@implementation SUWebViewManager

- (SUWebViewManager)init
{
  return -[SUWebViewManager initWithClientInterface:](self, "initWithClientInterface:", 0);
}

- (SUWebViewManager)initWithClientInterface:(id)a3
{
  SUWebViewManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUWebViewManager;
  v4 = -[SUWebViewManager init](&v9, sel_init);
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    v4->_webFramesPendingInitialRequest = CFSetCreateMutable(0, 0, 0);
    v5 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "valueForKey:", CFSTR("p2-client-options"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "objectForKey:", CFSTR("suppress-cookie-hosts"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4->_suppressCookiesHosts = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v7);
    }
  }
  return v4;
}

- (void)dealloc
{
  NSMapTable *scriptInterfaces;
  __CFSet *webFramesPendingInitialRequest;
  objc_super v5;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  -[SUWebViewManager _cancelUsingNetwork](self, "_cancelUsingNetwork");
  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, scriptInterfaces);
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      objc_msgSend(value, "setDelegate:", 0);
      objc_msgSend(value, "tearDownUserInterface");
    }
    NSEndMapTableEnumeration(&enumerator);
    NSFreeMapTable(self->_scriptInterfaces);
  }
  webFramesPendingInitialRequest = self->_webFramesPendingInitialRequest;
  if (webFramesPendingInitialRequest)
    CFRelease(webFramesPendingInitialRequest);

  v5.receiver = self;
  v5.super_class = (Class)SUWebViewManager;
  -[SUWebViewManager dealloc](&v5, sel_dealloc);
}

+ (id)defaultLocalStoragePath
{
  NSArray *v3;
  void *v4;

  if (!defaultLocalStoragePath_sLocalStoragePath)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    if (-[NSArray count](v3, "count"))
    {
      v4 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("com.apple.iTunesStore")), "stringByAppendingPathComponent:", CFSTR("LocalStorage"));
      if (objc_msgSend(MEMORY[0x24BDD1580], "ensureDirectoryExists:", v4))
        defaultLocalStoragePath_sLocalStoragePath = v4;
    }
  }
  return (id)defaultLocalStoragePath_sLocalStoragePath;
}

- (void)connectToWebView:(id)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_webView != a3)
  {
    -[SUWebViewManager disconnectFromWebView](self, "disconnectFromWebView");
    self->_webView = (UIWebView *)a3;
    objc_msgSend(a3, "setDelegate:", self);
    if (self->_webView)
    {
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1;
      v6 = (void *)-[UIWebView _scrollView](self->_webView, "_scrollView");
      objc_msgSend(v6, "setDecelerationRate:", 0.998);
      objc_msgSend(v6, "_setShowsBackgroundShadow:", v5);
      v7 = (void *)-[UIWebView _browserView](self->_webView, "_browserView");
      objc_msgSend(v7, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, *MEMORY[0x24BDF7FC8], *MEMORY[0x24BDF7FC0]);
      objc_msgSend(v7, "setAllowsDataDetectorsSheet:", 0);
      objc_msgSend(v7, "setAllowsImageSheet:", 0);
      objc_msgSend(v7, "setAllowsLinkSheet:", 0);
      objc_msgSend(v7, "setAllowsUserScaling:forDocumentTypes:", 0, 0xFFFFFFLL);
      objc_msgSend(v7, "setDoubleTapEnabled:", 0);
      objc_msgSend(v7, "setInputViewObeysDOMFocus:", 0);
      v8 = (void *)objc_msgSend(v7, "webView");
      v9 = -[SUClientInterface userAgent](self->_clientInterface, "userAgent");
      if (!v9)
        v9 = (NSString *)objc_msgSend(MEMORY[0x24BEC8C58], "copyUserAgent");
      objc_msgSend(v8, "setCustomUserAgent:", v9);

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA940]), "initWithIdentifier:", CFSTR("iTunesStorePreferences"));
      objc_msgSend(v10, "setCacheModel:", 2);
      objc_msgSend(v10, "setJavaScriptEnabled:", 1);
      objc_msgSend(v10, "setOfflineWebApplicationCacheEnabled:", 1);
      v11 = -[SUClientInterface localStoragePath](self->_clientInterface, "localStoragePath");
      if (v11)
        objc_msgSend(v10, "_setLocalStorageDatabasePath:", v11);
      if (CFPreferencesGetAppBooleanValue(CFSTR("DebugJavaScript"), (CFStringRef)*MEMORY[0x24BEC8CB0], 0))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v14 = v13 | 2;
        else
          v14 = v13;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEBUG))
          v14 &= 2u;
        if (v14)
        {
          v20 = 138412290;
          v21 = objc_opt_class();
          LODWORD(v19) = 12;
          v18 = &v20;
          v15 = _os_log_send_and_compose_impl();
          if (v15)
          {
            v16 = (void *)v15;
            v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v20, v19);
            free(v16);
            v18 = (int *)v17;
            SSFileLog();
          }
        }
        objc_msgSend(v8, "setScriptDebugDelegate:", self, v18);
      }
      objc_msgSend(v8, "setPreferences:", v10);

      -[UIWebView setDataDetectorTypes:](self->_webView, "setDataDetectorTypes:", 0);
      -[UIWebView setScalesPageToFit:](self->_webView, "setScalesPageToFit:", 0);
      -[UIWebView _setWebSelectionEnabled:](self->_webView, "_setWebSelectionEnabled:", 0);
      -[UIWebView _setDrawInWebThread:](self->_webView, "_setDrawInWebThread:", 1);
      -[UIWebView _setDrawsCheckeredPattern:](self->_webView, "_setDrawsCheckeredPattern:", 0);
      -[UIWebView setMediaPlaybackRequiresUserAction:](self->_webView, "setMediaPlaybackRequiresUserAction:", 0);
      if ((SUWebViewManager *)objc_msgSend(v8, "frameLoadDelegate") != self)
        -[SUWebViewManager setOriginalFrameLoadDelegate:](self, "setOriginalFrameLoadDelegate:", objc_msgSend(v8, "frameLoadDelegate"));
      if ((SUWebViewManager *)objc_msgSend(v8, "policyDelegate") != self)
        -[SUWebViewManager setOriginalPolicyDelegate:](self, "setOriginalPolicyDelegate:", objc_msgSend(v8, "policyDelegate"));
      if ((SUWebViewManager *)objc_msgSend(v8, "resourceLoadDelegate") != self)
        -[SUWebViewManager setOriginalResourceLoadDelegate:](self, "setOriginalResourceLoadDelegate:", objc_msgSend(v8, "resourceLoadDelegate"));
      if ((SUWebViewManager *)objc_msgSend(v8, "UIDelegate") != self)
        -[SUWebViewManager setOriginalUIDelegate:](self, "setOriginalUIDelegate:", objc_msgSend(v8, "UIDelegate"));
      objc_msgSend(v8, "setFrameLoadDelegate:", self);
      objc_msgSend(v8, "setPolicyDelegate:", self);
      objc_msgSend(v8, "setResourceLoadDelegate:", self);
      objc_msgSend(v8, "setUIDelegate:", self);
    }
  }
}

- (void)disconnectFromWebView
{
  void *v3;

  WebThreadLock();
  v3 = (void *)objc_msgSend((id)-[UIWebView _browserView](self->_webView, "_browserView"), "webView");
  if ((SUWebViewManager *)objc_msgSend(v3, "frameLoadDelegate") == self)
    objc_msgSend(v3, "setFrameLoadDelegate:", 0);
  if ((SUWebViewManager *)objc_msgSend(v3, "policyDelegate") == self)
    objc_msgSend(v3, "setPolicyDelegate:", 0);
  if ((SUWebViewManager *)objc_msgSend(v3, "resourceLoadDelegate") == self)
    objc_msgSend(v3, "setResourceLoadDelegate:", 0);
  if ((SUWebViewManager *)objc_msgSend(v3, "scriptDebugDelegate") == self)
    objc_msgSend(v3, "setScriptDebugDelegate:", 0);
  if ((SUWebViewManager *)objc_msgSend(v3, "UIDelegate") == self)
    objc_msgSend(v3, "setUIDelegate:", 0);
  -[UIWebView setDelegate:](self->_webView, "setDelegate:", 0);
  self->_webView = 0;
}

- (void)dispatchEvent:(id)a3 forName:(id)a4
{
  -[SUWebViewManager dispatchEvent:forName:synchronously:](self, "dispatchEvent:forName:synchronously:", a3, a4, 0);
}

- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SUWebViewManager_dispatchEvent_forName_synchronously___block_invoke;
  v5[3] = &unk_24DE7CF68;
  v5[4] = a3;
  v5[5] = a4;
  v6 = a5;
  -[SUWebViewManager _enumerateScriptInterfacesWithBlock:](self, "_enumerateScriptInterfacesWithBlock:", v5);
}

uint64_t __56__SUWebViewManager_dispatchEvent_forName_synchronously___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dispatchEvent:forName:synchronously:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)setAuthenticationContext:(id)a3
{
  SSAuthenticationContext *authenticationContext;
  SSAuthenticationContext *v6;
  uint64_t v7;
  _QWORD v8[5];

  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    v6 = (SSAuthenticationContext *)objc_msgSend(a3, "copy");
    v7 = MEMORY[0x24BDAC760];
    self->_authenticationContext = v6;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __45__SUWebViewManager_setAuthenticationContext___block_invoke;
    v8[3] = &unk_24DE7CF90;
    v8[4] = a3;
    -[SUWebViewManager _enumerateScriptInterfacesWithBlock:](self, "_enumerateScriptInterfacesWithBlock:", v8);
  }
}

uint64_t __45__SUWebViewManager_setAuthenticationContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationContext:", *(_QWORD *)(a1 + 32));
}

- (void)setScriptWindowContext:(id)a3
{
  SUScriptWindowContext *v5;
  uint64_t v6;
  _QWORD v7[5];

  if (self->_scriptWindowContext != a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v5 = (SUScriptWindowContext *)a3;
      v6 = MEMORY[0x24BDAC760];
      self->_scriptWindowContext = v5;
      v7[0] = v6;
      v7[1] = 3221225472;
      v7[2] = __43__SUWebViewManager_setScriptWindowContext___block_invoke;
      v7[3] = &unk_24DE7CF90;
      v7[4] = a3;
      -[SUWebViewManager _enumerateScriptInterfacesWithBlock:](self, "_enumerateScriptInterfacesWithBlock:", v7);
    }
  }
}

uint64_t __43__SUWebViewManager_setScriptWindowContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScriptWindowContext:", *(_QWORD *)(a1 + 32));
}

- (void)forwardInvocation:(id)a3
{
  const char *v5;
  id originalFrameLoadDelegate;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (const char *)objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    originalFrameLoadDelegate = self->_originalFrameLoadDelegate;
LABEL_9:
    objc_msgSend(a3, "invokeWithTarget:", originalFrameLoadDelegate);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    originalFrameLoadDelegate = self->_originalPolicyDelegate;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    originalFrameLoadDelegate = self->_originalResourceLoadDelegate;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    originalFrameLoadDelegate = self->_originalUIDelegate;
    goto LABEL_9;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v13 = 138412546;
    v14 = objc_opt_class();
    v15 = 2112;
    v16 = NSStringFromSelector(v5);
    LODWORD(v12) = 22;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v13, v12);
      free(v11);
      SSFileLog();
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUWebViewManager;
  result = -[SUWebViewManager methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    result = (id)objc_msgSend(self->_originalFrameLoadDelegate, "methodSignatureForSelector:", a3);
    if (!result)
    {
      result = (id)objc_msgSend(self->_originalResourceLoadDelegate, "methodSignatureForSelector:", a3);
      if (!result)
      {
        result = (id)objc_msgSend(self->_originalPolicyDelegate, "methodSignatureForSelector:", a3);
        if (!result)
          return (id)objc_msgSend(self->_originalUIDelegate, "methodSignatureForSelector:", a3);
      }
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUWebViewManager;
  if (-[SUWebViewManager respondsToSelector:](&v5, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)DOMElementForScriptInterface:(id)a3 element:(id)a4
{
  SUDOMElement *v5;

  v5 = -[SUDOMElement initWithDOMElement:]([SUDOMElement alloc], "initWithDOMElement:", a4);
  -[SUDOMElement setWebView:](v5, "setWebView:", self->_webView);
  return v5;
}

- (id)parentViewControllerForScriptInterface:(id)a3
{
  id v4;

  v4 = -[SUWebViewManager _delegate](self, "_delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(v4, "viewControllerForWebViewManager:", self);
  else
    return 0;
}

- (id)performanceMetricsForScriptInterface:(id)a3
{
  WebThreadLock();
  if (objc_msgSend((id)objc_msgSend(a3, "webFrame"), "parentFrame"))
    return 0;
  else
    return self->_initialRequestPerformance;
}

- (void)scriptInterface:(id)a3 requireCellularForResourceWithURL:(id)a4
{
  NSMutableSet *requireCellularURLs;

  -[NSLock lock](self->_lock, "lock", a3);
  requireCellularURLs = self->_requireCellularURLs;
  if (!requireCellularURLs)
  {
    requireCellularURLs = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_requireCellularURLs = requireCellularURLs;
  }
  -[NSMutableSet addObject:](requireCellularURLs, "addObject:", a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)webView:(id)a3 documentViewDidSetFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[SUWebViewManager _delegate](self, "_delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "webViewManager:webDocumentViewDidSetFrame:", self, x, y, width, height);
}

- (id)uiWebView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  return objc_getAssociatedObject(a4, "com.apple.iTunesStoreUI.SUWebViewManager.connectionProperties");
}

- (void)uiWebView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  id v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  SUWebViewManager *v18;
  int *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "rangeOfString:options:", CFSTR("html"), 1, a5, a6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[SUWebViewManager _delegate](self, "_delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v14 &= 2u;
      if (v14)
      {
        v21 = 138412802;
        v22 = objc_opt_class();
        v23 = 2112;
        v24 = a4;
        v25 = 2112;
        v26 = objc_msgSend(a5, "URL");
        LODWORD(v20) = 32;
        v19 = &v21;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v21, v20);
          free(v16);
          v19 = (int *)v17;
          SSFileLog();
        }
      }
      v18 = self;
      objc_msgSend(v11, "webViewManager:didRejectInvalidRequest:", self, a5);
    }
    objc_msgSend(a7, "ignore", v19);
  }
  else
  {
    objc_msgSend(a7, "use");
  }
}

- (id)uiWebView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  const void *v8;
  __CFString *v9;
  int v10;
  id v11;
  uint64_t v12;
  id v13;

  v8 = (const void *)objc_msgSend(a5, "webFrame", a3);
  if (!CFSetContainsValue(self->_webFramesPendingInitialRequest, v8)
    || !objc_msgSend((id)objc_msgSend(a4, "URL"), "isEqual:", objc_msgSend((id)objc_msgSend(a5, "initialRequest"), "URL"))|| (v9 = CFSTR("1"), CFSetRemoveValue(self->_webFramesPendingInitialRequest, v8), !v9))
  {
    v9 = (__CFString *)objc_alloc_init(MEMORY[0x24BEDCDF0]);
  }
  -[NSLock lock](self->_lock, "lock");
  v10 = -[NSMutableSet containsObject:](self->_requireCellularURLs, "containsObject:", objc_msgSend(a4, "URL"));
  -[NSLock unlock](self->_lock, "unlock");
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = ISWeakLinkedStringConstantForString();
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v13, "setObject:forKey:", v12, *MEMORY[0x24BDB7720]);
    objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x24BDB7838]);

    objc_setAssociatedObject(v9, "com.apple.iTunesStoreUI.SUWebViewManager.connectionProperties", v11, (void *)0x301);
  }
  return v9;
}

- (void)uiWebView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3, a4, a5, a6);
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v11 &= 2u;
  if (v11)
  {
    v17 = 138543874;
    v18 = objc_opt_class();
    v19 = 2112;
    v20 = a4;
    v21 = 2112;
    v22 = a5;
    LODWORD(v16) = 32;
    v15 = &v17;
    v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v17, v16);
      free(v13);
      v15 = (int *)v14;
      SSFileLog();
    }
  }
  -[SUWebViewManager _endUsingNetwork](self, "_endUsingNetwork", v15);
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SUWebScriptReloadContext *v19;
  void *v20;
  void *v21;
  NSSet *suppressCookiesHosts;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  ACAccount *v34;
  ACAccount *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  uint64_t v48;
  void *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSDictionary *v72;
  int *v74;
  int *v75;
  int *v76;
  uint64_t v77;
  _QWORD v78[5];
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  int v85;
  uint64_t v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (!a6)
    -[SUWebViewManager _beginUsingNetwork](self, "_beginUsingNetwork", a3);
  v12 = (void *)objc_msgSend(a5, "mutableCopy", a3);
  v13 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v14 = objc_msgSend(v13, "shouldLog");
  if (objc_msgSend(v13, "shouldLogToDisk"))
    v15 = v14 | 2;
  else
    v15 = v14;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v13, "OSLogObject"), OS_LOG_TYPE_INFO))
    v15 &= 2u;
  if (v15)
  {
    v85 = 138543618;
    v86 = objc_opt_class();
    v87 = 2112;
    v88 = a5;
    LODWORD(v77) = 22;
    v74 = &v85;
    v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v85, v77);
      free(v17);
      v74 = (int *)v18;
      SSFileLog();
    }
  }
  if (a4 == CFSTR("1"))
  {
    -[NSLock lock](self->_lock, "lock");
    v19 = self->_pendingWebScriptReloadContext;

    self->_pendingWebScriptReloadContext = 0;
    -[NSLock unlock](self->_lock, "unlock");
    if (v19
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "initialRequest"), "URL"), "isEqual:", -[SUWebScriptReloadContext URL](v19, "URL")))
    {
      v39 = -[SUWebScriptReloadContext referringUserAgent](v19, "referringUserAgent");
      if (v39)
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", v39, CFSTR("ref-user-agent"));
      v40 = -[NSURL absoluteString](-[SUWebScriptReloadContext referrerURL](v19, "referrerURL", v74), "absoluteString");
      if (v40)
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", v40, CFSTR("referer"));
    }
  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(v12, "setHTTPShouldHandleCookies:", 0);
  v20 = (void *)objc_msgSend(v12, "URL");
  v21 = v20;
  suppressCookiesHosts = self->_suppressCookiesHosts;
  if (!suppressCookiesHosts
    || !-[NSSet containsObject:](suppressCookiesHosts, "containsObject:", objc_msgSend(v20, "host")))
  {
    v23 = (void *)-[SSAuthenticationContext requiredUniqueIdentifier](-[SUWebViewManager authenticationContext](self, "authenticationContext", v74), "requiredUniqueIdentifier");
    objc_msgSend(MEMORY[0x24BEC8C30], "addITunesStoreHeadersToRequest:withAccountIdentifier:", v12, v23);
    if (v23 && objc_msgSend(v23, "unsignedLongLongValue"))
    {
      v24 = objc_msgSend(v23, "stringValue");
      objc_msgSend(v12, "setValue:forHTTPHeaderField:", v24, *MEMORY[0x24BEB2550]);
    }
    v25 = -[SUWebViewManager _userIdentifier](self, "_userIdentifier");
    v26 = (void *)objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
    v27 = v26;
    if (a6)
      objc_msgSend(v26, "setCookiesForHTTPResponse:userIdentifier:", a6, v25);
    v28 = (void *)objc_msgSend(v27, "cookieHeadersForURL:userIdentifier:", v21, v25);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v81 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(v12, "setValue:forHTTPHeaderField:", objc_msgSend(v28, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      }
      while (v30);
    }
    if (-[SUWebViewManager shouldSignRequests](self, "shouldSignRequests"))
    {
      v33 = objc_alloc_init(getAKAppleIDServerResourceLoadDelegateClass());
      objc_msgSend(v33, "setShouldSendAbsintheHeader:", 1);
      objc_msgSend(v33, "signRequest:", v12);

    }
  }
  v34 = -[SUWebViewManager account](self, "account", v74);
  if (v34)
  {
    v35 = v34;
    v79 = 0;
    v36 = objc_alloc_init(MEMORY[0x24BDB4398]);
    v37 = (void *)objc_msgSend(v36, "credentialForAccount:serviceID:error:", v35, *MEMORY[0x24BE060A8], &v79);

    if (v37)
    {
      v38 = objc_msgSend(v37, "token");
      if (v38)
      {
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", v38, *MEMORY[0x24BEB2558]);
        goto LABEL_62;
      }
      v49 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v50 = objc_msgSend(v49, "shouldLog");
      if (objc_msgSend(v49, "shouldLogToDisk"))
        v51 = v50 | 2;
      else
        v51 = v50;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v49, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v51 &= 2u;
      if (v51)
      {
        v52 = objc_opt_class();
        v85 = 138543362;
        v86 = v52;
        LODWORD(v77) = 12;
        v75 = &v85;
LABEL_60:
        v53 = _os_log_send_and_compose_impl();
        if (v53)
        {
          v54 = (void *)v53;
          v55 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, &v85, v77);
          free(v54);
          v75 = (int *)v55;
          SSFileLog();
        }
      }
    }
    else
    {
      v45 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v46 = objc_msgSend(v45, "shouldLog");
      if (objc_msgSend(v45, "shouldLogToDisk"))
        v47 = v46 | 2;
      else
        v47 = v46;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v45, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v47 &= 2u;
      if (v47)
      {
        v48 = objc_opt_class();
        v85 = 138543618;
        v86 = v48;
        v87 = 2114;
        v88 = v79;
        LODWORD(v77) = 22;
        v75 = &v85;
        goto LABEL_60;
      }
    }
LABEL_62:
    v56 = objc_msgSend(MEMORY[0x24BE04958], "clientInfoHeader", v75);
    if (v56)
    {
      objc_msgSend(v12, "setValue:forHTTPHeaderField:", v56, *MEMORY[0x24BEB2578]);
    }
    else
    {
      v58 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v59 = objc_msgSend(v58, "shouldLog");
      if (objc_msgSend(v58, "shouldLogToDisk"))
        v60 = v59 | 2;
      else
        v60 = v59;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v58, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v60 &= 2u;
      if (v60)
      {
        v61 = objc_opt_class();
        v85 = 138543362;
        v86 = v61;
        LODWORD(v77) = 12;
        v76 = &v85;
        v62 = _os_log_send_and_compose_impl();
        if (v62)
        {
          v63 = (void *)v62;
          v64 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v62, 4, &v85, v77);
          free(v63);
          v76 = (int *)v64;
          SSFileLog();
        }
      }
    }
    v57 = -[ACAccount aa_altDSID](v35, "aa_altDSID", v76);
    if (v57)
    {
      objc_msgSend(v12, "setValue:forHTTPHeaderField:", v57, *MEMORY[0x24BEB2520]);
      goto LABEL_83;
    }
    v65 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v66 = objc_msgSend(v65, "shouldLog");
    if (objc_msgSend(v65, "shouldLogToDisk"))
      v67 = v66 | 2;
    else
      v67 = v66;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v65, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v67 &= 2u;
    if (v67)
    {
      v68 = objc_opt_class();
      v85 = 138543362;
      v86 = v68;
      LODWORD(v77) = 12;
      v75 = &v85;
LABEL_81:
      v69 = _os_log_send_and_compose_impl();
      if (v69)
      {
        v70 = (void *)v69;
        v71 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v69, 4, &v85, v77);
        free(v70);
        v75 = (int *)v71;
        SSFileLog();
      }
      goto LABEL_83;
    }
    goto LABEL_83;
  }
  v41 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v42 = objc_msgSend(v41, "shouldLog");
  if (objc_msgSend(v41, "shouldLogToDisk"))
    v43 = v42 | 2;
  else
    v43 = v42;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v41, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v43 &= 2u;
  if (v43)
  {
    v44 = objc_opt_class();
    v85 = 138543362;
    v86 = v44;
    LODWORD(v77) = 12;
    v75 = &v85;
    goto LABEL_81;
  }
LABEL_83:
  if (-[SUWebViewManager tidHeaders](self, "tidHeaders", v75))
  {
    v72 = -[SUWebViewManager tidHeaders](self, "tidHeaders");
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __94__SUWebViewManager_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource___block_invoke;
    v78[3] = &unk_24DE7CFB8;
    v78[4] = v12;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v72, "enumerateKeysAndObjectsUsingBlock:", v78);
  }
  return v12;
}

uint64_t __94__SUWebViewManager_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "setValue:forHTTPHeaderField:", a3, a2);
  }
  return result;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  SUWebViewManager *v13;
  int *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    v16 = 138543618;
    v17 = objc_opt_class();
    v18 = 2112;
    v19 = a4;
    LODWORD(v15) = 22;
    v14 = &v16;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v16, v15);
      free(v10);
      v14 = (int *)v11;
      SSFileLog();
    }
  }
  v12 = -[SUWebViewManager _delegate](self, "_delegate", v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = self;
    objc_msgSend(v12, "webViewManager:didFailLoadWithError:", self, a4);
  }
  -[SUWebViewManager _cancelUsingNetwork](self, "_cancelUsingNetwork");
}

- (void)webViewDidFinishLoad:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  SUWebViewManager *v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    v15 = 138543362;
    v16 = objc_opt_class();
    LODWORD(v14) = 12;
    v13 = &v15;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v15, v14);
      free(v9);
      v13 = (int *)v10;
      SSFileLog();
    }
  }
  v11 = -[SUWebViewManager _delegate](self, "_delegate", v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = self;
    objc_msgSend(v11, "webViewManagerDidFinishLoad:", self);
  }
  if (!self->_initialLoadReported && (objc_msgSend(a3, "isLoading") & 1) == 0)
  {
    -[SUClientInterface delegate](self->_clientInterface, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SUClientInterfaceDelegate clientInterfaceDidFinishLoading:](-[SUClientInterface delegate](self->_clientInterface, "delegate"), "clientInterfaceDidFinishLoading:", self->_clientInterface);
      self->_initialLoadReported = 1;
    }
  }
  -[SUWebViewManager _cancelUsingNetwork](self, "_cancelUsingNetwork");
}

- (void)webViewDidStartLoad:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  SUWebViewManager *v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (v6)
  {
    v14 = 138543362;
    v15 = objc_opt_class();
    LODWORD(v13) = 12;
    v12 = &v14;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v14, v13);
      free(v8);
      v12 = (int *)v9;
      SSFileLog();
    }
  }
  v10 = -[SUWebViewManager _delegate](self, "_delegate", v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = self;
    objc_msgSend(v10, "webViewManagerDidStartLoad:", self);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  id v10;

  v10 = -[SUWebViewManager _locateStorePageViewController](self, "_locateStorePageViewController", a3, a4, a5, a6);
  if (!v10 || (objc_msgSend(v10, "decidePolicyForWebNavigationAction:request:decisionListener:", a4, a5, a7) & 1) == 0)
    objc_msgSend(a7, "use");
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  id v9;
  NSMapTable *scriptInterfaces;
  void *v11;
  SUScriptInterface *v12;
  NSMapTable *v13;
  __int128 v14;
  NSMapTableValueCallBacks v15;
  NSMapTableKeyCallBacks keyCallBacks;

  v9 = -[SUWebViewManager _delegate](self, "_delegate");
  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    v11 = NSMapGet(scriptInterfaces, a5);
    objc_msgSend(v11, "setDelegate:", 0);
    objc_msgSend(v11, "tearDownUserInterface");
    NSMapRemove(self->_scriptInterfaces, a5);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v12 = (SUScriptInterface *)objc_msgSend(v9, "newScriptInterfaceForWebViewManager:", self)) == 0)
  {
    v12 = -[SUClientInterface _newScriptInterface](self->_clientInterface, "_newScriptInterface");
    if (!v12)
    {
      v12 = +[SUClientDispatch newScriptInterface](SUClientDispatch, "newScriptInterface");
      if (!v12)
        v12 = objc_alloc_init(SUScriptInterface);
    }
  }
  -[SUScriptInterface setAuthenticationContext:](v12, "setAuthenticationContext:", -[SUWebViewManager authenticationContext](self, "authenticationContext"));
  -[SUScriptInterface setClientInterface:](v12, "setClientInterface:", self->_clientInterface);
  -[SUScriptInterface setDelegate:](v12, "setDelegate:", self);
  -[SUScriptInterface setWebFrame:](v12, "setWebFrame:", a5);
  v13 = self->_scriptInterfaces;
  if (!v13)
  {
    v14 = *(_OWORD *)(MEMORY[0x24BDD10F8] + 16);
    *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x24BDD10F8];
    *(_OWORD *)&keyCallBacks.retain = v14;
    *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x24BDD10F8] + 32);
    v15 = *(NSMapTableValueCallBacks *)*(_QWORD *)&MEMORY[0x24BDD1110];
    v13 = NSCreateMapTable(&keyCallBacks, &v15, 0);
    self->_scriptInterfaces = v13;
  }
  NSMapInsert(v13, a5, v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "webViewManager:willInjectScriptInterface:", self, v12);
  objc_msgSend(a4, "setValue:forKey:", v12, CFSTR("iTunes"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_originalFrameLoadDelegate, "webView:didClearWindowObject:forFrame:", a3, a4, a5);
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CFAbsoluteTime Current;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_originalFrameLoadDelegate, "webView:didFirstLayoutInFrame:", a3, a4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v13 = 138412802;
    v14 = objc_opt_class();
    v15 = 2048;
    Current = CFAbsoluteTimeGetCurrent();
    v17 = 2112;
    v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "dataSource"), "initialRequest"), "URL");
    LODWORD(v12) = 32;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v13, v12);
      free(v11);
      SSFileLog();
    }
  }
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
  id v7;
  SUWebViewManager *v8;

  if ((id)objc_msgSend((id)objc_msgSend(a5, "webView", a3), "mainFrame") == a5)
  {
    v7 = -[SUWebViewManager _delegate](self, "_delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = self;
      objc_msgSend(v7, "webViewManager:didReceiveTitle:", self, a4);
    }
  }
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_originalFrameLoadDelegate, "webView:didStartProvisionalLoadForFrame:", a3, a4);
  if ((id)objc_msgSend(a3, "mainFrame") == a4 && self->_scriptInterfaces)
  {
    -[SUWebViewManager _enumerateScriptInterfacesWithBlock:](self, "_enumerateScriptInterfacesWithBlock:", &__block_literal_global_10);
    NSFreeMapTable(self->_scriptInterfaces);
    self->_scriptInterfaces = 0;
  }
  CFSetAddValue(self->_webFramesPendingInitialRequest, a4);
}

uint64_t __60__SUWebViewManager_webView_didStartProvisionalLoadForFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDelegate:", 0);
  return objc_msgSend(a2, "tearDownUserInterface");
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveResponse:(id)a5 fromDataSource:(id)a6
{
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  SUWebViewManager *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_originalResourceLoadDelegate, "webView:resource:didReceiveResponse:fromDataSource:", a3, a4, a5, a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(a5, "URL");
    if ((objc_msgSend((id)objc_msgSend(v11, "scheme"), "isEqualToString:", CFSTR("data")) & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v14 &= 2u;
      if (v14)
      {
        v21 = 138412802;
        v22 = objc_opt_class();
        v23 = 2048;
        v24 = objc_msgSend(a5, "statusCode");
        v25 = 2112;
        v26 = v11;
        LODWORD(v20) = 32;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v21, v20);
          free(v16);
          SSFileLog();
        }
      }
    }
    if (a4 == CFSTR("1"))
    {
      v17 = -[SUWebViewManager _userIdentifier](self, "_userIdentifier");
      objc_msgSend(MEMORY[0x24BEC8C30], "handleITunesStoreResponseHeaders:request:withAccountIdentifier:shouldRetry:", a5, objc_msgSend(a6, "request"), v17, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage"), "setCookiesForHTTPResponse:userIdentifier:", a5, v17);
      v18 = -[SUWebViewManager _delegate](self, "_delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = self;
        objc_msgSend(v18, "webViewManager:didReceivePrimaryResponse:", self, a5);
      }
    }
  }
}

- (void)webView:(id)a3 didParseSource:(id)a4 fromURL:(id)a5 sourceId:(int64_t)a6 forWebFrame:(id)a7
{
  if (a5)
    NSLog(CFSTR("JavaScript did parse with source ID: %ld, URL: %@"), a2, a3, a4, a5, a6, a7, a6, a5);
}

- (void)webView:(id)a3 failedToParseSource:(id)a4 baseLineNumber:(unint64_t)a5 fromURL:(id)a6 withError:(id)a7 forWebFrame:(id)a8
{
  NSLog(CFSTR("JavaScript parse error: %@:%lu"), a2, a3, a4, a5, a6, a7, a8, a6, a5);
}

- (void)webView:(id)a3 exceptionWasRaised:(id)a4 sourceId:(int64_t)a5 line:(int)a6 forWebFrame:(id)a7
{
  uint64_t v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)&a6;
  v10 = (void *)objc_msgSend(a4, "exception", a3);
  v11 = objc_msgSend(v10, "valueForKey:", CFSTR("name"));
  v12 = objc_msgSend(v10, "valueForKey:", CFSTR("message"));
  v13 = 0;
  if (v11 && v12)
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v11, v12);
  NSLog(CFSTR("JavaScript exception: %@; %@:%ld:%d"), v13, objc_msgSend(a4, "functionName"), a5, v7);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  -[SUWebViewManager _presentModalAlertWithMessage:includingCancelButton:configurationHandler:](self, "_presentModalAlertWithMessage:includingCancelButton:configurationHandler:", a4, 0, 0);
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return -[SUWebViewManager _presentModalAlertWithMessage:includingCancelButton:configurationHandler:](self, "_presentModalAlertWithMessage:includingCancelButton:configurationHandler:", a4, 1, 0);
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__36;
  v13 = __Block_byref_object_dispose__36;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke;
  v8[3] = &unk_24DE7D048;
  v8[4] = a5;
  v8[5] = &v9;
  if (-[SUWebViewManager _presentModalAlertWithMessage:includingCancelButton:configurationHandler:](self, "_presentModalAlertWithMessage:includingCancelButton:configurationHandler:", a4, 1, v8, a6))
  {
    v6 = (id)objc_msgSend((id)v10[5], "text");
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2;
  v3[3] = &unk_24DE7D020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "addTextFieldWithConfigurationHandler:", v3);
}

uint64_t __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setText:", *(_QWORD *)(a1 + 32));
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
  SUWebScriptReloadContext *pendingWebScriptReloadContext;
  id v5;
  SUWebScriptReloadContext *v6;

  v6 = (SUWebScriptReloadContext *)objc_msgSend(a3, "copy");
  -[NSLock lock](self->_lock, "lock");
  pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
  if (pendingWebScriptReloadContext != v6)
  {

    self->_pendingWebScriptReloadContext = v6;
  }
  -[NSLock unlock](self->_lock, "unlock");
  v5 = -[SUWebScriptReloadContext _copyScriptDictionaryRepresentation](v6, "_copyScriptDictionaryRepresentation");
  -[SUWebViewManager dispatchEvent:forName:](self, "dispatchEvent:forName:", v5, CFSTR("reloadrequested"));

}

- (id)_locateStorePageViewController
{
  id v3;
  uint64_t i;
  void *v5;

  v3 = -[SUWebViewManager _delegate](self, "_delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    for (i = objc_msgSend(v3, "viewControllerForWebViewManager:", self); ; i = objc_msgSend(v5, "parentViewController"))
    {
      v5 = (void *)i;
      if (!i)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v5;
  else
    return 0;
}

- (void)_beginUsingNetwork
{
  -[NSLock lock](self->_lock, "lock");
  ++self->_usingNetworkCount;
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "beginUsingNetwork");
}

- (void)_cancelUsingNetwork
{
  int64_t usingNetworkCount;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NSLock lock](self->_lock, "lock");
  usingNetworkCount = self->_usingNetworkCount;
  self->_usingNetworkCount = 0;
  -[NSLock unlock](self->_lock, "unlock");
  v4 = objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  if (usingNetworkCount >= 1)
  {
    v5 = (void *)v4;
    v6 = usingNetworkCount + 1;
    do
    {
      objc_msgSend(v5, "endUsingNetwork");
      --v6;
    }
    while (v6 > 1);
  }
}

- (id)_delegate
{
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUWebViewManager.m"), 847, CFSTR("Not main thread"));
  return self->_delegate;
}

- (void)_endUsingNetwork
{
  int64_t usingNetworkCount;
  BOOL v4;
  int64_t v5;

  -[NSLock lock](self->_lock, "lock");
  usingNetworkCount = self->_usingNetworkCount;
  v4 = usingNetworkCount < 1;
  v5 = usingNetworkCount - 1;
  if (v4)
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    self->_usingNetworkCount = v5;
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "endUsingNetwork");
  }
}

- (void)_enumerateScriptInterfacesWithBlock:(id)a3
{
  NSMapTable *scriptInterfaces;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, scriptInterfaces);
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
      (*((void (**)(id, void *))a3 + 2))(a3, value);
    NSEndMapTableEnumeration(&enumerator);
  }
}

- (BOOL)_presentModalAlertWithMessage:(id)a3 includingCancelButton:(BOOL)a4 configurationHandler:(id)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  if (a5)
    (*((void (**)(id, void *))a5 + 2))(a5, v8);
  v9 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_2;
    v16[3] = &unk_24DE7D090;
    v16[4] = &__block_literal_global_105;
    objc_msgSend(v8, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0), 1, v16));
  }
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_3;
  v15[3] = &unk_24DE7D0B8;
  v15[4] = &__block_literal_global_105;
  v15[5] = &v17;
  objc_msgSend(v8, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DE83F60, 0), 0, v15));
  v10 = -[SUWebViewManager _delegate](self, "_delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "viewControllerForWebViewManager:", self);
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "presentViewController:animated:completion:", v8, 1, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "runModal:", objc_msgSend(v12, "view"));
    }
  }
  v13 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "stopModal");
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_userIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)-[SSAuthenticationContext requiredUniqueIdentifier](-[SUWebViewManager authenticationContext](self, "authenticationContext"), "requiredUniqueIdentifier");
  if (v2 && (v3 = v2, objc_msgSend(v2, "unsignedLongLongValue")))
    return v3;
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "uniqueIdentifier");
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (SUWebViewManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUWebViewManagerDelegate *)a3;
}

- (ISURLRequestPerformance)initialRequestPerformance
{
  return self->_initialRequestPerformance;
}

- (void)setInitialRequestPerformance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (id)originalFrameLoadDelegate
{
  return self->_originalFrameLoadDelegate;
}

- (void)setOriginalFrameLoadDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (id)originalPolicyDelegate
{
  return self->_originalPolicyDelegate;
}

- (void)setOriginalPolicyDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (id)originalResourceLoadDelegate
{
  return self->_originalResourceLoadDelegate;
}

- (void)setOriginalResourceLoadDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (id)originalUIDelegate
{
  return self->_originalUIDelegate;
}

- (void)setOriginalUIDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (SUScriptWindowContext)scriptWindowContext
{
  return self->_scriptWindowContext;
}

- (BOOL)shouldSignRequests
{
  return self->_shouldSignRequests;
}

- (void)setShouldSignRequests:(BOOL)a3
{
  self->_shouldSignRequests = a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
