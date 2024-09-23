@implementation TSCellularSetupLoadingViewController

- (TSCellularSetupLoadingViewController)initWithRemotePlanWebsheetContext:(id)a3 isRemotePlan:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TSCellularSetupLoadingViewController *v7;
  TSCellularSetupLoadingViewController *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupLoadingViewController;
  v7 = -[TSCellularSetupLoadingViewController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[TSCellularSetupLoadingViewController setRemotePlanWebsheetContext:](v7, "setRemotePlanWebsheetContext:", v6);
    -[TSCellularSetupLoadingViewController setIsRemotePlan:](v8, "setIsRemotePlan:", v4);
    -[TSCellularSetupLoadingViewController setIsProcessCanceled:](v8, "setIsProcessCanceled:", 0);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  TSCellularSetupLoadingView *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TSCellularSetupLoadingViewController;
  -[SSUIViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[TSCellularSetupLoadingViewController setupNavigationBarItems](self, "setupNavigationBarItems");
  +[TSUtilities backgroundColorForRemotePlan:](TSUtilities, "backgroundColorForRemotePlan:", -[TSCellularSetupLoadingViewController isRemotePlan](self, "isRemotePlan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[TSCellularSetupLoadingView initWithFrame:]([TSCellularSetupLoadingView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[TSCellularSetupLoadingViewController setLoadingView:](self, "setLoadingView:", v5);

  -[TSCellularSetupLoadingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingViewController loadingView](self, "loadingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[TSCellularSetupLoadingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[TSCellularSetupLoadingViewController loadingView](self, "loadingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = -[TSCellularSetupLoadingViewController isRemotePlan](self, "isRemotePlan");
  -[TSCellularSetupLoadingViewController loadingView](self, "loadingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIsRemotePlan:", v18);

  -[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup](self, "setupCoreTelephonyClientForRemoteSignup");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSCellularSetupLoadingViewController;
  -[TSCellularSetupLoadingViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[TSCellularSetupLoadingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)setupNavigationBarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TSCellularSetupLoadingViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped);
  -[TSCellularSetupLoadingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  -[TSCellularSetupLoadingViewController navBarTitle](self, "navBarTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[TSCellularSetupLoadingViewController viewDidDisappear:]";
    v13 = 2080;
    v14 = "-[TSCellularSetupLoadingViewController viewDidDisappear:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "dismiss %s  @%s", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupLoadingViewController;
  -[TSCellularSetupLoadingViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
  -[TSCellularSetupLoadingViewController loadingView](self, "loadingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spinnerStopAnimating");

  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "useLiveID") & 1) != 0)
  {

  }
  else
  {
    v8 = -[TSCellularSetupLoadingViewController isProcessCanceled](self, "isProcessCanceled");

    if (!v8)
      return;
  }
  -[TSCellularSetupLoadingViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userDidTapCancel");

}

- (void)setupCoreTelephonyClientForRemoteSignup
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CoreTelephonyClient *v13;
  CoreTelephonyClient *coreTelephonyClient;
  void *v15;
  int v16;
  CoreTelephonyClient *v17;
  void *v18;
  int v19;
  CoreTelephonyClient *v20;
  _QWORD v21[5];

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke;
  v21[3] = &unk_24DEF2BE0;
  v21[4] = self;
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x220765A70](v21, a2);
  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postdata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD))v3)[2](v3, v9, v11, 0);

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_alloc(MEMORY[0x24BDC2810]);
  v13 = (CoreTelephonyClient *)objc_msgSend(v12, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v13;

  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "flowType");

  if (v16 == 8)
  {
    v17 = self->_coreTelephonyClient;
    -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iccid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreTelephonyClient getRemotePlanManageAccountInfoFor:completion:](v17, "getRemotePlanManageAccountInfoFor:completion:", v8, v3);
    goto LABEL_7;
  }
  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "flowType");

  if (v19 == 7)
  {
    v20 = self->_coreTelephonyClient;
    -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subscriptionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreTelephonyClient remotePlanSignupInfoFor:userConsent:completion:](v20, "remotePlanSignupInfoFor:userConsent:completion:", v8, 0, v3);
    goto LABEL_7;
  }
LABEL_8:

}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  if (!a4)
  {
    v10 = objc_msgSend(v9, "isProcessCanceled");
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke_2";
        v20 = 2080;
        v21 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke_2";
        _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "Flow Stop by Cancel Set Purchase to NO %s @%s", buf, 0x16u);
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke";
        _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "Flow Start @%s", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCarrierURL:", v7);
      objc_msgSend(*(id *)(a1 + 32), "setPostdata:", v8);
      objc_msgSend(*(id *)(a1 + 32), "remotePlanWebsheetContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "useLiveID");

      v15 = *(void **)(a1 + 32);
      if (v14)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_83;
        v16[3] = &unk_24DEF29A8;
        v16[4] = v15;
        objc_msgSend(v15, "safariViewController:url:postdata:completion:", v15, v7, v8, v16);
        goto LABEL_12;
      }
      objc_msgSend(v15, "delegate");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject viewControllerDidComplete:](v11, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));
    }

    goto LABEL_12;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_2;
  v17[3] = &unk_24DEF29A8;
  v17[4] = v9;
  objc_msgSend(v9, "_showFailureAlert:completion:", v9, v17);
LABEL_12:

}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidTapCancel");

}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_83(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userDidTapCancel");

}

- (void)cancelButtonTapped
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSCellularSetupLoadingViewController cancelButtonTapped]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Cancel Process in Loading @%s", (uint8_t *)&v4, 0xCu);
  }

  -[TSCellularSetupLoadingViewController setIsProcessCanceled:](self, "setIsProcessCanceled:", 1);
  -[TSCellularSetupLoadingViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, 0);
}

- (id)navBarTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR ACCOUNT"), &stru_24DEF4290, CFSTR("Localizable"));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[TSCellularSetupLoadingViewController remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "carrierName");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (void)_showFailureAlert:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Connection Failed"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("The connection to the server was lost.  Please try again later."), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__TSCellularSetupLoadingViewController__showFailureAlert_completion___block_invoke;
  v27[3] = &unk_24DEF2C08;
  v15 = v6;
  v28 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v16);

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v17, "addAction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), (_QWORD)v23);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v20);
  }

  objc_msgSend(v5, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __69__TSCellularSetupLoadingViewController__showFailureAlert_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)safariViewController:(id)a3 url:(id)a4 postdata:(id)a5 completion:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1838];
  v8 = a3;
  -[TSCellularSetupLoadingViewController postdata](self, "postdata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("carrierPostData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("signup-url-data"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1808];
  -[TSCellularSetupLoadingViewController carrierURL](self, "carrierURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsWithURL:resolvingAgainstBaseURL:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setQueryItems:", v15);

  v16 = objc_alloc_init(MEMORY[0x24BDE81B0]);
  objc_msgSend(v16, "setEntersReaderIfAvailable:", 0);
  objc_msgSend(v16, "_setEphemeral:", 1);
  v17 = objc_alloc(MEMORY[0x24BDE81A8]);
  objc_msgSend(v14, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithURL:configuration:", v18, v16);

  objc_msgSend(v19, "setDelegate:", self);
  objc_msgSend(v19, "_setShowingLinkPreview:", 0);
  objc_msgSend(v19, "_setShowingLinkPreviewWithMinimalUI:", 0);
  objc_msgSend(v19, "setModalPresentationStyle:", 1);
  objc_msgSend(v19, "presentationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  objc_msgSend(v8, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "presentViewController:animated:completion:", v19, 1, 0);
}

- (void)deactivate
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[TSCellularSetupLoadingViewController deactivate]";
    v7 = 2080;
    v8 = "-[TSCellularSetupLoadingViewController deactivate]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v5, 0x16u);
  }

  -[TSCellularSetupLoadingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismiss");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TSCellularSetupLoadingViewController presentationControllerDidDismiss:]";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "safariViewController dismiss @%s", (uint8_t *)&v6, 0xCu);
  }

  -[TSCellularSetupLoadingViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)safariViewControllerDidFinish:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[TSCellularSetupLoadingViewController safariViewControllerDidFinish:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "safariViewController did finish @%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userSignupInitiatedOrFailed");

  objc_msgSend((id)objc_opt_class(), "durationForTransition:", 7);
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke_115;
  v6[3] = &unk_24DEF29A8;
  v6[4] = v4;
  objc_msgSend(v4, "dismissViewControllerWithTransition:completion:", 7, v6);
  return UIKeyboardOrderOutAutomaticToDirectionWithDuration();
}

uint64_t __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivate");
}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TSCellularSetupLoadingViewController safariViewController:didCompleteInitialLoad:]";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "safariViewController load complete @%s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userSignupInitiatedOrFailed");

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)carrierURL
{
  return self->_carrierURL;
}

- (void)setCarrierURL:(id)a3
{
  objc_storeStrong((id *)&self->_carrierURL, a3);
}

- (NSDictionary)postdata
{
  return self->_postdata;
}

- (void)setPostdata:(id)a3
{
  objc_storeStrong((id *)&self->_postdata, a3);
}

- (BOOL)isProcessCanceled
{
  return self->_isProcessCanceled;
}

- (void)setIsProcessCanceled:(BOOL)a3
{
  self->_isProcessCanceled = a3;
}

- (int)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(int)a3
{
  self->_flowType = a3;
}

- (BOOL)useLiveID
{
  return self->_useLiveID;
}

- (TSCellularSetupLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (BOOL)isRemotePlan
{
  return self->_isRemotePlan;
}

- (void)setIsRemotePlan:(BOOL)a3
{
  self->_isRemotePlan = a3;
}

- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext
{
  return (TSRemotePlanWebsheetContext *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setRemotePlanWebsheetContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlanWebsheetContext, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_carrierURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
