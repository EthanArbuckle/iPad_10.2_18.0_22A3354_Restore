@implementation ICQUIOSLOPresenter

- (ICQUIOSLOPresenter)initWithOffer:(id)a3 link:(id)a4 presenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICQUIOSLOPresenter *v12;
  ICQUIOSLOPresenter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICQUIOSLOPresenter;
  v12 = -[ICQUIOSLOPresenter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_offer, a3);
    objc_storeStrong((id *)&v13->_link, a4);
    objc_storeWeak((id *)&v13->_presenter, v11);
  }

  return v13;
}

- (NSString)_sceneIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_createPostPurchaseICQLink
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEC72E0]);
  -[NSDictionary objectForKeyedSubscript:](self->_purchaseParams, "objectForKeyedSubscript:", *MEMORY[0x24BEC73C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithActionString:", v4);

  return v5;
}

- (void)beginOSLOPurchaseFlow
{
  ICQPurchase *purchase;
  void *v4;
  ICQPurchase *v5;
  ICQPurchase *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICQPurchase *v12;
  _QWORD v13[5];

  purchase = self->_purchase;
  if (!purchase)
  {
    +[ICQUIOSLOPresenter parsePurchaseParams:](ICQUIOSLOPresenter, "parsePurchaseParams:", self->_link);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICQPurchase initWithOffer:clientInfo:]([ICQPurchase alloc], "initWithOffer:clientInfo:", self->_offer, v4);
    v6 = self->_purchase;
    self->_purchase = v5;

    purchase = self->_purchase;
  }
  -[ICQPurchase setIsLegacyNativeFlow:](purchase, "setIsLegacyNativeFlow:", 1);
  -[ICQPurchase setDelegate:](self->_purchase, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sceneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQPurchase setPresentingSceneIdentifier:](self->_purchase, "setPresentingSceneIdentifier:", v11);

  -[ICQPurchase setPresentingSceneBundleIdentifier:](self->_purchase, "setPresentingSceneBundleIdentifier:", *MEMORY[0x24BEC73C0]);
  v12 = self->_purchase;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke;
  v13[3] = &unk_24E3F35E8;
  v13[4] = self;
  -[ICQPurchase startPurchaseWithCompletion:](v12, "startPurchaseWithCompletion:", v13);
}

void __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "action") == 127)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke_cold_1(a2, (uint64_t)v5, v6);

    v7 = *(void **)(a1 + 32);
    if (a2)
    {
      objc_msgSend(v7, "_handlePostPurchaseFlow");
    }
    else
    {
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "purchaseFlowCompletedWith:error:", 0, v5);

    }
  }

}

- (void)_handlePostPurchaseFlow
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s Post purchase action not avaialble. Bailing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = objc_alloc(MEMORY[0x24BE08618]);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithAccount:presentingViewController:options:", v4, WeakRetained, v5);

  objc_msgSend(v6, "performAuthentication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2;
  v8[3] = &unk_24E3F3FA8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "addFinishBlock:", v8);

}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v5 = a3;
  v6 = a2;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v15, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ICQUIOSLOPresenter_handleDialogRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__ICQUIOSLOPresenter_handleDialogRequest_purchase_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08610]), "initWithRequest:presentingViewController:", a1[5], WeakRetained);
  objc_msgSend(v2, "present");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFinishBlock:", a1[6]);

}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICQUIOSLOPresenter_handleEngagementRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __66__ICQUIOSLOPresenter_handleEngagementRequest_purchase_completion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  v2 = objc_alloc(MEMORY[0x24BE08638]);
  v3 = a1[5];
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithRequest:bag:presentingViewController:", v3, v4, WeakRetained);

  objc_msgSend(v5, "presentEngagement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFinishBlock:", a1[6]);

}

- (BOOL)isLiftUIFlow
{
  return 1;
}

+ (id)parsePurchaseParams:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  _ICQStringForAction();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BEC73E8]);

  objc_msgSend(v4, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEC73D0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEC73D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

  objc_msgSend(v4, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BEC73E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BEC73B8]);

  objc_msgSend(v4, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEC73D8];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BEC73D8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);

  objc_msgSend(v4, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEC7400];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BEC7400]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);

  objc_msgSend(v4, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BEC73F0];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BEC73F0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v19);

  objc_msgSend(v4, "parameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BEC73F8];
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BEC73F8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, v22);

  objc_msgSend(v4, "parameters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = *MEMORY[0x24BEC73C8];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BEC73C8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, v25);

  v27 = (void *)objc_msgSend(v5, "copy");
  return v27;
}

- (void)_handlePostPurchaseLiftUIFlow
{
  NSObject *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  ICQLiftUIPresenter *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQLiftUIPresenter *v13;
  ICQLiftUIPresenter *liftUIPresenter;
  ICQLiftUIPresenter *v15;
  id WeakRetained;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_liftUIPresenter)
  {
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ICQUIOSLOPresenter _handlePostPurchaseLiftUIFlow]";
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "LiftUI presenter has already been dismissed, %s will be ignored", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v2 = objc_claimAutoreleasedReturnValue();

    +[ICQUIOSLOPresenter parsePurchaseParams:](ICQUIOSLOPresenter, "parsePurchaseParams:", self->_link);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BEC73F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

    v9 = [ICQLiftUIPresenter alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQPurchase statusCode](self->_purchase, "statusCode", CFSTR("purchaseStatus")));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("amsErrorCodes");
    v18[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQPurchase amsServerErrorCode](self->_purchase, "amsServerErrorCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICQLiftUIPresenter initWithURL:account:data:](v9, "initWithURL:account:data:", v8, v2, v12);
    liftUIPresenter = self->_liftUIPresenter;
    self->_liftUIPresenter = v13;

    -[ICQLiftUIPresenter setDelegate:](self->_liftUIPresenter, "setDelegate:", self);
    v15 = self->_liftUIPresenter;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    -[ICQLiftUIPresenter presentInViewController:animated:](v15, "presentInViewController:animated:", WeakRetained, 1);

  }
}

- (void)_handlePostPurchaseRemoteUIFlow
{
  NSObject *v2;
  void *v4;
  ICQUIRemoteUIPresenter *v5;
  id WeakRetained;
  ICQUIRemoteUIPresenter *v7;
  ICQUIRemoteUIPresenter *remoteUIPresenter;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  NSObject *v19;
  ICQUIRemoteUIPresenter *v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_remoteUIPresenter)
  {
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[ICQUIOSLOPresenter _handlePostPurchaseRemoteUIFlow]";
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "RemoteUI presenter has already been dismissed, %s will be ignored", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v2 = objc_claimAutoreleasedReturnValue();

    v5 = [ICQUIRemoteUIPresenter alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v7 = -[ICQUIRemoteUIPresenter initWithAccount:presenter:](v5, "initWithAccount:presenter:", v2, WeakRetained);
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v7;

    -[ICQUIRemoteUIPresenter setDelegate:](self->_remoteUIPresenter, "setDelegate:", self);
    +[ICQUIOSLOPresenter parsePurchaseParams:](ICQUIOSLOPresenter, "parsePurchaseParams:", self->_link);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEC73F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v12);
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Accept"));
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    v23[0] = CFSTR("purchaseStatus");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQPurchase statusCode](self->_purchase, "statusCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("amsErrorCodes");
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQPurchase amsServerErrorCode](self->_purchase, "amsServerErrorCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v16, 100, 0, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (char *)v22;
    if (v18)
    {
      _ICQGetLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "Could not convert message body to XML for post purchase flow. Error: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v13, "setHTTPBody:", v17);
    }
    v20 = self->_remoteUIPresenter;
    v21 = (void *)objc_msgSend(v13, "copy");
    -[ICQUIRemoteUIPresenter beginRUIFlowWithRequest:](v20, "beginRUIFlowWithRequest:", v21);

  }
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;

  v5 = a4;
  v7 = a5;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICQUIOSLOPresenter remoteUIFlowManager:didCompleteFlowWithSuccess:error:].cold.1(v5, v7);

  -[ICQUIOSLOPresenter delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseFlowCompletedWith:error:", v5, v7);

}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICQUIOSLOPresenter remoteUIFlowManager:didDismissWithError:].cold.1(v5, v6);

  -[ICQUIOSLOPresenter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchaseFlowCompletedWith:error:", 0, v5);

}

- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = a5;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICQUIOSLOPresenter remoteUIFlowManager:didLoadWithSuccess:error:].cold.1(v5, v6);

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICQUIOSLOPresenter liftUIPresenterDidComplete:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[ICQUIOSLOPresenter delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "purchaseFlowCompletedWith:error:", 1, 0);

}

- (void)liftUIPresenterDidCancel:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICQUIOSLOPresenter liftUIPresenterDidComplete:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[ICQUIOSLOPresenter delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "purchaseFlowCompletedWith:error:", 0, 0);

}

- (ICQUIOSLOPresenterDelegate)delegate
{
  return (ICQUIOSLOPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_purchaseParams, 0);
  objc_storeStrong((id *)&self->_postPurchaseFlowLink, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

void __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "OSLO Flow completed with success: %d and error: %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Error attempting silent auth: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)remoteUIFlowManager:(uint64_t)a1 didCompleteFlowWithSuccess:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_21F2CC000, v3, v4, "OSLO Post Purchase did complete flow with success: %d error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)remoteUIFlowManager:(void *)a1 didDismissWithError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "OSLO Post Purchase did dismiss flow with error: %@", (uint8_t *)&v4, 0xCu);

}

- (void)remoteUIFlowManager:(uint64_t)a1 didLoadWithSuccess:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_21F2CC000, v3, v4, "OSLO Post Purchase did load flow with success: %d, error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)liftUIPresenterDidComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, a1, a3, "OSLO Post Purchase liftUIPresenterDidComplete", a5, a6, a7, a8, 0);
}

@end
