@implementation TPSCloudCallingWebViewController

- (TPSCloudCallingWebViewController)init
{

  return 0;
}

- (TPSCloudCallingWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (TPSCloudCallingWebViewController)initWithCoder:(id)a3
{

  return 0;
}

- (TPSCloudCallingWebViewController)initWithType:(int64_t)a3
{
  TPSCloudCallingWebViewController *v4;
  TPSCloudCallingWebViewController *v5;
  UIWebView *v6;
  UIWebView *webView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingWebViewController;
  v4 = -[TPSCloudCallingWebViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = (UIWebView *)objc_alloc_init(MEMORY[0x1E0CEAC10]);
    webView = v5->_webView;
    v5->_webView = v6;

  }
  return v5;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v21 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v5);

  objc_msgSend(v21, "setAutoresizingMask:", 18);
  -[TPSCloudCallingWebViewController setView:](self, "setView:", v21);
  objc_msgSend(v21, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TPSCloudCallingWebViewController webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[TPSCloudCallingWebViewController webView](self, "webView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScalesPageToFit:", 1);

  -[TPSCloudCallingWebViewController webView](self, "webView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[TPSCloudCallingWebViewController webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  -[TPSCloudCallingWebViewController webView](self, "webView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonClicked_);
  -[TPSCloudCallingWebViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLeftBarButtonItem:", v19);

}

- (BOOL)isPresentingURL
{
  return self->_url || self->_body != 0;
}

- (void)loadWebViewWithSpinner:(id)a3
{
  id v4;
  NSObject *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *activityIndicator;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "loadWebViewWithSpinner", buf, 2u);
  }

  -[TPSCloudCallingWebViewController setCompletionBlock:](self, "setCompletionBlock:", v4);
  if (!self->_activityIndicator)
  {
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 2);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v6;

    -[UIActivityIndicatorView setAutoresizingMask:](self->_activityIndicator, "setAutoresizingMask:", 45);
    -[TPSCloudCallingWebViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIWebView addSubview:](self->_webView, "addSubview:", self->_activityIndicator);
  }
  v9 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__TPSCloudCallingWebViewController_loadWebViewWithSpinner___block_invoke;
  block[3] = &unk_1EA2CD7B8;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

void __59__TPSCloudCallingWebViewController_loadWebViewWithSpinner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "body"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    TPSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Timed out trying to load carrier URL", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "doWebViewTimedOut");
  }
}

- (void)loadURL:(id)a3 body:(id)a4 completion:(id)a5
{
  NSURL *v8;
  NSData *v9;
  id v10;
  NSObject *v11;
  NSURL *url;
  NSURL *v13;
  NSData *body;
  NSData *v15;
  UIActivityIndicatorView *activityIndicator;
  NSURL *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  NSURL *v25;
  __int16 v26;
  NSData *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (NSURL *)a3;
  v9 = (NSData *)a4;
  v10 = a5;
  TPSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1DB4B7000, v11, OS_LOG_TYPE_DEFAULT, "LoadURL: %@ body: %@", buf, 0x16u);
  }

  url = self->_url;
  self->_url = v8;
  v13 = v8;

  body = self->_body;
  self->_body = v9;
  v15 = v9;

  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  -[TPSCloudCallingWebViewController setCompletionBlock:](self, "setCompletionBlock:", v10);
  v17 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v13, 1, 30.0);
  -[NSURL setValue:forHTTPHeaderField:](v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v19;
  else
    v20 = CFSTR("en");
  -[NSURL setValue:forHTTPHeaderField:](v17, "setValue:forHTTPHeaderField:", v20, CFSTR("Accept-Language"));
  -[NSURL setHTTPMethod:](v17, "setHTTPMethod:", CFSTR("POST"));
  -[NSURL setHTTPBody:](v17, "setHTTPBody:", v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSData length](v15, "length"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL setValue:forHTTPHeaderField:](v17, "setValue:forHTTPHeaderField:", v21, CFSTR("Content-Length"));
  TPSLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl(&dword_1DB4B7000, v22, OS_LOG_TYPE_DEFAULT, "Loading URL request: %@", buf, 0xCu);
  }

  -[TPSCloudCallingWebViewController webView](self, "webView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "loadRequest:", v17);

}

- (void)cancelWebView
{
  NSObject *v3;
  uint8_t v4[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Asked to cancel web view", v4, 2u);
  }

  -[TPSCloudCallingWebViewController doProvisioningCanceled](self, "doProvisioningCanceled");
}

- (void)_cancelButtonClicked:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  TPSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4B7000, v4, OS_LOG_TYPE_DEFAULT, "_cancelButtonClicked", v5, 2u);
  }

  -[TPSCloudCallingWebViewController doProvisioningCanceled](self, "doProvisioningCanceled");
}

- (void)doProvisioningDone
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningDone", buf, 2u);
  }

  -[TPSCloudCallingWebViewController completionBlock](self, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[TPSCloudCallingWebViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TPSCloudCallingWebViewController_doProvisioningDone__block_invoke;
  v7[3] = &unk_1EA2CD9E0;
  v8 = v5;
  v6 = v5;
  -[TPSCloudCallingWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __54__TPSCloudCallingWebViewController_doProvisioningDone__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)doProvisioningCanceled
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningCanceled", buf, 2u);
  }

  -[TPSCloudCallingWebViewController completionBlock](self, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[TPSCloudCallingWebViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__TPSCloudCallingWebViewController_doProvisioningCanceled__block_invoke;
  v7[3] = &unk_1EA2CD9E0;
  v8 = v5;
  v6 = v5;
  -[TPSCloudCallingWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __58__TPSCloudCallingWebViewController_doProvisioningCanceled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)doProvisioningFailed
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4B7000, log, OS_LOG_TYPE_ERROR, "doProvisioningFailed", v1, 2u);
}

uint64_t __56__TPSCloudCallingWebViewController_doProvisioningFailed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  return result;
}

- (void)doWebViewTimedOut
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "doWebViewTimedOut", buf, 2u);
  }

  -[TPSCloudCallingWebViewController completionBlock](self, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[TPSCloudCallingWebViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__TPSCloudCallingWebViewController_doWebViewTimedOut__block_invoke;
  v7[3] = &unk_1EA2CD9E0;
  v8 = v5;
  v6 = v5;
  -[TPSCloudCallingWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __53__TPSCloudCallingWebViewController_doWebViewTimedOut__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[TPSCloudCallingWebViewController webView:didFailLoadWithError:].cold.1((uint64_t)v5, v6);

  if (objc_msgSend(v5, "code") != -999)
    -[TPSCloudCallingWebViewController doProvisioningFailed](self, "doProvisioningFailed");

}

- (void)uiWebView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  -[TPSCloudCallingWebViewController setupControllerInWebFrame:](self, "setupControllerInWebFrame:", a5, a4);
}

- (void)setupControllerInWebFrame:(id)a3
{
  uint64_t v4;
  const OpaqueJSContext *v5;
  OpaqueJSClass *v6;
  JSObjectRef v7;
  const OpaqueJSValue *v8;
  void *v9;
  OpaqueJSValue *v10;
  OpaqueJSString *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "globalContext");
  if (!v4)
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:].cold.1();
  v5 = (const OpaqueJSContext *)v4;
  v6 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    v6 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v6;
  }
  v7 = JSObjectMake(v5, v6, self);
  if (!v7)
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:].cold.2();
  v8 = v7;
  objc_msgSend(v12, "windowObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (OpaqueJSValue *)objc_msgSend(v9, "JSObject");

  if (!v10)
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:].cold.3();
  v11 = JSStringCreateWithCFString(CFSTR("WiFiCallingWebViewController"));
  JSObjectSetProperty(v5, v10, v11, v8, 0, 0);

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)webView:(uint64_t)a1 didFailLoadWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4B7000, a2, OS_LOG_TYPE_ERROR, "didFailLoadWithError: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setupControllerInWebFrame:.cold.1()
{
  __assert_rtn("-[TPSCloudCallingWebViewController setupControllerInWebFrame:]", "TPSCloudCallingWebViewController.m", 210, "ctx");
}

- (void)setupControllerInWebFrame:.cold.2()
{
  __assert_rtn("-[TPSCloudCallingWebViewController setupControllerInWebFrame:]", "TPSCloudCallingWebViewController.m", 213, "controllerScriptObject");
}

- (void)setupControllerInWebFrame:.cold.3()
{
  __assert_rtn("-[TPSCloudCallingWebViewController setupControllerInWebFrame:]", "TPSCloudCallingWebViewController.m", 216, "global");
}

@end
