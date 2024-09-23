@implementation SUWebViewController

- (void)dealloc
{
  objc_super v3;

  -[SUWebViewManager disconnectFromWebView](self->_webViewManager, "disconnectFromWebView");
  -[SUWebViewManager setDelegate:](self->_webViewManager, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (id)newScriptInterface
{
  id result;

  result = -[SUClientInterface _newScriptInterface](-[SUViewController clientInterface](self, "clientInterface"), "_newScriptInterface");
  if (!result)
    return +[SUClientDispatch newScriptInterface](SUClientDispatch, "newScriptInterface");
  return result;
}

- (void)setAuthenticationContext:(id)a3
{
  void *v3;
  SSMutableAuthenticationContext *authenticationContext;
  int64_t v6;

  v3 = a3;
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSMutableAuthenticationContext *)objc_msgSend(v3, "mutableCopy");
    v6 = -[SUWebViewController style](self, "style");
    v3 = self->_authenticationContext;
    if (v6 == 1)
    {
      -[SSMutableAuthenticationContext setShouldFollowAccountButtons:](self->_authenticationContext, "setShouldFollowAccountButtons:", 1);
      v3 = self->_authenticationContext;
    }
  }
  -[SUWebViewManager setAuthenticationContext:](self->_webViewManager, "setAuthenticationContext:", v3);
}

- (SUWebView)webView
{
  SSMutableAuthenticationContext *v3;
  ACAccount *account;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  SUWebViewManager *v10;
  SUWebView *result;
  id v12;
  SUWebView *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _UIApplicationLoadWebKit();
  if (self->_webViewManager)
    goto LABEL_15;
  v3 = self->_authenticationContext;
  if (!v3)
  {
    account = self->_account;
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (account)
    {
      if (v7)
      {
        v19 = 138412290;
        v20 = objc_opt_class();
        LODWORD(v18) = 12;
        v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v19, v18);
          free(v9);
          SSFileLog();
        }
      }
      v3 = (SSMutableAuthenticationContext *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1D80]), "initWithBackingAccount:", self->_account);
      if (!v3)
        goto LABEL_14;
    }
    else
    {
      if (v7)
      {
        v19 = 138412290;
        v20 = objc_opt_class();
        LODWORD(v18) = 12;
        v17 = &v19;
        v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v19, v18);
          free(v15);
          v17 = (int *)v16;
          SSFileLog();
        }
      }
      v3 = (SSMutableAuthenticationContext *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore", v17), "activeAccount");
      self->_account = (ACAccount *)(id)-[SSMutableAuthenticationContext backingAccount](v3, "backingAccount");
      if (!v3)
        goto LABEL_14;
    }
    v3 = (SSMutableAuthenticationContext *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DC0]), "initWithAccount:", v3);
  }
LABEL_14:
  v10 = -[SUWebViewManager initWithClientInterface:]([SUWebViewManager alloc], "initWithClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  self->_webViewManager = v10;
  -[SUWebViewManager setAccount:](v10, "setAccount:", self->_account);
  -[SUWebViewManager setAuthenticationContext:](self->_webViewManager, "setAuthenticationContext:", v3);
  -[SUWebViewManager setDelegate:](self->_webViewManager, "setDelegate:", self);
  -[SUWebViewManager setInitialRequestPerformance:](self->_webViewManager, "setInitialRequestPerformance:", self->_performanceMetrics);
  -[SUWebViewManager setShouldSignRequests:](self->_webViewManager, "setShouldSignRequests:", self->_shouldSignRequests);
  -[SUWebViewManager setTidHeaders:](self->_webViewManager, "setTidHeaders:", -[SUWebViewController tidHeaders](self, "tidHeaders"));
  -[SUWebViewManager connectToWebView:](self->_webViewManager, "connectToWebView:", self->_webView);

LABEL_15:
  result = self->_webView;
  if (!result)
  {
    v12 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
    v13 = -[SUWebView initWithFrame:]([SUWebView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
    self->_webView = v13;
    -[SUWebViewManager connectToWebView:](self->_webViewManager, "connectToWebView:", v13);
    -[SUWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor"));
    -[SUWebViewController _applyScriptProperties:](self, "_applyScriptProperties:", v12);

    return self->_webView;
  }
  return result;
}

- (void)applicationDidEnterBackground
{
  objc_super v3;

  -[SUWebView setHidden:](-[SUWebViewController webView](self, "webView"), "setHidden:", 1);
  -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("diddisappear"));
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[SUViewController applicationDidEnterBackground](&v3, sel_applicationDidEnterBackground);
}

- (void)applicationWillEnterForeground
{
  objc_super v3;

  -[SUWebView setHidden:](-[SUWebViewController webView](self, "webView"), "setHidden:", 0);
  -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("didreappear"));
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[SUViewController applicationWillEnterForeground](&v3, sel_applicationWillEnterForeground);
}

- (id)copyArchivableContext
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  v3 = -[SUViewController copyArchivableContext](&v8, sel_copyArchivableContext);
  if (!-[SUViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    v4 = (void *)-[SUWebView scrollView](self->_webView, "scrollView");
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend(v4, "contentOffset");
      v6 = (id)objc_msgSend(v5, "valueWithCGPoint:");
LABEL_6:
      objc_msgSend(v3, "setValue:forMetadataKey:", v6, CFSTR("offset"));
      return v3;
    }
    if (-[SUViewController _restoredContext](self, "_restoredContext"))
    {
      v6 = -[SUViewControllerContext valueForMetadataKey:](-[SUViewController _restoredContext](self, "_restoredContext"), "valueForMetadataKey:", CFSTR("offset"));
      goto LABEL_6;
    }
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  v2 = -[SUViewController copyDefaultScriptProperties](&v8, sel_copyDefaultScriptProperties);
  objc_msgSend(v2, "setDoubleTapEnabled:", 0);
  objc_msgSend(v2, "setFlashesScrollIndicators:", 1);
  objc_msgSend(v2, "setInputViewObeysDOMFocus:", 0);
  objc_msgSend(v2, "setScrollingDisabled:", 0);
  objc_msgSend(v2, "setShouldShowFormAccessory:", 1);
  v3 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "valueForKey:", CFSTR("p2-client-options"));
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("load-progressively"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 1;
  objc_msgSend(v2, "setShouldLoadProgressively:", v6);
  return v2;
}

- (id)copyScriptProperties
{
  id v3;
  SUWebView *webView;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  v3 = -[SUViewController copyScriptProperties](&v8, sel_copyScriptProperties);
  webView = self->_webView;
  if (webView)
  {
    objc_msgSend(v3, "setBackgroundColor:", -[SUWebView backgroundColor](webView, "backgroundColor"));
    objc_msgSend(v3, "setAlwaysDispatchesScrollEvents:", -[SUWebView _alwaysDispatchesScrollEvents](self->_webView, "_alwaysDispatchesScrollEvents"));
    v5 = (void *)-[SUWebView _browserView](self->_webView, "_browserView");
    objc_msgSend(v3, "setDoubleTapEnabled:", objc_msgSend(v5, "isDoubleTapEnabled"));
    objc_msgSend(v3, "setInputViewObeysDOMFocus:", objc_msgSend(v5, "inputViewObeysDOMFocus"));
    objc_msgSend(v3, "setScrollingDisabled:", -[SUWebView isScrollingEnabled](self->_webView, "isScrollingEnabled") ^ 1);
    objc_msgSend(v3, "setShouldShowFormAccessory:", objc_msgSend(v5, "isAccessoryEnabled"));
    v6 = (void *)-[SUWebView scrollView](self->_webView, "scrollView");
    objc_msgSend(v3, "setScrollContentInsets:", SUUIScrollViewGetDefaultContentInset(v6));
    objc_msgSend(v3, "setShowsBackgroundShadow:", objc_msgSend(v6, "_showsBackgroundShadow"));
    objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", objc_msgSend(v6, "showsHorizontalScrollIndicator"));
    objc_msgSend(v3, "setShowsVerticalScrollIndicator:", objc_msgSend(v6, "showsVerticalScrollIndicator"));
  }
  return v3;
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  id v4;

  v4 = -[SUObjectPool copyPoppedObjectForClass:](self->_objectPool, "copyPoppedObjectForClass:", a3);
  if (-[SUWebView isLoading](self->_webView, "isLoading")
    && objc_msgSend(v4, "conformsToProtocol:", &unk_2551D9640))
  {
    objc_msgSend(v4, "setDeferringInterfaceUpdates:", 1);
  }
  return v4;
}

- (id)displayedURL
{
  NSURL *displayedURL;
  objc_super v4;

  displayedURL = self->_displayedURL;
  if (displayedURL)
    return displayedURL;
  v4.receiver = self;
  v4.super_class = (Class)SUWebViewController;
  return -[UIViewController displayedURL](&v4, sel_displayedURL);
}

- (CGRect)documentBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (void *)-[SUWebView _browserView](self->_webView, "_browserView");
  if (v2)
  {
    objc_msgSend(v2, "documentBounds");
  }
  else
  {
    v3 = *MEMORY[0x24BDBF070];
    v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)invalidate
{
  objc_super v3;

  if (!-[SUViewController isVisible](self, "isVisible"))
    self->_hasEverAppeared = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[SUViewController invalidate](&v3, sel_invalidate);
}

- (void)keyboardDidHideWithInfo:(id)a3
{
  objc_super v5;

  -[SUWebView _updateScrollerViewForInputView:](self->_webView, "_updateScrollerViewForInputView:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[UIViewController keyboardDidHideWithInfo:](&v5, sel_keyboardDidHideWithInfo_, a3);
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  objc_super v5;

  -[SUWebView _updateScrollerViewForInputView:](self->_webView, "_updateScrollerViewForInputView:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[UIViewController keyboardWillShowWithInfo:](&v5, sel_keyboardWillShowWithInfo_, a3);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[SUWebViewController setView:](self, "setView:", v3);

}

- (CGSize)minimumViewSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  if (self->_webView)
  {
    objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "documentBounds");
    v3 = v2;
    v5 = v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUWebViewController;
    -[UIViewController minimumViewSize](&v6, sel_minimumViewSize);
  }
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)navigationItemForScriptInterface
{
  SUDelayedNavigationItem *delayedNavigationItem;
  uint64_t v4;
  SUNavigationItem *v5;
  id result;
  SUDelayedNavigationItem *v7;

  delayedNavigationItem = self->_delayedNavigationItem;
  if (delayedNavigationItem)
  {
    v4 = -[SUDelayedNavigationItem wrappedNavigationItem](delayedNavigationItem, "wrappedNavigationItem");
    v5 = -[SUViewController navigationItem](self, "navigationItem");
    result = self->_delayedNavigationItem;
    if ((SUNavigationItem *)v4 == v5)
    {
      if (result)
        return result;
    }
    else
    {

      self->_delayedNavigationItem = 0;
    }
  }
  v7 = -[SUDelayedNavigationItem initWithNavigationItem:]([SUDelayedNavigationItem alloc], "initWithNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
  self->_delayedNavigationItem = v7;
  -[SUDelayedNavigationItem setShouldDelayChanges:](v7, "setShouldDelayChanges:", self->_objectPool != 0);
  return self->_delayedNavigationItem;
}

- (void)parentViewControllerHierarchyDidChange
{
  objc_super v3;

  if (-[SUWebViewController _placeholderBackgroundView](self, "_placeholderBackgroundView"))
    -[SUWebViewController _reloadPlaceholderBackgroundView](self, "_reloadPlaceholderBackgroundView");
  -[SUWebViewManager setScriptWindowContext:](self->_webViewManager, "setScriptWindowContext:", objc_msgSend((id)-[SUWebViewController parentViewController](self, "parentViewController"), "scriptWindowContext"));
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[UIViewController parentViewControllerHierarchyDidChange](&v3, sel_parentViewControllerHierarchyDidChange);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void *i;
  objc_super v10;

  v6 = a4;
  for (i = (void *)-[SUWebViewController parentViewController](self, "parentViewController");
        i;
        i = (void *)objc_msgSend(i, "parentViewController"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  if (objc_msgSend(i, "bridgedNavigation"))
  {
    objc_msgSend((id)objc_msgSend(i, "parentViewController"), "presentViewController:animated:completion:", a3, v6, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SUWebViewController;
    -[SUWebViewController presentViewController:animated:completion:](&v10, sel_presentViewController_animated_completion_, a3, v6, a5);
  }
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  SUWebView *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[SUWebViewController _prepareToLoadURL:](self, "_prepareToLoadURL:", a4);
  v7 = -[SUWebViewController webView](self, "webView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v31 = 138543362;
      v32 = objc_opt_class();
      LODWORD(v30) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v31, v30);
        free(v12);
        SSFileLog();
      }
    }
    -[SUWebView loadData:MIMEType:textEncodingName:baseURL:](v7, "loadData:MIMEType:textEncodingName:baseURL:", a3, CFSTR("text/html"), CFStringConvertEncodingToIANACharSetName(0x8000100u), a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = objc_msgSend(v13, "shouldLog");
      if (objc_msgSend(v13, "shouldLogToDisk"))
        v15 = v14 | 2;
      else
        v15 = v14;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v13, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v15 &= 2u;
      if (v15)
      {
        v31 = 138543362;
        v32 = objc_opt_class();
        LODWORD(v30) = 12;
        v29 = &v31;
        v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v31, v30);
          free(v17);
          v29 = (int *)v18;
          SSFileLog();
        }
      }
      -[SUWebView loadHTMLString:baseURL:](v7, "loadHTMLString:baseURL:", a3, a4, v29);
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = objc_msgSend(v20, "shouldLog");
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v20, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v22 &= 2u;
      if ((isKindOfClass & 1) != 0)
      {
        if (v22)
        {
          v31 = 138543362;
          v32 = objc_opt_class();
          LODWORD(v30) = 12;
          v29 = &v31;
          v23 = _os_log_send_and_compose_impl();
          if (v23)
          {
            v24 = (void *)v23;
            v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v31, v30);
            free(v24);
            v29 = (int *)v25;
            SSFileLog();
          }
        }
        -[SUWebView loadArchive:](v7, "loadArchive:", a3, v29);
      }
      else
      {
        if (v22)
        {
          v31 = 138543362;
          v32 = objc_opt_class();
          LODWORD(v30) = 12;
          v29 = &v31;
          v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v31, v30);
            free(v27);
            v29 = (int *)v28;
            SSFileLog();
          }
        }
        -[SUWebViewController _reloadUI](self, "_reloadUI", v29);
        -[SUWebViewController setViewIsReady:](self, "setViewIsReady:", 1);
      }
    }
  }
}

- (void)_setExistingNavigationItem:(id)a3
{
  objc_super v5;

  -[SUDelayedNavigationItem setWrappedNavigationItem:](self->_delayedNavigationItem, "setWrappedNavigationItem:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[SUViewController _setExistingNavigationItem:](&v5, sel__setExistingNavigationItem_, a3);
}

- (void)setScriptProperties:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[SUViewController setScriptProperties:](&v5, sel_setScriptProperties_);
  -[SUWebViewController _applyScriptProperties:](self, "_applyScriptProperties:", a3);
}

- (void)setStorePageProtocol:(id)a3
{
  SUStorePageProtocol *storePageProtocol;

  storePageProtocol = self->_storePageProtocol;
  if (storePageProtocol != a3)
  {

    self->_storePageProtocol = (SUStorePageProtocol *)a3;
    -[SUWebViewController storePageProtocolDidChange](self, "storePageProtocolDidChange");
  }
}

- (id)storePageProtocol
{
  id result;

  result = self->_storePageProtocol;
  if (!result)
  {
    result = objc_alloc_init(SUStorePageProtocol);
    self->_storePageProtocol = (SUStorePageProtocol *)result;
  }
  return result;
}

- (void)setShouldSignRequests:(BOOL)a3
{
  self->_shouldSignRequests = a3;
  -[SUWebViewManager setShouldSignRequests:](self->_webViewManager, "setShouldSignRequests:");
}

- (void)storePageCleanupBeforeTearDown
{
  objc_super v3;

  -[SUWebViewManager disconnectFromWebView](self->_webViewManager, "disconnectFromWebView");
  -[SUWebViewManager setDelegate:](self->_webViewManager, "setDelegate:", 0);

  self->_webViewManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[UIViewController storePageCleanupBeforeTearDown](&v3, sel_storePageCleanupBeforeTearDown);
}

- (void)storePageProtocolDidChange
{
  objc_super v3;

  if (-[SUWebViewController isViewLoaded](self, "isViewLoaded")
    && (-[SUWebView isLoading](self->_webView, "isLoading") & 1) == 0)
  {
    -[SUWebViewController _reloadUI](self, "_reloadUI");
  }
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  -[SUViewController storePageProtocolDidChange](&v3, sel_storePageProtocolDidChange);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  if (self->_hasEverAppeared)
    -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("didreappear"));
  self->_hasEverAppeared = 1;
  v5 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
  -[SUWebViewController _applyScriptProperties:](self, "_applyScriptProperties:", v5);
  if ((-[SUWebView isLoading](self->_webView, "isLoading") & 1) == 0
    && -[SUWebView request](self->_webView, "request")
    && objc_msgSend(v5, "flashesScrollIndicators"))
  {
    objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "flashScrollIndicators");
  }

  v6.receiver = self;
  v6.super_class = (Class)SUWebViewController;
  -[SUViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("diddisappear"));
  objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "setScrollsToTop:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[SUViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  objc_super v6;

  v3 = a3;
  if (self->_hasEverAppeared)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation");
    if (-[SUWebViewController viewIsReady](self, "viewIsReady") && self->_lastKnownOrientation != v5)
    {
      -[SUWebView beginSynchronousLayout](self->_webView, "beginSynchronousLayout");
      -[SUWebViewController _sendOrientationWillChangeToInterfaceOrientation:](self, "_sendOrientationWillChangeToInterfaceOrientation:", v5);
      -[SUWebView endSynchronousLayout](self->_webView, "endSynchronousLayout");
      objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "sendOrientationEventForOrientation:", v5);
    }
    self->_lastKnownOrientation = v5;
    -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("willreappear"));
  }
  v6.receiver = self;
  v6.super_class = (Class)SUWebViewController;
  -[SUViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUWebViewManager dispatchEvent:forName:](self->_webViewManager, "dispatchEvent:forName:", 0, CFSTR("willdisappear"));
  self->_lastKnownOrientation = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[SUViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (id)newRotationController
{
  return -[SURotationController initWithViewController:]([SUWebViewRotationController alloc], "initWithViewController:", self);
}

- (void)webViewManager:(id)a3 didReceiveTitle:(id)a4
{
  -[SUViewController setTitle:changeTabBarItem:](self, "setTitle:changeTabBarItem:", a4, 0);
}

- (void)webViewManager:(id)a3 didFailLoadWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) != -999)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUWebViewControllerDidFailLoad"), self);
    -[SUWebViewController _finishLoadWithResult:error:](self, "_finishLoadWithResult:error:", 0, a4);
  }
}

- (void)webViewManager:(id)a3 didReceivePrimaryResponse:(id)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSURL *displayedURL;
  void *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->_mescalSession)
    goto LABEL_20;
  objc_msgSend(a4, "allHeaderFields", a3);
  v6 = (void *)ISDictionaryValueForCaseInsensitiveString();
  if (!objc_msgSend(v6, "length"))
    goto LABEL_20;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 0);
  v25 = 0;
  v8 = -[SUMescalSession verifyPrimeSignature:error:](self->_mescalSession, "verifyPrimeSignature:error:", v7, &v25);
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  v12 = objc_msgSend(v9, "OSLogObject");
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      v14 = objc_opt_class();
      v15 = objc_msgSend(a4, "URL");
      v26 = 138412546;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      LODWORD(v24) = 22;
      v23 = &v26;
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v16 = v11;
    else
      v16 = v11 & 2;
    if (v16)
    {
      v17 = objc_opt_class();
      v26 = 138412546;
      v27 = v17;
      v28 = 2112;
      v29 = v25;
      LODWORD(v24) = 22;
      v23 = &v26;
LABEL_17:
      v18 = (void *)_os_log_send_and_compose_impl();
      if (v18)
      {
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v26, v24);
        free(v18);
        v23 = (int *)v19;
        SSFileLog();
      }
    }
  }

LABEL_20:
  v20 = objc_msgSend(a4, "URL", a3, v23);
  displayedURL = self->_displayedURL;
  if (displayedURL != (NSURL *)v20)
  {
    v22 = (void *)v20;

    self->_displayedURL = (NSURL *)objc_msgSend(v22, "copy");
  }
}

- (void)webViewManager:(id)a3 didRejectInvalidRequest:(id)a4
{
  id v5;

  if (self->_loadBlock)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SUErrorDomain"), 1, 0);
    -[SUWebViewController _finishLoadWithResult:error:](self, "_finishLoadWithResult:error:", 0);
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURLRequest:", a4);
    -[UIViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:");
  }

}

- (void)webViewManager:(id)a3 willInjectScriptInterface:(id)a4
{
  objc_msgSend(a4, "setScriptWindowContext:", objc_msgSend((id)-[SUWebViewController parentViewController](self, "parentViewController", a3), "scriptWindowContext"));
}

- (void)webViewManagerDidFinishLoad:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  SUWebViewController *v12;
  id v13;
  void *v14;
  CFAbsoluteTime Current;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  CFAbsoluteTime v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[SUWebView _browserView](self->_webView, "_browserView", a3);
  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "webView"), "mainFrame"), "dataSource"), "response");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v5, "statusCode") - 400) <= 0x257)
    -[UIViewController handleStoreFailureWithError:](self, "handleStoreFailureWithError:", SSError());
  -[SUDelayedNavigationItem commitDelayedChanges](self->_delayedNavigationItem, "commitDelayedChanges");
  -[SUDelayedNavigationItem setShouldDelayChanges:](self->_delayedNavigationItem, "setShouldDelayChanges:", 0);
  v6 = -[SUObjectPool vendedObjects](self->_objectPool, "vendedObjects");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_2551D9640))
          objc_msgSend(v11, "setDeferringInterfaceUpdates:", 0);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v8);
  }

  self->_objectPool = 0;
  -[SUWebViewController _reloadUI](self, "_reloadUI");
  -[SUWebViewController _removePlaceholderBackgroundView](self, "_removePlaceholderBackgroundView");
  v12 = self;
  -[SUWebViewController setViewIsReady:](self, "setViewIsReady:", 1);
  -[SUWebViewController _applySavedScrollOffsetIfPossible](self, "_applySavedScrollOffsetIfPossible");
  v13 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
  if (objc_msgSend(v13, "flashesScrollIndicators"))
    objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "flashScrollIndicators");

  v28 = 0;
  if (-[SUWebView getStatusBarStyle:](self->_webView, "getStatusBarStyle:", &v28))
  {
    if (v28)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      objc_msgSend(v14, "setStatusBarStyle:", v28);
    }
    else
    {
      SUSetStatusBarStyleWithBarStyle(-[SUViewController ITunesStoreUIBarStyle](self, "ITunesStoreUIBarStyle"), 0);
    }
  }
  if (self->_performanceMetrics)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setRenderFinishTime:](self->_performanceMetrics, "setRenderFinishTime:");
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v18 &= 2u;
    if (v18)
    {
      v19 = objc_opt_class();
      -[ISURLRequestPerformance renderEndInterval](self->_performanceMetrics, "renderEndInterval");
      v21 = v20;
      v22 = objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performanceMetrics, "URLResponse"), "URL");
      v33 = 138413058;
      v34 = v19;
      v35 = 2048;
      v36 = Current;
      v37 = 2048;
      v38 = v21;
      v39 = 2112;
      v40 = v22;
      LODWORD(v27) = 42;
      v26 = &v33;
      v23 = _os_log_send_and_compose_impl();
      if (v23)
      {
        v24 = (void *)v23;
        v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v33, v27);
        free(v24);
        v26 = (int *)v25;
        SSFileLog();
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v26), "postNotificationName:object:", CFSTR("SUWebViewControllerDidFinishLoad"), self);
  -[SUWebViewController _finishLoadWithResult:error:](self, "_finishLoadWithResult:error:", 1, 0);
}

- (void)webViewManagerDidStartLoad:(id)a3
{
  double Current;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUDelayedNavigationItem setShouldDelayChanges:](self->_delayedNavigationItem, "setShouldDelayChanges:", 1);
  if (self->_performanceMetrics)
  {
    Current = CFAbsoluteTimeGetCurrent();
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
      v8 = objc_opt_class();
      v9 = objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performanceMetrics, "URLResponse"), "URL");
      v15 = 138412802;
      v16 = v8;
      v17 = 2048;
      v18 = Current;
      v19 = 2112;
      v20 = v9;
      LODWORD(v14) = 32;
      v13 = &v15;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v15, v14);
        free(v11);
        v13 = (int *)v12;
        SSFileLog();
      }
    }
    -[ISURLRequestPerformance setRenderBeginTime:](self->_performanceMetrics, "setRenderBeginTime:", Current, v13);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUWebViewControllerDidStartLoad"), self);
}

- (void)webViewManager:(id)a3 webDocumentViewDidSetFrame:(CGRect)a4
{
  -[SUWebViewController _applySavedScrollOffsetIfPossible](self, "_applySavedScrollOffsetIfPossible", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUViewControllerDocumentBoundsDidChangeNotification"), self);
}

- (void)_loadWithURLOperation:(id)a3 completionBlock:(id)a4
{
  id loadBlock;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  _QWORD v17[6];
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  loadBlock = self->_loadBlock;
  if (loadBlock != a4)
  {

    self->_loadBlock = (id)objc_msgSend(a4, "copy");
  }
  v8 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v11 &= 2u;
  if (v11)
  {
    v18 = 138543362;
    v19 = objc_opt_class();
    LODWORD(v16) = 12;
    v15 = &v18;
    v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v18, v16);
      free(v13);
      v15 = (int *)v14;
      SSFileLog();
    }
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SUWebViewController__loadWithURLOperation_completionBlock___block_invoke;
  v17[3] = &unk_24DE7B8D8;
  v17[4] = self;
  v17[5] = v8;
  -[SUWebViewController _getURLRequestForOperation:block:](self, "_getURLRequestForOperation:block:", a3, v17, v15);
}

uint64_t __61__SUWebViewController__loadWithURLOperation_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (v6)
  {
    v13 = 138543618;
    v14 = objc_opt_class();
    v15 = 2112;
    v16 = a2;
    LODWORD(v12) = 22;
    v11 = &v13;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v13, v12);
      free(v8);
      v11 = (int *)v9;
      SSFileLog();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "object", v11), "_loadURLRequest:", a2);
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
  -[SUWebViewManager _requestWebScriptReloadWithContext:](self->_webViewManager, "_requestWebScriptReloadWithContext:", a3);
}

- (void)_setPerformanceMetrics:(id)a3
{
  ISURLRequestPerformance *performanceMetrics;

  performanceMetrics = self->_performanceMetrics;
  if (performanceMetrics != a3)
  {

    self->_performanceMetrics = (ISURLRequestPerformance *)a3;
    -[SUWebViewManager setInitialRequestPerformance:](self->_webViewManager, "setInitialRequestPerformance:", a3);
  }
}

- (void)_addPlaceholderBackgroundView
{
  void *v3;

  v3 = (void *)-[SUWebView _browserView](-[SUWebViewController webView](self, "webView"), "_browserView");
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setNeedsDisplay");
  if (!-[SUWebViewController _placeholderBackgroundView](self, "_placeholderBackgroundView"))
    -[SUWebViewController _reloadPlaceholderBackgroundView](self, "_reloadPlaceholderBackgroundView");
}

- (void)_applySavedScrollOffsetIfPossible
{
  double v3;
  double v4;
  id v5;
  CGFloat x;
  CGFloat y;
  double v8;
  double v9;
  CGPoint v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = -[SUViewControllerContext valueForMetadataKey:](-[SUViewController _restoredContext](self, "_restoredContext"), "valueForMetadataKey:", CFSTR("offset"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "CGPointValue");
  }
  else
  {
    objc_opt_class();
    v8 = v4;
    v9 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v10 = CGPointFromString((NSString *)v5);
    y = v10.y;
    x = v10.x;
  }
  v9 = x;
  v8 = y;
LABEL_6:
  if (v9 != v3 || v8 != v4)
  {
    v12 = (void *)-[SUWebView scrollView](self->_webView, "scrollView");
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "contentOffset");
      if (v14 < 0.00000011920929)
      {
        objc_msgSend(v13, "contentSize");
        if (v8 > 0.0)
        {
          v16 = v15;
          objc_msgSend(v13, "frame");
          if (v8 <= v16 - v17)
          {
            objc_msgSend(v13, "setContentOffset:", v9, v8);
            -[SUViewController resetRestoredContext](self, "resetRestoredContext");
          }
        }
      }
    }
  }
}

- (void)_applyScriptProperties:(id)a3
{
  SUWebView *webView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (a3)
  {
    webView = self->_webView;
    if (webView)
    {
      v6 = (void *)-[SUWebView _scrollView](webView, "_scrollView");
      objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", objc_msgSend(a3, "showsHorizontalScrollIndicator"));
      objc_msgSend(v6, "setShowsVerticalScrollIndicator:", objc_msgSend(a3, "showsVerticalScrollIndicator"));
      objc_msgSend(a3, "scrollContentInsets");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      if (_UIApplicationUsesLegacyUI())
        SUUIScrollViewSetDefaultContentInset(v6, v8, v10, v12, v14);
      -[SUWebView _setAlwaysDispatchesScrollEvents:](self->_webView, "_setAlwaysDispatchesScrollEvents:", objc_msgSend(a3, "alwaysDispatchesScrollEvents"));
      v15 = objc_msgSend(a3, "showsBackgroundShadow");
      v16 = (void *)objc_msgSend(a3, "topExtensionColor");
      if (v16)
      {
        v17 = v16;
        if (!SUGradientColorIsPatternColor(v16, 0))
        {
          objc_msgSend(v6, "setTopExtensionViewColor:", 0);
          -[SUWebView setShowsTopBackgroundShadow:](self->_webView, "setShowsTopBackgroundShadow:", v15);
          -[SUWebView setTopBackgroundColor:](self->_webView, "setTopBackgroundColor:", v17);
          v15 = 0;
          goto LABEL_11;
        }
        v18 = v6;
        v19 = v17;
      }
      else
      {
        v18 = v6;
        v19 = 0;
      }
      objc_msgSend(v18, "setTopExtensionViewColor:", v19);
      -[SUWebView setTopBackgroundColor:](self->_webView, "setTopBackgroundColor:", 0);
LABEL_11:
      objc_msgSend(v6, "_setShowsBackgroundShadow:", v15);
      v20 = (void *)-[SUWebView _browserView](self->_webView, "_browserView");
      objc_msgSend(v20, "setAccessoryEnabled:", objc_msgSend(a3, "shouldShowFormAccessory"));
      objc_msgSend(v20, "setDoubleTapEnabled:", objc_msgSend(a3, "isDoubleTapEnabled"));
      objc_msgSend(v20, "setInputViewObeysDOMFocus:", objc_msgSend(a3, "inputViewObeysDOMFocus"));
      -[SUWebView setScrollingEnabled:](self->_webView, "setScrollingEnabled:", objc_msgSend(a3, "isScrollingDisabled") ^ 1);
    }
  }
  -[SUWebViewController _reloadBackgroundViewPropertiesWithScriptProperties:](self, "_reloadBackgroundViewPropertiesWithScriptProperties:", a3);
}

- (id)_defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
}

- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4
{
  id loadBlock;
  _BOOL8 v6;
  SUWebViewController *v8;
  void (**v9)(id, _BOOL8, id);

  loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    v6 = a3;
    v9 = (void (**)(id, _BOOL8, id))loadBlock;
    v8 = self;

    self->_loadBlock = 0;
    v9[2](v9, v6, a4);

  }
}

- (void)_getURLRequestForOperation:(id)a3 block:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[10];

  v7 = (void *)objc_msgSend(a3, "requestProperties");
  v8 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", objc_msgSend(v7, "URLBagType"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8BB8]), "initWithBagContext:", v8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SUWebViewController__getURLRequestForOperation_block___block_invoke;
  v10[3] = &unk_24DE7B928;
  v10[4] = v9;
  v10[5] = self;
  v10[6] = v7;
  v10[7] = a3;
  v10[8] = v8;
  v10[9] = a4;
  objc_msgSend(v9, "setCompletionBlock:", v10);
  -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v9, 0);

}

uint64_t __56__SUWebViewController__getURLRequestForOperation_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  _QWORD block[6];
  uint64_t v49;
  int v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "success") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v7 &= 2u;
    if (!v7)
      goto LABEL_40;
    v8 = objc_opt_class();
    v9 = objc_msgSend(*(id *)(a1 + 32), "error");
    v50 = 138543618;
    v51 = v8;
    v52 = 2112;
    v53 = v9;
    LODWORD(v47) = 22;
    goto LABEL_13;
  }
  v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "URL");
  v3 = *(void **)(a1 + 48);
  if (v2)
  {
    if (objc_msgSend(v3, "URLBagType") == 3
      && (objc_msgSend((id)objc_msgSend(v2, "host"), "isEqualToString:", CFSTR("localhost")) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "URLBag"), "urlIsTrusted:", v2))
    {
      v4 = objc_msgSend((id)objc_msgSend(v2, "scheme"), "hasPrefix:", CFSTR("https"));
    }
    else
    {
      v4 = 0;
    }
    v14 = objc_msgSend(MEMORY[0x24BE08680], "createBagForSubProfile");
    v49 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE08680], "verifyTrustedURL:bag:", v2, v14), "resultWithError:", &v49) & 1) != 0)
    {
      if (v4)
      {
LABEL_52:
        v10 = objc_msgSend(*(id *)(a1 + 56), "newRequestWithURL:", v2, v46);
        goto LABEL_53;
      }
    }
    else
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v16 = objc_msgSend(v15, "shouldLog");
      if (objc_msgSend(v15, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v15, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v17 &= 2u;
      if (v17)
      {
        v18 = objc_opt_class();
        v50 = 138543362;
        v51 = v18;
        LODWORD(v47) = 12;
        v46 = &v50;
        v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v50, v47);
          free(v20);
          v46 = (int *)v21;
          SSFileLog();
        }
      }
    }
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v46);
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v24 &= 2u;
    if (!v24)
      goto LABEL_40;
    v25 = objc_opt_class();
    v50 = 138543618;
    v51 = v25;
    v52 = 2112;
    v53 = (uint64_t)v2;
    LODWORD(v47) = 22;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v26 = (void *)v10;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v50, v47);
      free(v26);
      goto LABEL_39;
    }
    goto LABEL_53;
  }
  v12 = objc_msgSend(v3, "URLBagURLBlock");
  if (v12)
  {
    v13 = (*(uint64_t (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 64));
    goto LABEL_43;
  }
  v27 = objc_msgSend(*(id *)(a1 + 48), "URLBagKey");
  if (v27)
  {
    v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "URLBag"), "urlForKey:", v27);
LABEL_43:
    v2 = (void *)v13;
    if (v13)
    {
      v28 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v29 = objc_msgSend(v28, "shouldLog");
      if (objc_msgSend(v28, "shouldLogToDisk"))
        v30 = v29 | 2;
      else
        v30 = v29;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v28, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v30 &= 2u;
      if (v30)
      {
        v50 = 138543618;
        v51 = objc_opt_class();
        v52 = 2112;
        v53 = (uint64_t)v2;
        LODWORD(v47) = 22;
        v46 = &v50;
        v31 = _os_log_send_and_compose_impl();
        if (v31)
        {
          v32 = (void *)v31;
          v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v50, v47);
          free(v32);
          v46 = (int *)v33;
          SSFileLog();
        }
      }
      goto LABEL_52;
    }
    goto LABEL_62;
  }
  v36 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v37 = objc_msgSend(v36, "shouldLog");
  if (objc_msgSend(v36, "shouldLogToDisk"))
    v38 = v37 | 2;
  else
    v38 = v37;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v36, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v38 &= 2u;
  if (v38)
  {
    v50 = 138543618;
    v51 = objc_opt_class();
    v52 = 2114;
    v53 = 0;
    LODWORD(v47) = 22;
    v46 = &v50;
    v39 = _os_log_send_and_compose_impl();
    if (v39)
    {
      v40 = (void *)v39;
      v41 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v50, v47);
      free(v40);
      v46 = (int *)v41;
      SSFileLog();
    }
  }
LABEL_62:
  v42 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v46);
  v43 = objc_msgSend(v42, "shouldLog");
  if (objc_msgSend(v42, "shouldLogToDisk"))
    v44 = v43 | 2;
  else
    v44 = v43;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v42, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v44 &= 2u;
  if (!v44)
    goto LABEL_40;
  v45 = objc_opt_class();
  v50 = 138543362;
  v51 = v45;
  LODWORD(v47) = 12;
LABEL_13:
  v10 = _os_log_send_and_compose_impl();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v50, v47);
    free(v11);
LABEL_39:
    SSFileLog();
LABEL_40:
    v10 = 0;
  }
LABEL_53:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUWebViewController__getURLRequestForOperation_block___block_invoke_143;
  block[3] = &unk_24DE7B900;
  v34 = *(_QWORD *)(a1 + 72);
  block[4] = v10;
  block[5] = v34;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
}

void __56__SUWebViewController__getURLRequestForOperation_block___block_invoke_143(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_loadURLRequest:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CFAbsoluteTime Current;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
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
      v13 = 138543874;
      v14 = objc_opt_class();
      v15 = 2048;
      Current = CFAbsoluteTimeGetCurrent();
      v17 = 2112;
      v18 = objc_msgSend(a3, "URL");
      LODWORD(v12) = 32;
      v11 = &v13;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v13, v12);
        free(v9);
        v11 = (int *)v10;
        SSFileLog();
      }
    }
    -[SUWebViewController _prepareToLoadURL:](self, "_prepareToLoadURL:", objc_msgSend(a3, "URL", v11));
    -[SUWebView loadRequest:](-[SUWebViewController webView](self, "webView"), "loadRequest:", a3);
  }
  else
  {
    -[SUWebViewController _finishLoadWithResult:error:](self, "_finishLoadWithResult:error:", 0, SSError());
  }
}

- (id)_placeholderBackgroundView
{
  return (id)objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "viewWithTag:", 1886151271);
}

- (void)_prepareToLoadURL:(id)a3
{
  SUWebView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = -[SUWebViewController webView](self, "webView");
  objc_msgSend((id)-[SUWebView _browserView](v5, "_browserView"), "sendOrientationEventForOrientation:", -[SUViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_msgSend((id)-[SUWebViewController view](self, "view"), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
  if (!objc_msgSend(v15, "shouldLoadProgressively")
    || objc_msgSend(v6, "launchedToTest") && (objc_msgSend(v6, "shouldRecordExtendedLaunchTime") & 1) != 0)
  {
    -[SUWebViewController _removePlaceholderBackgroundView](self, "_removePlaceholderBackgroundView");
    -[SUWebView removeFromSuperview](v5, "removeFromSuperview");
    v16 = 0;
    v17 = 0;
    v14 = 1.0;
  }
  else
  {
    -[SUWebViewController _addPlaceholderBackgroundView](self, "_addPlaceholderBackgroundView");
    objc_msgSend((id)-[SUWebViewController view](self, "view"), "addSubview:", v5);
    v17 = 1;
    v16 = 18;
  }
  -[SUWebView setAutoresizingMask:](v5, "setAutoresizingMask:", v16);
  -[SUWebViewController setViewIsReady:](self, "setViewIsReady:", v17);
  -[SUWebView setFrame:](v5, "setFrame:", v8, v10, v12, v14);

  self->_url = (NSURL *)a3;
  self->_displayedURL = self->_url;
  -[SUWebViewController _reloadObjectPool](self, "_reloadObjectPool");
}

- (void)_reloadBackgroundViewPropertiesWithScriptProperties:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  SUWebView *webView;
  double v10;

  if (-[SUWebViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (objc_msgSend(a3, "usesBlurredBackground"))
      v5 = objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    else
      v5 = objc_msgSend(a3, "backgroundColor");
    v6 = (void *)v5;
    if (v5)
    {
      v7 = (void *)-[SUWebViewController view](self, "view");
      objc_msgSend(v7, "setBackgroundColor:", v6);
      objc_msgSend(v6, "alphaComponent");
      objc_msgSend(v7, "setOpaque:", v8 == 1.0);
      -[SUWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", v6);
      webView = self->_webView;
      objc_msgSend(v6, "alphaComponent");
      -[SUWebView setOpaque:](webView, "setOpaque:", v10 == 1.0);
    }
  }
}

- (void)_reloadObjectPool
{
  SUObjectPool *v3;
  uint64_t v4;
  SUObjectPool *objectPool;
  uint64_t v6;
  SUObjectPool *v7;
  uint64_t v8;

  if (-[SUViewController navigationController](self, "navigationController"))
  {

    v3 = objc_alloc_init(SUObjectPool);
    self->_objectPool = v3;
    v4 = objc_opt_class();
    -[SUObjectPool addObjectsOfClass:count:forClass:](v3, "addObjectsOfClass:count:forClass:", v4, 2, objc_opt_class());
    objectPool = self->_objectPool;
    v6 = objc_opt_class();
    -[SUObjectPool addObjectsOfClass:count:forClass:](objectPool, "addObjectsOfClass:count:forClass:", v6, 1, objc_opt_class());
    v7 = self->_objectPool;
    v8 = objc_opt_class();
    -[SUObjectPool addObjectsOfClass:count:forClass:](v7, "addObjectsOfClass:count:forClass:", v8, 1, objc_opt_class());
  }
}

- (void)_reloadPlaceholderBackgroundView
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(-[SUWebViewController _placeholderBackgroundView](self, "_placeholderBackgroundView"), "removeFromSuperview");
  v8 = (id)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v8, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  -[SUWebViewController addChildViewController:](self, "addChildViewController:", v8);
  v3 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
  if (objc_msgSend(v3, "placeholderBackgroundGradient"))
  {
    v4 = objc_msgSend(v3, "placeholderBackgroundGradient");
LABEL_4:
    objc_msgSend(v8, "setBackgroundGradient:", v4);
    v5 = v8;
    goto LABEL_5;
  }
  v4 = objc_msgSend(-[UIViewController section](self, "section"), "backgroundGradient");
  v5 = v8;
  if (v4)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(v5, "setScriptProperties:", v3);

  v6 = (void *)-[SUWebView _scrollView](-[SUWebViewController webView](self, "webView"), "_scrollView");
  v7 = (id)objc_msgSend(v8, "view");
  objc_msgSend(v8, "setView:", 0);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setTag:", 1886151271);
  objc_msgSend(v6, "insertSubview:atIndex:", v7, 0);

  -[SUWebViewController removeChildViewController:](self, "removeChildViewController:", v8);
}

- (void)_reloadUI
{
  void *v3;
  SUWebView *v4;
  NSString *v5;
  id v6;

  v3 = (void *)-[SUWebViewController view](self, "view");
  v4 = -[SUWebViewController webView](self, "webView");
  -[SUWebView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "bounds");
  -[SUWebView setFrame:](v4, "setFrame:");
  objc_msgSend(v3, "addSubview:", v4);
  v5 = -[SUWebView title](v4, "title");
  if (-[NSString length](v5, "length"))
    -[SUViewController setTitle:changeTabBarItem:](self, "setTitle:changeTabBarItem:", v5, 0);
  v6 = -[SUWebViewController copyScriptProperties](self, "copyScriptProperties");
  -[SUWebViewController _applyScriptProperties:](self, "_applyScriptProperties:", v6);

}

- (void)_removePlaceholderBackgroundView
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "viewWithTag:", 1886151271);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)-[SUWebView _browserView](self->_webView, "_browserView");
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor"));
    objc_msgSend(v5, "setOpaque:", -[SUWebView isOpaque](self->_webView, "isOpaque"));
    objc_msgSend(v5, "setNeedsDisplay");
    objc_msgSend(v4, "removeFromSuperview");
  }
}

- (void)_sendOrientationWillChangeToInterfaceOrientation:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptDictionary *v9;
  id v10;

  v4 = 90;
  v5 = -90;
  v6 = 180;
  if (a3 != 2)
    v6 = 0;
  if (a3 != 4)
    v5 = v6;
  if (a3 != 3)
    v4 = v5;
  if (a3 == 1)
    v7 = 0;
  else
    v7 = v4;
  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v8, CFSTR("orientation"), 0);
  v9 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v10);
  -[SUWebViewManager dispatchEvent:forName:synchronously:](self->_webViewManager, "dispatchEvent:forName:synchronously:", v9, CFSTR("orientationwillchange"), 1);

}

- (void)_setLastKnownOrientation:(int64_t)a3
{
  self->_lastKnownOrientation = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (SUMescalSession)_mescalSession
{
  return self->_mescalSession;
}

- (void)_setMescalSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1168);
}

- (ISURLRequestPerformance)_performanceMetrics
{
  return self->_performanceMetrics;
}

- (BOOL)shouldSignRequests
{
  return self->_shouldSignRequests;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)viewIsReady
{
  return self->_viewIsReady;
}

- (void)setViewIsReady:(BOOL)a3
{
  self->_viewIsReady = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1248);
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1256);
}

@end
