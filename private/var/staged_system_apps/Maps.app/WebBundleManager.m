@implementation WebBundleManager

- (WKProcessPool)pool
{
  WKProcessPool *pool;
  id v4;
  WKProcessPool *v5;
  WKProcessPool *v6;

  pool = self->_pool;
  if (!pool)
  {
    v4 = objc_alloc_init((Class)_WKProcessPoolConfiguration);
    objc_msgSend(v4, "setUsesSingleWebProcess:", 1);
    v5 = (WKProcessPool *)objc_msgSend(objc_alloc((Class)WKProcessPool), "_initWithConfiguration:", v4);
    v6 = self->_pool;
    self->_pool = v5;

    pool = self->_pool;
  }
  return pool;
}

- (WebBundleManager)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  WebBundleManager *v9;
  WebBundleManager *v10;
  WKWebView *v11;
  WKWebView *webView;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WebBundleManager;
  v9 = -[WebBundleManager init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_webBundleConfiguration, a3);
    v11 = -[WebBundleManager _newConfiguredWebView](v10, "_newConfiguredWebView");
    webView = v10->_webView;
    v10->_webView = v11;

  }
  return v10;
}

- (void)loadRequest
{
  void *v3;
  WebBundleConfiguration *webBundleConfiguration;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager entryPointString](self, "entryPointString"));
  webBundleConfiguration = self->_webBundleConfiguration;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration entryPointUrlBase](webBundleConfiguration, "entryPointUrlBase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager entryPointString](self, "entryPointString"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v6));

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration entryPointUrl](webBundleConfiguration, "entryPointUrl"));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self, "webView"));
  v8 = objc_msgSend(objc_alloc((Class)NSURLRequest), "initWithURL:", v10);
  v9 = objc_msgSend(v7, "loadRequest:", v8);

}

- (void)cancelLoadRequest
{
  id v3;

  -[WebBundleManager _cancelPageLoadTimerIfNeeded](self, "_cancelPageLoadTimerIfNeeded");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self, "webView"));
  objc_msgSend(v3, "stopLoading");

}

- (void)didLoadPageWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;

  v3 = a3;
  v5 = sub_10043292C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did load page with success: %@", (uint8_t *)&v9, 0xCu);

  }
  if (v3)
    -[WebBundleManager _cancelPageLoadTimerIfNeeded](self, "_cancelPageLoadTimerIfNeeded");
  else
    -[WebBundleManager _pageLoadFailureOccurred](self, "_pageLoadFailureOccurred");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebViewConfiguration userContentController](self->_webViewConfiguration, "userContentController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration messageHandlerName](self->_webBundleConfiguration, "messageHandlerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  objc_msgSend(v3, "removeScriptMessageHandlerForName:contentWorld:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)WebBundleManager;
  -[WebBundleManager dealloc](&v6, "dealloc");
}

- (id)_newConfiguredWebView
{
  WebBundleSchemaHandler *v3;
  id WeakRetained;
  WebBundleSchemaHandler *v5;
  WebBundleScriptMessageHandlerWithReply *v6;
  id v7;
  WebBundleScriptMessageHandlerWithReply *v8;
  WKWebViewConfiguration *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  WKWebViewConfiguration *webViewConfiguration;
  WKWebViewConfiguration *v17;
  NoKeyboardAccessoryWebView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = [WebBundleSchemaHandler alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = -[WebBundleSchemaHandler initWithDelegate:configuration:](v3, "initWithDelegate:configuration:", WeakRetained, self->_webBundleConfiguration);

  v6 = [WebBundleScriptMessageHandlerWithReply alloc];
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = -[WebBundleScriptMessageHandlerWithReply initWithDelegate:](v6, "initWithDelegate:", v7);

  v9 = (WKWebViewConfiguration *)objc_alloc_init((Class)WKWebViewConfiguration);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration urlScheme](self->_webBundleConfiguration, "urlScheme"));
  -[WKWebViewConfiguration setURLSchemeHandler:forURLScheme:](v9, "setURLSchemeHandler:forURLScheme:", v5, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager pool](self, "pool"));
  -[WKWebViewConfiguration setProcessPool:](v9, "setProcessPool:", v11);

  v12 = objc_alloc_init((Class)WKUserContentController);
  -[WKWebViewConfiguration setUserContentController:](v9, "setUserContentController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebViewConfiguration userContentController](v9, "userContentController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration messageHandlerName](self->_webBundleConfiguration, "messageHandlerName"));
  objc_msgSend(v13, "addScriptMessageHandlerWithReply:contentWorld:name:", v8, v14, v15);

  webViewConfiguration = self->_webViewConfiguration;
  self->_webViewConfiguration = v9;
  v17 = v9;

  v18 = -[NoKeyboardAccessoryWebView initWithFrame:configuration:]([NoKeyboardAccessoryWebView alloc], "initWithFrame:configuration:", v17, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[NoKeyboardAccessoryWebView _setInputDelegate:](v18, "_setInputDelegate:", self);
  -[NoKeyboardAccessoryWebView setNavigationDelegate:](v18, "setNavigationDelegate:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NoKeyboardAccessoryWebView scrollView](v18, "scrollView"));
  objc_msgSend(v19, "setScrollsToTop:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NoKeyboardAccessoryWebView scrollView](v18, "scrollView"));
  objc_msgSend(v20, "setMaximumZoomScale:", 1.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NoKeyboardAccessoryWebView scrollView](v18, "scrollView"));
  objc_msgSend(v21, "setMinimumZoomScale:", 1.0);

  -[NoKeyboardAccessoryWebView setOpaque:](v18, "setOpaque:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NoKeyboardAccessoryWebView scrollView](v18, "scrollView"));
  objc_msgSend(v22, "setZoomEnabled:", 0);

  return v18;
}

- (void)_startPageLoadTimer
{
  NSTimer *v3;
  NSTimer *pageLoadTimer;

  -[WebBundleManager _cancelPageLoadTimerIfNeeded](self, "_cancelPageLoadTimerIfNeeded");
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_pageLoadFailureOccurred", 0, 0, 3.0));
  pageLoadTimer = self->_pageLoadTimer;
  self->_pageLoadTimer = v3;

}

- (void)_cancelPageLoadTimerIfNeeded
{
  NSTimer *pageLoadTimer;
  NSTimer *v4;

  pageLoadTimer = self->_pageLoadTimer;
  if (pageLoadTimer)
  {
    -[NSTimer invalidate](pageLoadTimer, "invalidate");
    v4 = self->_pageLoadTimer;
    self->_pageLoadTimer = 0;

  }
}

- (void)_pageLoadFailureOccurred
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  int v12;
  __CFString *v13;

  -[WebBundleManager _cancelPageLoadTimerIfNeeded](self, "_cancelPageLoadTimerIfNeeded");
  v3 = sub_10043292C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[WebBundleConfiguration temporarilyUseOnDeviceDirectory](self->_webBundleConfiguration, "temporarilyUseOnDeviceDirectory");
    v6 = CFSTR("YES");
    if (v5)
      v6 = CFSTR("NO");
    v7 = v6;
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Page load failure occurred, reloading: %@", (uint8_t *)&v12, 0xCu);

  }
  if (-[WebBundleConfiguration temporarilyUseOnDeviceDirectory](self->_webBundleConfiguration, "temporarilyUseOnDeviceDirectory"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self, "webView"));
    objc_msgSend(WeakRetained, "webView:didFinishLoadingWithError:", v9, 0);

  }
  else
  {
    -[WebBundleConfiguration setTemporarilyUseOnDeviceDirectory:](self->_webBundleConfiguration, "setTemporarilyUseOnDeviceDirectory:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self, "webView"));
    objc_msgSend(v10, "stopLoading");

    WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self, "webView"));
    v11 = objc_msgSend(WeakRetained, "reloadFromOrigin");
  }

}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  return objc_msgSend(a4, "type", a3) != (id)16;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  objc_storeStrong((id *)&self->_currentNavigation, a4);
  -[WebBundleManager _startPageLoadTimer](self, "_startPageLoadTimer");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  WebBundleManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (self->_currentNavigation == a4)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "webViewDidFinishNavigation:", v5);

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (self->_currentNavigation == a4)
    -[WebBundleManager _pageLoadFailureOccurred](self, "_pageLoadFailureOccurred", a3);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  if (self->_currentNavigation == a4)
    -[WebBundleManager _pageLoadFailureOccurred](self, "_pageLoadFailureOccurred", a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSString)entryPointString
{
  return self->_entryPointString;
}

- (void)setEntryPointString:(id)a3
{
  objc_storeStrong((id *)&self->_entryPointString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPointString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_pageLoadTimer, 0);
  objc_storeStrong((id *)&self->_currentNavigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);
  objc_storeStrong((id *)&self->_webBundleConfiguration, 0);
}

@end
