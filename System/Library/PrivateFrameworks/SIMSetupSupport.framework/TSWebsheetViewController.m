@implementation TSWebsheetViewController

- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 skipUIDismissal:(BOOL)a5
{
  id v9;
  TSWebsheetViewController *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  WKWebView *webView;
  void *v20;
  TSCellularSetupLoadingView *v21;
  TSCellularSetupLoadingView *loadingView;
  uint64_t v23;
  _SFFormAutoFillController *autoFillController;
  uint64_t v25;
  UIBarButtonItem *cancelButton;
  objc_super v28;

  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TSWebsheetViewController;
  v10 = -[TSWebsheetViewController init](&v28, sel_init);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDFA918]);
    -[TSWebsheetViewController _processPool](v10, "_processPool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSWebsheetViewController _webViewConfigurationWithProcessPool:](v10, "_webViewConfigurationWithProcessPool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v18 = objc_msgSend(v11, "initWithFrame:configuration:", v13, *MEMORY[0x24BDBF090], v15, v16, v17);
    webView = v10->_webView;
    v10->_webView = (WKWebView *)v18;

    -[WKWebView setNavigationDelegate:](v10->_webView, "setNavigationDelegate:", v10);
    -[WKWebView setUIDelegate:](v10->_webView, "setUIDelegate:", v10);
    -[WKWebView _setInputDelegate:](v10->_webView, "_setInputDelegate:", v10);
    -[WKWebView setAutoresizingMask:](v10->_webView, "setAutoresizingMask:", 18);
    -[WKWebView scrollView](v10->_webView, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v10);

    -[WKWebView setAutoresizesSubviews:](v10->_webView, "setAutoresizesSubviews:", 1);
    if (!a3)
    {
      v21 = -[TSCellularSetupLoadingView initWithFrame:]([TSCellularSetupLoadingView alloc], "initWithFrame:", v14, v15, v16, v17);
      loadingView = v10->_loadingView;
      v10->_loadingView = v21;

      -[WKWebView addSubview:](v10->_webView, "addSubview:", v10->_loadingView);
    }
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDE81C0]), "initWithWebView:delegate:", v10->_webView, v10);
    autoFillController = v10->_autoFillController;
    v10->_autoFillController = (_SFFormAutoFillController *)v23;

    -[TSWebsheetViewController setModalInPresentation:](v10, "setModalInPresentation:", 1);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel__doneButtonTapped);
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v25;

    v10->_dismissCause = 2;
    v10->_didReceivePurchaseCallback = 0;
    v10->_didViewAppear = 0;
    v10->_isRemotePlan = a3;
    objc_storeStrong((id *)&v10->_currentTitle, a4);
    v10->_skipUIDismissal = a5;
  }

  return v10;
}

- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 viewController:(id)a5
{
  _BOOL8 v7;
  id v9;
  id *v10;
  id *v11;

  v7 = a3;
  v9 = a5;
  v10 = -[TSWebsheetViewController initForRemotePlan:carrierName:skipUIDismissal:](self, "initForRemotePlan:carrierName:skipUIDismissal:", v7, a4, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong(v10 + 127, a5);

  return v11;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWebsheetViewController;
  -[TSWebsheetViewController loadView](&v3, sel_loadView);
  -[TSWebsheetViewController setView:](self, "setView:", self->_webView);
  if (!self->_isRemotePlan)
    -[WKWebView bringSubviewToFront:](self->_webView, "bringSubviewToFront:", self->_loadingView);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TSCellularSetupLoadingView *loadingView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSWebsheetViewController;
  -[TSWebsheetViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[WKWebView scrollView](self->_webView, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[TSWebsheetViewController _showCancelButton:](self, "_showCancelButton:", 1);
  -[TSWebsheetViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  if (self->_isRemotePlan)
  {
    -[TSWebsheetViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);
    -[TSWebsheetViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", self->_currentTitle);

  }
  else
  {
    if (+[TSUtilities isPad](TSUtilities, "isPad"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cellular Data Account"), &stru_24DEF4290, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSWebsheetViewController setTitle:](self, "setTitle:", v12);

    }
    loadingView = self->_loadingView;
    -[WKWebView bounds](self->_webView, "bounds");
    -[TSCellularSetupLoadingView setFrame:](loadingView, "setFrame:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWebsheetViewController;
  -[TSWebsheetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_didViewAppear = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWebsheetViewController;
  -[TSWebsheetViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[WKWebView setUIDelegate:](self->_webView, "setUIDelegate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wkUserContentController);
  objc_msgSend(WeakRetained, "removeAllScriptMessageHandlers");

  if (-[TSWebsheetViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[TSWebsheetViewController setDismissCause:](self, "setDismissCause:", 0);
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerDidComplete:", self);

  }
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id requestLoadedCompletion;

  v6 = a4;
  -[TSWebsheetViewController sendRequest:](self, "sendRequest:", a3);
  v7 = (void *)MEMORY[0x220765A70](v6);

  requestLoadedCompletion = self->_requestLoadedCompletion;
  self->_requestLoadedCompletion = v7;

}

- (void)sendRequest:(id)a3
{
  id v4;
  id WeakRetained;

  if (a3)
  {
    v4 = -[WKWebView loadRequest:](self->_webView, "loadRequest:");
  }
  else
  {
    -[TSWebsheetViewController setDismissCause:](self, "setDismissCause:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

  }
}

- (BOOL)_shouldIgnoreWebviewError:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x24BEC27A8]) && v4 == 102)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x24BDD1308]))
  {
    v5 = v4 == -999 || v4 == -1012;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  self->_didFinishDocumentLoad = 0;
  self->_didFirstLayout = 0;
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void (**requestLoadedCompletion)(id, _QWORD);
  id WeakRetained;

  v6 = a5;
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[TSWebsheetViewController webView:didFailProvisionalNavigation:withError:].cold.1();

  if (!self->_isRemotePlan
    || !-[TSWebsheetViewController _shouldIgnoreWebviewError:](self, "_shouldIgnoreWebviewError:", v6))
  {
    -[TSWebsheetViewController setDismissCause:](self, "setDismissCause:", 1);
    requestLoadedCompletion = (void (**)(id, _QWORD))self->_requestLoadedCompletion;
    if (requestLoadedCompletion)
    {
      requestLoadedCompletion[2](requestLoadedCompletion, 0);
      WeakRetained = self->_requestLoadedCompletion;
      self->_requestLoadedCompletion = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);
    }

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  UIViewController *viewController;
  UIViewController *v9;
  NSObject *v10;
  NSObject *v11;
  UIViewController *v12;
  void (**requestLoadedCompletion)(id, uint64_t);
  id v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_isRemotePlan)
  {
    viewController = self->_viewController;
    if (viewController)
    {
      v9 = viewController;
      if ((-[UIViewController isProcessCanceled](v9, "isProcessCanceled") & 1) != 0 || self->_dismissCause == 1)
      {
        _TSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315138;
          v16 = "-[TSWebsheetViewController webView:didFinishNavigation:]";
          _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "Process Got Cancel or Come Back with error in Loading Page @%s", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        _TSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315138;
          v16 = "-[TSWebsheetViewController webView:didFinishNavigation:]";
          _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "Start Load the view @%s", (uint8_t *)&v15, 0xCu);
        }

        -[UIViewController navigationController](self->_viewController, "navigationController");
        v10 = objc_claimAutoreleasedReturnValue();
        -[NSObject pushViewController:animated:](v10, "pushViewController:animated:", self, 1);
      }

      v12 = self->_viewController;
      self->_viewController = 0;

    }
  }
  else
  {
    -[TSCellularSetupLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  }
  requestLoadedCompletion = (void (**)(id, uint64_t))self->_requestLoadedCompletion;
  if (requestLoadedCompletion)
  {
    requestLoadedCompletion[2](requestLoadedCompletion, 1);
    v14 = self->_requestLoadedCompletion;
    self->_requestLoadedCompletion = 0;

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, uint64_t);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;

  v6 = (void (**)(id, uint64_t))a5;
  v7 = (void *)MEMORY[0x24BEBD3C8];
  v8 = a4;
  objc_msgSend(v7, "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _TSLogDomain();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TSWebsheetViewController webView:decidePolicyForNavigationAction:decisionHandler:].cold.1();

  objc_msgSend(v11, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("tel"));

  if (v14 && objc_msgSend(v9, "canOpenURL:", v11))
  {
    objc_msgSend(v9, "openURL:options:completionHandler:", v11, MEMORY[0x24BDBD1B8], &__block_literal_global_12);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  v6[2](v6, v15);

}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  self->_didFinishDocumentLoad = 1;
  -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded", a3, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void (**requestLoadedCompletion)(id, _QWORD);
  id WeakRetained;

  v6 = a5;
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[TSWebsheetViewController webView:didFailNavigation:withError:].cold.1();

  if (!self->_isRemotePlan
    || !-[TSWebsheetViewController _shouldIgnoreWebviewError:](self, "_shouldIgnoreWebviewError:", v6))
  {
    -[TSWebsheetViewController setDismissCause:](self, "setDismissCause:", 1);
    requestLoadedCompletion = (void (**)(id, _QWORD))self->_requestLoadedCompletion;
    if (requestLoadedCompletion)
    {
      requestLoadedCompletion[2](requestLoadedCompletion, 0);
      WeakRetained = self->_requestLoadedCompletion;
      self->_requestLoadedCompletion = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);
    }

  }
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4;
  id v6;
  UIViewController *viewController;
  UIViewController *v8;
  NSObject *v9;
  UIViewController *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_isRemotePlan)
  {
    viewController = self->_viewController;
    if (viewController)
    {
      v8 = viewController;
      if (-[UIViewController isProcessCanceled](v8, "isProcessCanceled"))
      {
        _TSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315138;
          v12 = "-[TSWebsheetViewController _webView:renderingProgressDidChange:]";
          _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Cancel Request set PurchaseFlow to NO then return @%s", (uint8_t *)&v11, 0xCu);
        }

        v10 = self->_viewController;
        self->_viewController = 0;

        goto LABEL_10;
      }

    }
  }
  if ((v4 & 1) != 0)
  {
    self->_didFirstLayout = 1;
    -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded");
  }
LABEL_10:

}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  -[_SFFormAutoFillController fieldFocusedWithInputSession:](self->_autoFillController, "fieldFocusedWithInputSession:", a4);
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  -[_SFFormAutoFillController willSubmitFormValues:userObject:submissionHandler:](self->_autoFillController, "willSubmitFormValues:userObject:submissionHandler:", a4, a5, a6);
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
  -[_SFFormAutoFillController autoFill](self->_autoFillController, "autoFill", a3, a4);
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
  -[_SFFormAutoFillController insertTextSuggestion:](self->_autoFillController, "insertTextSuggestion:", a4);
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return self->_didFinishDocumentLoad && self->_didFirstLayout;
}

- (BOOL)formAutoFillControllerShouldDisableAutoFill:(id)a3
{
  return 0;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  return -[WKWebView URL](self->_webView, "URL", a3);
}

- (void)_transferESimInstallationStarted
{
  void *v3;
  id WeakRetained;

  if (!+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("transfer.websheet.install.started"), 0, 0);

  }
  -[TSWebsheetViewController setDismissCause:](self, "setDismissCause:", 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startTimer:", 1);

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *WeakRetained;
  const char *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  TSWebsheetViewController *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "name");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412802;
    v38 = v7;
    v39 = 2112;
    v40 = v8;
    v41 = 2080;
    v42 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "js callback: %@ - %@ @%s", (uint8_t *)&v37, 0x20u);

  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("dataPlanAccountUpdatedWithIccid")))
  {
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("dataPlanAccountUpdatedWithInfo"));

    if (v11)
      goto LABEL_6;
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("dataPlanTransferAccountUpdatedWithInfo"));

    if (v14)
    {
      objc_msgSend(v5, "body");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSWebsheetViewController _handleTransferWithMessageBody:](self, "_handleTransferWithMessageBody:", v12);
      goto LABEL_7;
    }
    objc_msgSend(v5, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("showCancelButtonSelected"));

    if (v16)
    {
      _TSLogDomain();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315138;
        v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
        v18 = "No longer supported @%s";
LABEL_22:
        _os_log_impl(&dword_21B647000, WeakRetained, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v5, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("hideCancelButtonSelected"));

      if (v20)
      {
        _TSLogDomain();
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 136315138;
          v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
          v18 = "No longer supported @%s";
          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(v5, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("doneSelected"));

        if (v22)
        {
          -[TSWebsheetViewController _doneButtonTapped](self, "_doneButtonTapped");
          goto LABEL_8;
        }
        objc_msgSend(v5, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("dataPlanAccountUpdated"));

        if (!v24)
        {
          objc_msgSend(v5, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("showVerifyingIndicator"));

          if (v26)
          {
            v27 = self;
            v28 = 1;
          }
          else
          {
            objc_msgSend(v5, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("hideVerifyingIndicator"));

            if (!v30)
            {
              objc_msgSend(v5, "name");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("dismissKeyboard"));

              if (v32)
              {
                -[TSWebsheetViewController navigationController](self, "navigationController");
                WeakRetained = objc_claimAutoreleasedReturnValue();
                -[NSObject _endPinningInputViews](WeakRetained, "_endPinningInputViews");
              }
              else
              {
                objc_msgSend(v5, "name");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("dataPlanAccountCancelled"));

                if (v34)
                {
                  WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
                  -[NSObject accountCancelled](WeakRetained, "accountCancelled");
                }
                else
                {
                  objc_msgSend(v5, "name");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("dataPlanPendingRelease"));

                  if (!v36)
                    goto LABEL_8;
                  WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
                  -[NSObject accountPendingRelease](WeakRetained, "accountPendingRelease");
                }
              }
              goto LABEL_23;
            }
            v27 = self;
            v28 = 0;
          }
          -[TSWebsheetViewController _showVerifyingIndicator:](v27, "_showVerifyingIndicator:", v28);
          goto LABEL_8;
        }
        _TSLogDomain();
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 136315138;
          v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
          v18 = "No longer handled @%s";
          goto LABEL_22;
        }
      }
    }
LABEL_23:

    goto LABEL_8;
  }

LABEL_6:
  objc_msgSend(v5, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:](self, "_handlePlanPurchaseWithMessageBody:", v12);
LABEL_7:

  -[TSWebsheetViewController _transferESimInstallationStarted](self, "_transferESimInstallationStarted");
LABEL_8:

}

- (id)_processPool
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x24BDFA978]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "builtInPlugInsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("SafariServices.wkbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInjectedBundleURL:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA8E8]), "_initWithConfiguration:", v2);
  return v6;
}

- (id)_webViewConfigurationWithProcessPool:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v19;

  v4 = (objc_class *)MEMORY[0x24BDFA9C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initNonPersistentConfiguration");
  objc_msgSend(v6, "setSuppressesConnectionTerminationOnSystemChange:", 1);
  objc_msgSend(v6, "setSourceApplicationSecondaryIdentifier:", CFSTR("com.apple.CommCenter.CellularPlanProvisioning"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA928]), "_initWithConfiguration:", v6);
  objc_msgSend(v7, "httpCookieStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setCookieAcceptPolicy:completionHandler:", 2, &__block_literal_global_72);

  v9 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v9, "setDataDetectorTypes:", 0);
  objc_msgSend(v9, "setProcessPool:", v5);

  objc_msgSend(v9, "setWebsiteDataStore:", v7);
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(v9, "defaultWebpagePreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredContentMode:", 1);

    objc_msgSend(v9, "_setApplePayEnabled:", 1);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathForResource:ofType:", CFSTR("MessageCallbackHandler"), CFSTR("js"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v12, 4, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  if (v14)
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TSWebsheetViewController _webViewConfigurationWithProcessPool:].cold.1();

  }
  if (objc_msgSend(v13, "length"))
  {
    v16 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
    if (v13)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v13, 0, 1);
      objc_msgSend(v16, "addUserScript:", v17);

    }
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanAccountUpdatedWithIccid"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("showCancelButtonSelected"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("hideCancelButtonSelected"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanAccountUpdated"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("doneSelected"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("showVerifyingIndicator"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("hideVerifyingIndicator"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dismissKeyboard"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanAccountUpdatedWithInfo"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanTransferAccountUpdatedWithInfo"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanAccountCancelled"));
    objc_msgSend(v16, "addScriptMessageHandler:name:", self, CFSTR("dataPlanPendingRelease"));
    objc_msgSend(v9, "setUserContentController:", v16);
    objc_storeWeak((id *)&self->_wkUserContentController, v16);

  }
  return v9;
}

- (void)_doneButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

  if (!self->_skipUIDismissal)
    -[TSWebsheetViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, 0);
}

- (void)_showCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  UIBarButtonItem *cancelButton;
  UIBarButtonItem *v8;
  id v9;

  v3 = a3;
  v5 = +[TSUtilities isPad](TSUtilities, "isPad");
  -[TSWebsheetViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v5)
  {
    if (v3)
      cancelButton = self->_cancelButton;
    else
      cancelButton = 0;
    objc_msgSend(v6, "setRightBarButtonItem:animated:", cancelButton, 1);
  }
  else
  {
    if (v3)
      v8 = self->_cancelButton;
    else
      v8 = 0;
    objc_msgSend(v6, "setLeftBarButtonItem:animated:", v8, 1);
  }

}

- (void)_showVerifyingIndicator:(BOOL)a3
{
  NSString *v4;
  NSString *currentTitle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    -[TSWebsheetViewController title](self, "title");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentTitle = self->_currentTitle;
    self->_currentTitle = v4;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Verifying"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSWebsheetViewController setTitle:](self, "setTitle:", v7);

    +[TSNavigationBarSpinnerManager sharedManager](TSNavigationBarSpinnerManager, "sharedManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[TSWebsheetViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startSpinnerInNavigationItem:withIdentifier:", v9, v10);

  }
  else
  {
    -[TSWebsheetViewController setTitle:](self, "setTitle:", self->_currentTitle);
    +[TSNavigationBarSpinnerManager sharedManager](TSNavigationBarSpinnerManager, "sharedManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopSpinnerForIdentifier:", v8);
  }

}

- (void)_handlePlanPurchaseWithMessageBody:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *WeakRetained;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  BOOL v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_didReceivePurchaseCallback)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_56:

      goto LABEL_57;
    }
    v36 = 136315138;
    v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    v7 = "Received 2nd purchase callback - skipping @%s";
LABEL_4:
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v36, 0xCu);
    goto LABEL_56;
  }
  self->_didReceivePurchaseCallback = 1;
  if (!v4)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_56;
    v36 = 136315138;
    v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    v7 = "Invalid message @%s";
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v6))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
      -[NSObject didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:](WeakRetained, "didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:", 0, 0, 0, v6, 0, 0);
LABEL_55:

      goto LABEL_56;
    }
    _TSLogDomain();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v36 = 138412546;
    v37 = (const char *)v6;
    v38 = 2080;
    v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    v11 = "Invalid ICCID: %@ @%s";
    v12 = WeakRetained;
    v13 = 22;
LABEL_18:
    _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v36, v13);
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v5;
    v6 = v9;
    if (self->_isRemotePlan)
    {
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("state"));
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (WeakRetained
        && -[TSWebsheetViewController _isProfilePendingRelease:](self, "_isProfilePendingRelease:", WeakRetained))
      {
        v10 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
        -[NSObject accountPendingRelease](v10, "accountPendingRelease");
LABEL_49:

        goto LABEL_55;
      }
    }
    else
    {
      WeakRetained = 0;
    }
    v14 = WeakRetained;
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("eid"));
    WeakRetained = objc_claimAutoreleasedReturnValue();

    v15 = WeakRetained != 0;
    if (WeakRetained
      && (!isValidNSString(WeakRetained)
       || -[NSObject length](WeakRetained, "length") != 32
       || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", WeakRetained)))
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v36 = 138412546;
      v37 = (const char *)WeakRetained;
      v38 = 2080;
      v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
      v24 = "Invalid EID: %@ @%s";
      goto LABEL_48;
    }
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("imei"));
    v16 = (char *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (!isValidNSString(v16)
        || objc_msgSend(v16, "length") != 15 && objc_msgSend(v16, "length") != 16
        || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
      {
        _TSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_54;
        v36 = 138412546;
        v37 = v16;
        v38 = 2080;
        v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v26 = "Invalid IMEI: %@ @%s";
        goto LABEL_52;
      }
      v15 = 1;
    }
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("meid"));
    WeakRetained = objc_claimAutoreleasedReturnValue();

    if (WeakRetained)
    {
      if (!isValidNSString(WeakRetained)
        || -[NSObject length](WeakRetained, "length") != 14 && -[NSObject length](WeakRetained, "length") != 15
        || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", WeakRetained))
      {
        _TSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_49;
        v36 = 138412546;
        v37 = (const char *)WeakRetained;
        v38 = 2080;
        v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v24 = "Invalid MEID: %@ @%s";
        goto LABEL_48;
      }
      v15 = 1;
    }
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("iccid"));
    v16 = (char *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      _TSLogDomain();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315138;
        v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        _os_log_impl(&dword_21B647000, v29, OS_LOG_TYPE_DEFAULT, "Missing ICCID @%s", (uint8_t *)&v36, 0xCu);
      }

      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("mcc"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        WeakRetained = v30;
        if (!isValidNSString(v30)
          || -[NSObject length](WeakRetained, "length") != 3
          || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", WeakRetained))
        {
          _TSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            goto LABEL_49;
          v36 = 138412546;
          v37 = (const char *)WeakRetained;
          v38 = 2080;
          v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
          v24 = "Invalid mcc: %@ @%s";
          goto LABEL_48;
        }
        -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("mnc"));
        v16 = (char *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if (isValidNSString(v16)
            && (objc_msgSend(v16, "length") == 2 || objc_msgSend(v16, "length") == 3)
            && -[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
          {
            -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("gid1"));
            WeakRetained = objc_claimAutoreleasedReturnValue();

            if (WeakRetained
              && (!isValidNSString(WeakRetained)
               || -[NSObject length](WeakRetained, "length") != 3
               || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", WeakRetained)))
            {
              _TSLogDomain();
              v10 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                goto LABEL_49;
              v36 = 138412546;
              v37 = (const char *)WeakRetained;
              v38 = 2080;
              v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
              v24 = "Invalid gid1: %@ @%s";
              goto LABEL_48;
            }
            -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("gid2"));
            v16 = (char *)objc_claimAutoreleasedReturnValue();

            if (!v16
              || isValidNSString(v16)
              && objc_msgSend(v16, "length") == 3
              && -[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
            {
              v25 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("mcc"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("mnc"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("gid1"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("gid2"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("state"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject didPurchasePlanSuccessfullyWithCarrier:mnc:gid1:gid2:state:](v25, "didPurchasePlanSuccessfullyWithCarrier:mnc:gid1:gid2:state:", v31, v32, v33, v34, v35);

              goto LABEL_54;
            }
            _TSLogDomain();
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              goto LABEL_54;
            v36 = 138412546;
            v37 = v16;
            v38 = 2080;
            v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
            v26 = "Invalid gid2: %@ @%s";
          }
          else
          {
            _TSLogDomain();
            v25 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              goto LABEL_54;
            v36 = 138412546;
            v37 = v16;
            v38 = 2080;
            v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
            v26 = "Invalid mnc: %@ @%s";
          }
          goto LABEL_52;
        }
        _TSLogDomain();
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        v36 = 136315138;
        v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v11 = "Missing mnc @%s";
      }
      else
      {
        _TSLogDomain();
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        v36 = 136315138;
        v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v11 = "Missing mcc @%s";
      }
      v12 = WeakRetained;
      v13 = 12;
      goto LABEL_18;
    }
    if (isValidNSString(v16)
      && (objc_msgSend(v16, "length") == 19 || objc_msgSend(v16, "length") == 20)
      && -[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
    {
      if (v15)
      {
        -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("alternateSmdpFqdn"));
        WeakRetained = objc_claimAutoreleasedReturnValue();

        if (!WeakRetained
          || isValidNSString(WeakRetained)
          && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", WeakRetained),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v17,
              v17))
        {
          v10 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("eid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("imei"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("meid"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("iccid"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("alternateSmdpFqdn"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("state"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:](v10, "didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:", v18, v19, v20, v21, v22, v23);

          goto LABEL_49;
        }
        _TSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_49;
        v36 = 138412546;
        v37 = (const char *)WeakRetained;
        v38 = 2080;
        v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v24 = "Invalid alternateSmdpFqdn: %@ @%s";
LABEL_48:
        _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v36, 0x16u);
        goto LABEL_49;
      }
      _TSLogDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315138;
        v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        v26 = "Missing identifier @%s";
        v27 = v25;
        v28 = 12;
        goto LABEL_53;
      }
LABEL_54:

      WeakRetained = v16;
      goto LABEL_55;
    }
    _TSLogDomain();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    v36 = 138412546;
    v37 = v16;
    v38 = 2080;
    v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    v26 = "Invalid ICCID: %@ @%s";
LABEL_52:
    v27 = v25;
    v28 = 22;
LABEL_53:
    _os_log_impl(&dword_21B647000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v36, v28);
    goto LABEL_54;
  }
LABEL_57:

}

- (void)_handleTransferWithMessageBody:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  char *v8;
  BOOL v9;
  char *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  char *v16;
  char *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  TSEntitlementJSHandlerDelegate **p_callbackDelegate;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Invalid message @%s", buf, 0xCu);
    }

LABEL_8:
    v5 = v4;
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eid"));
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (v7
      && (objc_msgSend(v7, "length") != 32
       || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v8)))
    {
      _TSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v8;
        v44 = 2080;
        v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "Invalid EID: %@ @%s", buf, 0x16u);
      }
      goto LABEL_44;
    }
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("alternateSmdpFqdn"));
    v10 = (char *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        _TSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v10;
          v44 = 2080;
          v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
          _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "Invalid alternateSmdpFqdn: %@ @%s", buf, 0x16u);
        }
        goto LABEL_43;
      }
    }
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("targetIccids"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!-[NSObject count](v12, "count"))
      {
        _TSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        *(_DWORD *)buf = 136315138;
        v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        v22 = "Missing target ICCIDs @%s";
        goto LABEL_41;
      }
      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("imei"));
        v16 = (char *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if (objc_msgSend(v16, "length") != 15 && objc_msgSend(v16, "length") != 16
            || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
          {
            _TSLogDomain();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              goto LABEL_64;
            *(_DWORD *)buf = 138412546;
            v43 = v16;
            v44 = 2080;
            v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
            v24 = "Invalid IMEI: %@ @%s";
            goto LABEL_60;
          }
          v9 = 1;
        }
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("meid"));
        v17 = (char *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (objc_msgSend(v17, "length") != 14 && objc_msgSend(v17, "length") != 15
            || !-[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v17))
          {
            _TSLogDomain();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v43 = v17;
              v44 = 2080;
              v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              v25 = "Invalid MEID: %@ @%s";
              v26 = v23;
              v27 = 22;
LABEL_56:
              _os_log_impl(&dword_21B647000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
            }
LABEL_57:
            v16 = v17;
            goto LABEL_64;
          }
          v9 = 1;
        }
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("iccid"));
        v16 = (char *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          _TSLogDomain();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
            _os_log_impl(&dword_21B647000, v23, OS_LOG_TYPE_DEFAULT, "ICCID missing @%s", buf, 0xCu);
          }
          v16 = 0;
          goto LABEL_64;
        }
        if ((objc_msgSend(v16, "length") == 19 || objc_msgSend(v16, "length") == 20)
          && -[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v16))
        {
          -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("src-iccid"));
          v17 = (char *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if ((objc_msgSend(v17, "length") == 19 || objc_msgSend(v17, "length") == 20)
              && -[TSWebsheetViewController _isHexadecimalString:](self, "_isHexadecimalString:", v17))
            {
LABEL_69:
              if (v9)
              {
                -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("state"));
                v16 = (char *)objc_claimAutoreleasedReturnValue();

                if (!v16 || (unint64_t)objc_msgSend(v16, "length") < 0x33)
                {
                  p_callbackDelegate = &self->_callbackDelegate;
                  WeakRetained = objc_loadWeakRetained((id *)p_callbackDelegate);

                  if (WeakRetained)
                  {
                    v23 = objc_loadWeakRetained((id *)p_callbackDelegate);
                    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eid"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("imei"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("meid"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("iccid"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("src-iccid"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("alternateSmdpFqdn"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("state"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject didTransferPlanSuccessfullyWithEid:imei:meid:iccid:srcIccid:alternateSDMP:state:](v23, "didTransferPlanSuccessfullyWithEid:imei:meid:iccid:srcIccid:alternateSDMP:state:", v41, v40, v39, v30, v31, v32, v33);

                  }
                  else
                  {
                    _TSLogDomain();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                      _os_log_impl(&dword_21B647000, v34, OS_LOG_TYPE_DEFAULT, "ERROR: invalid delegate for transfer plan. invoke TSCellularPlanManagerCache directly @%s", buf, 0xCu);
                    }

                    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
                    v23 = objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eid"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("iccid"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("src-iccid"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("alternateSmdpFqdn"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("state"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject didTransferPlanForEid:iccid:srcIccid:smdpURL:state:](v23, "didTransferPlanForEid:iccid:srcIccid:smdpURL:state:", v41, v35, v36, v37, v38);

                  }
                  goto LABEL_64;
                }
                _TSLogDomain();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v43 = v16;
                  v44 = 2080;
                  v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                  v24 = "Invalid state: %@ @%s";
                  goto LABEL_60;
                }
LABEL_64:

                v10 = v16;
                goto LABEL_42;
              }
              _TSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                v25 = "No identifier found @%s";
                v26 = v23;
                v27 = 12;
                goto LABEL_56;
              }
              goto LABEL_57;
            }
            _TSLogDomain();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v43 = v17;
              v44 = 2080;
              v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              v19 = "Invalid source ICCID: %@ @%s";
              v20 = v18;
              v21 = 22;
LABEL_67:
              _os_log_impl(&dword_21B647000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
            }
          }
          else
          {
            _TSLogDomain();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              v19 = "source ICCID missing @%s";
              v20 = v18;
              v21 = 12;
              goto LABEL_67;
            }
          }

          goto LABEL_69;
        }
        _TSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          goto LABEL_64;
        *(_DWORD *)buf = 138412546;
        v43 = v16;
        v44 = 2080;
        v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        v24 = "Invalid ICCID: %@ @%s";
LABEL_60:
        _os_log_impl(&dword_21B647000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
        goto LABEL_64;
      }
      _TSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        v22 = "Invalid target device information @%s";
        goto LABEL_41;
      }
    }
    else
    {
      _TSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        v22 = "Invalid target ICCIDs @%s";
LABEL_41:
        _os_log_impl(&dword_21B647000, v15, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
    }
LABEL_42:

LABEL_43:
    v8 = v10;
LABEL_44:

    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "Invalid body type @%s", buf, 0xCu);
  }
LABEL_45:

}

- (BOOL)_currentLanguageIsRTL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "characterDirectionForLanguage:", v4);

    v6 = v5 == 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isHexadecimalString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isProfilePendingRelease:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("pending-profile-release"));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  if (!self->_didViewAppear)
  {
    v6 = v4;
    objc_msgSend(v4, "contentOffset");
    v4 = v6;
    if (v5 > 0.0)
    {
      objc_msgSend(v6, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v4 = v6;
    }
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

- (TSEntitlementJSHandlerDelegate)callbackDelegate
{
  return (TSEntitlementJSHandlerDelegate *)objc_loadWeakRetained((id *)&self->_callbackDelegate);
}

- (void)setCallbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callbackDelegate, a3);
}

- (int64_t)dismissCause
{
  return self->_dismissCause;
}

- (void)setDismissCause:(int64_t)a3
{
  self->_dismissCause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_callbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_requestLoadedCompletion, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_destroyWeak((id *)&self->_wkUserContentController);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)webView:didFailProvisionalNavigation:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = "-[TSWebsheetViewController webView:decidePolicyForNavigationAction:decisionHandler:]";
  _os_log_debug_impl(&dword_21B647000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)webView:didFailNavigation:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_webViewConfigurationWithProcessPool:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]error loading js file: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
