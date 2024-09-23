@implementation RemoteUIWebViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  WKWebView *v10;
  WKWebView *webView;
  void *v12;
  UINavigationBar *v13;
  UINavigationBar *navigationBar;
  void *v15;
  void *v16;
  void *v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  UINavigationItem *v49;
  UINavigationItem *navigationItem;
  void *v51;
  int v52;
  UINavigationItem *v53;
  UINavigationBar *v54;
  void *v55;
  _QWORD v56[5];
  objc_super v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)RemoteUIWebViewController;
  -[RemoteUIWebViewController viewDidLoad](&v57, sel_viewDidLoad);
  if (!self->_webView)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || self->_scalesPageToFit)
    {
      -[RemoteUIWebViewController scriptForScalesPageToFit](self, "scriptForScalesPageToFit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addUserScript:", v6);

    }
    -[RemoteUIWebViewController scriptForJSBridge](self, "scriptForJSBridge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addUserScript:", v7);

    objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("dismissWebView"));
    objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("startActivityIndicator"));
    objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("stopActivityIndicator"));
    objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("log"));
    objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("error"));
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setUserContentController:", v3);
    +[RUIPlatform assertWebkitAllowed](RUIPlatform, "assertWebkitAllowed");
    v9 = objc_alloc(MEMORY[0x24BDFA918]);
    v10 = (WKWebView *)objc_msgSend(v9, "initWithFrame:configuration:", v8, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    webView = self->_webView;
    self->_webView = v10;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RemoteUIWebViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_webView);

    v13 = (UINavigationBar *)objc_alloc_init(MEMORY[0x24BEBD788]);
    navigationBar = self->_navigationBar;
    self->_navigationBar = v13;

    -[UINavigationBar setTranslatesAutoresizingMaskIntoConstraints:](self->_navigationBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RemoteUIWebViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_navigationBar);

    -[UINavigationBar topAnchor](self->_navigationBar, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UINavigationBar leftAnchor](self->_navigationBar, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UINavigationBar rightAnchor](self->_navigationBar, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[RemoteUIWebViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __40__RemoteUIWebViewController_viewDidLoad__block_invoke;
    v56[3] = &unk_24C2973F0;
    v56[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v56);
    -[WKWebView topAnchor](self->_webView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[WKWebView leftAnchor](self->_webView, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leftAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[WKWebView rightAnchor](self->_webView, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[WKWebView bottomAnchor](self->_webView, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[RemoteUIWebViewController dismissButtonLabel](self, "dismissButtonLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_alloc(MEMORY[0x24BEBD410]);
    v46 = v45;
    if (v44)
    {
      -[RemoteUIWebViewController dismissButtonLabel](self, "dismissButtonLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v46, "initWithTitle:style:target:action:", v47, 0, self, sel_donePressed_);

    }
    else
    {
      v48 = (void *)objc_msgSend(v45, "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePressed_);
    }
    v49 = (UINavigationItem *)objc_alloc_init(MEMORY[0x24BEBD7A8]);
    navigationItem = self->_navigationItem;
    self->_navigationItem = v49;

    -[RemoteUIWebViewController dismissButtonAlignment](self, "dismissButtonAlignment");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("leading"));

    v53 = self->_navigationItem;
    if (v52)
      -[UINavigationItem setLeftBarButtonItem:](v53, "setLeftBarButtonItem:", v48);
    else
      -[UINavigationItem setRightBarButtonItem:](v53, "setRightBarButtonItem:", v48);
    v54 = self->_navigationBar;
    v58[0] = self->_navigationItem;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar setItems:](v54, "setItems:", v55);

    -[RUIStyle applyToNavigationBar:](self->_style, "applyToNavigationBar:", self->_navigationBar);
  }
}

uint64_t __40__RemoteUIWebViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", RemoteUIPreferredContentSize());
}

- (id)navigationItem
{
  return self->_navigationItem;
}

- (void)_startActivityIndicator
{
  void *v3;
  void *v4;
  id v5;

  +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RemoteUIWebViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUIWebViewController _spinnerManagerIdentifier](self, "_spinnerManagerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimatingInNavItem:title:forIdentifier:hideBackButton:hideLeftItems:", v3, 0, v4, 0, 0);

}

- (void)_stopActivityIndicator
{
  void *v3;
  id v4;

  +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RemoteUIWebViewController _spinnerManagerIdentifier](self, "_spinnerManagerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimatingForIdentifier:", v3);

}

- (id)_spinnerManagerIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)scriptForJSBridge
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(CFSTR("var remoteUIBridge = {};"), "mutableCopy");
  objc_msgSend(v2, "appendFormat:", CFSTR("remoteUIBridge.%1$@ = function(payload) {         webkit.messageHandlers.%1$@.postMessage(payload);     };"),
    CFSTR("dismissWebView"));
  objc_msgSend(v2, "appendFormat:", CFSTR("remoteUIBridge.%1$@ = function() {         webkit.messageHandlers.%1$@.postMessage(null);     };"),
    CFSTR("startActivityIndicator"));
  objc_msgSend(v2, "appendFormat:", CFSTR("remoteUIBridge.%1$@ = function() {         webkit.messageHandlers.%1$@.postMessage(null);     };"),
    CFSTR("stopActivityIndicator"));
  objc_msgSend(v2, "appendFormat:", CFSTR("remoteUIBridge.%1$@ = function(message) {         webkit.messageHandlers.%1$@.postMessage(message);     };"),
    CFSTR("log"));
  objc_msgSend(v2, "appendString:", CFSTR("window.onerror = function(message) {         webkit.messageHandlers.error.postMessage(message);     };"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v2, 0, 0);

  return v3;
}

- (id)scriptForScalesPageToFit
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("var meta = document.createElement('meta');     meta.name = 'viewport';     meta.content = 'width=device-width';     var head = document.getElementsByTagName('head')[0];    head.appendChild(meta);"),
                                           1,
                                           0));
}

- (id)navigationBar
{
  UINavigationBar *navigationBar;

  navigationBar = self->_navigationBar;
  if (!navigationBar)
  {
    -[RemoteUIWebViewController loadView](self, "loadView");
    navigationBar = self->_navigationBar;
  }
  return navigationBar;
}

- (WKWebView)webView
{
  WKWebView *webView;

  webView = self->_webView;
  if (!webView)
  {
    -[RemoteUIWebViewController loadView](self, "loadView");
    webView = self->_webView;
  }
  return webView;
}

- (void)dealloc
{
  objc_super v3;

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RemoteUIWebViewController;
  -[RemoteUIWebViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RemoteUIWebViewController;
  -[RemoteUIWebViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RemoteUIWebViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_24C2973F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__RemoteUIWebViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "setAdditionalSafeAreaInsets:", v2, 0.0, 0.0, 0.0);
}

- (void)_dismissWithPayload:(id)a3
{
  RemoteUIWebViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "remoteUIWebViewController:dismissWithPayload:", self, 0);
  else
    objc_msgSend(v7, "remoteUIWebViewControllerDonePressed:", self);

}

- (void)donePressed:(id)a3
{
  -[RemoteUIWebViewController _dismissWithPayload:](self, "_dismissWithPayload:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  id WeakRetained;
  char v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v5 = -[RemoteUIWebViewController isBeingDismissed](self, "isBeingDismissed");
  v9.receiver = self;
  v9.super_class = (Class)RemoteUIWebViewController;
  -[RemoteUIWebViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, v3);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "remoteUIWebViewControllerDidDismiss:", self);

    }
  }
}

- (void)loadURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id loadCompletion;
  id v9;
  id v10;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  loadCompletion = self->_loadCompletion;
  self->_loadCompletion = v7;

  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTimeoutInterval:", 30.0);
  v9 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v10);

}

- (void)loadURL:(id)a3
{
  -[RemoteUIWebViewController loadURL:completion:](self, "loadURL:completion:", a3, 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void (**loadCompletion)(id, uint64_t, _QWORD, id);
  id v6;

  loadCompletion = (void (**)(id, uint64_t, _QWORD, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 1, 0, a4);
    v6 = self->_loadCompletion;
    self->_loadCompletion = 0;

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void (**loadCompletion)(id, _QWORD, id);
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "WebView load failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  loadCompletion = (void (**)(id, _QWORD, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 0, v6);
    v9 = self->_loadCompletion;
    self->_loadCompletion = 0;

  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void (**loadCompletion)(id, _QWORD, id);
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "WebView load failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  loadCompletion = (void (**)(id, _QWORD, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 0, v6);
    v9 = self->_loadCompletion;
    self->_loadCompletion = 0;

  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v7;
      _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "didReceiveScriptMessage: %{public}@", (uint8_t *)&v22, 0xCu);

    }
  }
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("dismissWebView"));

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "remoteUIWebViewController:dismissWithPayload:", self, v11);

  }
  else
  {
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("startActivityIndicator"));

    if (v13)
    {
      -[RemoteUIWebViewController _startActivityIndicator](self, "_startActivityIndicator");
    }
    else
    {
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("stopActivityIndicator"));

      if (!v15)
      {
        objc_msgSend(v5, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("log"));

        if (v17)
        {
          if (!_isInternalInstall())
            goto LABEL_19;
          _RUILoggingFacility();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "body");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138412290;
            v23 = v19;
            _os_log_impl(&dword_209E87000, v18, OS_LOG_TYPE_DEFAULT, "remoteUIBridge.log: %@", (uint8_t *)&v22, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v5, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("error"));

          if (!v21)
            goto LABEL_19;
          _RUILoggingFacility();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[RemoteUIWebViewController userContentController:didReceiveScriptMessage:].cold.1(v5, v18);
        }

        goto LABEL_19;
      }
      -[RemoteUIWebViewController _stopActivityIndicator](self, "_stopActivityIndicator");
    }
  }
LABEL_19:

}

- (RemoteUIWebViewControllerDelegate)delegate
{
  return (RemoteUIWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (BOOL)scalesPageToFit
{
  return self->_scalesPageToFit;
}

- (void)setScalesPageToFit:(BOOL)a3
{
  self->_scalesPageToFit = a3;
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSString)dismissButtonAlignment
{
  return self->_dismissButtonAlignment;
}

- (void)setDismissButtonAlignment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSString)dismissButtonLabel
{
  return self->_dismissButtonLabel;
}

- (void)setDismissButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonLabel, 0);
  objc_storeStrong((id *)&self->_dismissButtonAlignment, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)userContentController:(void *)a1 didReceiveScriptMessage:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_209E87000, a2, OS_LOG_TYPE_ERROR, "JS error from webview: %@", (uint8_t *)&v4, 0xCu);

}

@end
