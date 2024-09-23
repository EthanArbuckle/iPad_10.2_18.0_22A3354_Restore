@implementation SUStorePageViewController

- (SUStorePageViewController)init
{
  SUStorePageViewController *v3;
  SUStorePageViewController *v4;
  double v5;
  void *v6;
  objc_super v8;

  if (init_sOnce != -1)
    dispatch_once(&init_sOnce, &__block_literal_global_1);
  v8.receiver = self;
  v8.super_class = (Class)SUStorePageViewController;
  v3 = -[SUViewController init](&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_canMoveToOverlay = 1;
    v3->_shouldAdjustContentOffsets = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"), "timeIntervalSinceReferenceDate");
    v4->_expirationTime = v5;
    v4->_reloadsWhenCacheExpired = 0;
    v4->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    v4->_useWebViewFastPath = (init_sUseWebViewFastPath & 1) == 0;
    v4->_isInBackground = 0;
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__reloadForNetworkTypeChange_, CFSTR("SUNetworkTypeChangedNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__reloadPreviewOverlayVisibility, CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__scriptEventNotification_, CFSTR("SUScriptInterfaceGlobalEventNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__tabConfigurationChanged_, CFSTR("SUTabBarConfigurationChangedNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__documentBoundsChangeNotification_, CFSTR("SUViewControllerDocumentBoundsDidChangeNotification"), 0);
  }
  return v4;
}

uint64_t __33__SUStorePageViewController_init__block_invoke()
{
  uint64_t result;
  void *v1;

  result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
    result = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEC8A80]);
    if ((_DWORD)result)
      init_sUseWebViewFastPath = 1;
  }
  return result;
}

- (SUStorePageViewController)initWithTabBarItem:(id)a3
{
  SUStorePageViewController *v4;
  void *v5;

  v4 = -[SUStorePageViewController init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "underlyingTabBarItem");
    -[SUStorePageViewController setTabBarItem:](v4, "setTabBarItem:", v5);
    -[SUViewController setTitle:](v4, "setTitle:", objc_msgSend(v5, "_internalTitle"));
    -[SSMutableURLRequestProperties setURL:](v4->_urlRequestProperties, "setURL:", objc_msgSend(a3, "rootURL"));
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  SUViewController *activeChildViewController;
  __CFSet *allowedInterfaceOrientations;
  objc_super v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUNetworkTypeChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUScriptInterfaceGlobalEventNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUTabBarConfigurationChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerDocumentBoundsDidChangeNotification"), 0);
  if (self->_activeChildViewController)
  {
    -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:");
    activeChildViewController = self->_activeChildViewController;
  }
  else
  {
    activeChildViewController = 0;
  }

  -[SUViewController removeObserver:forKeyPath:](self->_pendingChildViewController, "removeObserver:forKeyPath:", self, CFSTR("viewIsReady"));
  allowedInterfaceOrientations = self->_allowedInterfaceOrientations;
  if (allowedInterfaceOrientations)
    CFRelease(allowedInterfaceOrientations);
  -[SUMenuViewController setDelegate:](self->_navigationMenuViewController, "setDelegate:", 0);

  -[UIPopoverController setDelegate:](self->_navigationMenuPopover, "setDelegate:", 0);
  -[SUSegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  -[SUViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)canBeResolved
{
  return -[SSMutableURLRequestProperties canBeResolved](self->_urlRequestProperties, "canBeResolved");
}

- (BOOL)decidePolicyForWebNavigationAction:(id)a3 request:(id)a4 decisionListener:(id)a5
{
  return 0;
}

- (void)_finishWebViewLoadWithResult:(BOOL)a3 error:(id)a4
{
  if (!a3)
  {
    if ((ISErrorIsEqual() & 1) != 0)
    {
      self->_useWebViewFastPath = 0;
      -[SUStorePageViewController _fetchPage:](self, "_fetchPage:", 1);
    }
    else
    {
      -[SUStorePageViewController _handleFailureWithError:](self, "_handleFailureWithError:", a4);
    }
  }
}

- (void)enqueueFetchOperation
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  char isKindOfClass;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  _QWORD v27[7];
  _QWORD v28[6];
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUStorePageViewController newFetchOperation](self, "newFetchOperation");
  v4 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke;
  v28[3] = &__block_descriptor_48_e5_v8__0ls32l8s40l8;
  v28[4] = self;
  v28[5] = v3;
  objc_msgSend(v3, "setCompletionBlock:", v28);
  if (self->_useWebViewFastPath)
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
      v8 = objc_opt_class();
      v29 = 138543362;
      v30 = v8;
      LODWORD(v26) = 12;
      v25 = &v29;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v29, v26);
        free(v10);
        v25 = (int *)v11;
        SSFileLog();
      }
    }
    v12 = -[SUStorePageViewController newViewControllerForPage:ofType:returningError:](self, "newViewControllerForPage:ofType:returningError:", 0, 1, 0, v25);
  }
  else
  {
    v12 = 0;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v15 = objc_msgSend(v14, "shouldLog");
  if (objc_msgSend(v14, "shouldLogToDisk"))
    v16 = v15 | 2;
  else
    v16 = v15;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v16 &= 2u;
  if ((isKindOfClass & 1) != 0)
  {
    if (v16)
    {
      v17 = objc_opt_class();
      v29 = 138543362;
      v30 = v17;
      LODWORD(v26) = 12;
      v25 = &v29;
      v18 = _os_log_send_and_compose_impl();
      if (v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v29, v26);
        free(v19);
        v25 = (int *)v20;
        SSFileLog();
      }
    }
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_28;
    v27[3] = &unk_24DE7B6C0;
    v27[4] = v12;
    v27[5] = v3;
    v27[6] = self;
    -[SUStorePageViewController _renderStorePage:withType:viewController:block:](self, "_renderStorePage:withType:viewController:block:", 0, 1, v12, v27, v25);
  }
  else
  {
    if (v16)
    {
      v21 = objc_opt_class();
      v29 = 138543362;
      v30 = v21;
      LODWORD(v26) = 12;
      v25 = &v29;
      v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v29, v26);
        free(v23);
        v25 = (int *)v24;
        SSFileLog();
      }
    }
    -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v3, 1, v25);
  }
  -[SUStorePageViewController _logInternalEventWithOperation:](self, "_logInternalEventWithOperation:", v3);

}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDidPageViewLoad:", objc_msgSend(*(id *)(a1 + 40), "success"));
}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_28(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_2;
  v4[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12ls32l8;
  v4[4] = a1[6];
  return objc_msgSend(v2, "_loadWithURLOperation:completionBlock:", v1, v4);
}

uint64_t __50__SUStorePageViewController_enqueueFetchOperation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWebViewLoadWithResult:error:", a2, a3);
}

- (void)enqueueFetchOperationForPageSection:(id)a3
{
  id v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[SUStorePageViewController newFetchOperation](self, "newFetchOperation");
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    v15 = 138543618;
    v16 = objc_opt_class();
    v17 = 2112;
    v18 = objc_msgSend((id)objc_msgSend(v5, "requestProperties"), "URL");
    LODWORD(v14) = 22;
    v13 = &v15;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v15, v14);
      free(v10);
      v13 = (int *)v11;
      SSFileLog();
    }
  }
  v12 = objc_msgSend(a3, "URLRequestProperties", v13);
  objc_msgSend(v5, "setRequestProperties:", v12);
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 1);
  -[SUStorePageViewController setURLRequestProperties:](self, "setURLRequestProperties:", v12);
  -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v5, 1);

}

- (void)forceLoadingForNeverAppearedPage
{
  -[SUStorePageViewController _reloadForAppearance:](self, "_reloadForAppearance:", 0);
}

- (id)newFetchOperation
{
  id v3;
  SUClientInterface *v4;
  SUStorePageDataProvider *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v3, "setAuthenticationContext:", -[SUStorePageViewController authenticationContext](self, "authenticationContext"));
  objc_msgSend(v3, "setNeedsAuthentication:", -[SUStorePageViewController needsAuthentication](self, "needsAuthentication"));
  objc_msgSend(v3, "setTracksPerformanceMetrics:", SSDebugShouldTrackPerformance());
  v4 = -[SUViewController clientInterface](self, "clientInterface");
  v5 = objc_alloc_init(SUStorePageDataProvider);
  -[SUStorePageDataProvider setClientInterface:](v5, "setClientInterface:", v4);
  objc_msgSend(v3, "setDataProvider:", v5);

  v6 = -[UIViewController section](self, "section");
  v7 = (void *)objc_msgSend(v6, "searchFieldConfiguration");
  if (-[UIViewController isRootViewController](self, "isRootViewController"))
  {
    if (objc_msgSend(v6, "type") == 1)
    {
      if (v7)
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "searchURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType")), "requestParameters");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              -[SSMutableURLRequestProperties setValue:forRequestParameter:](self->_urlRequestProperties, "setValue:forRequestParameter:", objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v10);
        }
      }
    }
  }
  v13 = (void *)-[SSMutableURLRequestProperties mutableCopy](self->_urlRequestProperties, "mutableCopy");
  v14 = -[SUClientInterface userAgent](v4, "userAgent");
  if (v14)
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v14, *MEMORY[0x24BEB2518]);
  v15 = -[SUClientInterface clientIdentifier](v4, "clientIdentifier");
  if (v15)
    objc_msgSend(v13, "setClientIdentifier:", v15);
  if (-[NSString isEqualToString:](-[SUClientInterface hostApplicationIdentifier](v4, "hostApplicationIdentifier"), "isEqualToString:", CFSTR("com.apple.appstored"))&& objc_msgSend((id)objc_msgSend((id)-[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL"), "host"), "isEqualToString:", CFSTR("localhost")))
  {
    objc_msgSend(v13, "setURLBagType:", 3);
  }
  objc_msgSend(v3, "setRequestProperties:", v13);

  return v3;
}

- (id)newPlaceholderViewController
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v3, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  v4 = -[SUStorePageViewController copyScriptProperties](self, "copyScriptProperties");
  v5 = -[UIViewController section](self, "section");
  if (objc_msgSend(v4, "placeholderBackgroundGradient"))
  {
    v6 = objc_msgSend(v4, "placeholderBackgroundGradient");
  }
  else
  {
    v6 = objc_msgSend(v5, "backgroundGradient");
    if (!v6)
      goto LABEL_5;
  }
  objc_msgSend(v3, "setBackgroundGradient:", v6);
LABEL_5:
  if (objc_msgSend(v4, "backgroundColor"))
    v7 = objc_msgSend(v4, "backgroundColor");
  else
    v7 = objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  objc_msgSend((id)objc_msgSend(v3, "view"), "setBackgroundColor:", v7);
  v8 = (void *)objc_msgSend(v3, "loadingView");
  objc_msgSend(v8, "setActivityIndicatorStyle:", objc_msgSend(v4, "loadingIndicatorStyle"));
  v9 = objc_msgSend(v5, "loadingIndicatorColor");
  if (v9)
    objc_msgSend(v8, "setActivityIndicatorColor:", v9);
  v10 = objc_msgSend(v4, "loadingTextColor");
  if (v10 || (v10 = objc_msgSend(v5, "loadingTextColor")) != 0)
    objc_msgSend(v8, "setTextColor:", v10);
  v11 = objc_msgSend(v4, "loadingTextShadowColor", v10);
  if (!v11)
    v11 = objc_msgSend(v5, "loadingTextShadowColor");
  if (objc_msgSend(v4, "loadingTextShadowColor"))
    objc_msgSend(v8, "setTextShadowColor:", v11);

  return v3;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5
{
  void *v7;

  v7 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newViewControllerForPage:ofType:", a3, a4);
  objc_msgSend(v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "_setPerformanceMetrics:", self->_performanceMetrics);
  if (a5)
    *a5 = 0;
  return v7;
}

- (void)handleFailureWithError:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (v7)
  {
    v8 = objc_opt_class();
    v9 = -[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL");
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = a3;
    v20 = 2112;
    v21 = v9;
    LODWORD(v15) = 32;
    v14 = &v16;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v16, v15);
      free(v11);
      v14 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v14);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__sendFailureAfterDialogsFinished_, CFSTR("SUDialogDidFinishNotification"), 0);
  if (!-[SUViewController presentDialogForError:pendUntilVisible:](self, "presentDialogForError:pendUntilVisible:", a3, 1))objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
}

- (BOOL)isSkLoaded
{
  SUViewController *activeChildViewController;

  return !self->_reloadOnAppear
      && -[SUStorePageViewController isViewLoaded](self, "isViewLoaded")
      && !-[SUViewController isSkLoading](self, "isSkLoading")
      && (activeChildViewController = self->_activeChildViewController) != 0
      && -[SUViewController isViewLoaded](activeChildViewController, "isViewLoaded")
      && !-[UIViewController isSkLoaded](self->_activeChildViewController, "isSkLoaded")
      && -[UIViewController viewIsReady](self->_activeChildViewController, "viewIsReady");
}

- (void)reloadWithStorePage:(id)a3 ofType:(int64_t)a4 forURL:(id)a5
{
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD v28[7];
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v9 = -[SUStorePageViewController newViewControllerForPage:ofType:returningError:](self, "newViewControllerForPage:ofType:returningError:", a3, a4, &v29);
  if (v9)
  {
    v10 = v9;
    if (-[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL"))
      -[SSMutableURLRequestProperties setURL:](self->_urlRequestProperties, "setURL:", a5);
    v11 = -[SUStorePageViewController canBeResolved](self, "canBeResolved");
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v14 &= 2u;
    if (v11)
    {
      if (v14)
      {
LABEL_22:
        v22 = objc_opt_class();
        v23 = objc_opt_class();
        v30 = 138543874;
        v31 = v22;
        v32 = 2114;
        v33 = v23;
        v34 = 2112;
        v35 = a5;
        LODWORD(v27) = 32;
        v26 = &v30;
        v24 = (void *)_os_log_send_and_compose_impl();
        if (v24)
        {
          v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v30, v27);
          free(v24);
          v26 = (int *)v25;
          SSFileLog();
        }
      }
    }
    else if (v14)
    {
      goto LABEL_22;
    }
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __63__SUStorePageViewController_reloadWithStorePage_ofType_forURL___block_invoke;
    v28[3] = &unk_24DE7B6E8;
    v28[4] = v10;
    v28[5] = a3;
    v28[6] = a5;
    -[SUStorePageViewController _renderStorePage:withType:viewController:block:](self, "_renderStorePage:withType:viewController:block:", a3, a4, v10, v28, v26);

    return;
  }
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
    v30 = 138543618;
    v31 = v18;
    v32 = 2112;
    v33 = (uint64_t)a5;
    LODWORD(v27) = 22;
    v26 = &v30;
    v19 = _os_log_send_and_compose_impl();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v30, v27);
      free(v20);
      v26 = (int *)v21;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _handleFailureWithError:](self, "_handleFailureWithError:", v29, v26);
}

uint64_t __63__SUStorePageViewController_reloadWithStorePage_ofType_forURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadWithStorePage:forURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)requestWebScriptReloadWithContext:(id)a3
{
  SUViewController *activeChildViewController;
  SUWebScriptReloadContext *pendingWebScriptReloadContext;

  if (!self->_reloadOnAppear
    && -[SUStorePageViewController isViewLoaded](self, "isViewLoaded")
    && !-[SUViewController isSkLoading](self, "isSkLoading")
    && (activeChildViewController = self->_activeChildViewController) != 0
    && -[SUViewController isViewLoaded](activeChildViewController, "isViewLoaded")
    && !-[SUViewController isSkLoading](self->_activeChildViewController, "isSkLoading")
    && -[UIViewController viewIsReady](self->_activeChildViewController, "viewIsReady"))
  {
    -[SUStorePageViewController _requestWebScriptReloadWithContext:](self, "_requestWebScriptReloadWithContext:", a3);
  }
  else
  {
    pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
    if (pendingWebScriptReloadContext != a3)
    {

      self->_pendingWebScriptReloadContext = (SUWebScriptReloadContext *)objc_msgSend(a3, "copy");
    }
  }
}

- (void)resetNavigationItem:(id)a3
{
  objc_msgSend(a3, "resetAllValues");
  -[SUStorePageViewController _reloadSectionButtons](self, "_reloadSectionButtons");
  -[SUViewController _reloadLibraryButton](self, "_reloadLibraryButton");
  -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", -[UIViewController section](self, "section"));
}

- (void)setScriptUserInfo:(id)a3
{
  NSString *scriptUserInfo;

  scriptUserInfo = self->_scriptUserInfo;
  if (scriptUserInfo != a3)
  {

    self->_scriptUserInfo = (NSString *)objc_msgSend(a3, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUStorePageViewControllerScriptUserInfoDidChangeNotification"), self);
  }
}

- (void)setURLRequestProperties:(id)a3
{
  SSMutableURLRequestProperties *urlRequestProperties;

  urlRequestProperties = self->_urlRequestProperties;
  if (urlRequestProperties != a3)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend(a3, "mutableCopy");
  }
}

- (void)showPlaceholderViewController
{
  -[SUStorePageViewController _showPlaceholderViewControllerWithTearDown:](self, "_showPlaceholderViewControllerWithTearDown:", 1);
}

- (SSURLRequestProperties)URLRequestProperties
{
  return (SSURLRequestProperties *)(id)-[SSMutableURLRequestProperties copy](self->_urlRequestProperties, "copy");
}

- (void)setUrlBagKey:(id)a3
{
  -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", a3);
}

- (void)setURLRequest:(id)a3
{

  self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "mutableCopy");
}

- (id)urlBagKey
{
  return (id)-[SSMutableURLRequestProperties URLBagKey](self->_urlRequestProperties, "URLBagKey");
}

- (id)URLRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C68]), "initWithRequestProperties:", self->_urlRequestProperties);
}

- (void)applicationDidEnterBackground
{
  _BOOL4 reloadOnAppear;
  BOOL v4;
  objc_super v5;

  reloadOnAppear = self->_reloadOnAppear;
  v4 = 1;
  if (!reloadOnAppear)
    v4 = -[SUStorePageViewController isSkLoaded](self, "isSkLoaded");
  self->_reloadOnAppear = v4;
  self->_isInBackground = 1;
  -[SUViewController cancelOperations](self, "cancelOperations");
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  -[SUViewController applicationDidEnterBackground](&v5, sel_applicationDidEnterBackground);
}

- (void)applicationWillEnterForeground
{
  objc_super v3;

  self->_isInBackground = 0;
  if (-[SUStorePageViewController _shouldReloadForAppearance](self, "_shouldReloadForAppearance"))
    -[SUStorePageViewController _reloadForAppearance:](self, "_reloadForAppearance:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUStorePageViewController;
  -[SUViewController applicationWillEnterForeground](&v3, sel_applicationWillEnterForeground);
}

- (id)copyArchivableContext
{
  id v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  v3 = -[SUViewController copyArchivableContext](&v7, sel_copyArchivableContext);
  if (v3)
  {
    v4 = -[SUViewController copyArchivableContext](self->_activeChildViewController, "copyArchivableContext");
    if (v4)
    {
      v5 = v4;

      v3 = v5;
    }
  }
  objc_msgSend(v3, "setType:", 1);
  if (!-[SUStorePageViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController displayedURL](self, "displayedURL"), CFSTR("url"));
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController scriptUserInfo](self, "scriptUserInfo"), CFSTR("scriptUserInfo"));
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUStorePageViewController URLRequestProperties](self, "URLRequestProperties"), CFSTR("urlRequestProperties"));
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  SUViewController *pendingChildViewController;
  id result;
  objc_super v5;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    result = -[SUViewController copyDefaultScriptProperties](pendingChildViewController, "copyDefaultScriptProperties");
    if (result)
      return result;
    goto LABEL_5;
  }
  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return -[SUViewController copyDefaultScriptProperties](&v5, sel_copyDefaultScriptProperties);
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  SUViewController *pendingChildViewController;
  id result;
  objc_super v7;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    result = -[UIViewController copyObjectForScriptFromPoolWithClass:](pendingChildViewController, "copyObjectForScriptFromPoolWithClass:", a3);
    if (result)
      return result;
    goto LABEL_5;
  }
  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  return -[UIViewController copyObjectForScriptFromPoolWithClass:](&v7, sel_copyObjectForScriptFromPoolWithClass_, a3);
}

- (id)copyScriptProperties
{
  SUViewController *pendingChildViewController;
  id result;
  objc_super v5;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    result = -[SUViewController copyScriptProperties](pendingChildViewController, "copyScriptProperties");
    if (result)
      return result;
    goto LABEL_5;
  }
  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return -[SUViewController copyScriptProperties](&v5, sel_copyScriptProperties);
}

- (id)copyScriptViewController
{
  SUScriptStorePageViewController *v3;

  v3 = objc_alloc_init(SUScriptStorePageViewController);
  -[SUScriptStorePageViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  -[SUStorePageViewController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  -[SUStorePageViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, a3);
}

- (id)displayedURL
{
  id v3;
  NSArray *v4;
  NSArray *v6;

  v3 = -[UIViewController displayedURL](self->_activeChildViewController, "displayedURL");
  v4 = -[SUPageSectionGroup sections](self->_sectionsGroup, "sections");
  if (v3)
    return v3;
  v6 = v4;
  if (-[NSArray count](v4, "count")
    && (v3 = (id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", self->_activeSectionIndex), "URLRequestProperties"), "URL")) != 0)
  {
    return v3;
  }
  else
  {
    return (id)-[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL");
  }
}

- (CGRect)documentBounds
{
  SUViewController *activeChildViewController;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController && -[UIViewController viewIsReady](activeChildViewController, "viewIsReady"))
  {
    -[UIViewController documentBounds](self->_activeChildViewController, "documentBounds");
  }
  else
  {
    v4 = *MEMORY[0x24BDBF070];
    v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)handleApplicationURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  objc_super v9;

  if (objc_msgSend(a3, "storeURLType") == 1)
  {
    -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", -[UIViewController section](self, "section"));
    -[SUSearchFieldController handleSearchURL:withSourceApplication:sourceURL:](self->_searchFieldController, "handleSearchURL:withSourceApplication:sourceURL:", a3, a4, a5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUStorePageViewController;
    -[SUViewController handleApplicationURL:withSourceApplication:sourceURL:](&v9, sel_handleApplicationURL_withSourceApplication_sourceURL_, a3, a4, a5);
  }
}

- (void)invalidate
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  -[SUViewController invalidate](&v4, sel_invalidate);
  v3 = (id)-[SUNavigationItem title](-[SUViewController navigationItem](self, "navigationItem"), "title");
  -[SUViewController cancelOperations](self, "cancelOperations");
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", 0);

  self->_sectionsGroup = 0;
  if ((-[SUStorePageViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
    -[SUStorePageViewController resetNavigationItem:](self, "resetNavigationItem:", -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface"));
  }
  else
  {
    -[SUStorePageViewController _setActiveChildViewController:shouldTearDown:](self, "_setActiveChildViewController:shouldTearDown:", 0, 1);
  }
  self->_reloadOnAppear = 1;
  -[SUNavigationItem setTitle:](-[SUViewController navigationItem](self, "navigationItem"), "setTitle:", v3);

}

- (void)invalidateForMemoryPurge
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  objc_super v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[SUViewController isVisible](self, "isVisible")
    || -[SUStorePageViewController presentedViewController](self, "presentedViewController")
    || self->_isInBackground)
  {
    v3 = -[SUPageSectionGroup sections](self->_sectionsGroup, "sections");
    v4 = -[NSArray count](v3, "count");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        if (i != self->_activeSectionIndex)
          objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "setUserInfo:", 0);
      }
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (v9)
    {
      v16 = 138412546;
      v17 = objc_opt_class();
      v18 = 2112;
      v19 = -[SUStorePageViewController displayedURL](self, "displayedURL");
      LODWORD(v14) = 22;
      v13 = &v16;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v16, v14);
        free(v11);
        v13 = (int *)v12;
        SSFileLog();
      }
    }
    -[SUStorePageViewController invalidate](self, "invalidate", v13);
  }
  v15.receiver = self;
  v15.super_class = (Class)SUStorePageViewController;
  -[SUViewController invalidateForMemoryPurge](&v15, sel_invalidateForMemoryPurge);
}

- (id)iTunesStoreUI_searchFieldController
{
  return self->_searchFieldController;
}

- (void)iTunesStoreUI_searchFieldControllerDidChange:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3), "userInterfaceIdiom") != 1)
    objc_msgSend((id)-[SUViewController view](self->_activeChildViewController, "view"), "setHidden:", 1);
}

- (BOOL)loadMoreWithURL:(id)a3
{
  int64_t pageType;

  pageType = self->_pageType;
  if (pageType == 1)
  {
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0));
    -[SUStorePageViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", self->_urlRequestProperties);
  }
  return pageType == 1;
}

- (BOOL)_shouldShowPlaceholderForEmptyPage
{
  return objc_msgSend(-[UIViewController section](self, "section"), "type") != 1
      || objc_msgSend(-[UIViewController section](self, "section"), "url") != 0;
}

- (void)loadView
{
  SUViewController *activeChildViewController;
  void *v4;
  SUStorePageView *v5;

  v5 = -[SUStorePageView initWithFrame:]([SUStorePageView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
  -[SUStorePageView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[SUStorePageViewController setView:](self, "setView:", v5);
  -[SUStorePageViewController _reloadBackgroundViewProperties](self, "_reloadBackgroundViewProperties");
  activeChildViewController = self->_activeChildViewController;
  if (!activeChildViewController)
  {
    if (-[SUStorePageViewController canBeResolved](self, "canBeResolved"))
    {
      self->_reloadOnAppear = 1;
    }
    else if (!-[SUStorePageViewController _shouldShowPlaceholderForEmptyPage](self, "_shouldShowPlaceholderForEmptyPage"))
    {
      goto LABEL_7;
    }
    -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
    goto LABEL_7;
  }
  v4 = (void *)-[SUViewController view](activeChildViewController, "view");
  -[SUStorePageViewController _frameForActiveViewController](self, "_frameForActiveViewController");
  objc_msgSend(v4, "setFrame:");
  -[SUStorePageView setContentView:](v5, "setContentView:", -[SUViewController view](self->_activeChildViewController, "view"));
LABEL_7:
  -[SUStorePageViewController _reloadSectionButtons](self, "_reloadSectionButtons");
  -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", -[UIViewController section](self, "section"));

}

- (id)navigationItemForScriptInterface
{
  SUViewController *pendingChildViewController;
  id result;
  objc_super v5;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
LABEL_4:
    result = -[UIViewController navigationItemForScriptInterface](pendingChildViewController, "navigationItemForScriptInterface");
    if (result)
      return result;
    goto LABEL_5;
  }
  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
  {
    pendingChildViewController = self->_activeChildViewController;
    goto LABEL_4;
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  return -[UIViewController navigationItemForScriptInterface](&v5, sel_navigationItemForScriptInterface);
}

- (id)newRotationController
{
  return -[SURotationController initWithViewController:]([SUStorePageRotationController alloc], "initWithViewController:", self);
}

- (BOOL)pushStorePage:(id)a3 withTarget:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  SUTabBarController *v10;
  SUStorePageViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = a5;
  v9 = -[UIViewController overlayViewController](self, "overlayViewController");
  v10 = (SUTabBarController *)-[SUStorePageViewController tabBarController](self, "tabBarController");
  if (!v10)
    v10 = -[SUClientInterface tabBarController](-[SUViewController clientInterface](self, "clientInterface"), "tabBarController");
  -[SUTabBarController dismissOverlayBackgroundViewController](v10, "dismissOverlayBackgroundViewController");
  if (a4 != 2)
    goto LABEL_18;
  if (!self)
    goto LABEL_9;
  v11 = self;
  do
  {
    v12 = -[SUStorePageViewController _popoverController](v11, "_popoverController");
    v13 = -[SUStorePageViewController popoverPresentationController](v11, "popoverPresentationController");
    v14 = -[SUStorePageViewController parentViewController](v11, "parentViewController");
    if (v12 | v13)
      break;
    v11 = (SUStorePageViewController *)v14;
  }
  while (v14);
  if (!(v12 | v13))
  {
LABEL_9:
    if (!v9)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (v12)
  {
    objc_msgSend((id)v12, "dismissPopoverAnimated:", v5);
  }
  else if (v13)
  {
    -[SUStorePageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, 0);
  }
  v15 = (id)-[SUTabBarController transientViewController](v10, "transientViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
LABEL_16:
    v15 = -[UITabBarController selectedNavigationController](v10, "selectedNavigationController");
  if (!v15)
LABEL_18:
    v15 = -[SUViewController navigationController](self, "navigationController");
  objc_msgSend(v15, "pushViewController:animated:", a3, v5);
  return 1;
}

- (BOOL)reloadForSectionsWithGroup:(id)a3
{
  id v3;

  v3 = a3;
  if (!a3 && self->_loadingForSectionChange)
  {
    v3 = (id)-[SUPageSectionGroup copy](self->_sectionsGroup, "copy");
    objc_msgSend(v3, "setDefaultSectionIndex:", self->_activeSectionIndex);
  }
  if (!-[SUPageSectionGroup isEqual:](self->_sectionsGroup, "isEqual:", v3))
  {

    self->_sectionsGroup = (SUPageSectionGroup *)v3;
    self->_activeSectionIndex = objc_msgSend(v3, "defaultSectionIndex");
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_reloadSectionsControlWithGroup:", v3);
  objc_msgSend(-[SUStorePageViewController _activePageSection](self, "_activePageSection"), "setExpirationTime:", self->_expirationTime);
  return 1;
}

- (void)reload
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = -[UIViewController section](self, "section");
  if (v3)
  {
    v4 = v3;
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(v3, "url"), 0));
    -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", objc_msgSend(v4, "urlBagKey"));
  }
  -[SUStorePageViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", self->_urlRequestProperties);
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  -[SUViewController reload](&v5, sel_reload);
}

- (BOOL)reloadWithURLRequestProperties:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v14 = 138543362;
    v15 = objc_opt_class();
    LODWORD(v13) = 12;
    v12 = &v14;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      v12 = (int *)v10;
      SSFileLog();
    }
  }
  return -[SUStorePageViewController _reloadWithURLRequestProperties:completionBlock:](self, "_reloadWithURLRequestProperties:completionBlock:", a3, 0, v12);
}

- (void)restoreArchivableContext:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v5 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("scriptUserInfo"));
  if (v5)
    -[SUStorePageViewController setScriptUserInfo:](self, "setScriptUserInfo:", v5);
  v6 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("urlRequestProperties"));
  if (v6 || (v6 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("urlRequest"))) != 0)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend(v6, "mutableCopy");
  }
  v7 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("url"));
  if (v7)
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, 0));
  v8 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("urlBagKey"));
  if (v8)
    -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", v8);
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewController;
  -[SUViewController restoreArchivableContext:](&v9, sel_restoreArchivableContext_, a3);
}

- (id)setDisplayedSectionGroup:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(a3, "sections");
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[SUStorePageViewController _newSegmentedControlWithItems:](self, "_newSegmentedControlWithItems:", objc_msgSend(v5, "valueForKey:", CFSTR("segmentedControlItem")));
    if (!objc_msgSend(a3, "style") && _UIApplicationUsesLegacyUI())
      objc_msgSend(v6, "setSegmentedControlStyle:", 2);
    objc_msgSend(v6, "setTintColor:", objc_msgSend(a3, "tintColor"));
    objc_msgSend(v6, "setTintStyle:", objc_msgSend(a3, "tintStyle"));
    -[SUStorePageViewController _displaySegmentedControl:](self, "_displaySegmentedControl:", v6);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setSkLoading:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  objc_super v6;

  v3 = a3;
  self->_lastLoadDidFail = 0;
  v5 = self->_loadingForSectionChange && a3;
  self->_loadingForSectionChange = v5;
  -[SUViewController setSkLoading:](self->_activeChildViewController, "setSkLoading:");
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  -[SUViewController setSkLoading:](&v6, sel_setSkLoading_, v3);
}

- (void)setParentViewController:(id)a3
{
  id v5;
  objc_super v6;

  v5 = -[UIViewController section](self, "section");
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  -[SUViewController setParentViewController:](&v6, sel_setParentViewController_, a3);
  if (a3
    && v5 != -[UIViewController section](self, "section")
    && -[SUStorePageViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", -[UIViewController section](self, "section"));
  }

}

- (void)setSection:(id)a3
{
  objc_super v5;

  if (!-[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL"))
    -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(a3, "url"), 0));
  if (!-[SSMutableURLRequestProperties URLBagKey](self->_urlRequestProperties, "URLBagKey"))
    -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", objc_msgSend(a3, "urlBagKey"));
  if (-[SUStorePageViewController isViewLoaded](self, "isViewLoaded"))
    -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", a3);
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  -[SUViewController setSection:](&v5, sel_setSection_, a3);
}

- (void)setScriptProperties:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  -[SUViewController setScriptProperties:](&v4, sel_setScriptProperties_, a3);
  if (-[SUStorePageViewController isViewLoaded](self, "isViewLoaded"))
    -[SUStorePageViewController _reloadBackgroundViewProperties](self, "_reloadBackgroundViewProperties");
  -[SUStorePageViewController _applyPropertiesToViewController:](self, "_applyPropertiesToViewController:", self->_pendingChildViewController);
  -[SUStorePageViewController _applyPropertiesToViewController:](self, "_applyPropertiesToViewController:", self->_activeChildViewController);
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SUStorePageViewController;
  if (-[SUViewController shouldExcludeFromNavigationHistory](&v14, sel_shouldExcludeFromNavigationHistory)
    || -[SUViewController shouldExcludeFromNavigationHistory](self->_activeChildViewController, "shouldExcludeFromNavigationHistory"))
  {
    goto LABEL_3;
  }
  v4 = (void *)objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "expectedClientIdentifiers");
  v3 = objc_msgSend(v4, "count");
  if (!v3)
    return v3;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (!v5)
  {
LABEL_3:
    LOBYTE(v3) = 1;
  }
  else
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (+[SUClientDispatch matchesClientApplication:](SUClientDispatch, "matchesClientApplication:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v3) = 0;
          return v3;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      LOBYTE(v3) = 1;
      if (v6)
        continue;
      break;
    }
  }
  return v3;
}

- (id)storePageProtocol
{
  id result;
  objc_super v4;

  result = -[UIViewController storePageProtocol](self->_activeChildViewController, "storePageProtocol");
  if (!result)
  {
    result = self->_lastValidProtocol;
    if (!result)
    {
      v4.receiver = self;
      v4.super_class = (Class)SUStorePageViewController;
      return -[UIViewController storePageProtocol](&v4, sel_storePageProtocol);
    }
  }
  return result;
}

- (void)storePageProtocolDidChange
{
  SUStorePageProtocol *v3;
  SUStorePageProtocol *v4;
  SUStorePageProtocol *lastValidProtocol;
  objc_super v6;

  v3 = -[SUStorePageViewController storePageProtocol](self, "storePageProtocol");
  v4 = v3;
  if (v3)
  {
    lastValidProtocol = self->_lastValidProtocol;
    if (lastValidProtocol != v3)
    {

      self->_lastValidProtocol = v4;
    }
  }
  -[SUStorePageViewController _verifyStorePageProtocol:](self, "_verifyStorePageProtocol:", v4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_reloadNavigationBar");
  if (-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
  {
    if (-[SUStorePageProtocol shouldDisplayInOverlay](v4, "shouldDisplayInOverlay")
      && !-[UIViewController overlayViewController](self, "overlayViewController")
      && -[SUStorePageViewController canMoveToOverlay](self, "canMoveToOverlay"))
    {
      -[SUStorePageViewController _moveChildViewController:toOverlayForProtocol:](self, "_moveChildViewController:toOverlayForProtocol:", self->_activeChildViewController, v4);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_repositionForChildViewController:", self->_activeChildViewController);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SUStorePageViewController;
  -[SUViewController storePageProtocolDidChange](&v6, sel_storePageProtocolDidChange);
}

- (void)tabBarControllerDidLongPressTabBarItem:(id)a3
{
  SSURLRequestProperties *v4;
  void *v5;

  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded", a3)
    && -[SUViewController isVisibleAndFrontmost](self, "isVisibleAndFrontmost"))
  {
    v4 = -[SUStorePageViewController URLRequestProperties](self, "URLRequestProperties");
    if (-[SSURLRequestProperties URL](v4, "URL"))
    {
      v5 = (void *)-[SSURLRequestProperties copyURLRequest](v4, "copyURLRequest");
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache"), "removeCachedResponseForRequest:", v5);

    }
    -[SUStorePageViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", v4);
  }
}

- (void)tabBarControllerDidReselectTabBarItem:(id)a3
{
  if (self->_lastLoadDidFail && !-[SUStorePageViewController isSkLoaded](self, "isSkLoaded", a3))
  {
    if (-[SUViewController isVisibleAndFrontmost](self, "isVisibleAndFrontmost"))
      -[SUStorePageViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", -[SUStorePageViewController URLRequestProperties](self, "URLRequestProperties"));
  }
}

- (BOOL)viewIsReady
{
  SUViewController *activeChildViewController;

  activeChildViewController = self->_activeChildViewController;
  if (activeChildViewController)
    LOBYTE(activeChildViewController) = -[UIViewController viewIsReady](activeChildViewController, "viewIsReady");
  return (char)activeChildViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (self->_reloadOnAppear
    && -[SUStorePageViewController _shouldFetchAutomatically](self, "_shouldFetchAutomatically"))
  {
    -[SUStorePageViewController _reloadForAppearance:](self, "_reloadForAppearance:", v3);
    self->_reloadOnAppear = -[SUStorePageViewController _sectionIsNetworkConstrained](self, "_sectionIsNetworkConstrained");
  }
  v5.receiver = self;
  v5.super_class = (Class)SUStorePageViewController;
  -[SUViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  -[SUViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[SUViewController isSkLoading](self, "isSkLoading"))
  {
    self->_reloadOnAppear = 1;
    -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
    -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSString *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  if (!+[SUScriptNavigationSimulator transitioning](SUScriptNavigationSimulator, "transitioning"))
  {
    v5 = -[UIViewController section](self, "section");
    -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", v5);
    if (objc_msgSend(v5, "type") == 1)
    {
      if (-[UIViewController isRootViewController](self, "isRootViewController"))
      {
        if (!-[SUStorePageViewController _shouldFetchAutomatically](self, "_shouldFetchAutomatically"))
        {
          v6 = -[UISearchBar text](-[SUSearchFieldController searchBar](self->_searchFieldController, "searchBar"), "text");
          if (-[NSString length](v6, "length"))
          {
            v7 = -[SUSearchFieldController newRequestPropertiesWithSearchTerm:](self->_searchFieldController, "newRequestPropertiesWithSearchTerm:", v6);
            if (objc_msgSend(v7, "URL"))
              -[SSMutableURLRequestProperties setURL:](self->_urlRequestProperties, "setURL:", objc_msgSend(v7, "URL"));
            if (objc_msgSend(v7, "URLBagKey"))
              -[SSMutableURLRequestProperties setURLBagKey:](self->_urlRequestProperties, "setURLBagKey:", objc_msgSend(v7, "URLBagKey"));
            if (objc_msgSend(v7, "requestParameters"))
              -[SSMutableURLRequestProperties setRequestParameters:](self->_urlRequestProperties, "setRequestParameters:", objc_msgSend(v7, "requestParameters"));

          }
        }
      }
    }
    -[SUStorePageViewController _reloadForAppearance:](self, "_reloadForAppearance:", v3);
    -[SUStorePageViewController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
    v8.receiver = self;
    v8.super_class = (Class)SUStorePageViewController;
    -[SUViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!+[SUScriptNavigationSimulator transitioning](SUScriptNavigationSimulator, "transitioning"))
  {
    if (self->_navigationMenuPopover)
      -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController");
    SUButtonActionDeactivateNavigationItem(-[SUViewController navigationItem](self, "navigationItem"));
    -[SUViewController cancelOperations](self, "cancelOperations");
    v5.receiver = self;
    v5.super_class = (Class)SUStorePageViewController;
    -[SUViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v5;
  SUNavigationMenu *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  if (self->_navigationMenuPopover)
  {
    v5 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
    v6 = -[SUNavigationMenuViewController navigationMenu](self->_navigationMenuViewController, "navigationMenu");
    if (-[SUNavigationMenu location](v6, "location"))
    {
      if (-[SUNavigationMenu location](v6, "location") != 1)
        goto LABEL_8;
      v8 = objc_msgSend(v5, "rightBarButtonItem");
    }
    else
    {
      v8 = objc_msgSend(v5, "leftBarButtonItem");
    }
    v7 = v8;
    if (v8)
    {
      -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self->_navigationMenuPopover, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v8, 15, 1);
      goto LABEL_9;
    }
LABEL_8:
    -[SUStorePageViewController _tearDownNavigationMenu](self, "_tearDownNavigationMenu", v7);
  }
LABEL_9:
  v9.receiver = self;
  v9.super_class = (Class)SUStorePageViewController;
  -[SUViewController didRotateFromInterfaceOrientation:](&v9, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageViewController;
  -[SUViewController willAnimateRotationToInterfaceOrientation:duration:](&v4, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v7;

  -[UIPopoverController dismissPopoverAnimated:](self->_navigationMenuPopover, "dismissPopoverAnimated:", 0);
  -[SUSearchFieldController willRotateToInterfaceOrientation:](self->_searchFieldController, "willRotateToInterfaceOrientation:", a3);
  v7.receiver = self;
  v7.super_class = (Class)SUStorePageViewController;
  -[SUViewController willRotateToInterfaceOrientation:duration:](&v7, sel_willRotateToInterfaceOrientation_duration_, a3, a4);
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  objc_super v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (v9)
  {
    v16 = 138543874;
    v17 = objc_opt_class();
    v18 = 2112;
    v19 = a4;
    v20 = 2112;
    v21 = -[SUStorePageViewController displayedURL](self, "displayedURL");
    LODWORD(v14) = 32;
    v13 = &v16;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v16, v14);
      free(v11);
      v13 = (int *)v12;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _handleFailureWithError:](self, "_handleFailureWithError:", a4, v13);
  v15.receiver = self;
  v15.super_class = (Class)SUStorePageViewController;
  -[SUViewController operation:failedWithError:](&v15, sel_operation_failedWithError_, a3, a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[4];
  int v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(a3, "response");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "itunes_expirationInterval"), v8 >= 0.0))
    v9 = v8 + CFAbsoluteTimeGetCurrent();
  else
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"), "timeIntervalSinceReferenceDate");
  self->_expirationTime = v9;

  self->_performanceMetrics = (ISURLRequestPerformance *)(id)objc_msgSend(a3, "performanceMetrics");
  v10 = (void *)objc_msgSend(a3, "dataProvider");
  v11 = objc_msgSend(v10, "outputType");
  v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v15 = v14;
  else
    v15 = v14 & 2;
  if (v15)
  {
    v24 = objc_opt_class();
    v25[0] = CFSTR("statusCode");
    v26[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "statusCode"));
    v25[1] = CFSTR("correlationId");
    v16 = (const __CFString *)objc_msgSend((id)objc_msgSend(v7, "allHeaderFields"), "objectForKeyedSubscript:", CFSTR("X-Apple-Jingle-Correlation-Key"));
    v17 = v16 ? (__CFString *)v16 : CFSTR("<unknown>");
    v26[1] = v17;
    v25[2] = CFSTR("pageType");
    v26[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v25[3] = CFSTR("URL");
    v18 = (const __CFString *)objc_msgSend((id)objc_msgSend(v7, "URL"), "absoluteString");
    v19 = v18 ? (__CFString *)v18 : CFSTR("<unknown>");
    v26[3] = v19;
    v20 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v27 = 138543874;
    v28 = v24;
    v29 = 2114;
    v30 = a3;
    v31 = 2112;
    v32 = v20;
    LODWORD(v23) = 32;
    v21 = _os_log_send_and_compose_impl();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v27, v23);
      free(v22);
      SSFileLog();
    }
  }
  if (v11 == 5)
    -[SUClientInterface _dispatchOnPageResponseWithData:response:](-[SUViewController clientInterface](self, "clientInterface"), "_dispatchOnPageResponseWithData:response:", a4, v7);
  else
    -[SUStorePageViewController reloadWithStorePage:ofType:forURL:](self, "reloadWithStorePage:ofType:forURL:", a4, objc_msgSend(v10, "outputType"), objc_msgSend(v7, "URL"));
}

- (void)setClientContext:(id)a3
{
  -[SUViewController setClientInterface:](self, "setClientInterface:", objc_msgSend(a3, "clientInterface"));
}

- (void)showExternalURL:(id)a3
{
  -[SUStorePageViewController handleApplicationURL:withSourceApplication:sourceURL:](self, "handleApplicationURL:withSourceApplication:sourceURL:", objc_msgSend(a3, "underlyingURL"), objc_msgSend(a3, "referrerApplicationName"), objc_msgSend(a3, "referrerURLString"));
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v5;
  id v6;

  if (self->_navigationMenuViewController == a3)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "navigationMenu"), "menuItems"), "objectAtIndex:", a4);
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(v5, "URL"));
    -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController");
    -[SUStorePageViewController _reloadWithURLRequestProperties:preserveSectionControl:](self, "_reloadWithURLRequestProperties:preserveSectionControl:", v6, 1);

  }
}

- (void)menuViewController:(id)a3 didTapButton:(id)a4
{
  if (self->_navigationMenuViewController == a3)
  {
    -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_performActionForProtocolButton:", a4);
  }
}

- (void)menuViewControllerDidCancel:(id)a3
{
  if (self->_navigationMenuViewController == a3)
    -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController");
}

- (void)hidePreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  void *v9;
  uint64_t v10;
  double v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v6 = a4;
  v9 = (void *)-[SUStorePageViewController view](self, "view");
  v10 = objc_msgSend(a3, "view");
  objc_msgSend(v9, "setPreviewOverlayView:", v10);
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v9, "setPreviewOverlayView:", 0);
  objc_msgSend(v9, "addSubview:", v10);
  v11 = 0.0;
  if (v6)
    +[SUPreviewOverlayViewController defaultAnimationDuration](SUPreviewOverlayViewController, "defaultAnimationDuration", 0.0);
  v12[4] = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke;
  v13[3] = &unk_24DE7AFB8;
  v13[4] = v10;
  v13[5] = self;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke_2;
  v12[3] = &unk_24DE7B710;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v13, v12, v11);
}

uint64_t __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "view"), "layoutSubviews");
}

uint64_t __73__SUStorePageViewController_hidePreviewOverlay_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isShowingPreviewOverlay
{
  return objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "previewOverlayView") != 0;
}

- (BOOL)showPreviewOverlay:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  _QWORD v26[10];
  _QWORD v27[5];
  CGRect v28;

  v6 = a4;
  v8 = (void *)-[SUStorePageViewController view](self, "view");
  v9 = objc_msgSend(v8, "headerView");
  if (v9)
  {
    v10 = (void *)objc_msgSend(a3, "view");
    objc_msgSend(v8, "setPreviewOverlayView:", v10);
    objc_msgSend(v8, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "frame");
    v20 = v19;
    v21 = *MEMORY[0x24BDBEFB0];
    v22 = -v19;
    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = v16;
    v28.size.height = v18;
    Width = CGRectGetWidth(v28);
    objc_msgSend(v10, "setFrame:", v21, v22, Width, v20);
    v24 = 0.0;
    if (v6)
      objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke;
    v27[3] = &unk_24DE7AF90;
    v27[4] = v8;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke_2;
    v26[3] = &unk_24DE7B738;
    *(double *)&v26[6] = v21;
    *(double *)&v26[7] = v22;
    *(double *)&v26[8] = Width;
    *(double *)&v26[9] = v20;
    v26[4] = v8;
    v26[5] = a5;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v27, v26, v24);
  }
  return v9 != 0;
}

uint64_t __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

void __73__SUStorePageViewController_showPreviewOverlay_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "backgroundColor"));
  objc_msgSend(*(id *)(a1 + 32), "setPreviewOverlayView:", v3);

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (self->_navigationMenuPopover == a3)
    -[SUStorePageViewController _tearDownNavigationMenu](self, "_tearDownNavigationMenu");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  SUViewController *pendingChildViewController;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController)
  {
    if (-[UIViewController viewIsReady](pendingChildViewController, "viewIsReady", a3, a4, a5, a6))
      -[SUStorePageViewController _handleViewControllerBecameReady:](self, "_handleViewControllerBecameReady:", self->_pendingChildViewController);
  }
}

- (void)_documentBoundsChangeNotification:(id)a3
{
  SUStorePageViewController *v4;

  v4 = (SUStorePageViewController *)objc_msgSend(a3, "object");
  if (v4 != self)
  {
    if (-[UIViewController isDescendantOfViewController:](v4, "isDescendantOfViewController:", self))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUViewControllerDocumentBoundsDidChangeNotification"), self);
  }
}

- (void)_reloadForNetworkTypeChange:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance", a3), "networkType") >= 1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SUStorePageViewController__reloadForNetworkTypeChange___block_invoke;
    block[3] = &unk_24DE7AF90;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __57__SUStorePageViewController__reloadForNetworkTypeChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_reloadForAppearance:", 0);
  return result;
}

- (void)_scriptEventNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  SUStorePageViewController *v7;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("viewController")), "isDescendantOfViewController:", self)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("payload")), "dataUsingEncoding:", 4);
    if (v5)
      v6 = objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, 0);
    else
      v6 = 0;
    v7 = self;
    -[SUStorePageViewControllerDelegate storePageViewController:didReceiveScriptEvent:payload:](self->_delegate, "storePageViewController:didReceiveScriptEvent:payload:", self, objc_msgSend(v4, "objectForKey:", CFSTR("name")), v6);
  }
}

- (void)_sendFailureAfterDialogsFinished:(id)a3
{
  if (!-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance"), "numberOfPendingDialogs"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, objc_msgSend(a3, "name"), objc_msgSend(a3, "object"));
    -[SUStorePageViewController _finishHandlingFailure](self, "_finishHandlingFailure");
  }
}

- (void)_tabConfigurationChanged:(id)a3
{
  -[SUStorePageViewController _reloadNavigationBar](self, "_reloadNavigationBar", a3);
  -[SUStorePageViewController _reloadSearchFieldWithSection:](self, "_reloadSearchFieldWithSection:", -[UIViewController section](self, "section"));
}

- (void)_navigationButtonAction:(id)a3
{
  uint64_t v4;
  __CFString **v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "tag");
  if (v4 == 1851944034)
  {
    v5 = SUProtocolButtonLocationLeft;
  }
  else
  {
    if (v4 != 1851945570)
      return;
    v5 = SUProtocolButtonLocationRight;
  }
  v6 = objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "navigationButtonForLocation:", *v5);
  if (v6)
    -[SUStorePageViewController _performActionForProtocolButton:](self, "_performActionForProtocolButton:", v6);
}

- (void)_navigationMenuButtonAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUNavigationMenuViewController *v8;
  UIPopoverController *v9;
  SUNavigationController *v10;

  if (self->_navigationMenuViewController)
  {
    -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController", a3);
    return;
  }
  v5 = objc_msgSend(a3, "tag");
  if (v5 == 1852664930)
  {
    v6 = 0;
  }
  else
  {
    if (v5 != 1852666466)
      return;
    v6 = 1;
  }
  v7 = objc_msgSend(-[SUStorePageViewController storePageProtocol](self, "storePageProtocol"), "navigationMenuForLocation:", v6);
  if (v7)
  {
    v8 = -[SUNavigationMenuViewController initWithNavigationMenu:]([SUNavigationMenuViewController alloc], "initWithNavigationMenu:", v7);
    self->_navigationMenuViewController = v8;
    -[SUViewController setClientInterface:](v8, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    -[SUMenuViewController setDelegate:](self->_navigationMenuViewController, "setDelegate:", self);
    v10 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", self->_navigationMenuViewController);
    -[SUNavigationController setClientInterface:](v10, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    {
      v9 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA0]), "initWithContentViewController:", v10);
      self->_navigationMenuPopover = v9;
      -[UIPopoverController _setPopoverBackgroundStyle:](v9, "_setPopoverBackgroundStyle:", 3);
      -[UIPopoverController setDelegate:](self->_navigationMenuPopover, "setDelegate:", self);
      -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self->_navigationMenuPopover, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", a3, 15, 1);
    }
    else
    {
      -[SUStorePageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    }
    -[UISearchBar resignFirstResponder](-[SUSearchFieldController searchBar](self->_searchFieldController, "searchBar"), "resignFirstResponder");

  }
}

- (void)_sectionControlAction:(id)a3
{
  uint64_t v4;
  int64_t v5;
  NSArray *v6;
  id v7;
  CFAbsoluteTime v8;
  void *v9;

  v4 = objc_msgSend(a3, "selectedItemIndex");
  if (self->_activeSectionIndex != v4)
  {
    v5 = v4;
    v6 = -[SUPageSectionGroup sections](self->_sectionsGroup, "sections");
    if (-[SUStorePageViewController isSkLoaded](self, "isSkLoaded"))
    {
      -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", 0);
      -[SUViewController cancelOperations](self, "cancelOperations");
    }
    else
    {
      objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", self->_activeSectionIndex), "setUserInfo:", self->_activeChildViewController);
    }
    -[SUStorePageViewController _dismissNavigationMenuViewController](self, "_dismissNavigationMenuViewController");
    self->_activeSectionIndex = v5;
    -[SUSegmentedControl setSelectedItemIndex:](self->_segmentedControl, "setSelectedItemIndex:", v5);
    v7 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", self->_activeSectionIndex);
    if (objc_msgSend(v7, "userInfo")
      && (-[SUStorePageViewController _expirationTime](self, "_expirationTime"), v8 > CFAbsoluteTimeGetCurrent()))
    {
      v9 = (void *)objc_msgSend(v7, "userInfo");
      objc_msgSend(v9, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v9, "_setExistingTabBarItem:", -[SUStorePageViewController _existingTabBarItem](self, "_existingTabBarItem"));
      -[SUStorePageViewController _setActiveChildViewController:shouldTearDown:](self, "_setActiveChildViewController:shouldTearDown:", v9, 0);
      -[SUStorePageViewController storePageProtocolDidChange](self, "storePageProtocolDidChange");
      -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
    }
    else
    {
      if (!-[UIViewController canDisplaySectionGroup:](self->_activeChildViewController, "canDisplaySectionGroup:", self->_sectionsGroup))
      {
        -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", 0);
        -[SUStorePageViewController _showPlaceholderViewControllerWithTearDown:](self, "_showPlaceholderViewControllerWithTearDown:", 0);
      }
      self->_loadingForSectionChange = 1;
      -[SUStorePageViewController enqueueFetchOperationForPageSection:](self, "enqueueFetchOperationForPageSection:", v7);
    }
  }
}

- (BOOL)_isCacheExpired
{
  CFAbsoluteTime v2;

  -[SUStorePageViewController _expirationTime](self, "_expirationTime");
  return v2 < CFAbsoluteTimeGetCurrent();
}

- (BOOL)_reloadWithURLRequestProperties:(id)a3 completionBlock:(id)a4
{
  id loadBlock;

  loadBlock = self->_loadBlock;
  if (loadBlock != a4)
  {

    self->_loadBlock = (id)objc_msgSend(a4, "copy");
  }
  -[SUStorePageViewController setURLRequestProperties:](self, "setURLRequestProperties:", a3);
  self->_reloadOnAppear = 1;
  return !-[SUStorePageViewController _sectionIsNetworkConstrained](self, "_sectionIsNetworkConstrained")
      && -[SUStorePageViewController _reloadWithURLRequestProperties:preserveSectionControl:](self, "_reloadWithURLRequestProperties:preserveSectionControl:", a3, 0);
}

- (void)_setHeaderView:(id)a3
{
  void *v5;

  v5 = (void *)-[SUStorePageViewController view](self, "view");
  if ((id)objc_msgSend(v5, "headerView") != a3)
  {
    objc_msgSend(v5, "setHeaderView:", a3);
    -[SUStorePageViewController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
  }
}

- (void)_setSegmentedControl:(id)a3
{
  id v5;
  SUSegmentedControl *v6;
  SUSegmentedControl *v7;
  SUSegmentedControl *segmentedControl;
  id v9;
  SUSegmentedControl *v10;
  SUViewController *pendingChildViewController;
  void *v12;

  if (self->_segmentedControl != a3)
  {
    v5 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
    v6 = (SUSegmentedControl *)objc_msgSend(v5, "titleView");
    v7 = v6;
    segmentedControl = self->_segmentedControl;
    if (v6 != segmentedControl)
    {
      if (-[SUSegmentedControl isDescendantOfView:](segmentedControl, "isDescendantOfView:", objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView")))-[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", 0);
      -[SUSegmentedControl removeFromSuperview](self->_segmentedControl, "removeFromSuperview");
      v6 = self->_segmentedControl;
    }
    -[SUSegmentedControl removeTarget:action:forControlEvents:](v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

    self->_segmentedControl = (SUSegmentedControl *)a3;
    v9 = -[UIViewController section](self, "section");
    if (v9)
      -[SUSegmentedControl setTintStyle:](self->_segmentedControl, "setTintStyle:", objc_msgSend(v9, "defaultPNGStyle") == 1);
    if (self->_segmentedControl)
      -[SUStorePageViewController _displaySegmentedControl:](self, "_displaySegmentedControl:");
    if (v7 == segmentedControl)
    {
      v10 = self->_segmentedControl;
      if (!v10
        || -[SUSegmentedControl isDescendantOfView:](v10, "isDescendantOfView:", -[SUStorePageViewController view](self, "view")))
      {
        objc_msgSend(v5, "setTitleView:", 0);
      }
    }
    pendingChildViewController = self->_pendingChildViewController;
    if (!pendingChildViewController)
      pendingChildViewController = self->_activeChildViewController;
    if (-[SUViewController isViewLoaded](pendingChildViewController, "isViewLoaded"))
    {
      v12 = (void *)-[SUViewController view](pendingChildViewController, "view");
      -[SUStorePageViewController _frameForActiveViewController](self, "_frameForActiveViewController");
      objc_msgSend(v12, "setFrame:");
    }
  }
}

- (void)_setUseWebViewFastPath:(BOOL)a3
{
  self->_useWebViewFastPath = a3;
}

- (id)_activeChildViewController
{
  return self->_activeChildViewController;
}

- (id)_activePageSection
{
  NSArray *v3;
  unint64_t activeSectionIndex;

  v3 = -[SUPageSectionGroup sections](self->_sectionsGroup, "sections");
  activeSectionIndex = self->_activeSectionIndex;
  if (activeSectionIndex >= -[NSArray count](v3, "count"))
    return 0;
  else
    return -[NSArray objectAtIndex:](v3, "objectAtIndex:", self->_activeSectionIndex);
}

- (void)_applyPropertiesToViewController:(id)a3
{
  objc_msgSend(a3, "setScriptProperties:", -[SUViewController _cachedScriptProperties](self, "_cachedScriptProperties"));
}

- (void)_dismissNavigationMenuViewController
{
  -[UIViewController dismissAnimated:](self->_navigationMenuViewController, "dismissAnimated:", 1);
  -[SUStorePageViewController _tearDownNavigationMenu](self, "_tearDownNavigationMenu");
}

- (void)_displaySegmentedControl:(id)a3
{
  void *v5;
  SUSegmentedControlBar *v6;

  if (-[SUStorePageViewController _shouldDisplaySegmentedControlInNavigationBar:](self, "_shouldDisplaySegmentedControlInNavigationBar:"))
  {
    if (_UIApplicationUsesLegacyUI())
      objc_msgSend(a3, "setSegmentedControlStyle:", 2);
    objc_msgSend(a3, "sizeToFitUserInterfaceIdiom");
    objc_msgSend(-[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface"), "setTitleView:", a3);
  }
  else
  {
    v5 = (void *)-[SUStorePageViewController view](self, "view");
    if (objc_msgSend(a3, "conformsToProtocol:", &unk_2551D9640))
      objc_msgSend(a3, "setDeferringInterfaceUpdates:", 0);
    objc_msgSend(a3, "setSegmentedControlStyle:", 7);
    v6 = -[SUSegmentedControlBar initWithSegmentedControl:]([SUSegmentedControlBar alloc], "initWithSegmentedControl:", a3);
    -[SUSegmentedControlBar sizeToFit](v6, "sizeToFit");
    -[SUSegmentedControlBar frame](v6, "frame");
    objc_msgSend(v5, "bounds");
    -[SUSegmentedControlBar setFrame:](v6, "setFrame:", 0.0, 0.0);
    -[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", v6);

  }
}

- (double)_expirationTime
{
  id v3;
  double result;

  v3 = -[SUStorePageViewController _activePageSection](self, "_activePageSection");
  if (!v3)
    return self->_expirationTime;
  objc_msgSend(v3, "expirationTime");
  return result;
}

- (void)_fetchPage:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!-[SUStorePageViewController isSkLoaded](self, "isSkLoaded") || v3)
  {
    -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 1);
    -[SUStorePageViewController enqueueFetchOperation](self, "enqueueFetchOperation");
  }
}

- (void)_finishHandlingFailure
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**loadBlock)(id, _QWORD);
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    v14 = 138543362;
    v15 = objc_opt_class();
    LODWORD(v13) = 12;
    v12 = &v14;
    v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v14, v13);
      free(v7);
      v12 = (int *)v8;
      SSFileLog();
    }
  }
  v9 = (void *)-[SUStorePageViewController presentingViewController](self, "presentingViewController", v12);
  v10 = (void *)-[SUStorePageViewController _popoverController](self, "_popoverController");
  if (v10)
  {
    objc_msgSend(v10, "dismissPopoverAnimated:", 1);
  }
  else if (v9)
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  objc_msgSend(-[NSObject responderChainProxy:](self, "responderChainProxy:", &unk_25521C3B8), "storePage:finishedWithSuccess:", self, 0);
  loadBlock = (void (**)(id, _QWORD))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, 0);

    self->_loadBlock = 0;
  }

  self->_pendingWebScriptReloadContext = 0;
}

- (void)_finishSuccessfulLoad
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**loadBlock)(id, uint64_t);
  SUWebScriptReloadContext *pendingWebScriptReloadContext;
  SUWebScriptReloadContext *v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    v15 = 138543362;
    v16 = objc_opt_class();
    LODWORD(v14) = 12;
    v13 = &v15;
    v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v15, v14);
      free(v7);
      v13 = (int *)v8;
      SSFileLog();
    }
  }
  -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", 0, v13);
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  self->_reloadOnAppear = 0;
  -[SUStorePageViewController _applyPropertiesToViewController:](self, "_applyPropertiesToViewController:", self->_activeChildViewController);
  if ((_finishSuccessfulLoad_sDidFinishOnce & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    if (objc_msgSend(v9, "shouldRecordExtendedLaunchTime"))
      objc_msgSend(v9, "finishedTest:extraResults:", objc_msgSend(v9, "_launchTestName"), 0);
    _finishSuccessfulLoad_sDidFinishOnce = 1;
  }
  objc_msgSend(-[NSObject responderChainProxy:](self, "responderChainProxy:", &unk_25521C3B8), "storePage:finishedWithSuccess:", self, 1);
  loadBlock = (void (**)(id, uint64_t))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, 1);

    self->_loadBlock = 0;
  }
  pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
  if (pendingWebScriptReloadContext)
  {
    v12 = pendingWebScriptReloadContext;

    self->_pendingWebScriptReloadContext = 0;
    -[SUStorePageViewController _requestWebScriptReloadWithContext:](self, "_requestWebScriptReloadWithContext:", v12);

  }
}

- (CGRect)_frameForActiveViewController
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v3 = -[SUStorePageViewController view](self, "view");
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "bounds");
    v6 = v5;
    MaxY = v7;
    v10 = v9;
    v12 = v11;
    if (!-[UIViewController canDisplaySectionGroup:](self->_activeChildViewController, "canDisplaySectionGroup:", self->_sectionsGroup)&& -[SUSegmentedControl isDescendantOfView:](self->_segmentedControl, "isDescendantOfView:", v4))
    {
      -[SUSegmentedControl frame](self->_segmentedControl, "frame");
      MaxY = CGRectGetMaxY(v17);
      objc_msgSend(v4, "bounds");
      v12 = CGRectGetHeight(v18) - MaxY;
    }
  }
  else
  {
    v6 = *MEMORY[0x24BDBF090];
    MaxY = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v13 = v6;
  v14 = MaxY;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_handleFailureWithError:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  __int16 v19;
  NSUInteger v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  self->_lastLoadDidFail = 1;
  self->_reloadOnAppear = 1;
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  -[SUStorePageViewController handleFailureWithError:](self, "handleFailureWithError:", a3);
  if (-[NSArray count](-[SUViewController _pendingDialogs](self, "_pendingDialogs"), "count")
    || -[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance"), "numberOfPendingDialogs"))
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
      v17 = 138543874;
      v18 = objc_opt_class();
      v19 = 2048;
      v20 = -[NSArray count](-[SUViewController _pendingDialogs](self, "_pendingDialogs"), "count");
      v21 = 2048;
      v22 = -[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance"), "numberOfPendingDialogs");
      LODWORD(v15) = 32;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v17, v15);
        free(v9);
        SSFileLog();
      }
    }
  }
  else
  {
    v10 = -[SUClientInterface showDialogOnError](-[SUViewController clientInterface](self, "clientInterface"), "showDialogOnError");
    if (a3 && v10)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("GENERIC_ERROR"), &stru_24DE83F60, 0), 0, 1);
      v13 = (void *)MEMORY[0x24BDF67E8];
      v14 = objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DE83F60, 0);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __53__SUStorePageViewController__handleFailureWithError___block_invoke;
      v16[3] = &unk_24DE7B760;
      v16[4] = self;
      objc_msgSend(v12, "addAction:", objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v16));
      -[SUStorePageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    }
    else
    {
      -[SUStorePageViewController _finishHandlingFailure](self, "_finishHandlingFailure");
    }
  }
}

uint64_t __53__SUStorePageViewController__handleFailureWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishHandlingFailure");
}

- (void)_handleViewControllerBecameReady:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "storePageProtocol");
  if (objc_msgSend(v5, "shouldDisplayInOverlay")
    && !-[UIViewController overlayViewController](self, "overlayViewController")
    && -[SUStorePageViewController canMoveToOverlay](self, "canMoveToOverlay"))
  {
    -[SUStorePageViewController _verifyStorePageProtocol:](self, "_verifyStorePageProtocol:", v5);
    -[SUStorePageViewController _moveToRootSectionForChildViewController:protocol:](self, "_moveToRootSectionForChildViewController:protocol:", a3, v5);
    -[SUStorePageViewController _moveChildViewController:toOverlayForProtocol:](self, "_moveChildViewController:toOverlayForProtocol:", a3, v5);
  }
  else
  {
    -[SUStorePageViewController _setActiveChildViewController:shouldTearDown:](self, "_setActiveChildViewController:shouldTearDown:", a3, 1);
    -[SUStorePageViewController _finishSuccessfulLoad](self, "_finishSuccessfulLoad");
    -[SUStorePageViewController storePageProtocolDidChange](self, "storePageProtocolDidChange");
  }
  -[SUStorePageViewController _reloadPreviewOverlayVisibility](self, "_reloadPreviewOverlayVisibility");
}

- (BOOL)_isInTransientViewController
{
  uint64_t v3;

  v3 = objc_msgSend((id)-[SUStorePageViewController tabBarController](self, "tabBarController"), "transientViewController");
  if (v3)
    LOBYTE(v3) = -[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", v3);
  return v3;
}

- (void)_logInternalEventWithOperation:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_didRecordLoggingEvent)
  {
    self->_didRecordLoggingEvent = 1;
    v5 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
    v6 = (void *)objc_msgSend(v5, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0));
    v7 = SSIsInternalBuild();
    v8 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("samplePercentWebInternalLogging"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
    }
    else
    {
      v10 = v7 ? 1.0 : 0.1;
    }
    v11 = drand48();
    if (v11 >= 0.0 && v11 <= 1.0 && v11 <= v10)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v14 &= 2u;
      if (v14)
      {
        v22 = 138412290;
        v23 = objc_opt_class();
        LODWORD(v21) = 12;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v22, v21);
          free(v16);
          SSFileLog();
        }
      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08288]), "initWithSubsystem:category:error:", CFSTR("iTunesStoreUI"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), -[SUClientInterface hostApplicationIdentifier](-[SUViewController clientInterface](self, "clientInterface"), "hostApplicationIdentifier")), 0);
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = (void *)objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL");
      objc_msgSend(v17, "setErrorMessage:", objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), objc_msgSend(v19, "ams_URLByReplaceingQueryParameters:", MEMORY[0x24BDBD1B8])));
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B60]), "initWithURLBag:", v6);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BE08260], "internalInstanceUsingBag:", v20), "enqueueEvent:", v17);

    }
  }
}

- (void)_moveChildViewController:(id)a3 toOverlayForProtocol:(id)a4
{
  SUViewController *v7;
  id v8;
  id v9;
  SUNavigationController *v10;
  SUNavigationController *v11;
  void *v12;
  void *v13;
  SUStorePageViewController *v14;
  id v15;

  if (self->_activeChildViewController == a3)
  {
    objc_msgSend(a3, "storePageCleanupBeforeTearDown");
    -[SUViewController _setExistingNavigationItem:](self->_activeChildViewController, "_setExistingNavigationItem:", 0);
    -[SUViewController _setExistingTabBarItem:](self->_activeChildViewController, "_setExistingTabBarItem:", 0);
    v7 = self->_activeChildViewController;
    self->_activeChildViewController = 0;
  }
  if (objc_msgSend(a3, "isViewLoaded"))
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
  -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:", a3);
  v15 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v15, "_setActiveChildViewController:shouldTearDown:", a3, 1);
  objc_msgSend(v15, "setAuthenticationContext:", -[SUStorePageViewController authenticationContext](self, "authenticationContext"));
  objc_msgSend(v15, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_msgSend(v15, "setNeedsAuthentication:", -[SUStorePageViewController needsAuthentication](self, "needsAuthentication"));
  objc_msgSend(v15, "setURLRequestProperties:", self->_urlRequestProperties);
  objc_msgSend((id)objc_msgSend(v15, "navigationItem"), "mergeValuesFromItem:", objc_msgSend(a3, "navigationItem"));
  objc_msgSend(a3, "_setExistingNavigationItem:", objc_msgSend(v15, "navigationItem"));
  objc_msgSend(a3, "_setExistingTabBarItem:", objc_msgSend(v15, "_existingTabBarItem"));
  v8 = +[SUClientDispatch overlayConfigurationForStorePage:](SUClientDispatch, "overlayConfigurationForStorePage:", v15);
  if (v8)
  {
    v9 = v8;
    v10 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v15);
    -[SUNavigationController setClientInterface:](v10, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    -[UIViewController presentViewController:inOverlayWithConfiguration:](self, "presentViewController:inOverlayWithConfiguration:", v10, v9);
  }
  else
  {
    v10 = objc_alloc_init(SUOverlayViewController);
    -[SUNavigationController setClientInterface:](v10, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    if (-[SUViewController navigationController](self, "navigationController"))
    {
      v11 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v15);
      -[SUNavigationController setClientInterface:](v11, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
      -[SUNavigationController setNavigationBarHidden:](v11, "setNavigationBarHidden:", 1);
      -[SUNavigationController setBackViewController:](v10, "setBackViewController:", v11);

    }
    else
    {
      -[SUNavigationController setBackViewController:](v10, "setBackViewController:", v15);
    }
    -[UIViewController presentOverlayViewController:withTransition:](self, "presentOverlayViewController:withTransition:", v10, 0);
  }

  objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "populateNavigationHistoryWithItems:", objc_msgSend(a4, "navigationHistoryItems"));
  v12 = (void *)objc_msgSend(a4, "overlayBackgroundURLRequestProperties");
  -[SUStorePageViewController _finishSuccessfulLoad](self, "_finishSuccessfulLoad");
  -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
  if (v12)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend(v12, "mutableCopy");
    -[SUStorePageViewController _fetchPage:](self, "_fetchPage:", 0);
  }
  else
  {
    v13 = (void *)-[SUStorePageViewController tabBarController](self, "tabBarController");
    if (-[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", objc_msgSend(v13, "transientViewController")))
    {
      v14 = self;
      objc_msgSend(v13, "setTransientViewController:animated:", 0, 0);
    }
    else if (-[SUStorePageViewController _popoverController](self, "_popoverController"))
    {
      objc_msgSend((id)-[SUStorePageViewController _popoverController](self, "_popoverController"), "dismissPopoverAnimated:", 0);
    }
    else
    {
      -[SUStorePageViewController setURLRequestProperties:](self, "setURLRequestProperties:", 0);
    }
  }

}

- (void)_moveToRootSectionForChildViewController:(id)a3 protocol:(id)a4
{
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  if (-[SUStorePageViewController isExternalRequest](self, "isExternalRequest"))
  {
    if (+[SUClientDispatch isTabBarControllerLoaded](SUClientDispatch, "isTabBarControllerLoaded"))
    {
      v7 = +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController");
      if (-[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", v7))
      {
        v8 = objc_msgSend(a3, "hasDisplayableContent");
        v9 = objc_msgSend(a4, "rootSectionIdentifier");
        if (v9)
        {
          v10 = v9;
          if ((v8 & 1) != 0)
          {
            if (objc_msgSend(a4, "shouldReplaceRootViewController"))
              objc_msgSend(v7, "setTransientViewController:onSectionWithIdentifier:", self, v10);
            else
              objc_msgSend(v7, "pushTransientViewController:onSectionWithIdentifier:", self, v10);
          }
          else
          {
            objc_msgSend(v7, "setSelectedIdentifier:", v9);
          }
        }
        else if ((v8 & 1) == 0)
        {
          objc_msgSend(v7, "selectDefaultSection");
        }
      }
    }
  }
}

- (id)_newBarButtonItemsWithButtonItems:(id)a3 replacingItemWithTag:(int64_t)a4 withButtonItem:(id)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = v7;
  if (a5)
  {
    if (!v7)
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!objc_msgSend(v8, "count"))
      goto LABEL_15;
    v9 = 0;
    while (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v9), "tag") != a4)
    {
      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_15;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v9, a5);
    else
LABEL_15:
      objc_msgSend(v8, "addObject:", a5);
  }
  else if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    while (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v10), "tag") != a4)
    {
      if (++v10 >= (unint64_t)objc_msgSend(v8, "count"))
        return v8;
    }
    objc_msgSend(v8, "removeObjectAtIndex:", v10);
  }
  return v8;
}

- (id)_newSegmentedControlWithItems:(id)a3
{
  id v5;

  v5 = -[SUStorePageViewController copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_msgSend(v5, "setItems:", a3);
  return v5;
}

- (void)_performActionForProtocolButton:(id)a3
{
  void *v5;
  int v6;
  SUAccountViewController *v7;
  id v8;

  v5 = (void *)objc_msgSend(a3, "buttonTarget");
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("external")))
  {
    SUOpenExternalURL(objc_msgSend(a3, "URL"), -[SUViewController clientInterface](self, "clientInterface"));
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("self")))
    {
      v8 = (id)-[SSMutableURLRequestProperties mutableCopy](self->_urlRequestProperties, "mutableCopy");
      objc_msgSend(v8, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(a3, "URL"), 0));
      -[SUStorePageViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:", v8);
    }
    else
    {
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("account"));
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(a3, "URL"));
      if (v6)
      {
        v7 = objc_alloc_init(SUAccountViewController);
        -[SUViewController setClientInterface:](v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
        -[SUStorePageViewController setURLRequestProperties:](v7, "setURLRequestProperties:", v8);
        +[SUClientDispatch enterAccountFlowWithViewController:animated:](SUClientDispatch, "enterAccountFlowWithViewController:animated:", v7, 1);
      }
      else
      {
        v7 = (SUAccountViewController *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", -[UIViewController section](self, "section"));
        -[SUViewController setClientInterface:](v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
        -[SUStorePageViewController setURLRequestProperties:](v7, "setURLRequestProperties:", v8);
        -[SUStorePageViewController pushStorePage:withTarget:animated:](self, "pushStorePage:withTarget:animated:", v7, 0, 1);
      }

    }
  }
}

- (void)_reloadBackgroundViewProperties
{
  void *v3;
  _UIBackdropView *backdropView;
  void *v5;
  double v6;
  id v7;

  v3 = (void *)-[SUStorePageViewController view](self, "view");
  v7 = -[SUStorePageViewController copyScriptProperties](self, "copyScriptProperties");
  if (objc_msgSend(v7, "usesBlurredBackground"))
  {
    backdropView = self->_backdropView;
    if (!backdropView)
    {
      backdropView = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2020);
      self->_backdropView = backdropView;
    }
    objc_msgSend(v3, "setBackdropView:", backdropView);
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    objc_msgSend(v3, "setOpaque:", 0);
  }
  else
  {
    v5 = (void *)objc_msgSend(v7, "backgroundColor");
    if (!v5)
      v5 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    objc_msgSend(v3, "setBackgroundColor:", v5);
    objc_msgSend(v5, "alphaComponent");
    objc_msgSend(v3, "setOpaque:", v6 == 1.0);
    objc_msgSend(v3, "setBackdropView:", 0);

    self->_backdropView = 0;
  }

}

- (void)_reloadForAppearance:(BOOL)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  SUStorePageViewController *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  int *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUStorePageViewController _reloadsWhenCacheExpired](self, "_reloadsWhenCacheExpired", a3);
  if (-[SUStorePageViewController presentedViewController](self, "presentedViewController"))
  {
    v4 = 0;
  }
  else if (!-[UIViewController overlayViewController](self, "overlayViewController")
         && -[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"))
  {
    v4 = 0;
  }
  v5 = -[SUStorePageViewController _sectionIsNetworkConstrained](self, "_sectionIsNetworkConstrained");
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newNetworkLockoutViewControllerWithSection:", -[UIViewController section](self, "section"));
    objc_msgSend(v7, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    objc_msgSend(v7, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
    -[SUStorePageViewController _setActiveChildViewController:shouldTearDown:](self, "_setActiveChildViewController:shouldTearDown:", v7, 1);

    goto LABEL_28;
  }
  if (-[UIViewController viewIsReady](self->_activeChildViewController, "viewIsReady") && !self->_reloadOnAppear)
  {
    if (v4 && -[SUStorePageViewController _isCacheExpired](self, "_isCacheExpired"))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v12 &= 2u;
      if (v12)
      {
        v19 = 138412546;
        v20 = objc_opt_class();
        v21 = 2112;
        v22 = -[SUStorePageViewController displayedURL](self, "displayedURL");
        LODWORD(v18) = 22;
        v17 = &v19;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v19, v18);
          free(v14);
          v17 = (int *)v15;
          SSFileLog();
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture", v17), "timeIntervalSinceReferenceDate");
      self->_expirationTime = v16;
      objc_msgSend(-[SUStorePageViewController _activePageSection](self, "_activePageSection"), "setExpirationTime:", self->_expirationTime);
      -[SSMutableURLRequestProperties setURLs:](self->_urlRequestProperties, "setURLs:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", -[SUStorePageViewController displayedURL](self, "displayedURL"), 0));
      -[SUStorePageViewController _reloadWithURLRequestProperties:preserveSectionControl:](self, "_reloadWithURLRequestProperties:preserveSectionControl:", self->_urlRequestProperties, 1);
      if (self->_reloadOnAppear)
      {
        v8 = self;
        v9 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
    if (-[SUStorePageViewController _shouldFetchAutomatically](self, "_shouldFetchAutomatically")
      && -[SUStorePageViewController canBeResolved](self, "canBeResolved"))
    {
      -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 1);
      v8 = self;
      v9 = 1;
LABEL_13:
      -[SUStorePageViewController _fetchPage:](v8, "_fetchPage:", v9);
      goto LABEL_28;
    }
    if (-[SUStorePageViewController _shouldShowPlaceholderForEmptyPage](self, "_shouldShowPlaceholderForEmptyPage"))
      -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
  }
LABEL_28:
  self->_reloadOnAppear = v6;
}

- (void)_reloadNavigationBar
{
  SUSegmentedControl *segmentedControl;
  SUSegmentedControl *v4;

  -[SUStorePageViewController _reloadNavigationButtons](self, "_reloadNavigationButtons");
  -[SUStorePageViewController _reloadNavigationMenus](self, "_reloadNavigationMenus");
  if (self->_sectionsGroup)
  {
    -[SUStorePageViewController _reloadSectionsControlWithGroup:](self, "_reloadSectionsControlWithGroup:");
  }
  else
  {
    segmentedControl = self->_segmentedControl;
    if (segmentedControl)
    {
      v4 = segmentedControl;
      -[SUStorePageViewController _setSegmentedControl:](self, "_setSegmentedControl:", 0);
      -[SUStorePageViewController _setSegmentedControl:](self, "_setSegmentedControl:", v4);

    }
  }
}

- (void)_reloadNavigationButtons
{
  id v3;
  SUBarButtonItem *v4;
  void *v5;
  SUUIAppearance *v6;
  SUBarButtonItem *v7;

  v3 = -[SUStorePageViewController storePageProtocol](self, "storePageProtocol");
  v4 = (SUBarButtonItem *)objc_msgSend(v3, "navigationButtonForLocation:", CFSTR("left"));
  if (v4)
    v4 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", -[SUBarButtonItem buttonTitle](v4, "buttonTitle"), 0, self, sel__navigationButtonAction_);
  v5 = (void *)objc_msgSend(v3, "navigationButtonForLocation:", CFSTR("right"));
  if (v5)
    v7 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", objc_msgSend(v5, "buttonTitle"), 0, self, sel__navigationButtonAction_);
  else
    v7 = 0;
  v6 = -[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance");
  -[SUUIAppearance styleBarButtonItem:](v6, "styleBarButtonItem:", v4);
  -[SUUIAppearance styleBarButtonItem:](v6, "styleBarButtonItem:", v7);
  -[SUStorePageViewController _setLeftNavigationItem:forTag:](self, "_setLeftNavigationItem:forTag:", v4, 1851944034);
  -[SUStorePageViewController _setRightNavigationItem:forTag:](self, "_setRightNavigationItem:forTag:", v7, 1851945570);

}

- (void)_reloadNavigationMenus
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SUBarButtonItem *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SUUIAppearance *v11;
  SUBarButtonItem *v12;

  v3 = -[SUStorePageViewController storePageProtocol](self, "storePageProtocol");
  v4 = (void *)objc_msgSend(v3, "navigationMenuForLocation:", 0);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "closedTitle");
    if (!v6)
      v6 = objc_msgSend(v5, "openTitle");
    v7 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", v6, 0, self, sel__navigationMenuButtonAction_);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(v3, "navigationMenuForLocation:", 1);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "closedTitle");
    if (!v10)
      v10 = objc_msgSend(v9, "openTitle");
    v12 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", v10, 0, self, sel__navigationMenuButtonAction_);
  }
  else
  {
    v12 = 0;
  }
  v11 = -[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance");
  -[SUUIAppearance styleBarButtonItem:](v11, "styleBarButtonItem:", v7);
  -[SUUIAppearance styleBarButtonItem:](v11, "styleBarButtonItem:", v12);
  -[SUStorePageViewController _setLeftNavigationItem:forTag:](self, "_setLeftNavigationItem:forTag:", v7, 1852664930);
  -[SUStorePageViewController _setRightNavigationItem:forTag:](self, "_setRightNavigationItem:forTag:", v12, 1852666466);

}

- (void)_reloadPreviewOverlayVisibility
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    +[SUPreviewOverlayViewController offsetScrollView:forViewController:](SUPreviewOverlayViewController, "offsetScrollView:forViewController:", SUViewFirstUIScrollView(-[SUViewController view](self->_activeChildViewController, "view")), self->_activeChildViewController);
}

- (void)_reloadSearchFieldWithSection:(id)a3
{
  SUNavigationItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  UISearchBar *v12;
  id v13;
  void *v14;
  SUSearchFieldController *searchFieldController;
  UISearchBar *v18;
  SUSearchFieldController *v19;
  SUSearchFieldController *v20;
  UISearchBar *v21;
  char v22;
  SUBarButtonItem *v23;
  uint64_t v24;
  _QWORD block[5];

  v5 = -[SUViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_msgSend(a3, "searchFieldConfiguration");
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "location");
    v9 = -[SUStorePageViewController _shouldDisplayControlsInNavigationBar](self, "_shouldDisplayControlsInNavigationBar");
    v10 = v8 != 2
       && (-[UIViewController isRootViewController](self, "isRootViewController")
        || (objc_msgSend(v7, "isRootViewOnly") & 1) == 0)
       && (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom")
        || !-[UIViewController isDescendantOfViewController:](self, "isDescendantOfViewController:", objc_msgSend((id)-[SUStorePageViewController tabBarController](self, "tabBarController"), "transientViewController")))&& -[UIViewController overlayViewController](self, "overlayViewController") == 0;
  }
  else
  {
    v9 = -[SUStorePageViewController _shouldDisplayControlsInNavigationBar](self, "_shouldDisplayControlsInNavigationBar");
    v10 = 0;
    v8 = 2;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    v11 = v9;
  else
    v11 = v10 && v9;
  v12 = -[SUSearchFieldController searchBar](self->_searchFieldController, "searchBar", v11 ^ 1u);
  v13 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
  v14 = v13;
  if (!v10 || !v9 || v8 != 1)
  {
    if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", objc_msgSend((id)objc_msgSend(v13, "leftBarButtonItem"), "customView")))objc_msgSend(v14, "setLeftBarButtonItem:", 0);
    if (!v8 && v10 && v9)
      goto LABEL_63;
  }
  if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", objc_msgSend(v14, "titleView")))
    objc_msgSend(v14, "setTitleView:", 0);
  if (v8 != 3 || !v10 || !v9)
  {
LABEL_63:
    if (-[UISearchBar isDescendantOfView:](v12, "isDescendantOfView:", objc_msgSend((id)objc_msgSend(v14, "rightBarButtonItem"), "customView")))objc_msgSend(v14, "setRightBarButtonItem:", 0);
  }
  if ((!v10 || v9)
    && -[SUStorePageViewController isViewLoaded](self, "isViewLoaded")
    && v12 == (UISearchBar *)objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView"))
  {
    -[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", 0);
  }
  searchFieldController = self->_searchFieldController;
  if (searchFieldController
    && -[SUSearchFieldController searchFieldStyle](searchFieldController, "searchFieldStyle") != v24)
  {
    v18 = (UISearchBar *)objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "headerView");
    if (v18 == -[SUSearchFieldController searchBar](self->_searchFieldController, "searchBar"))
      -[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", 0);

    self->_searchFieldController = 0;
  }
  v19 = self->_searchFieldController;
  if (v7)
  {
    if (!v19)
    {
      v19 = -[SUSearchFieldController initWithContentsController:clientInterface:style:]([SUSearchFieldController alloc], "initWithContentsController:clientInterface:style:", self, -[SUViewController clientInterface](self, "clientInterface"), v24);
      self->_searchFieldController = v19;
    }
    -[SUSearchFieldController setSearchFieldConfiguration:](v19, "setSearchFieldConfiguration:", v7);
    v20 = self->_searchFieldController;
  }
  else
  {

    v20 = 0;
    self->_searchFieldController = 0;
  }
  v21 = -[SUSearchFieldController searchBar](v20, "searchBar");
  -[UISearchBar setAlpha:](v21, "setAlpha:", 1.0);
  v22 = !v10;
  if (!v21)
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
      {
        if ((_UIApplicationUsesLegacyUI() & 1) == 0)
          -[UISearchBar setBarStyle:](v21, "setBarStyle:", -[SUViewController ITunesStoreUIBarStyle](self, "ITunesStoreUIBarStyle") == 2);
        v23 = -[SUBarButtonItem initWithCustomView:]([SUBarButtonItem alloc], "initWithCustomView:", v21);
        -[SUUIAppearance styleBarButtonItem:](-[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance"), "styleBarButtonItem:", v23);
        switch(v8)
        {
          case 3:
            objc_msgSend(v14, "setRightBarButtonItem:", v23);
            break;
          case 1:
            objc_msgSend(v14, "setLeftBarButtonItem:", v23);
            break;
          case 0:
            objc_msgSend(v14, "setTitleView:", v21);
            break;
        }

      }
    }
    else if (-[SUStorePageViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUStorePageViewController _setHeaderView:](self, "_setHeaderView:", v21);
    }
  }
  if (v5 != -[SUViewController navigationItem](self, "navigationItem"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SUStorePageViewController__reloadSearchFieldWithSection___block_invoke;
    block[3] = &unk_24DE7AF90;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __59__SUStorePageViewController__reloadSearchFieldWithSection___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "setViewControllers:animated:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "viewControllers"), 0);
}

- (void)_reloadSectionButtons
{
  id v3;
  void *v4;
  id v5;
  SUUIAppearance *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SUBarButtonItem *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SUBarButtonItem *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = -[UIViewController section](self, "section");
  if (v3)
  {
    v4 = v3;
    if (-[UIViewController isRootViewController](self, "isRootViewController"))
    {
      if (!-[SUStorePageViewController _isInTransientViewController](self, "_isInTransientViewController"))
      {
        v5 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
        v6 = -[SUClientInterface appearance](-[SUViewController clientInterface](self, "clientInterface"), "appearance");
        v7 = (void *)objc_msgSend(v4, "leftSectionButtons");
        if (objc_msgSend(v7, "count"))
        {
          v23 = v5;
          v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v29;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v29 != v11)
                  objc_enumerationMutation(v7);
                v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
                v14 = objc_alloc_init(SUBarButtonItem);
                objc_msgSend(v13, "applyToBarButtonItem:", v14);
                -[SUUIAppearance styleBarButtonItem:](v6, "styleBarButtonItem:", v14);
                SUButtonActionAttachToBarButtonItem(v14);
                objc_msgSend(v8, "addObject:", v14);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            }
            while (v10);
          }
          v5 = v23;
          objc_msgSend(v23, "setLeftBarButtonItems:", v8);

        }
        v15 = (void *)objc_msgSend(v4, "rightSectionButtons");
        if (objc_msgSend(v15, "count"))
        {
          v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v15);
                v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v20);
                v22 = objc_alloc_init(SUBarButtonItem);
                objc_msgSend(v21, "applyToBarButtonItem:", v22);
                -[SUUIAppearance styleBarButtonItem:](v6, "styleBarButtonItem:", v22);
                SUButtonActionAttachToBarButtonItem(v22);
                objc_msgSend(v16, "addObject:", v22);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v18);
          }
          objc_msgSend(v5, "setRightBarButtonItems:", v16);

        }
      }
    }
  }
}

- (void)_reloadSectionsControlWithGroup:(id)a3
{
  SUViewController *pendingChildViewController;
  SUStorePageViewController *v6;
  id v7;

  pendingChildViewController = self->_pendingChildViewController;
  if (!pendingChildViewController)
    pendingChildViewController = self->_activeChildViewController;
  if (-[UIViewController canDisplaySectionGroup:](pendingChildViewController, "canDisplaySectionGroup:", a3))
  {
    v6 = (SUStorePageViewController *)pendingChildViewController;
  }
  else
  {
    -[UIViewController setDisplayedSectionGroup:](pendingChildViewController, "setDisplayedSectionGroup:", 0);
    v6 = self;
  }
  v7 = -[SUStorePageViewController setDisplayedSectionGroup:](v6, "setDisplayedSectionGroup:", a3);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__sectionControlAction_, 4096);
  objc_msgSend(v7, "setSelectedItemIndex:", self->_activeSectionIndex);
  -[SUStorePageViewController _setSegmentedControl:](self, "_setSegmentedControl:", v7);
}

- (BOOL)_reloadWithURLRequestProperties:(id)a3 preserveSectionControl:(BOOL)a4
{
  _BOOL4 v4;
  BOOL v7;

  v4 = a4;
  -[SUViewController cancelOperations](self, "cancelOperations");
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 0);
  -[SUStorePageViewController setURLRequestProperties:](self, "setURLRequestProperties:", a3);
  if (v4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_reloadSectionsControlWithGroup:", self->_sectionsGroup);
  else
    -[SUStorePageViewController reloadForSectionsWithGroup:](self, "reloadForSectionsWithGroup:", 0);
  -[SUStorePageViewController showPlaceholderViewController](self, "showPlaceholderViewController");
  -[SUStorePageViewController resetNavigationItem:](self, "resetNavigationItem:", -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface"));
  -[SUViewController resetRestoredContext](self, "resetRestoredContext");
  if (-[SUStorePageViewController _shouldReloadForAppearance](self, "_shouldReloadForAppearance"))
  {
    -[SUStorePageViewController _fetchPage:](self, "_fetchPage:", 0);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  self->_reloadOnAppear = v7;
  return 1;
}

- (void)_renderStorePage:(id)a3 withType:(int64_t)a4 viewController:(id)a5 block:(id)a6
{
  SUNavigationItem *v10;
  void *v11;
  char v12;

  -[SUStorePageViewController addChildViewController:](self, "addChildViewController:", a5);
  -[SUStorePageViewController _applyPropertiesToViewController:](self, "_applyPropertiesToViewController:", a5);
  v10 = -[SUViewController navigationItem](self, "navigationItem");
  -[UINavigationItem mergeValuesFromItem:](v10, "mergeValuesFromItem:", objc_msgSend(a5, "navigationItem"));
  objc_msgSend(a5, "_setExistingNavigationItem:", v10);
  objc_msgSend(a5, "_setExistingTabBarItem:", -[SUStorePageViewController _existingTabBarItem](self, "_existingTabBarItem"));
  v11 = (void *)objc_msgSend(a5, "view");
  objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "bounds");
  objc_msgSend(v11, "setFrame:");
  if (-[SUViewController _restoredContext](self, "_restoredContext"))
  {
    objc_msgSend(a5, "restoreArchivableContext:", -[SUViewController _restoredContext](self, "_restoredContext"));
    -[SUViewController resetRestoredContext](self, "resetRestoredContext");
  }
  -[SUStorePageViewController setSkLoading:](self, "setSkLoading:", 1);
  (*((void (**)(id))a6 + 2))(a6);
  v12 = objc_msgSend(a5, "viewIsReady");
  self->_pageType = a4;
  if ((v12 & 1) != 0)
    -[SUStorePageViewController _handleViewControllerBecameReady:](self, "_handleViewControllerBecameReady:", a5);
  else
    -[SUStorePageViewController _setPendingChildViewController:](self, "_setPendingChildViewController:", a5);
}

- (void)_repositionForChildViewController:(id)a3
{
  void *v5;
  id v6;
  SUClientInterface *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  SUStorePageViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[SUStorePageViewController isExternalRequest](self, "isExternalRequest"))
  {
    v5 = (void *)objc_msgSend(a3, "storePageProtocol");
    -[SUStorePageViewController _moveToRootSectionForChildViewController:protocol:](self, "_moveToRootSectionForChildViewController:protocol:", a3, v5);
    if (objc_msgSend(a3, "hasDisplayableContent"))
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = -[SUViewController clientInterface](self, "clientInterface");
      v8 = -[SUViewController viewControllerFactory](self, "viewControllerFactory");
      v18 = self;
      v9 = -[UIViewController section](self, "section");
      v10 = (void *)objc_msgSend(v5, "navigationHistoryItems");
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
            v16 = (void *)objc_msgSend(v8, "newStorePageViewControllerWithSection:", v9);
            objc_msgSend(v16, "setClientInterface:", v7);
            objc_msgSend(v16, "setTitle:", objc_msgSend(v15, "title"));
            objc_msgSend(v16, "setURLRequestProperties:", objc_msgSend(v15, "URLRequestProperties"));
            objc_msgSend(v6, "addObject:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
      if (objc_msgSend(v6, "count"))
      {
        v17 = -[SUViewController navigationController](v18, "navigationController");
        objc_msgSend(v6, "addObject:", objc_msgSend(v17, "topViewController"));
        objc_msgSend(v17, "setViewControllers:animated:", v6, 0);
      }

    }
  }
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUViewController _requestWebScriptReloadWithContext:](self->_activeChildViewController, "_requestWebScriptReloadWithContext:", a3);
  else
    NSLog(CFSTR("Requesting a web script reload is only supported for HTML store pages. Unexpected content inside of %@."), self->_activeChildViewController);
}

- (BOOL)_sectionIsNetworkConstrained
{
  id v2;
  uint64_t v3;

  v2 = -[UIViewController section](self, "section");
  if (v2)
  {
    v3 = objc_msgSend(v2, "minimumNetworkType");
    LOBYTE(v2) = v3 > objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType");
  }
  return (char)v2;
}

- (void)_setActiveChildViewController:(id)a3 shouldTearDown:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  SUViewController *activeChildViewController;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (self->_activeChildViewController != a3)
  {
    v4 = a4;
    v7 = -[SUStorePageViewController isViewLoaded](self, "isViewLoaded");
    activeChildViewController = self->_activeChildViewController;
    if (!activeChildViewController)
      goto LABEL_10;
    if (v7)
    {
      -[SUViewController viewWillDisappear:](activeChildViewController, "viewWillDisappear:", 0);
      activeChildViewController = self->_activeChildViewController;
    }
    if (v4)
    {
      -[UIViewController storePageCleanupBeforeTearDown](activeChildViewController, "storePageCleanupBeforeTearDown");
      activeChildViewController = self->_activeChildViewController;
    }
    -[SUViewController _setExistingNavigationItem:](activeChildViewController, "_setExistingNavigationItem:", 0);
    -[SUViewController _setExistingTabBarItem:](self->_activeChildViewController, "_setExistingTabBarItem:", 0);
    -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:", self->_activeChildViewController);
    activeChildViewController = self->_activeChildViewController;
    if (v7)
    {
      v12 = (id)-[SUViewController contentScrollView](activeChildViewController, "contentScrollView");
      objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "setContentView:", 0);
      objc_msgSend((id)-[SUViewController view](self->_activeChildViewController, "view"), "removeFromSuperview");
      -[SUViewController viewDidDisappear:](self->_activeChildViewController, "viewDidDisappear:", 0);
      activeChildViewController = self->_activeChildViewController;
    }
    else
    {
LABEL_10:
      v12 = 0;
    }

    self->_activeChildViewController = (SUViewController *)a3;
    v9 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
    if (self->_activeChildViewController)
    {
      -[SUStorePageViewController addChildViewController:](self, "addChildViewController:");
      if (v7)
      {
        v10 = (void *)-[SUViewController view](self->_activeChildViewController, "view");
        -[SUStorePageViewController _frameForActiveViewController](self, "_frameForActiveViewController");
        objc_msgSend(v10, "setFrame:");
        -[SUViewController viewWillAppear:](self->_activeChildViewController, "viewWillAppear:", 0);
        objc_msgSend((id)-[SUStorePageViewController view](self, "view"), "setContentView:", -[SUViewController view](self->_activeChildViewController, "view"));
        -[SUViewController viewDidAppear:](self->_activeChildViewController, "viewDidAppear:", 0);
      }
      -[SUViewController setSkLoading:](self->_activeChildViewController, "setSkLoading:", -[SUStorePageViewController isSkLoaded](self, "isSkLoaded"));
      v11 = -[SUViewController title](self->_activeChildViewController, "title");
      if (v11)
        objc_msgSend(-[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface"), "setTitle:", v11);
      if (-[SUViewController _cachedScriptProperties](self, "_cachedScriptProperties"))
        -[SUViewController setScriptProperties:](self->_activeChildViewController, "setScriptProperties:", -[SUViewController _cachedScriptProperties](self, "_cachedScriptProperties"));
    }
    else
    {
      -[SUStorePageViewController resetNavigationItem:](self, "resetNavigationItem:", v9);
    }

  }
}

- (void)_setLeftNavigationItem:(id)a3 forTag:(int64_t)a4
{
  id v7;
  id v8;

  v7 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
  v8 = -[SUStorePageViewController _newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:](self, "_newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:", objc_msgSend(v7, "leftBarButtonItems"), a4, a3);
  objc_msgSend(a3, "setTag:", a4);
  objc_msgSend(v7, "setLeftBarButtonItems:", v8);

}

- (void)_setPendingChildViewController:(id)a3
{
  SUViewController *pendingChildViewController;
  SUViewController *v6;

  pendingChildViewController = self->_pendingChildViewController;
  if (pendingChildViewController != a3)
  {
    if (pendingChildViewController)
    {
      if (pendingChildViewController != self->_activeChildViewController)
      {
        -[SUStorePageViewController removeChildViewController:](self, "removeChildViewController:");
        pendingChildViewController = self->_pendingChildViewController;
      }
    }
    -[SUViewController removeObserver:forKeyPath:](pendingChildViewController, "removeObserver:forKeyPath:", self, CFSTR("viewIsReady"));

    v6 = (SUViewController *)a3;
    self->_pendingChildViewController = v6;
    -[SUViewController addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("viewIsReady"), 0, 0);
  }
}

- (void)_setRightNavigationItem:(id)a3 forTag:(int64_t)a4
{
  id v7;
  id v8;

  v7 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
  v8 = -[SUStorePageViewController _newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:](self, "_newBarButtonItemsWithButtonItems:replacingItemWithTag:withButtonItem:", objc_msgSend(v7, "rightBarButtonItems"), a4, a3);
  objc_msgSend(a3, "setTag:", a4);
  objc_msgSend(v7, "setRightBarButtonItems:", v8);

}

- (BOOL)_shouldFetchAutomatically
{
  return !-[UIViewController isRootViewController](self, "isRootViewController")
      || objc_msgSend(-[UIViewController section](self, "section"), "type") != 1
      || -[SSMutableURLRequestProperties URL](self->_urlRequestProperties, "URL")
      || objc_msgSend((id)-[SSMutableURLRequestProperties requestParameters](self->_urlRequestProperties, "requestParameters"), "count") != 0;
}

- (BOOL)_shouldDisplayControlsInNavigationBar
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (v3 != 1)
  {
    if (-[UIViewController isInMoreList](self, "isInMoreList"))
    {
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v4 = -[SUViewController navigationController](self, "navigationController");
    if (!v4
      || ((v5 = objc_msgSend(v4, "indexOfViewController:", self)) == 0
        ? (LOBYTE(v3) = 1)
        : (LOBYTE(v3) = v5 == 0x7FFFFFFFFFFFFFFFLL),
          v5 == 0x7FFFFFFFFFFFFFFFLL || !v5))
    {
      v6 = -[SUStorePageViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
      if (objc_msgSend(v6, "leftBarButtonItem"))
        goto LABEL_10;
      LOBYTE(v3) = objc_msgSend(v6, "rightBarButtonItem") == 0;
    }
  }
  return v3;
}

- (BOOL)_shouldReloadForAppearance
{
  return -[SUStorePageViewController loadsWhenHidden](self, "loadsWhenHidden")
      || -[SUViewController isVisible](self, "isVisible");
}

- (void)_showPlaceholderViewControllerWithTearDown:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = -[SUStorePageViewController newPlaceholderViewController](self, "newPlaceholderViewController");
  objc_msgSend(v5, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
  -[SUStorePageViewController _setActiveChildViewController:shouldTearDown:](self, "_setActiveChildViewController:shouldTearDown:", v5, v3);

}

- (void)_tearDownNavigationMenu
{
  -[SUMenuViewController setDelegate:](self->_navigationMenuViewController, "setDelegate:", 0);

  self->_navigationMenuViewController = 0;
  -[UIPopoverController setDelegate:](self->_navigationMenuPopover, "setDelegate:", 0);

  self->_navigationMenuPopover = 0;
}

- (void)_verifyStorePageProtocol:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  int *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  int v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "expectedClientIdentifiers");
  if (objc_msgSend(v4, "count")
    && !-[SUClientInterface _ignoresExpectedClientsProtocol](-[SUViewController clientInterface](self, "clientInterface"), "_ignoresExpectedClientsProtocol"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
LABEL_6:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        if (+[SUClientDispatch matchesClientApplication:](SUClientDispatch, "matchesClientApplication:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8)))
        {
          break;
        }
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v6)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v11 &= 2u;
      if (v11)
      {
        v12 = objc_opt_class();
        v39 = 138412546;
        v40 = v12;
        v41 = 2112;
        v42 = v4;
        LODWORD(v29) = 22;
        v28 = &v39;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v39, v29);
          free(v14);
          v28 = (int *)v15;
          SSFileLog();
        }
      }
      -[UIViewController dismissAnimated:](self, "dismissAnimated:", 0, v28);
      v16 = -[SUStorePageViewController displayedURL](self, "displayedURL");
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v4);
            v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (SUOpenURLInClient((uint64_t)v16, v21, -[SUViewController clientInterface](self, "clientInterface")))
            {
              v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
              v23 = objc_msgSend(v22, "shouldLog");
              if (objc_msgSend(v22, "shouldLogToDisk"))
                v24 = v23 | 2;
              else
                v24 = v23;
              if (os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEBUG))
                v25 = v24;
              else
                v25 = v24 & 2;
              if (v25)
              {
                v39 = 138412546;
                v40 = v21;
                v41 = 2112;
                v42 = v16;
                LODWORD(v29) = 22;
                v26 = _os_log_send_and_compose_impl();
                if (v26)
                {
                  v27 = (void *)v26;
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v39, v29);
                  free(v27);
                  SSFileLog();
                }
              }
              return;
            }
          }
          v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v18)
            continue;
          break;
        }
      }
    }
  }
}

- (SUViewController)activeChildViewController
{
  return self->_activeChildViewController;
}

- (BOOL)shouldAdjustContentOffsets
{
  return self->_shouldAdjustContentOffsets;
}

- (void)setShouldAdjustContentOffsets:(BOOL)a3
{
  self->_shouldAdjustContentOffsets = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1264);
}

- (SUStorePageViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUStorePageViewControllerDelegate *)a3;
}

- (BOOL)isExternalRequest
{
  return self->_externalRequest;
}

- (void)setExternalRequest:(BOOL)a3
{
  self->_externalRequest = a3;
}

- (BOOL)loadsWhenHidden
{
  return self->_loadsWhenHidden;
}

- (void)setLoadsWhenHidden:(BOOL)a3
{
  self->_loadsWhenHidden = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)_reloadsWhenCacheExpired
{
  return self->_reloadsWhenCacheExpired;
}

- (void)_setReloadsWhenCacheExpired:(BOOL)a3
{
  self->_reloadsWhenCacheExpired = a3;
}

- (NSString)scriptUserInfo
{
  return self->_scriptUserInfo;
}

- (SUSearchFieldController)searchFieldController
{
  return self->_searchFieldController;
}

- (SUPageSectionGroup)sectionGroup
{
  return self->_sectionsGroup;
}

- (SUSegmentedControl)sectionSegmentedControl
{
  return self->_segmentedControl;
}

- (BOOL)canMoveToOverlay
{
  return self->_canMoveToOverlay;
}

- (void)setCanMoveToOverlay:(BOOL)a3
{
  self->_canMoveToOverlay = a3;
}

- (BOOL)didPageViewLoad
{
  return self->_didPageViewLoad;
}

- (void)setDidPageViewLoad:(BOOL)a3
{
  self->_didPageViewLoad = a3;
}

@end
