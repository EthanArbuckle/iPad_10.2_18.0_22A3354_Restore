@implementation ICQUILegacyPurchaseFlowManager

- (ICQUILegacyPurchaseFlowManager)initWithPresenter:(id)a3
{
  id v4;
  ICQUILegacyPurchaseFlowManager *v5;
  ICQUILegacyPurchaseFlowManager *v6;
  NSMutableArray *v7;
  NSMutableArray *objectModels;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICQUILegacyPurchaseFlowManager;
  v5 = -[ICQUILegacyPurchaseFlowManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objectModels = v6->_objectModels;
    v6->_objectModels = v7;

    v6->_isDowngradePurchaseInProgress = 0;
  }

  return v6;
}

- (void)beginFlowWithCompletion:(id)a3
{
  void *v4;
  id flowCompletion;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = _Block_copy(a3);
  flowCompletion = self->_flowCompletion;
  self->_flowCompletion = v4;

  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", CFSTR("mint-offers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke;
  v9[3] = &unk_24E3F5650;
  v9[4] = self;
  objc_msgSend(v8, "addFinishBlock:", v9);

}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = CFSTR("mint-offers");
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched the url (%@) for key (%@)", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_24;
    v10[3] = &unk_24E3F5628;
    v10[4] = v9;
    v11 = v5;
    objc_msgSend(v9, "_fetchURLRequestWithURL:completion:", v11, v10);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    objc_msgSend(*(id *)(a1 + 32), "_didCompletePurchaseFlowWithStatusCode:", 3);
  }

}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[ICQUsageQuotaRequest addHeadersForPrimaryAccountToRequest:](ICQQuotaInfoRequest, "addHeadersForPrimaryAccountToRequest:", v5);
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", CFSTR(" CastleSettings/1.0"), CFSTR("User-agent"));
    objc_msgSend(*(id *)(a1 + 32), "_beginURLOperationWithURLRequest:", v5);
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_24_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_didCompletePurchaseFlowWithStatusCode:", 3);
  }

}

- (id)_presentationContext
{
  UINavigationController *navController;
  UINavigationController *WeakRetained;
  UINavigationController *v4;
  NSObject *v5;
  void *v6;
  int v8;
  UINavigationController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  navController = self->_navController;
  if (navController)
    WeakRetained = navController;
  else
    WeakRetained = (UINavigationController *)objc_loadWeakRetained((id *)&self->_presenter);
  v4 = WeakRetained;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[UINavigationController presentedViewController](v4, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Presentation Context: %@ - %@", (uint8_t *)&v8, 0x16u);

  }
  return v4;
}

- (void)_fetchURLRequestWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(void *, void *);
  _QWORD aBlock[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ICQUILegacyPurchaseFlowManager _fetchURLRequestWithURL:completion:]";
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s called with url: %@", buf, 0x16u);
  }

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke;
  aBlock[3] = &unk_24E3F5678;
  v10 = v6;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13 = objc_alloc(MEMORY[0x24BE083F8]);
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithBag:", v14);

  if (self->_amsAccount)
  {
    objc_msgSend(v15, "setAccount:");
    v12[2](v12, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "aa_primaryAppleAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "ams_iTunesAccountForAccount:forMediaType:createIfNeeded:", v17, *MEMORY[0x24BE07CB0], 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2;
      v20[3] = &unk_24E3F56A0;
      v21 = v15;
      v22 = v12;
      objc_msgSend(v18, "addFinishBlock:", v20);

    }
    else
    {
      objc_msgSend(v16, "ams_iTunesAccountForAccount:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAccount:", v19);

      v12[2](v12, v15);
    }

  }
}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "requestWithMethod:URL:parameters:", 2, *(_QWORD *)(a1 + 32), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", a2);
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_beginURLOperationWithURLRequest:(id)a3
{
  id v4;
  NSObject *v5;
  AMSURLSession *v6;
  AMSURLSession *defaultAMSURLSession;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[ICQUILegacyPurchaseFlowManager _beginURLOperationWithURLRequest:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s called with urlRequest: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE08410], "defaultSession");
  v6 = (AMSURLSession *)objc_claimAutoreleasedReturnValue();
  defaultAMSURLSession = self->_defaultAMSURLSession;
  self->_defaultAMSURLSession = v6;

  -[AMSURLSession setDelegate:](self->_defaultAMSURLSession, "setDelegate:", self);
  -[AMSURLSession dataTaskPromiseWithRequest:](self->_defaultAMSURLSession, "dataTaskPromiseWithRequest:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke;
  v10[3] = &unk_24E3F56C8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "addFinishBlock:", v10);

}

void __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "This AMS request has been intercepted to perform AMS purchase for downgrade and need no action here.", buf, 2u);
    }

  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_didCompletePurchaseFlowWithStatusCode:", 3);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Successfully completed AMS request %@, with result: %@", buf, 0x16u);
      }

      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_38;
      v11[3] = &unk_24E3F34D8;
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v11);

    }
  }

}

uint64_t __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginRUIFlowWithAMSURLResult:", *(_QWORD *)(a1 + 40));
}

- (void)_beginRUIFlowWithAMSURLResult:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  UINavigationController *navController;
  UINavigationController *v13;
  UINavigationController *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char isKindOfClass;
  UINavigationController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v6 = objc_alloc(MEMORY[0x24BE7EDF0]);
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithXML:", v7);

  if ((objc_msgSend(v8, "succeeded") & 1) != 0)
  {
    objc_msgSend(v8, "uiObjectModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSignal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = (const char *)v9;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "objectModel: %@, actionSignal: %@", buf, 0x16u);
    }

    if (!-[NSMutableArray count](self->_objectModels, "count") && objc_msgSend(v10, "topSignal") == 3)
      objc_msgSend(v10, "setTopSignal:", 2);
    navController = self->_navController;
    if (!navController)
    {
      v13 = (UINavigationController *)objc_alloc_init(MEMORY[0x24BEBD7A0]);
      v14 = self->_navController;
      self->_navController = v13;

      -[UINavigationController setModalPresentationStyle:](self->_navController, "setModalPresentationStyle:", 2);
      -[UINavigationController setModalTransitionStyle:](self->_navController, "setModalTransitionStyle:", 0);
    }
    if (!objc_msgSend(v10, "topSignal"))
      objc_msgSend(v10, "setTopSignal:", 2);
    if (objc_msgSend(v10, "topSignal") == 2)
    {
      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
      objc_msgSend(v9, "defaultPages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:].cold.1();
      if (v16)
        -[ICQUILegacyPurchaseFlowManager _updatePage:](self, "_updatePage:", v16);
      -[UINavigationController topViewController](self->_navController, "topViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v19 = self->_navController;
      if ((isKindOfClass & 1) != 0)
      {
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke;
        v31[3] = &unk_24E3F3610;
        v31[4] = self;
        objc_msgSend(v9, "presentInParentViewController:animated:completion:", v19, 0, v31);

        goto LABEL_32;
      }
      objc_msgSend(v9, "presentInParentViewController:animated:", v19, navController != 0);
      goto LABEL_30;
    }
    if (objc_msgSend(v10, "topSignal") == 3)
    {
      -[UINavigationController viewControllers](self->_navController, "viewControllers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v21, "mutableCopy");

      -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
      -[NSObject removeLastObject](v16, "removeLastObject");
      objc_msgSend(v9, "defaultPages");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v16, "addObject:", v23);

      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
      -[UINavigationController setViewControllers:animated:](self->_navController, "setViewControllers:animated:", v16, 0);
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(v10, "topSignal") != 4)
      goto LABEL_31;
    objc_msgSend(v9, "defaultPages");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      if ((unint64_t)-[NSMutableArray count](self->_objectModels, "count") <= 1)
      {
        _ICQGetLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:].cold.2();
        goto LABEL_30;
      }
      -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
      -[UINavigationController viewControllers](self->_navController, "viewControllers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      objc_msgSend(v28, "removeLastObject");
      objc_msgSend(v28, "removeLastObject");
      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
      objc_msgSend(v9, "defaultPages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v30);

      -[UINavigationController setViewControllers:animated:](self->_navController, "setViewControllers:animated:", v28, 0);
    }
    else
    {
      -[ICQUILegacyPurchaseFlowManager _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
    }
LABEL_31:
    if (navController)
    {
LABEL_33:

      goto LABEL_34;
    }
LABEL_32:
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self->_navController, 1, 0);

    goto LABEL_33;
  }
  _ICQGetLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:].cold.3();

  -[ICQUILegacyPurchaseFlowManager _didCompletePurchaseFlowWithStatusCode:](self, "_didCompletePurchaseFlowWithStatusCode:", 3);
LABEL_34:

}

void __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke_2;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setViewControllers:", v4);
}

- (void)_updatePage:(id)a3
{
  NSObject *v4;
  unint64_t requiredStorageThreshold;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  ICQUILegacyPurchaseFlowManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v31 = self;
  if (self->_requiredStorageThreshold)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      requiredStorageThreshold = self->_requiredStorageThreshold;
      *(_DWORD *)buf = 134217984;
      v43 = requiredStorageThreshold;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "May need to update row for requiredStorageThreshold: %lld", buf, 0xCu);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v30, "tableViewOM");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    v8 = 0;
    if (v28)
    {
      v27 = *(_QWORD *)v37;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(obj);
          v29 = v9;
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v10, "rows");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v33 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v16, "attributes");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("totalStorage"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (v19 = strtoull((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), 0, 0),
                      v19 < -[ICQUILegacyPurchaseFlowManager requiredStorageThreshold](v31, "requiredStorageThreshold")))
                {
                  objc_msgSend(v16, "setEnabled:", 0);
                  if (objc_msgSend(v16, "isSelected"))
                  {
                    objc_msgSend(v16, "attributes");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("radioGroup"));
                    v21 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v16, "setSelected:", 0);
                    v8 = (void *)v21;
                  }
                }
                else
                {
                  objc_msgSend(v16, "attributes");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("radioGroup"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "isEqualToString:", v8);

                  if (v24)
                  {
                    objc_msgSend(v30, "tableViewOM");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setSelectedRadioGroupRow:", v16);

                    v8 = 0;
                  }
                }

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v13);
          }

          v9 = v29 + 1;
        }
        while (v29 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v28);
    }

  }
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_navController;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  NSObject *v12;
  id v13;

  v3 = a3;
  if (-[NSMutableArray count](self->_objectModels, "count"))
  {
    -[NSMutableArray lastObject](self->_objectModels, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultPages");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
    v6 = objc_msgSend(v13, "count") - 1;
    if (v6 >= 0)
    {
      do
      {
        objc_msgSend(v13, "objectAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController topViewController](self->_navController, "topViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v7)
        {
          if (v6)
            v9 = 0;
          else
            v9 = v3;
          v10 = -[UINavigationController popViewControllerAnimated:](self->_navController, "popViewControllerAnimated:", v9);
        }

      }
      while (v6-- > 0);
    }

  }
  else
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICQUILegacyPurchaseFlowManager _popObjectModelAnimated:].cold.1();

  }
}

- (void)objectModelPressedBack:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ICQUILegacyPurchaseFlowManager objectModelPressedBack:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UINavigationController popViewControllerAnimated:](self->_navController, "popViewControllerAnimated:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    if (v8)
    {
      objc_msgSend(v4, "defaultPages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v10)
        -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315650;
    v24 = "-[ICQUILegacyPurchaseFlowManager objectModel:pressedButton:attributes:]";
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "%s called with element name: %@, attributes: %@", (uint8_t *)&v23, 0x20u);
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ams_followup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("clear")))
    -[ICQUILegacyPurchaseFlowManager _clearRetailFollowUpItem](self, "_clearRetailFollowUpItem");
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("cancel")))
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Purchase flow cancelled!", (uint8_t *)&v23, 2u);
    }

    -[ICQUILegacyPurchaseFlowManager _didCompletePurchaseFlowWithStatusCode:](self, "_didCompletePurchaseFlowWithStatusCode:", 2);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("buy")))
  {
    objc_msgSend(v8, "defaultPages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "startNavigationBarSpinnerWithTitle:", v16);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultPages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "populatePostbackDictionary:", v17);

    objc_msgSend(v17, "objectForKey:", CFSTR("quota"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("quota"));

      if (v22)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
    }
    -[ICQUILegacyPurchaseFlowManager makeBuyRequest:](self, "makeBuyRequest:", v20);

  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("pop")))
  {
    -[ICQUILegacyPurchaseFlowManager _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
  }

}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  ICQUILegacyPurchaseFlowManager *v26;
  id v27;
  void (**v28)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ICQUILegacyPurchaseFlowManager objectModel:pressedLink:httpMethod:completion:]";
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "%s called with URL: %@", buf, 0x16u);
  }

  if (-[ICQUILegacyPurchaseFlowManager _loadNativeURL:](self, "_loadNativeURL:", v11))
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Successfully handled native url/deep link URL.", buf, 2u);
    }

    v13[2](v13, 1, 0);
  }
  else
  {
    objc_msgSend(v12, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("post"));

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultPages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "populatePostbackDictionary:", v18);

      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v18, 100, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke;
    v23[3] = &unk_24E3F56F0;
    v24 = v21;
    v25 = v12;
    v26 = self;
    v28 = v13;
    v27 = v11;
    v22 = v21;
    -[ICQUILegacyPurchaseFlowManager _fetchURLRequestWithURL:completion:](self, "_fetchURLRequestWithURL:completion:", v27, v23);

  }
}

void __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", CFSTR(" CastleSettings/1.0"), CFSTR("User-agent"));
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "setHTTPMethod:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "setHTTPBody:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      +[ICQUsageQuotaRequest addHeadersForPrimaryAccountToRequest:](ICQQuotaInfoRequest, "addHeadersForPrimaryAccountToRequest:", v5);
    }
    objc_msgSend(*(id *)(a1 + 48), "_beginURLOperationWithURLRequest:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "_didCompletePurchaseFlowWithStatusCode:", 3);
  }

}

- (void)makeBuyRequestWithParams:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id flowCompletion;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _Block_copy(a4);
  flowCompletion = self->_flowCompletion;
  self->_flowCompletion = v7;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "queryItemWithName:value:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v19 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v19, "setQueryItems:", v9);
  objc_msgSend(v19, "query");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v19, "query");
    v21 = objc_claimAutoreleasedReturnValue();
    -[ICQUILegacyPurchaseFlowManager makeBuyRequest:](self, "makeBuyRequest:", v21);
  }
  else
  {
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ICQUILegacyPurchaseFlowManager makeBuyRequestWithParams:completion:].cold.1();
  }

}

- (void)makeBuyRequest:(id)a3
{
  NSString *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSString *presentingSceneBundleIdentifier;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint8_t buf[4];
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Performing AMSPurchase request with buyParams: %@", buf, 0xCu);
  }

  v6 = objc_alloc(MEMORY[0x24BE08360]);
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBag:", v7);

  objc_msgSend(v8, "setDelegate:", self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08358]), "initWithConfiguration:", v8);
  v10 = objc_alloc(MEMORY[0x24BE08350]);
  objc_msgSend(MEMORY[0x24BE08098], "buyParamsWithString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithPurchaseType:buyParams:", 0, v11);

  objc_msgSend(v12, "setUserInitiated:", 1);
  objc_msgSend(v12, "setAdditionalHeaders:", &unk_24E436470);
  v32 = CFSTR("mtTopic");
  v33 = CFSTR("xp_its_main");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMetricsOverlay:", v13);

  -[ICQUILegacyPurchaseFlowManager _presentationContext](self, "_presentationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_sceneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPresentingSceneIdentifier:", v18);

  _ICQGetLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "presentingSceneIdentifier");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v20;
    _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "Setting sceneIdentifier: %@ to AMSPurchase.", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "ams_isActiveAccountCombined"))
    objc_msgSend(v21, "ams_activeiTunesAccount");
  else
    objc_msgSend(v21, "ams_activeiCloudAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccount:", v22);

  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CastleSettings/1.0"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUserAgentSuffix:", v24);

  if (self->_presentingSceneBundleIdentifier)
  {
    _ICQGetLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v35 = presentingSceneBundleIdentifier;
      _os_log_impl(&dword_21F2CC000, v25, OS_LOG_TYPE_DEFAULT, "Setting app bundleID: %@ to AMSPurchase.", buf, 0xCu);
    }

    objc_msgSend(v23, "setProxyAppBundleID:", self->_presentingSceneBundleIdentifier);
  }
  objc_msgSend(v12, "setClientInfo:", v23);
  v31 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enquePurchases:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke;
  v29[3] = &unk_24E3F5718;
  objc_copyWeak(&v30, (id *)buf);
  v29[4] = self;
  objc_msgSend(v28, "addFinishBlock:", v29);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[8];
  _QWORD block[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_1(a1, v8);
    goto LABEL_7;
  }
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_92;
  block[3] = &unk_24E3F3610;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (v4)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_2();
LABEL_7:

    v9 = *(void **)(a1 + 32);
    v10 = 3;
LABEL_8:
    objc_msgSend(v9, "_didCompletePurchaseFlowWithStatusCode:", v10);
    goto LABEL_9;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "AMSPurchase for upgrade completed successfully. Dismissing the flow.", buf, 2u);
    }

    v9 = *(void **)(a1 + 32);
    v10 = 0;
    goto LABEL_8;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "AMSPurchase for downgrade completed successfully. Navigating back to previous page.", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_93;
  v15[3] = &unk_24E3F3610;
  v15[4] = *(_QWORD *)(a1 + 32);
  v14 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

LABEL_9:
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_92(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopNavigationBarSpinner");

}

uint64_t __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_93(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popObjectModelAnimated:", 1);
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleAuthenticateRequest:completion:](self, "_handleAuthenticateRequest:completion:", a3, a6, a5);
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleDialogRequest:completion:](self, "_handleDialogRequest:completion:", a3, a6, a5);
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleEngagementRequest:completion:](self, "_handleEngagementRequest:completion:", a3, a6, a5);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleAuthenticateRequest:completion:](self, "_handleAuthenticateRequest:completion:", a5, a6);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleDialogRequest:completion:](self, "_handleDialogRequest:completion:", a5, a6);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  -[ICQUILegacyPurchaseFlowManager _handleEngagementRequest:completion:](self, "_handleEngagementRequest:completion:", a5, a6);
}

- (void)_handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICQUILegacyPurchaseFlowManager *v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "We've been asked to handle Authenticate request. Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v2 = objc_alloc(MEMORY[0x24BE08618]);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithAccount:presentingViewController:options:", v3, v4, v5);

  objc_msgSend(v6, "performAuthentication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2;
  v9[3] = &unk_24E3F5740;
  v8 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v8;
  objc_msgSend(v7, "addFinishBlock:", v9);

}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a2;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v12, 2u);
  }

  objc_msgSend(v6, "account");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICQUILegacyPurchaseFlowManager *v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "We've been asked to handle AMS dialog request.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE08610]);
  v18 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v2, "initWithRequest:presentingViewController:", v3, v4);

  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__11;
  v38 = __Block_byref_object_dispose__11;
  v39 = 0;
  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__11;
  v32 = __Block_byref_object_dispose__11;
  v33 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v44, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("buyParams"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_storeStrong(v29 + 5, v12);
            objc_storeStrong(v35 + 5, v9);
            _ICQGetLogSystem();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = v35[5];
              v15 = v29[5];
              *(_DWORD *)buf = 138412546;
              v41 = v14;
              v42 = 2112;
              v43 = v15;
              _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "It's a confirm downgrade action: %@, buyParams: %@", buf, 0x16u);
            }

          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v44, 16);
    }
    while (v6);
  }

  objc_msgSend(v19, "present");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_102;
  v20[3] = &unk_24E3F5768;
  v22 = &v34;
  v23 = &v28;
  v17 = *(void **)(v18 + 48);
  v20[4] = *(_QWORD *)(v18 + 40);
  v21 = v17;
  objc_msgSend(v16, "addFinishBlock:", v20);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedActionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "It's not a downgrade confirmation dialog or user chose to cancel.", (uint8_t *)&v18, 2u);
    }
    goto LABEL_10;
  }
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v18 = 138412290;
    v19 = v12;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "User confirmed downgrade. Let's begin buy request with buyParams: %@", (uint8_t *)&v18, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_102_cold_1();
LABEL_10:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "makeBuyRequest:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCloudQuota.LegacyPurchase"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_11:
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

}

- (void)_handleEngagementRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICQUILegacyPurchaseFlowManager *v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ICQUILegacyPurchaseFlowManager__handleEngagementRequest_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__ICQUILegacyPurchaseFlowManager__handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x24BE08638]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "initWithRequest:bag:presentingViewController:", v3, v4, v5);

  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserAgentSuffix:", CFSTR("CastleSettings/1.0"));
  objc_msgSend(v8, "setClientInfo:", v6);
  objc_msgSend(v8, "presentEngagement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFinishBlock:", *(_QWORD *)(a1 + 48));

}

- (void)_clearRetailFollowUpItem
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_19);

}

void __58__ICQUILegacyPurchaseFlowManager__clearRetailFollowUpItem__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEFAULT, "Clearing iCloud follow up item.", v8, 2u);
  }

  AMSGenerateLogCorrelationKey();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE08120], "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08120], "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bagForProfile:profileVersion:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE08118], "removeDeviceOfferWithIdentifier:account:bag:logKey:", *MEMORY[0x24BE07CF8], v3, v7, v1);
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ams-ui"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v3, 0);

  }
  return v5;
}

- (void)_didCompletePurchaseFlowWithStatusCode:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow has been completed with error code: %ld", buf, 0xCu);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke;
  v6[3] = &unk_24E3F41B8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_dismissPurchaseFlow");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCloudQuota.LegacyPurchase"), v2, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_3();

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
    }
    else
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_2();

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
    }
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;
  }
  else
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_1();
  }

}

- (void)_dismissPurchaseFlow
{
  id WeakRetained;
  UINavigationController *navController;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  -[NSMutableArray removeAllObjects](self->_objectModels, "removeAllObjects");
  navController = self->_navController;
  self->_navController = 0;

}

- (unint64_t)requiredStorageThreshold
{
  return self->_requiredStorageThreshold;
}

- (void)setRequiredStorageThreshold:(unint64_t)a3
{
  self->_requiredStorageThreshold = a3;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_amsAccount, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_defaultAMSURLSession, 0);
  objc_storeStrong(&self->_flowCompletion, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("mint-offers");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch url from AMS-Quota bag for key %@ with error: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_24_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_21F2CC000, v0, v1, "AMSURLRequestEncoder failed to return request for URL: %@, with error: %@");
  OUTLINED_FUNCTION_2_0();
}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "ams_iTunesAccountForAccount failed to return result with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_21F2CC000, v0, v1, "Failed to complete AMS request: %@, with error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.1()
{
  __assert_rtn("-[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]", "ICQUILegacyPurchaseFlowManager.m", 185, "[firstPage isKindOfClass:[RUIPage class]]");
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Pop + Replace requires at least 2 existing object models.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "RUIParser failed to parse AMSURLResult: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_popObjectModelAnimated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "No object model found, can't pop view controller!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_21F2CC000, v0, v1, "AMSURLRequestEncoder failed to return request for URL: %@, with error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)makeBuyRequestWithParams:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Failed to form query for buyParams: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_2_2();
  v4 = v3;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "%@ object got destroyed.", v5, 0xCu);

}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "AMS Purchase failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Failed to handle silent AMS Auth with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_102_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "No buy param exist. Can't initiate AMS Purchase.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "No flow completion provided!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "Calling flow completion w/ success.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEBUG, "Calling flow completion w/ error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
