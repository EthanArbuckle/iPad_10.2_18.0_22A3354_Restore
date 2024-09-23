@implementation ICQBundlesHook

- (ICQBundlesHook)initWithFlowManager:(id)a3
{
  id v4;
  ICQBundlesHook *v5;
  ICQBundlesHook *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQBundlesHook;
  v5 = -[ICQBundlesHook init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_flowManager, v4);

  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
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
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LAUNCH_BUNDLE_OFFER_VIEW")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "clientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("ICQActionLaunchAppleOne"));

  }
  return v6;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  NSDictionary *v7;
  NSDictionary *clientInfo;
  void *v9;
  id completionHandler;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  clientInfo = self->_clientInfo;
  self->_clientInfo = v7;

  +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:](ICQPurchase, "clearCacheAndNotifyClientsWithCompletion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  completionHandler = self->_completionHandler;
  self->_completionHandler = v9;

  -[ICQBundlesHook launchBundleOffer](self, "launchBundleOffer");
}

- (RUIServerHookResponse)serverHookResponse
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL v7;
  id v8;
  int64_t statusCode;
  int64_t amsAction;
  int64_t amsErrorCode;
  NSObject *v12;
  NSString *buyParamsStr;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("refreshHttpMethod"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "No refresh URL or Http method found.", buf, 2u);
    }
    v8 = 0;
  }
  else
  {
    if (v6)
    {
      statusCode = self->_statusCode;
      amsErrorCode = self->_amsErrorCode;
      amsAction = self->_amsAction;
      *(_DWORD *)buf = 134218496;
      v19 = statusCode;
      v20 = 2048;
      v21 = amsAction;
      v22 = 2048;
      v23 = amsErrorCode;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "_statusCode = %ld, _amsAction = %ld, _amsErrorCode = %ld", buf, 0x20u);
    }

    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      buyParamsStr = self->_buyParamsStr;
      *(_DWORD *)buf = 138412290;
      v19 = (int64_t)buyParamsStr;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "_buyParamsStr = %@", buf, 0xCu);
    }

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v3);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'><plist version='1.0'><dict><key>statusCode</key><integer>%ld</integer><key>amsAction</key><integer>%ld</integer><key>amsErrorCode</key><integer>%ld</integer><key>buyParams</key><string>%@</string></dict></plist>"), self->_statusCode, self->_amsAction, self->_amsErrorCode, self->_buyParamsStr);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHTTPBody:", v16);

    objc_msgSend(v14, "setHTTPMethod:", v4);
    v8 = objc_alloc_init(MEMORY[0x24BE7EE00]);
    objc_msgSend(v8, "setContinuationRequest:", v14);

  }
  return (RUIServerHookResponse *)v8;
}

- (id)continuationResponseBody
{
  void *v3;
  void *v4;
  void *v5;
  NSString *buyParamsStr;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("statusCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_statusCode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("amsErrorCodes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_amsErrorCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("amsAction");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_amsAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = CFSTR("buyParams");
  buyParamsStr = self->_buyParamsStr;
  v10[2] = v5;
  v10[3] = buyParamsStr;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)launchBundleOffer
{
  ICQServerHookDelegate **p_flowManager;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  UIViewController *v15;
  UIViewController *presentingViewController;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  p_flowManager = &self->_flowManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  objc_msgSend(WeakRetained, "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "action");

  if (v6 == 118)
  {
    v7 = objc_loadWeakRetained((id *)p_flowManager);
    objc_msgSend(v7, "presentHostingNavigationController");

  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "present bundle start from server hook path", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE08050], "quotaBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v9;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "bag = %@", buf, 0xCu);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08648]), "initWithServiceType:placement:bag:", CFSTR("icloud"), CFSTR("iCloudPreBuyFlow"), v9);
  objc_msgSend(v11, "setDelegate:", self);
  -[ICQBundlesHook setAdditionalParameters:](self, "setAdditionalParameters:", v11);
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "replacing the spinner with bundle view", buf, 2u);
  }

  v13 = objc_loadWeakRetained((id *)p_flowManager);
  objc_msgSend(v13, "hostingNavigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentingViewController");
  v15 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v15;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = objc_loadWeakRetained((id *)p_flowManager);
  objc_msgSend(v18, "hostingNavigationController", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "navigationBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subviews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v26, "setHidden:", 1);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v23);
  }

  v27 = objc_loadWeakRetained((id *)p_flowManager);
  objc_msgSend(v27, "hostingNavigationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNavigationBarHidden:animated:", 0, 0);

  v29 = objc_loadWeakRetained((id *)p_flowManager);
  objc_msgSend(v29, "hostingNavigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setViewControllers:", v17);

}

- (void)setAdditionalParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_activeiTunesAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "acc = %@", buf, 0xCu);
  }

  objc_msgSend(v4, "setAccount:", v6);
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("amsParams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE50]);
    -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("amsParams"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v10, 0);

    if (v11)
    {
      v39 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, &v39);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v39;
      if (v13)
      {
        v14 = v13;
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v14;
          _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "error parsing ams bundle dictionary: %@", buf, 0xCu);
        }

LABEL_13:
        goto LABEL_14;
      }
      if (v12)
      {
        _ICQGetLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v12;
          _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "AMS Bundle additional Parameters = %@", buf, 0xCu);
        }

        objc_msgSend(v4, "setClientOptions:", v12);
        v14 = v12;
        goto LABEL_13;
      }
    }
LABEL_14:

  }
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  objc_msgSend(WeakRetained, "offer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "appVersionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v19, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%@ MBF/1.0 CastleSettings/1.0"), v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUserAgentSuffix:", v23);

  objc_msgSend(v4, "setClientInfo:", v17);
  objc_msgSend(v4, "setMediaClientIdentifier:", CFSTR("com.apple.RemoteICloudQuotaUI"));
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v24, "setObject:forKey:", CFSTR("icloud"), CFSTR("app"));
  objc_msgSend(v24, "setObject:forKey:", CFSTR("xp_its_main"), CFSTR("topic"));
  objc_msgSend(v6, "ams_DSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v6, "ams_DSID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("DSID"));

  }
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("precedingMarketing"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x24BDBCE50]);
    -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("precedingMarketing"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithBase64EncodedString:options:", v29, 0);

    if (v30)
    {
      v37 = v5;
      v38 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v30, 0, &v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v38;
      if (v32)
      {
        v33 = v32;
        _ICQGetLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v33;
          _os_log_impl(&dword_21F2CC000, v34, OS_LOG_TYPE_DEFAULT, "error parsing precedingMarketing dictionary: %@", buf, 0xCu);
        }

LABEL_27:
        v5 = v37;
        goto LABEL_28;
      }
      if (v31)
      {
        _ICQGetLogSystem();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v31;
          _os_log_impl(&dword_21F2CC000, v35, OS_LOG_TYPE_DEFAULT, "AMS precedingMarketing = %@", buf, 0xCu);
        }

        objc_msgSend(v24, "setObject:forKey:", v31, CFSTR("precedingMarketing"));
        v33 = v31;
        goto LABEL_27;
      }
    }
LABEL_28:

  }
  _ICQGetLogSystem();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v24;
    _os_log_impl(&dword_21F2CC000, v36, OS_LOG_TYPE_DEFAULT, "Setting overlayDictionary = %@", buf, 0xCu);
  }

  objc_msgSend(v4, "setMetricsOverlay:", v24);
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  char *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  UIViewController *presentingViewController;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *buyParamsStr;
  NSString *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  int64_t amsErrorCode;
  void *v41;
  id v42;
  int v43;
  const char *v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  void *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = (char *)a4;
  v10 = (char *)a5;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewControllerDelegate:didFinishPurchaseWithResult", (uint8_t *)&v43, 2u);
  }

  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 138412290;
    v44 = v8;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewController = %@", (uint8_t *)&v43, 0xCu);
  }

  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 138412290;
    v44 = v9;
    _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "AMSPurchaseResult = %@", (uint8_t *)&v43, 0xCu);
  }

  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 138412290;
    v44 = v10;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "error = %@", (uint8_t *)&v43, 0xCu);
  }

  v15 = objc_msgSend(v10, "code");
  self->_amsErrorCode = v15;
  if (v9)
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 136315138;
      v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
      _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "%s: We have a purchase result", (uint8_t *)&v43, 0xCu);
    }

    v17 = (void *)MEMORY[0x24BDBCE30];
    v18 = objc_alloc_init(MEMORY[0x24BE04DB0]);
    objc_msgSend(v17, "arrayWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
    objc_msgSend(WeakRetained, "hostingNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setViewControllers:", v19);

    v22 = objc_loadWeakRetained((id *)&self->_flowManager);
    objc_msgSend(v22, "hostingNavigationController");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      -[UIViewController presentedViewController](self->_presentingViewController, "presentedViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        presentingViewController = self->_presentingViewController;
        v27 = objc_loadWeakRetained((id *)&self->_flowManager);
        -[NSObject hostingNavigationController](v27, "hostingNavigationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController presentPreferredSizeWithViewController:animated:completion:](presentingViewController, "presentPreferredSizeWithViewController:animated:completion:", v28, 1, 0);

LABEL_22:
        self->_statusCode = 0;
        objc_msgSend(v9, "purchase");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("mtTopic");
        v50[0] = CFSTR("xp_its_main");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setMetricsOverlay:", v31);

        objc_msgSend(v30, "buyParams");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "stringValue");
          v34 = (NSString *)objc_claimAutoreleasedReturnValue();
          buyParamsStr = self->_buyParamsStr;
          self->_buyParamsStr = v34;

          objc_msgSend(MEMORY[0x24BEC7350], "base64EncodeString:", self->_buyParamsStr);
          v36 = (NSString *)objc_claimAutoreleasedReturnValue();
          v37 = self->_buyParamsStr;
          self->_buyParamsStr = v36;
        }
        else
        {
          _ICQGetLogSystem();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:].cold.1(v37);
        }

        self->_amsAction = 2;
        v10 = 0;
        v38 = 1;
        goto LABEL_33;
      }
    }
    else
    {

    }
    _ICQGetLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:].cold.2((id *)&self->_flowManager, (uint64_t)self, v27);
    goto LABEL_22;
  }
  if (v15)
  {
    if (v15 == 6)
    {
      _ICQGetLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 136315138;
        v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
        _os_log_impl(&dword_21F2CC000, v29, OS_LOG_TYPE_DEFAULT, "%s: Cancelled", (uint8_t *)&v43, 0xCu);
      }
    }
    else
    {
      _ICQGetLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        amsErrorCode = self->_amsErrorCode;
        objc_msgSend(v10, "localizedDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 136315650;
        v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
        v45 = 2048;
        v46 = amsErrorCode;
        v47 = 2112;
        v48 = v41;
        _os_log_impl(&dword_21F2CC000, v29, OS_LOG_TYPE_DEFAULT, "%s: Error code %ld. Error: %@", (uint8_t *)&v43, 0x20u);

      }
    }

    v38 = 0;
    self->_statusCode = 1;
    self->_amsAction = 1;
  }
  else
  {
    _ICQGetLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 136315138;
      v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
      _os_log_impl(&dword_21F2CC000, v39, OS_LOG_TYPE_DEFAULT, "%s: no error & no purchase result -- counting this as success.", (uint8_t *)&v43, 0xCu);
    }

    v38 = 1;
    self->_statusCode = 1;
    self->_amsAction = 2;

    v10 = 0;
  }
LABEL_33:
  (*((void (**)(void))self->_completionHandler + 2))();
  v42 = objc_loadWeakRetained((id *)&self->_flowManager);
  objc_msgSend(v42, "dismissUpgradeFlowWithSuccess:", v38);

}

- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSString *buyParamsStr;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewControllerDelegate:contentViewControllerWithDictionary", (uint8_t *)&v11, 2u);
  }

  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "contentViewControllerDictionary = %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04DB0]), "initWithNibName:bundle:", 0, 0);
  self->_statusCode = 1;
  self->_amsErrorCode = 0;
  self->_amsAction = 0;
  buyParamsStr = self->_buyParamsStr;
  self->_buyParamsStr = (NSString *)&stru_24E400750;

  (*((void (**)(void))self->_completionHandler + 2))();
  return v8;
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ICQBundlesHook dynamicViewControllerShouldDismiss:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  objc_msgSend(WeakRetained, "dismissUpgradeFlowWithSuccess:", 0);

  return 0;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)buffervar
{
  return self->_buffervar;
}

- (void)setBuffervar:(id)a3
{
  objc_storeStrong((id *)&self->_buffervar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffervar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_buyParamsStr, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_destroyWeak((id *)&self->_flowManager);
}

- (void)dynamicViewController:(os_log_t)log didFinishPurchaseWithResult:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "AMSBuyParams object not found or corrupted", v1, 2u);
}

- (void)dynamicViewController:(id *)a1 didFinishPurchaseWithResult:(uint64_t)a2 error:(NSObject *)a3 .cold.2(id *a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "hostingNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 64), "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("YES");
  v10 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
  v9 = 136315650;
  if (!v7)
    v8 = CFSTR("NO");
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_21F2CC000, a3, OS_LOG_TYPE_ERROR, "%s: failed to present with _flowManager.hostingNavigationController: %@, _presentingViewController.presentedViewController: %@", (uint8_t *)&v9, 0x20u);

}

@end
