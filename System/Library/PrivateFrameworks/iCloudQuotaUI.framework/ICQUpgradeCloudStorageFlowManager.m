@implementation ICQUpgradeCloudStorageFlowManager

+ (BOOL)shouldSubclassShowForOffer:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(v4, "isBuddyOffer"))
    v5 = objc_msgSend(a1, "_canDoTokenPurchaseWithOffer:", v4);
  else
    v5 = 1;

  return v5;
}

- (id)initSubclassWithOffer:(id)a3
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICQUpgradeCloudStorageFlowManager;
  v3 = -[ICQUpgradeFlowManager initSubclassWithOffer:](&v9, sel_initSubclassWithOffer_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("ICQUpgradeFlowURLSession"));
    objc_msgSend(v4, "set_appleIDContext:", v5);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[31];
    v3[31] = v6;

  }
  return v3;
}

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id purchaseCompletionHandler;
  NSString *v10;
  NSString *storagePurchaseButtonId;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  ICQUpgradeStorageHook *v21;
  void *v22;
  ICQUpgradeStorageHook *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  purchaseCompletionHandler = self->_purchaseCompletionHandler;
  self->_purchaseCompletionHandler = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEC71D8]);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  storagePurchaseButtonId = self->_storagePurchaseButtonId;
  self->_storagePurchaseButtonId = v10;

  -[ICQUpgradeCloudStorageFlowManager storagePurchaseKeybag](self, "storagePurchaseKeybag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager setBindings:](self, "setBindings:", v12);

  if (!self->_storagePurchaseButtonId)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v6;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Attempt to upgrade cloud storage without proper button ID (parameters: %@)", (uint8_t *)&v25, 0xCu);
    }

  }
  -[ICQUpgradeFlowManager bindings](self, "bindings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("buyParams"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_11;
  }
  v16 = (void *)v15;
  objc_msgSend(v6, "objectForKey:", CFSTR("osloPurchase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_11:
    -[ICQUpgradeCloudStorageFlowManager _performPurchase](self, "_performPurchase");
    goto LABEL_12;
  }
  _ICQGetLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQUpgradeFlowManager bindings](self, "bindings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("buyParams"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v20;
    _os_log_impl(&dword_21F2CC000, v18, OS_LOG_TYPE_DEFAULT, "Performing purchase using oslo with buyParams = %@", (uint8_t *)&v25, 0xCu);

  }
  v21 = [ICQUpgradeStorageHook alloc];
  -[ICQUpgradeFlowManager offer](self, "offer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ICQUpgradeStorageHook initWithOffer:flowDelegate:](v21, "initWithOffer:flowDelegate:", v22, self);

  -[ICQUpgradeStorageHook setButtonId:](v23, "setButtonId:", self->_storagePurchaseButtonId);
  -[ICQUpgradeStorageHook setFlowtype:](v23, "setFlowtype:", CFSTR("native"));
  +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:](ICQPurchase, "clearCacheAndNotifyClientsWithCompletion:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeStorageHook setCompletionHandler:](v23, "setCompletionHandler:", v24);

  -[ICQUpgradeStorageHook beginOsloPurchaseFlow](v23, "beginOsloPurchaseFlow");
LABEL_12:

}

- (NSDictionary)storagePurchaseKeybag
{
  void *v3;
  void *v4;
  void *v5;

  -[ICQUpgradeFlowManager offer](self, "offer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeCloudStorageFlowManager storagePurchaseButtonId](self, "storagePurchaseButtonId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storagePurchaseKeybagForButtonId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)_buyProductQueryKeySet
{
  if (_buyProductQueryKeySet_onceToken != -1)
    dispatch_once(&_buyProductQueryKeySet_onceToken, &__block_literal_global_9);
  return (id)_buyProductQueryKeySet_sBuyProductQueryKeySet;
}

void __59__ICQUpgradeCloudStorageFlowManager__buyProductQueryKeySet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E435E18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_buyProductQueryKeySet_sBuyProductQueryKeySet;
  _buyProductQueryKeySet_sBuyProductQueryKeySet = v0;

}

- (id)_buyProductQueryDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[ICQUpgradeCloudStorageFlowManager storagePurchaseKeybag](self, "storagePurchaseKeybag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICQUpgradeCloudStorageFlowManager _buyProductQueryKeySet](self, "_buyProductQueryKeySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412290;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v11, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v3, "setObject:forKey:", v12, v11);
        }
        else
        {
          _ICQGetLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "query item %@ missing from keybag", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (id)_dummyRequestWithAccount:(id)a3 token:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "adding storageBuyingToken: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v5, "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v6, v12);

  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (id)_storageContextJSONString
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
        _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Could not convert storage context for bundleID \"%@\" to JSON. Error: %@", buf, 0x16u);
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

- (id)_storageContextHeaderDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[ICQUpgradeCloudStorageFlowManager _storageContextJSONString](self, "_storageContextJSONString");
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

- (void)_buyProductShouldUseToken:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  ICQUpgradeCloudStorageFlowManager *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v4 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v19 = 0;
LABEL_10:
    -[ICQUpgradeCloudStorageFlowManager _dummyRequestWithAccount:token:](self, "_dummyRequestWithAccount:token:", v8, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSession configuration](self->_buyProductSession, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_appleIDContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appleIDHeadersForRequest:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v23;
      _os_log_impl(&dword_21F2CC000, v22, OS_LOG_TYPE_DEFAULT, "AKAppleIDSession returned %@ headers", buf, 0xCu);

    }
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      -[ICQUpgradeCloudStorageFlowManager _buyProductQueryDictionary](self, "_buyProductQueryDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeCloudStorageFlowManager _storageContextHeaderDictionary](self, "_storageContextHeaderDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self;
      v27 = 0;
      v28 = v10;
      v29 = v25;
    }
    else
    {
      v10 = (void *)objc_msgSend(v12, "mutableCopy");
      -[ICQUpgradeCloudStorageFlowManager _storageContextHeaderDictionary](self, "_storageContextHeaderDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v24);

      -[ICQUpgradeCloudStorageFlowManager _buyProductQueryDictionary](self, "_buyProductQueryDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self;
      v27 = v19;
      v28 = v25;
      v29 = v10;
    }
    -[ICQUpgradeCloudStorageFlowManager _adoptRemoteUIWithPurchaseToken:buyParameters:requestHeaders:](v26, "_adoptRemoteUIWithPurchaseToken:buyParameters:requestHeaders:", v27, v28, v29);

    goto LABEL_29;
  }
  objc_msgSend(v7, "aa_grandSlamAccountForiCloudAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v7, "credentialForAccount:serviceID:error:", v9, CFSTR("com.apple.gs.icloud.storage.buy"), &v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v34;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD1398]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.accounts.keychain")))
    {
      v16 = objc_msgSend(v14, "code");

      if (v16 == -128)
      {
        _ICQGetLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "user canceled", buf, 2u);
        }

        if (!v6)
          goto LABEL_27;
        v18 = 3;
LABEL_26:
        v6[2](v6, v18);
LABEL_27:

LABEL_28:
        v19 = 0;
        goto LABEL_29;
      }
    }
    else
    {

    }
    _ICQGetLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v12;
      _os_log_impl(&dword_21F2CC000, v32, OS_LOG_TYPE_DEFAULT, "storage buy get token error %@", buf, 0xCu);
    }

    if (!v6)
      goto LABEL_27;
    v18 = 2;
    goto LABEL_26;
  }
  objc_msgSend(v10, "token");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    _ICQGetLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (!v19)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v30, OS_LOG_TYPE_DEFAULT, "no storage buy token present", buf, 2u);
      }

      if (v6)
        v6[2](v6, 2);
      goto LABEL_28;
    }
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v30, OS_LOG_TYPE_DEFAULT, "valid purchase", buf, 2u);
    }

    goto LABEL_10;
  }
  _ICQGetLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v33, OS_LOG_TYPE_DEFAULT, "credential nil but no error reported", buf, 2u);
  }

  if (v6)
    v6[2](v6, 2);
LABEL_29:

}

- (void)_adoptRemoteUIWithPurchaseToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *purchaseCompletionHandler;
  ICQUICloudStorageOffersManager *v20;
  ICQUICloudStorageOffersManager *storageOffersManager;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  ICQUICloudStorageOffersManager *v30;
  int v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICQUpgradeFlowManager offer](self, "offer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBuddyOffer");

  if (v10)
    v13 = v9 == 0;
  else
    v13 = 1;
  v14 = v13 || v8 == 0;
  if (!v14 || !v12)
  {
    if (!self->_storageOffersManager)
    {
      v20 = objc_alloc_init(ICQUICloudStorageOffersManager);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v20;

      -[ICQUICloudStorageOffersManager setSkipCompletionAlert:](self->_storageOffersManager, "setSkipCompletionAlert:", 1);
      -[ICQUICloudStorageOffersManager setSupportsModernAlerts:](self->_storageOffersManager, "setSupportsModernAlerts:", 1);
      -[ICQUpgradeCloudStorageFlowManager storagePurchaseKeybag](self, "storagePurchaseKeybag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("totalStorage"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "doubleValue");
          -[ICQUICloudStorageOffersManager setRequiredStorageThreshold:](self->_storageOffersManager, "setRequiredStorageThreshold:", (unint64_t)(v24 * 1000000000.0));
        }
      }
      -[ICQUICloudStorageOffersManager setDelegate:](self->_storageOffersManager, "setDelegate:", self);

    }
    -[ICQUpgradeFlowManager offer](self, "offer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUICloudStorageOffersManager setSkipRetryWithoutToken:](self->_storageOffersManager, "setSkipRetryWithoutToken:", objc_msgSend(v25, "isBuddyOffer"));

    _ICQGetLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICQUICloudStorageOffersManager skipRetryWithoutToken](self->_storageOffersManager, "skipRetryWithoutToken"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v27;
      _os_log_impl(&dword_21F2CC000, v26, OS_LOG_TYPE_DEFAULT, "skipRetryWithoutToken == %{public}@", (uint8_t *)&v31, 0xCu);

    }
    _ICQGetLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("YES");
      if (!v8)
        v29 = CFSTR("NO");
      v31 = 138543618;
      v32 = v29;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_21F2CC000, v28, OS_LOG_TYPE_DEFAULT, "Calling out to ICQUICloudStorageOffersManager with purchaseToken:%{public}@, buyParameters:%{public}@", (uint8_t *)&v31, 0x16u);
    }

    v30 = self->_storageOffersManager;
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    purchaseCompletionHandler = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:purchaseToken:buyParameters:requestHeaders:modally:](v30, "beginFlowWithNavigationController:purchaseToken:buyParameters:requestHeaders:modally:", purchaseCompletionHandler, v8, v9, v10, 0);
    goto LABEL_26;
  }
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Token not available and legacy flow cannot be used in Buddy; returning token missing failure",
      (uint8_t *)&v31,
      2u);
  }

  -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeCloudStorageFlowManager secureTokenMissingError](self, "secureTokenMissingError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v18);

    purchaseCompletionHandler = self->_purchaseCompletionHandler;
    self->_purchaseCompletionHandler = 0;
LABEL_26:

  }
}

- (void)_performPurchaseUsingSettingsUI
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Switch to purchase flow using settings UI", v6, 2u);
  }

  -[ICQUpgradeCloudStorageFlowManager _buyProductQueryDictionary](self, "_buyProductQueryDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeCloudStorageFlowManager _storageContextHeaderDictionary](self, "_storageContextHeaderDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeCloudStorageFlowManager _adoptRemoteUIWithPurchaseToken:buyParameters:requestHeaders:](self, "_adoptRemoteUIWithPurchaseToken:buyParameters:requestHeaders:", 0, v4, v5);

}

- (void)_performPurchaseUsingTouchID
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Authenticating purchase using Touch ID", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke;
  v4[3] = &unk_24E3F4288;
  v4[4] = self;
  -[ICQUpgradeCloudStorageFlowManager _buyProductShouldUseToken:completionHandler:](self, "_buyProductShouldUseToken:completionHandler:", 1, v4);
}

void __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke_2;
  v2[3] = &unk_24E3F41B8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = result;
  switch(*(_QWORD *)(result + 40))
  {
    case 0:
      _ICQGetLogSystem();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "ERROR: Unexpected ICQBuyProductSucceeded -- should go through ICQUICloudStorageOffersManager", v3, 2u);
      }

      objc_msgSend(*(id *)(v1 + 32), "_presentUpgradeComplete");
      result = objc_msgSend(*(id *)(v1 + 32), "_clearBusyOfferViewController");
      break;
    case 2:
    case 4:
      objc_msgSend(*(id *)(result + 32), "_clearBusyOfferViewController");
      result = objc_msgSend(*(id *)(v1 + 32), "_performPurchaseUsingSettingsUI");
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 32), "_cancelFlow");
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)_canDoTokenPurchaseWithOffer:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  dispatch_semaphore_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  uint8_t v18[16];
  _QWORD v19[4];
  NSObject *v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  if ((objc_msgSend(v3, "iTunesAccountExists") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPasscodeSet");

    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "checking biometric state", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v23 = buf;
      v24 = 0x2020000000;
      v25 = 5;
      v8 = dispatch_semaphore_create(0);
      v9 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __66__ICQUpgradeCloudStorageFlowManager__canDoTokenPurchaseWithOffer___block_invoke;
      v19[3] = &unk_24E3F42B0;
      v21 = buf;
      v10 = v8;
      v20 = v10;
      objc_msgSend(v9, "getStateWithCompletionBlock:", v19);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      v11 = *((_QWORD *)v23 + 3);
      v12 = v11 == 1;
      if (v11 == 1)
      {
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        *(_WORD *)v18 = 0;
        v13 = "Touch ID purchase should be available";
      }
      else
      {
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_WORD *)v18 = 0;
        v13 = "Touch ID purchase not enabled";
      }
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, v13, v18, 2u);
      goto LABEL_18;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      v14 = "no Touch ID purchase: Passcode not set";
      goto LABEL_13;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "no Touch ID purchase: iTunes account does not exist";
LABEL_13:
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }

  v12 = 0;
LABEL_19:

  return v12;
}

intptr_t __66__ICQUpgradeCloudStorageFlowManager__canDoTokenPurchaseWithOffer___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_performPurchase
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_opt_class();
  -[ICQUpgradeFlowManager offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_canDoTokenPurchaseWithOffer:", v4);

  if ((_DWORD)v3)
  {
    -[ICQUpgradeCloudStorageFlowManager _performPurchaseUsingTouchID](self, "_performPurchaseUsingTouchID");
  }
  else
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "_performPurchase: _canDoTokenPurchaseWithOffer: says NO", v6, 2u);
    }

    -[ICQUpgradeCloudStorageFlowManager _performPurchaseUsingSettingsUI](self, "_performPurchaseUsingSettingsUI");
  }
}

- (id)secureTokenMissingError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB2A58], 1003, 0);
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
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
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "will present view controller %@", (uint8_t *)&v7, 0xCu);
  }

  -[ICQUpgradeFlowManager _clearBusyOfferViewController](self, "_clearBusyOfferViewController");
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id purchaseCompletionHandler;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "load failed with error %@", (uint8_t *)&v19, 0xCu);
  }

  if (v5)
  {
    v7 = v5;
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Preferences.cloud-storage-offers"));

    if (v9)
    {
      v10 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
      if (v10 != 1)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v7, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEB24A0]))
      {

      }
      else
      {
        objc_msgSend(v7, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB2A58]);

        if (!v15)
          goto LABEL_13;
      }
      if (objc_msgSend(v7, "code") != 16 && objc_msgSend(v7, "code") != 140)
      {
LABEL_13:
        -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, id))v17)[2](v17, 0, v7);

          purchaseCompletionHandler = self->_purchaseCompletionHandler;
          self->_purchaseCompletionHandler = 0;

        }
        goto LABEL_15;
      }
    }
    -[ICQUpgradeFlowManager _cancelFlow](self, "_cancelFlow");
LABEL_15:

  }
}

- (void)managerDidCancel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "cloud storage offers manager canceled", v5, 2u);
  }

  -[ICQUpgradeFlowManager _cancelFlow](self, "_cancelFlow");
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id purchaseCompletionHandler;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers manager did complete with error %@", (uint8_t *)&v16, 0xCu);
  }

  -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v5 == 0;
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Preferences.cloud-storage-offers"));

    if (v12)
    {
      if (objc_msgSend(v5, "code"))
        v10 = objc_msgSend(v5, "code") == 2;
      else
        v10 = 1;
    }
    -[ICQUpgradeCloudStorageFlowManager purchaseCompletionHandler](self, "purchaseCompletionHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, void *))v14)[2](v14, v10, v9);

    purchaseCompletionHandler = self->_purchaseCompletionHandler;
    self->_purchaseCompletionHandler = 0;

  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "ERROR: purchaseCompletionHandler missing -- using fallback", (uint8_t *)&v16, 2u);
    }

    -[ICQUpgradeFlowManager _presentUpgradeComplete](self, "_presentUpgradeComplete");
    -[ICQUpgradeFlowManager _clearBusyOfferViewController](self, "_clearBusyOfferViewController");
  }

}

- (NSString)storagePurchaseButtonId
{
  return self->_storagePurchaseButtonId;
}

- (void)setStoragePurchaseButtonId:(id)a3
{
  objc_storeStrong((id *)&self->_storagePurchaseButtonId, a3);
}

- (ICQUICloudStorageOffersManager)storageOffersManager
{
  return self->_storageOffersManager;
}

- (void)setStorageOffersManager:(id)a3
{
  objc_storeStrong((id *)&self->_storageOffersManager, a3);
}

- (id)purchaseCompletionHandler
{
  return self->_purchaseCompletionHandler;
}

- (void)setPurchaseCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseCompletionHandler, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_storagePurchaseButtonId, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_buyProductSession, 0);
}

@end
