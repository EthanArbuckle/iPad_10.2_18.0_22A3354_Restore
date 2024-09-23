@implementation TSBuddyMLViewController

- (TSBuddyMLViewController)initWithCTPlan:(id)a3 websheetURL:(id)a4 postdata:(id)a5
{
  id v9;
  id v10;
  id v11;
  TSBuddyMLViewController *v12;
  TSBuddyMLViewController *v13;
  uint64_t v14;
  NSMutableArray *objectModels;
  id v16;
  uint64_t v17;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TSBuddyMLViewController;
  v12 = -[TSBuddyMLViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plan, a3);
    objc_storeStrong((id *)&v13->_buddyMLURL, a4);
    objc_storeStrong((id *)&v13->_postdata, a5);
    v13->_initialRequest = 1;
    v13->_isBootstrapAsserted = 0;
  }
  v14 = objc_opt_new();
  objectModels = v13->_objectModels;
  v13->_objectModels = (NSMutableArray *)v14;

  v16 = objc_alloc(MEMORY[0x24BDC2810]);
  v17 = objc_msgSend(v16, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  coreTelephonyClient = v13->_coreTelephonyClient;
  v13->_coreTelephonyClient = (CoreTelephonyClient *)v17;

  -[TSBuddyMLViewController _setUserInPurchaseFlow](v13, "_setUserInPurchaseFlow");
  return v13;
}

- (TSBuddyMLViewController)initWithCTPlan:(id)a3 inBuddy:(BOOL)a4
{
  id v7;
  TSBuddyMLViewController *v8;
  TSBuddyMLViewController *v9;
  uint64_t v10;
  NSMutableArray *objectModels;
  id v12;
  uint64_t v13;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TSBuddyMLViewController;
  v8 = -[TSBuddyMLViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_plan, a3);
    v9->_inBuddy = a4;
    v9->_initialRequest = 1;
    v9->_isBootstrapAsserted = 0;
  }
  v10 = objc_opt_new();
  objectModels = v9->_objectModels;
  v9->_objectModels = (NSMutableArray *)v10;

  v12 = objc_alloc(MEMORY[0x24BDC2810]);
  v13 = objc_msgSend(v12, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  coreTelephonyClient = v9->_coreTelephonyClient;
  v9->_coreTelephonyClient = (CoreTelephonyClient *)v13;

  -[TSBuddyMLViewController _setUserInPurchaseFlow](v9, "_setUserInPurchaseFlow");
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_isBootstrapAsserted)
  {
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  }
  v4.receiver = self;
  v4.super_class = (Class)TSBuddyMLViewController;
  -[TSBuddyMLViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  TSBuddyMLViewController *v10;
  id v11;

  -[TSBuddyMLViewController _configureRUIController](self, "_configureRUIController");
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_buddyMLURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", 5, v3, self->_postdata);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __38__TSBuddyMLViewController_viewDidLoad__block_invoke;
  v9 = &unk_24DEF2A48;
  v10 = self;
  v11 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], &v6);
  -[TSBuddyMLViewController setModalInPresentation:](self, "setModalInPresentation:", 1, v6, v7, v8, v9, v10);

}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteUIController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_24DEF3B20;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "loadRequest:completion:", v3, v4);

}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setBuddyMLURL:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1025) = 0;

}

- (void)viewWillAppear:(BOOL)a3
{
  RemoteUIController *remoteUIController;
  id v4;

  remoteUIController = self->_remoteUIController;
  -[TSBuddyMLViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RemoteUIController setHostViewController:](remoteUIController, "setHostViewController:", v4);

}

- (void)prepare:(id)a3
{
  id v4;
  void *v5;
  CTPlan *plan;
  _BOOL8 inBuddy;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  plan = self->_plan;
  inBuddy = self->_inBuddy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__TSBuddyMLViewController_prepare___block_invoke;
  v9[3] = &unk_24DEF3530;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "getWebsheetInfoForPlan:inBuddy:completion:", plan, inBuddy, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __35__TSBuddyMLViewController_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 131, a2);
    objc_storeStrong(v9 + 132, a3);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __35__TSBuddyMLViewController_prepare___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  -[NSMutableArray addObject:](self->_objectModels, "addObject:", a4);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[NSMutableArray indexOfObject:](self->_objectModels, "indexOfObject:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2080;
      v11 = "-[TSBuddyMLViewController remoteUIController:didRemoveObjectModel:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "RemoteUI removed an object model that is not on stack: %@ @%s", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_objectModels, "removeObjectAtIndex:", v6);
  }

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  NSString *v47;
  NSString *idNeedsEncryption;
  void *v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  const char *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = *a5;
    if (*a5 == 1)
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:]";
        _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "ActionSignalDismiss!!! @%s", buf, 0xCu);
      }

      objc_msgSend(v8, "clientInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[TSBuddyMLViewController _isActionDismissToCancelFlow:](self, "_isActionDismissToCancelFlow:", v11);

      if (v12)
      {
        -[TSBuddyMLViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userDidTapCancel");

      }
      v9 = *a5;
    }
    if (v9 == 2)
    {
      _TSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:]";
        _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "ActionSignalPush!!! @%s", buf, 0xCu);
      }

    }
    -[RemoteUIController displayedPages](self->_remoteUIController, "displayedPages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      if (*a5 == 4)
      {
        _TSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:].cold.2(v17, v26, v27, v28, v29, v30, v31, v32);
        v25 = 0;
      }
      else
      {
        if (*a5 != 3)
          goto LABEL_22;
        _TSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
        v25 = 2;
      }

      *a5 = v25;
    }
  }
LABEL_22:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v8, "allPages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v69;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v69 != v52)
          objc_enumerationMutation(obj);
        v55 = v33;
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v33), "tableViewOM");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v54 = v34;
        objc_msgSend(v34, "sections");
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v58)
        {
          v57 = *(_QWORD *)v65;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v65 != v57)
                objc_enumerationMutation(v56);
              v59 = v35;
              v36 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v35);
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              objc_msgSend(v36, "rows");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              if (v38)
              {
                v39 = v38;
                v40 = *(_QWORD *)v61;
                do
                {
                  for (i = 0; i != v39; ++i)
                  {
                    if (*(_QWORD *)v61 != v40)
                      objc_enumerationMutation(v37);
                    v42 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                    objc_msgSend(v42, "attributes");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("secure"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v44, "BOOLValue");

                    if (v45)
                    {
                      objc_msgSend(v42, "attributes");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "objectForKey:", CFSTR("id"));
                      v47 = (NSString *)objc_claimAutoreleasedReturnValue();
                      idNeedsEncryption = self->_idNeedsEncryption;
                      self->_idNeedsEncryption = v47;

                    }
                  }
                  v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                }
                while (v39);
              }

              v35 = v59 + 1;
            }
            while (v59 + 1 != v58);
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          }
          while (v58);
        }

        v33 = v55 + 1;
      }
      while (v55 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v53);
  }

  objc_msgSend(v8, "clientInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSBuddyMLViewController _handlePlanAddition:](self, "_handlePlanAddition:", v49);

}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, uint64_t, _QWORD);
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v14, "populatePostbackDictionary:", v15);
  objc_msgSend(v15, "objectForKey:", self->_idNeedsEncryption);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("iOS Device Activation"), CFSTR("User-Agent"));
  if (self->_initialRequest)
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[TSBuddyMLViewController remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]";
      _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "Set type as json for initial request @%s", buf, 0xCu);
    }

    objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v13[2](v13, 1, 0);
  }
  else if (v16)
  {
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
    v19[3] = &unk_24DEF3B48;
    objc_copyWeak(&v23, (id *)buf);
    v22 = v13;
    v20 = v15;
    v21 = v11;
    -[TSBuddyMLViewController _requestCipherText:completion:](self, "_requestCipherText:completion:", v16, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _TSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[TSBuddyMLViewController remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]";
      _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "No encryption needed @%s", buf, 0xCu);
    }

    v13[2](v13, 1, 0);
  }

}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_9;
  }
  if (!v3)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_2(v6, v14, v15, v16, v17, v18, v19, v20);
LABEL_9:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, WeakRetained[122]);
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", *(_QWORD *)(a1 + 32), 100, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setHTTPBody:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setTimeoutInterval:", 180.0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2080;
      v26 = "-[TSBuddyMLViewController remoteUIController:didFinishLoadWithError:forRequest:]";
      _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "RemoteUI didFinishLoadWithError: %{public}@ @%s", buf, 0x16u);
    }

    if (objc_msgSend(v9, "code") == -1001)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFER_ITEM_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CARRRIER_SETUP_TIMEOUT_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v20, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v16 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __80__TSBuddyMLViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
      v21[3] = &unk_24DEF2A20;
      objc_copyWeak(&v22, (id *)buf);
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v19);

      -[TSBuddyMLViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __80__TSBuddyMLViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TSBuddyMLViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "Complete viewController to allow user continue flow @%s", (uint8_t *)&v7, 0xCu);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "viewControllerDidComplete:", v6);

}

- (void)_configureRUIController
{
  RemoteUIController *v3;
  RemoteUIController *remoteUIController;
  RemoteUIController *v5;
  void *v6;
  void *v7;
  RemoteUIController *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_remoteUIController)
  {
    v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v3;

    -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
    v5 = self->_remoteUIController;
    objc_msgSend(MEMORY[0x24BE7EE08], "setupAssistantStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIController setStyle:](v5, "setStyle:", v6);

    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.CommCenter.CellularPlanProvisioning"));
    -[RemoteUIController setSessionConfiguration:](self->_remoteUIController, "setSessionConfiguration:", v7);
    objc_initWeak(&location, self);
    v8 = self->_remoteUIController;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__TSBuddyMLViewController__configureRUIController__block_invoke;
    v9[3] = &unk_24DEF3B70;
    objc_copyWeak(&v10, &location);
    -[RemoteUIController setHandlerForElementName:handler:](v8, "setHandlerForElementName:handler:", CFSTR("cancel"), v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __50__TSBuddyMLViewController__configureRUIController__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSBuddyMLViewController _configureRUIController]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "User canceled flow @%s", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidTapCancel");

}

- (void)_handlePlanAddition:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *v6;
  NSString *mcc;
  NSString *v8;
  NSString *mnc;
  NSString *v10;
  NSString *gid1;
  NSString *v12;
  NSString *gid2;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eid"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iccid"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mcc"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  mcc = self->_mcc;
  self->_mcc = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mnc"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  mnc = self->_mnc;
  self->_mnc = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gid1"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  gid1 = self->_gid1;
  self->_gid1 = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gid2"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  gid2 = self->_gid2;
  self->_gid2 = v12;

  v38 = (void *)v5;
  if (v5 && v40 && v39)
  {
    v34 = objc_alloc(MEMORY[0x24BDC2718]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceIccid"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UnusableIccid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mcc"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mnc"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gid1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gid2"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smdpAddress"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useDS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isESim"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v30) = v18;
    LOBYTE(v30) = v16;
    v20 = objc_msgSend(v34, "initWithDetails:installIccid:sourceIccid:unusableIccid:phoneNumber:mcc:mnc:gid1:gid2:smdp:useDS:esim:flowType:", v5, v40, v36, v35, v39, v33, v37, v14, v32, v31, v30, v19);

    if (v20)
    {
      _TSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[TSBuddyMLViewController _handlePlanAddition:]";
        _os_log_impl(&dword_21B647000, v21, OS_LOG_TYPE_DEFAULT, "Adding cellular plan... @%s", buf, 0xCu);
      }

      -[CoreTelephonyClient addPlanWith:completionHandler:](self->_coreTelephonyClient, "addPlanWith:completionHandler:", v20, &__block_literal_global_16);
      -[TSBuddyMLViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "viewControllerDidComplete:", self);

    }
  }
  else
  {
    _TSLogDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[TSBuddyMLViewController _handlePlanAddition:].cold.1(v20, v23, v24, v25, v26, v27, v28, v29);
  }

}

void __47__TSBuddyMLViewController__handlePlanAddition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (a2 != 2)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__TSBuddyMLViewController__handlePlanAddition___block_invoke_cold_1();

  }
}

- (void)_requestCipherText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *coreTelephonyClient;
  NSString *mcc;
  NSString *mnc;
  NSString *gid1;
  NSString *gid2;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TSBuddyMLViewController _requestCipherText:completion:].cold.1((uint64_t)self, v8);

  objc_initWeak(&location, self);
  coreTelephonyClient = self->_coreTelephonyClient;
  mcc = self->_mcc;
  mnc = self->_mnc;
  gid1 = self->_gid1;
  gid2 = self->_gid2;
  v15[0] = MEMORY[0x24BDAC760];
  v15[2] = __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke;
  v15[3] = &unk_24DEF3BD8;
  v15[1] = 3221225472;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  -[CoreTelephonyClient encryptDataWithCarrierIdentifiers:mnc:gid1:gid2:data:completion:](coreTelephonyClient, "encryptDataWithCarrierIdentifiers:mnc:gid1:gid2:data:completion:", mcc, mnc, gid1, gid2, v6, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void (*v9)(void);

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke_cold_1();

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

- (BOOL)_isActionDismissToCancelFlow:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("eid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)_setUserInPurchaseFlow
{
  id v3;

  if (+[TSUtilities isOnBootstrap](TSUtilities, "isOnBootstrap"))
  {
    self->_isBootstrapAsserted = 1;
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertUserInPurchaseFlowStartOver:caller:", 0, self);

  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CTPlan)plan
{
  return (CTPlan *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSString)buddyMLURL
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setBuddyMLURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSDictionary)postdata
{
  return (NSDictionary *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPostdata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (RemoteUIController)remoteUIController
{
  return (RemoteUIController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setRemoteUIController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_buddyMLURL, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_idNeedsEncryption, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]RemoteUI loadRequest error %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__TSBuddyMLViewController_prepare___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)remoteUIController:(uint64_t)a3 didReceiveObjectModel:(uint64_t)a4 actionSignal:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Carrier Setup: Server bug, got a replace with no pages @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)remoteUIController:(uint64_t)a3 didReceiveObjectModel:(uint64_t)a4 actionSignal:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Carrier Setup: Server bug, got a pop with no pages @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Fail to get cipher text @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handlePlanAddition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid clientinfo for adding cellular plan @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __47__TSBuddyMLViewController__handlePlanAddition___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed to add cellular plan: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestCipherText:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 992);
  v3 = *(_QWORD *)(a1 + 1000);
  v4 = 138412802;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  v8 = 2080;
  v9 = "-[TSBuddyMLViewController _requestCipherText:completion:]";
  _os_log_debug_impl(&dword_21B647000, a2, OS_LOG_TYPE_DEBUG, "[Db] IMSI %@/%@ @%s", (uint8_t *)&v4, 0x20u);
}

void __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
