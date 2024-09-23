@implementation ICQiCloudHeaderSpecifierProvider

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQiCloudHeaderSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 navigationController:(id)a4
{
  return -[ICQiCloudHeaderSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICQiCloudHeaderSpecifierProvider *v9;
  ICQiCloudHeaderSpecifierProvider *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQiCloudHeaderSpecifierProvider;
  v9 = -[ICQiCloudHeaderSpecifierProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    -[ICQiCloudHeaderSpecifierProvider account](v10, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQJetAnalytics preloadWithAccount:](ICQJetAnalytics, "preloadWithAccount:", v11);

  }
  return v10;
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSpecifiers:(id)a3
{
  NSArray *v4;
  NSArray *specifiers;

  v4 = (NSArray *)a3;
  -[AAUISpecifierProvider setSpecifiers:](self->_storageViolationTipSpecifierProvider, "setSpecifiers:", 0);
  specifiers = self->_specifiers;
  self->_specifiers = v4;

}

- (void)setDelegate:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  ICQCloudStorageSpecifierProvider *v5;
  AIDAAccountManager *accountManager;
  id WeakRetained;
  ICQCloudStorageSpecifierProvider *v8;
  ICQCloudStorageSpecifierProvider *storageGroupSpecifierProvider;
  id v10;
  ICQUITipSpecifierProvider *v11;
  AIDAAccountManager *v12;
  id v13;
  AAUISpecifierProvider *v14;
  AAUISpecifierProvider *storageViolationTipSpecifierProvider;
  id v16;
  ICQUITipSpecifierProvider *v17;
  AIDAAccountManager *v18;
  id v19;
  AAUISpecifierProvider *v20;
  AAUISpecifierProvider *recommendationsTipSpecifierProvider;
  id v22;

  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  v5 = [ICQCloudStorageSpecifierProvider alloc];
  accountManager = self->_accountManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v8 = -[ICQCloudStorageSpecifierProvider initWithAccountManager:presenter:](v5, "initWithAccountManager:presenter:", accountManager, WeakRetained);
  storageGroupSpecifierProvider = self->_storageGroupSpecifierProvider;
  self->_storageGroupSpecifierProvider = v8;

  v10 = objc_loadWeakRetained((id *)p_delegate);
  -[ICQCloudStorageSpecifierProvider setDelegate:](self->_storageGroupSpecifierProvider, "setDelegate:", v10);

  v11 = [ICQUITipSpecifierProvider alloc];
  v12 = self->_accountManager;
  v13 = objc_loadWeakRetained((id *)&self->_listController);
  v14 = -[ICQUITipSpecifierProvider initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:](v11, "initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:", v12, v13, *MEMORY[0x24BEC7240], 1);
  storageViolationTipSpecifierProvider = self->_storageViolationTipSpecifierProvider;
  self->_storageViolationTipSpecifierProvider = v14;

  v16 = objc_loadWeakRetained((id *)p_delegate);
  -[AAUISpecifierProvider setDelegate:](self->_storageViolationTipSpecifierProvider, "setDelegate:", v16);

  v17 = [ICQUITipSpecifierProvider alloc];
  v18 = self->_accountManager;
  v19 = objc_loadWeakRetained((id *)&self->_listController);
  v20 = -[ICQUITipSpecifierProvider initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:](v17, "initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:", v18, v19, *MEMORY[0x24BEC7278], 0);
  recommendationsTipSpecifierProvider = self->_recommendationsTipSpecifierProvider;
  self->_recommendationsTipSpecifierProvider = v20;

  v22 = objc_loadWeakRetained((id *)p_delegate);
  -[AAUISpecifierProvider setDelegate:](self->_recommendationsTipSpecifierProvider, "setDelegate:", v22);

}

- (NSArray)specifiers
{
  id v3;
  void *v4;
  NSArray *v5;
  NSArray *storageSpecifiers;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSArray firstObject](self->_storageSpecifiers, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ICQCloudStorageSpecifierProvider specifiers](self->_storageGroupSpecifierProvider, "specifiers");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    storageSpecifiers = self->_storageSpecifiers;
    self->_storageSpecifiers = v5;

  }
  objc_msgSend(v3, "addObjectsFromArray:", self->_storageSpecifiers);
  -[AAUISpecifierProvider specifiers](self->_storageViolationTipSpecifierProvider, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[AAUISpecifierProvider specifiers](self->_storageViolationTipSpecifierProvider, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  -[AAUISpecifierProvider specifiers](self->_recommendationsTipSpecifierProvider, "specifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[AAUISpecifierProvider specifiers](self->_recommendationsTipSpecifierProvider, "specifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v13;
}

- (BOOL)handleURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[ICQCloudStorageSpecifierProvider handleURL:](self->_storageGroupSpecifierProvider, "handleURL:", v4))
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = (const char *)v4;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "ICQiCloudHeaderSpecifierProvider Storage Specifier handled: %@", buf, 0xCu);
    }

  }
  else if (objc_msgSend(v5, "icqui_isReviewLargeFilesPath"))
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[ICQiCloudHeaderSpecifierProvider handleURL:]";
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s: Received review large files url", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ICQiCloudHeaderSpecifierProvider_handleURL___block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    if (!objc_msgSend(v5, "icqui_isCFUSkipPath"))
    {
      v9 = 0;
      goto LABEL_15;
    }
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[ICQiCloudHeaderSpecifierProvider handleURL:]";
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s: Received CFU skip url from lockscreen notification", buf, 0xCu);
    }

    -[ICQiCloudHeaderSpecifierProvider _handleSkippedCFUWithResourceDictionary:](self, "_handleSkippedCFUWithResourceDictionary:", v4);
  }
  v9 = 1;
LABEL_15:

  return v9;
}

void __46__ICQiCloudHeaderSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  ICQUIReviewLargeFilesFlowController *v3;

  v3 = objc_alloc_init(ICQUIReviewLargeFilesFlowController);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "presentPreferredSizeWithViewController:animated:completion:", v3, 1, &__block_literal_global_26);

}

- (void)_handleSkippedCFUWithResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  ICQiCloudHeaderSpecifierProvider *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEC71C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEC7388]);
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEC7380]);
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke;
    v14[3] = &unk_24E3F5D80;
    v14[4] = self;
    objc_msgSend(v8, "getPremiumOfferWithCompletion:", v14);
  }
  else
  {
    if (!v7)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_3;
      v10[3] = &unk_24E3F5CA0;
      v11 = v4;
      v12 = self;
      objc_msgSend(v9, "getOfferWithCompletion:", v10);

      goto LABEL_7;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_2;
    v13[3] = &unk_24E3F5DA8;
    v13[4] = self;
    objc_msgSend(v8, "getEventOfferWithOptions:completion:", 0, v13);
  }

LABEL_7:
}

uint64_t __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchServerUIFlowWithOffer:", a2);
}

uint64_t __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchServerUIFlowWithOffer:", a2);
}

void __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "offerId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BEC71D8]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x24BEC71E0];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "ICQiCloudHeaderSpecifierProvider sending updateOfferId:%@ buttonId:%@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateOfferId:buttonId:info:completion:", v7, v11, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "_launchServerUIFlowWithOffer:", v5);
}

- (void)_launchServerUIFlowWithOffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "followupSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteActivateLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "action");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ICQiCloudHeaderSpecifierProvider__launchServerUIFlowWithOffer___block_invoke;
  block[3] = &unk_24E3F4898;
  v11 = v3;
  v12 = v6;
  v10 = v5;
  v7 = v3;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__ICQiCloudHeaderSpecifierProvider__launchServerUIFlowWithOffer___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  ICQUpgradeFlowManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasServerUIAction");
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      _ICQStringForAction();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Handling serverUI action %@ in link %@", (uint8_t *)&v12, 0x16u);

    }
    v7 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", *(_QWORD *)(a1 + 40));
    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:](v7, "beginRemoteUpgradeFlowWithICQLink:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      _ICQStringForAction();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "No special handling for action %@ in link %@, falling back to performAction.", (uint8_t *)&v12, 0x16u);

    }
    v10 = (void *)MEMORY[0x24BEC72E0];
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "parameters");
    v7 = (ICQUpgradeFlowManager *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performAction:parameters:options:", v11, v7, 0);
  }

}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recommendationsTipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageSpecifiers, 0);
  objc_storeStrong((id *)&self->_storageViolationTipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageGroupSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
