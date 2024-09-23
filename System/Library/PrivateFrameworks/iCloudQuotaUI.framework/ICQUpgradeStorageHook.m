@implementation ICQUpgradeStorageHook

- (ICQUpgradeStorageHook)initWithOffer:(id)a3 flowDelegate:(id)a4
{
  id v7;
  id v8;
  ICQUpgradeStorageHook *v9;
  ICQUpgradeStorageHook *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURLSession *session;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICQUpgradeStorageHook;
  v9 = -[ICQUpgradeStorageHook init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offer, a3);
    objc_storeWeak((id *)&v10->_flowDelegate, v8);
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("ICQUpgradeFlowURLSession"));
    objc_msgSend(v11, "set_appleIDContext:", v12);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    session = v10->_session;
    v10->_session = (NSURLSession *)v13;

  }
  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSTimer *v8;
  NSTimer *stopActivityIndicatorTimer;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("upgradeButton"));

  if (v7)
  {
    objc_storeStrong((id *)&self->_ruiElement, a3);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__firedStopActivityIndicatorTimer_, 0, 0, 45.0);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    stopActivityIndicatorTimer = self->_stopActivityIndicatorTimer;
    self->_stopActivityIndicatorTimer = v8;

    objc_msgSend(v5, "startActivityIndicator");
  }

  return 0;
}

- (void)_firedStopActivityIndicatorTimer:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Did not receive callback from AMS for 30s stopping spinner", v5, 2u);
  }

  -[ICQUpgradeStorageHook stopActivityIndicator](self, "stopActivityIndicator");
}

- (void)stopActivityIndicator
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping activity indicator", buf, 2u);
  }

  -[NSTimer invalidate](self->_stopActivityIndicatorTimer, "invalidate");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICQUpgradeStorageHook_stopActivityIndicator__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__ICQUpgradeStorageHook_stopActivityIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stopActivityIndicator");
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a6;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't process element |%@|, It's not yet supported.", (uint8_t *)&v11, 0xCu);

  }
  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);

}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_msgSend(v4, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UPGRADE_ICLOUD_STORAGE"));
  v30 = v6;
  if ((v7 & 1) != 0)
  {
    v8 = v5;
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("action"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("UPGRADE_ICLOUD_STORAGE_OSLO")) & 1) != 0)
    {
      v8 = v5;
      v9 = 0;
      v10 = 0;
      v11 = 0;
    }
    else
    {
      objc_msgSend(v4, "clientInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("action"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UPGRADE_ENABLE_ICPL")) & 1) != 0)
      {
        v8 = v5;
        v3 = v19;
        v26 = v18;
        v10 = 0;
        v11 = 0;
        v9 = 1;
      }
      else
      {
        objc_msgSend(v4, "clientInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("action"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO")) & 1) != 0)
        {
          v29 = v21;
          v8 = v5;
          v5 = v20;
          v3 = v19;
          v26 = v18;
          v11 = 0;
          v9 = 1;
          v10 = 1;
        }
        else
        {
          objc_msgSend(v4, "clientInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("action"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqualToString:", CFSTR("UPGRADE_ENABLE_ICPL_OSLO")) & 1) == 0)
          {

            v15 = 0;
            goto LABEL_10;
          }
          v24 = v23;
          v25 = v22;
          v29 = v21;
          v8 = v5;
          v5 = v20;
          v3 = v19;
          v26 = v18;
          v9 = 1;
          v10 = 1;
          v11 = 1;
        }
      }
    }
  }
  objc_msgSend(v4, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("parameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 != 0;

  if (v11)
  {

    v16 = v29;
    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  else
  {
    v16 = v29;
    if (!v10)
    {
LABEL_7:
      v5 = v8;
      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
  }

  v5 = v8;
  if ((v9 & 1) != 0)
  {
LABEL_8:

  }
LABEL_9:
  v6 = v30;
  if ((v7 & 1) == 0)
  {
LABEL_10:

  }
  return v15;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *clientInfo;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientInfo");
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  clientInfo = self->_clientInfo;
  self->_clientInfo = v8;

  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("parameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQPurchase parseParameters:action:](ICQPurchase, "parseParameters:action:", v10, -[ICQUpgradeStorageHook offerAction](self, "offerAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:](ICQPurchase, "clearCacheAndNotifyClientsWithCompletion:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeStorageHook setCompletionHandler:](self, "setCompletionHandler:", v13);

    -[ICQOffer updateOfferWithPlanDetails:actionString:](self->_offer, "updateOfferWithPlanDetails:actionString:", v12, v11);
    -[ICQUpgradeStorageHook completionHandler](self, "completionHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeStorageHook beginPurchaseFlowUsingParameters:completion:](self, "beginPurchaseFlowUsingParameters:completion:", v10, v14);

  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't process object model |%@|, No plan details found.", (uint8_t *)&v18, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "dismissUpgradeFlowWithSuccess:", 0);

  }
}

- (RUIServerHookResponse)serverHookResponse
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[16];

  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("refreshHttpMethod"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "No refresh URL or Http method found.", buf, 2u);
    }

    v15 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v8);
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = -[ICQUpgradeStorageHook _statusCode](self, "_statusCode");
    -[ICQUpgradeStorageHook purchase](self, "purchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'><plist version='1.0'><dict><key>statusCode</key><integer>%ld</integer><key>AMSServerErrorCode</key><integer>%ld</integer></dict></plist>"), v11, objc_msgSend(v12, "amsServerErrorCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v14);

    objc_msgSend(v9, "setHTTPMethod:", v5);
    v15 = objc_alloc_init(MEMORY[0x24BE7EE00]);
    objc_msgSend(v15, "setContinuationRequest:", v9);

  }
  return (RUIServerHookResponse *)v15;
}

- (id)continuationResponseBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("purchaseStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQUpgradeStorageHook _statusCode](self, "_statusCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("amsErrorCodes");
  v10[0] = v3;
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "amsServerErrorCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)beginPurchaseFlowUsingParameters:(id)a3 completion:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "hostingNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(WeakRetained, "hostingNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "hostingNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setViewControllers:", v10);

  }
  if (objc_msgSend(MEMORY[0x24BEC7350], "isServerMockingEnabled"))
  {
    -[ICQUpgradeStorageHook mockPurchaseFlow](self, "mockPurchaseFlow");
  }
  else
  {
    v12 = -[ICQUpgradeStorageHook offerAction](self, "offerAction");
    if ((unint64_t)(v12 - 116) >= 3)
    {
      if (v12 == 108 || v12 == 105)
      {
        -[ICQUpgradeStorageHook beginLegacyPurchaseFlow](self, "beginLegacyPurchaseFlow");
      }
      else
      {
        _ICQGetLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ICQUpgradeStorageHook beginPurchaseFlowUsingParameters:completion:].cold.1(v13);

      }
    }
    else
    {
      -[ICQUpgradeStorageHook beginOsloPurchaseFlow](self, "beginOsloPurchaseFlow");
    }
  }

}

- (void)mockPurchaseFlow
{
  -[ICQUpgradeStorageHook manager:didCompleteWithError:](self, "manager:didCompleteWithError:", 0, 0);
}

- (void)beginLegacyPurchaseFlow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICQUICloudStorageOffersManager *v32;
  ICQUICloudStorageOffersManager *cloudStorageOffersManager;
  id WeakRetained;
  void *v35;
  ICQUICloudStorageOffersManager *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_grandSlamAccountForiCloudAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v3, "credentialForAccount:serviceID:error:", v5, CFSTR("com.apple.gs.icloud.storage.buy"), &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;
  v8 = v7;
  if (!v7)
  {
LABEL_12:
    if (!v6)
    {
      _ICQGetLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v18, OS_LOG_TYPE_DEFAULT, "Credential is nil but no error reported.", buf, 2u);
      }

    }
    objc_msgSend(v6, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_23;
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "No storage buy token present.", buf, 2u);
    }

    if (!-[ICQOffer isBuddyOffer](self->_offer, "isBuddyOffer"))
    {
LABEL_23:
      v21 = v8;
      v22 = objc_alloc(MEMORY[0x24BDBCED8]);
      -[ICQUpgradeStorageHook upgradeStorageContextHeaderDictionary](self, "upgradeStorageContextHeaderDictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithDictionary:", v23);

      if (v10)
      {
        v38 = v6;
        v39 = v3;
        v25 = v5;
        v26 = v4;
        -[ICQUpgradeStorageHook dummyRequestWithAccount:token:](self, "dummyRequestWithAccount:token:", v4, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURLSession configuration](self->_session, "configuration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_appleIDContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "appleIDHeadersForRequest:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v30, "count") < 2)
        {

          v10 = 0;
        }
        else
        {
          objc_msgSend(v24, "addEntriesFromDictionary:", v30);
        }

        v4 = v26;
        v5 = v25;
        v6 = v38;
        v3 = v39;
      }
      v8 = v21;
      v31 = v5;
      if (!self->_cloudStorageOffersManager)
      {
        v32 = objc_alloc_init(ICQUICloudStorageOffersManager);
        cloudStorageOffersManager = self->_cloudStorageOffersManager;
        self->_cloudStorageOffersManager = v32;

        -[ICQUICloudStorageOffersManager setSkipCompletionAlert:](self->_cloudStorageOffersManager, "setSkipCompletionAlert:", 1);
        -[ICQUICloudStorageOffersManager setSupportsModernAlerts:](self->_cloudStorageOffersManager, "setSupportsModernAlerts:", 1);
        -[ICQUICloudStorageOffersManager setDelegate:](self->_cloudStorageOffersManager, "setDelegate:", self);
      }
      -[ICQUICloudStorageOffersManager setSkipRetryWithoutToken:](self->_cloudStorageOffersManager, "setSkipRetryWithoutToken:", -[ICQOffer isBuddyOffer](self->_offer, "isBuddyOffer"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "presentationContextForHook:", self);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = self->_cloudStorageOffersManager;
      +[ICQPurchase upgradeStorageQueryDictionaryForOffer:buttonID:](ICQPurchase, "upgradeStorageQueryDictionaryForOffer:buttonID:", self->_offer, self->_buttonId);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:purchaseToken:buyParameters:requestHeaders:modally:](v36, "beginFlowWithNavigationController:purchaseToken:buyParameters:requestHeaders:modally:", v35, v10, v37, v24, 0);

      v5 = v31;
    }
    else
    {
      _ICQGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v20, OS_LOG_TYPE_DEFAULT, "Dismissing the flow as it's a buddy offer and no token received.", buf, 2u);
      }

      v10 = objc_loadWeakRetained((id *)&self->_flowDelegate);
      objc_msgSend(v10, "dismissUpgradeFlowWithSuccess:", 0);
    }
    goto LABEL_31;
  }
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD1398]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.accounts.keychain")))
  {

LABEL_9:
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v8;
      _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Buy storage failed to get token with error: %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  v12 = v8;
  v13 = objc_msgSend(v10, "code");

  v14 = v13 == -128;
  v8 = v12;
  if (!v14)
    goto LABEL_9;
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "User cancelled.", buf, 2u);
  }

  v16 = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(v16, "dismissUpgradeFlowWithSuccess:", 0);

LABEL_31:
}

- (void)beginOsloPurchaseFlow
{
  ICQPurchase *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *presentingSceneIdentifier;
  void *v9;
  NSString *presentingSceneBundleIdentifier;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = -[ICQPurchase initWithOffer:clientInfo:]([ICQPurchase alloc], "initWithOffer:clientInfo:", self->_offer, self->_clientInfo);
  -[ICQUpgradeStorageHook setPurchase:](self, "setPurchase:", v3);

  -[ICQUpgradeStorageHook flowtype](self, "flowtype");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("native"));
  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsLegacyNativeFlow:", v5);

  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPresentingSceneIdentifier:", presentingSceneIdentifier);

  presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPresentingSceneBundleIdentifier:", presentingSceneBundleIdentifier);

  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke;
  v13[3] = &unk_24E3F35E8;
  v13[4] = self;
  objc_msgSend(v12, "startPurchaseWithCompletion:", v13);

}

void __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id WeakRetained;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD block[5];

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  if (objc_msgSend(v5, "action") == 118)
  {
    if ((_DWORD)a2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke_2;
      block[3] = &unk_24E3F3610;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
      objc_msgSend(WeakRetained, "dismissUpgradeFlowWithSuccess:", 0);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, id))v8)[2](v8, a2, v6);

}

void __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "presentHostingNavigationController");

}

- (int64_t)offerAction
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQActionForServerActionString();

  return v3;
}

- (id)dummyRequestWithAccount:(id)a3 token:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://www.apple.com/example"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:cachePolicy:timeoutInterval:", v7, 1, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);
  objc_msgSend(v8, "ak_addClientInfoHeader");
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "abbreviation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v10, CFSTR("X-MMe-Timezone"));

  objc_msgSend(v8, "ak_addCountryHeader");
  if (v6)
  {
    objc_msgSend(v5, "aa_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v6, v11);

  }
  return v8;
}

- (id)upgradeStorageContextHeaderDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[ICQUpgradeStorageHook storageContextJSONString](self, "storageContextJSONString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v5 = CFSTR("X-Apple-Storage-Context");
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v3;
}

- (id)storageContextJSONString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v15 = CFSTR("appName");
    v16[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Failed to parse storage context for bundleID \"%@\" with error: %@", buf, 0x16u);
      }

    }
    else if (v5)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
      goto LABEL_10;
    }
    v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (int64_t)_statusCode
{
  void *v3;
  void *v4;
  int64_t v5;

  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_legacyStatusCode;
  -[ICQUpgradeStorageHook purchase](self, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "statusCode");

  return v5;
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "ICQUICloudStorageOffersManager: willPresentViewController: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Failed to upgrade storage with error: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_legacyStatusCode = objc_msgSend(v5, "code");
  (*((void (**)(void))self->_completionHandler + 2))();

}

- (void)managerDidCancel:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade storage cancelled.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "dismissUpgradeFlowWithSuccess:", 0);

}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void (*v8)(void);
  void *v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Failed to upgrade storage with error: %@", (uint8_t *)&v11, 0xCu);
    }

    self->_legacyStatusCode = objc_msgSend(v5, "code");
    v8 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
  }
  else
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Storage upgraded successfully. Call completion handler and it'll load refreshURL if exist.", (uint8_t *)&v11, 2u);
    }

    self->_legacyStatusCode = 0;
    -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("UPGRADE_ENABLE_ICPL"));

    if (v10)
      +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosLibraryWithCompletion:", &__block_literal_global_25);
    v8 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
  }
  v8();

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
  block[2] = __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BE08618]);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithAccount:presentingViewController:options:", v5, v3, v6);

  objc_msgSend(v7, "performAuthentication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2;
  v9[3] = &unk_24E3F3FA8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v8, "addFinishBlock:", v9);

}

void __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = a2;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1((uint64_t)v5, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v9, 2u);
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
  block[2] = __65__ICQUpgradeStorageHook_handleDialogRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__ICQUpgradeStorageHook_handleDialogRequest_purchase_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(WeakRetained, "presentationContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08610]), "initWithRequest:presentingViewController:", a1[5], v5);
  objc_msgSend(v3, "present");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFinishBlock:", a1[6]);

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
  block[2] = __69__ICQUpgradeStorageHook_handleEngagementRequest_purchase_completion___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__ICQUpgradeStorageHook_handleEngagementRequest_purchase_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(WeakRetained, "presentationContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(MEMORY[0x24BE08638]);
  v4 = a1[5];
  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRequest:bag:presentingViewController:", v4, v5, v8);

  objc_msgSend(v6, "presentEngagement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFinishBlock:", a1[6]);

}

- (BOOL)isLiftUIFlow
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  v3 = objc_msgSend(WeakRetained, "isLiftUIFlow");

  return v3;
}

- (void)_handlePurchaseRequestSucceededNotification
{
  void *v3;
  void *v4;
  int v5;

  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("UPGRADE_ENABLE_ICPL_OSLO")))
  {

LABEL_4:
    +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosLibraryWithCompletion:", &__block_literal_global_91);
    goto LABEL_5;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO"));

  if (v5)
    goto LABEL_4;
LABEL_5:
  self->_legacyStatusCode = 0;
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)_appGoesToBackground:(id)a3
{
  NSObject *v4;
  __CFNotificationCenter *DistributedCenter;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "app goes to background", buf, 2u);
  }

  if (self->_isListeningToAMS)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("kSSPurchaseRequestFinishedNotification"), 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    self->_isListeningToAMS = 0;
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "remove observers", v8, 2u);
    }

  }
}

- (void)registerForDarwinNotifications
{
  _BOOL4 isListeningToAMS;
  NSObject *v4;
  _BOOL4 v5;
  __CFNotificationCenter *DistributedCenter;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  isListeningToAMS = self->_isListeningToAMS;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isListeningToAMS)
  {
    if (v5)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "already registered to kSSPurchaseRequestSucceededNotification", (uint8_t *)&v11, 2u);
    }

  }
  else
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = CFSTR("kSSPurchaseRequestFinishedNotification");
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v11, 0xCu);
    }

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)_handleReceivedDarwinNotification, CFSTR("kSSPurchaseRequestFinishedNotification"), 0, (CFNotificationSuspensionBehavior)1024);
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    v9 = (const __CFString *)*MEMORY[0x24BEBDF98];
    if (v8)
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "registering for ns notification %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__appGoesToBackground_, v9, 0);

    self->_isListeningToAMS = 1;
  }
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)buttonId
{
  return self->_buttonId;
}

- (void)setButtonId:(id)a3
{
  objc_storeStrong((id *)&self->_buttonId, a3);
}

- (NSString)flowtype
{
  return self->_flowtype;
}

- (void)setFlowtype:(id)a3
{
  objc_storeStrong((id *)&self->_flowtype, a3);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (ICQPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_flowtype, 0);
  objc_storeStrong((id *)&self->_buttonId, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stopActivityIndicatorTimer, 0);
  objc_storeStrong((id *)&self->_ruiElement, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_cloudStorageOffersManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)beginPurchaseFlowUsingParameters:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "ICQUpgradeStorageHook - Unsupported purchaseAction", v1, 2u);
}

void __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Error attempting silent auth: %@", (uint8_t *)&v2, 0xCu);
}

@end
