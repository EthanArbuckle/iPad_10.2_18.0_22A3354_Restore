@implementation HODiscoverWebViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HODiscoverWebViewController;
  -[HODiscoverWebViewController dealloc](&v4, "dealloc");
}

- (HODiscoverWebViewController)initWithLocalizationDictionary:(id)a3
{
  id v4;
  HODiscoverWebViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HODiscoverWebViewController;
  v5 = -[HODiscoverWebViewController init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getURLStringFromLocaleDictionary:", v4));

    -[HODiscoverWebViewController _commonInitializer:](v5, "_commonInitializer:", v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_networkPathMonitorDispatchQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_connectionIssueOverlayView, 0);
  objc_storeStrong((id *)&self->_webViewActivityIndicatorDelayTimer, 0);
  objc_storeStrong((id *)&self->_webViewActivityIndicator, 0);
  objc_storeStrong((id *)&self->_applicationBackgroundedDate, 0);
}

- (void)_commonInitializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  nw_path_monitor_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD update_handler[5];

  -[HODiscoverWebViewController setUrlString:](self, "setUrlString:", a3);
  -[HODiscoverWebViewController setHasConnectedToNetwork:](self, "setHasConnectedToNetwork:", 1);
  v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[HODiscoverWebViewController setContentView:](self, "setContentView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("background-color-discover")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = sub_10000E1B0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[HODiscoverWebViewController setNetworkPathMonitorDispatchQueue:](self, "setNetworkPathMonitorDispatchQueue:", v10);

  v11 = nw_path_monitor_create();
  -[HODiscoverWebViewController setNetworkPathMonitor:](self, "setNetworkPathMonitor:", v11);

  v12 = objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController networkPathMonitor](self, "networkPathMonitor"));
  v13 = objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController networkPathMonitorDispatchQueue](self, "networkPathMonitorDispatchQueue"));
  nw_path_monitor_set_queue(v12, v13);

  v14 = objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController networkPathMonitor](self, "networkPathMonitor"));
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = sub_10001CAE8;
  update_handler[3] = &unk_1000B61C8;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v14, update_handler);

}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void)setNetworkPathMonitorDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_networkPathMonitorDispatchQueue, a3);
}

- (void)setNetworkPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkPathMonitor, a3);
}

- (void)setHasConnectedToNetwork:(BOOL)a3
{
  self->_hasConnectedToNetwork = a3;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (OS_dispatch_queue)networkPathMonitorDispatchQueue
{
  return self->_networkPathMonitorDispatchQueue;
}

- (HODiscoverWebViewController)initWithURLString:(id)a3
{
  id v4;
  HODiscoverWebViewController *v5;
  HODiscoverWebViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HODiscoverWebViewController;
  v5 = -[HODiscoverWebViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[HODiscoverWebViewController _commonInitializer:](v5, "_commonInitializer:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  NSAttributedStringKey v32;
  void *v33;
  _BYTE v34[128];

  v27.receiver = self;
  v27.super_class = (Class)HODiscoverWebViewController;
  -[HODiscoverWebViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  objc_msgSend(v3, "addSubview:", v4);

  -[HODiscoverWebViewController _addContentViewConstraints](self, "_addContentViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = CFSTR("HOTabDiscoverTitle");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HOTabDiscoverTitle"), CFSTR("_"), CFSTR("HOLocalizable")));

  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v7))
  {
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = sub_10001EE5C();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("HOTabDiscoverTitle"), CFSTR("HOTabDiscoverTitle"), v14));

        if (!-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("HOTabDiscoverTitle")))
          break;

        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v11)
            goto LABEL_4;
          v16 = CFSTR("_");
          break;
        }
      }
      v6 = CFSTR("HOTabDiscoverTitle");
    }
    else
    {
      v16 = CFSTR("_");
    }

    v7 = v16;
  }
  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v7))
    NSLog(CFSTR("Sensitive key '%@' not found!"), CFSTR("HOTabDiscoverTitle"));
  else
    v6 = v7;

  -[HODiscoverWebViewController setTitle:](self, "setTitle:", v6);
  if (!_os_feature_enabled_impl("HomeApp", "adaptive_navigation")
    || (_os_feature_enabled_impl("UIKit", "uip_floating_tab_bar") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationBar"));
    objc_msgSend(v18, "setPrefersLargeTitles:", 0);

    v32 = NSForegroundColorAttributeName;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v33 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
    objc_msgSend(v22, "setTitleTextAttributes:", v20);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    objc_msgSend(v23, "setModalPresentationStyle:", 0);

  }
  v24 = objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController networkPathMonitor](self, "networkPathMonitor"));
  nw_path_monitor_start(v24);

  -[HODiscoverWebViewController _updateNetworkConnectionState:](self, "_updateNetworkConnectionState:", 0);
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "navigationBar"));
    objc_msgSend(v26, "setHidden:", 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
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
  objc_super v26;
  NSAttributedStringKey v27;
  void *v28;

  v26.receiver = self;
  v26.super_class = (Class)HODiscoverWebViewController;
  -[HODiscoverWebViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  -[HODiscoverWebViewController setupWebViewAndActivityIndicator](self, "setupWebViewAndActivityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v6 = objc_msgSend(v4, "getWebViewNavigationStateForWebView:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  -[HODiscoverWebViewController webViewNavigationStateUpdated:navigationState:](self, "webViewNavigationStateUpdated:navigationState:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController applicationBackgroundedDate](self, "applicationBackgroundedDate"));
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = fabs(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  objc_msgSend(v11, "cacheRefreshTimeInterval");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "allowForcedCacheReload");

  if (v10 > v13 || v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    objc_msgSend(v16, "reloadWebViews");

  }
  if (v6 == (id)2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    objc_msgSend(v17, "reloadWebViews");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  objc_msgSend(v18, "setDelegate:", self);

  if (_os_feature_enabled_impl("HomeApp", "adaptive_navigation"))
  {
    if (_os_feature_enabled_impl("UIKit", "uip_floating_tab_bar"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationBar"));
      objc_msgSend(v20, "setPrefersLargeTitles:", 0);

      v27 = NSForegroundColorAttributeName;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v28 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationBar"));
      objc_msgSend(v24, "setTitleTextAttributes:", v22);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
      objc_msgSend(v25, "setModalPresentationStyle:", 0);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HODiscoverWebViewController;
  -[HODiscoverWebViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[HODiscoverWebViewController setApplicationBackgroundedDate:](self, "setApplicationBackgroundedDate:", v4);

  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HODiscoverWebViewController;
  -[HODiscoverWebViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[HODiscoverWebViewController _updateNavigationBarAppearenceFromOffset](self, "_updateNavigationBarAppearenceFromOffset");
}

- (void)setupWebViewAndActivityIndicator
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  unsigned __int8 v25;
  HODiscoverWebKitContentController *v26;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v3 = objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController urlString](self, "urlString"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "webViewForURLString:", v11));
      -[HODiscoverWebViewController setWebView:](self, "setWebView:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v14, "setOpaque:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v15, "setClipsToBounds:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
      objc_msgSend(v17, "setAllowsInlineMediaPlayback:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
      objc_msgSend(v19, "setMediaTypesRequiringUserActionForPlayback:", 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v20, "setAllowsLinkPreview:", 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[HODiscoverWebViewController setApplicationBackgroundedDate:](self, "setApplicationBackgroundedDate:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subviews"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
    v25 = objc_msgSend(v23, "containsObject:", v24);

    if ((v25 & 1) == 0)
    {
      v26 = -[HODiscoverWebKitContentController initWithDelegate:]([HODiscoverWebKitContentController alloc], "initWithDelegate:", self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "configuration"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userContentController"));
      objc_msgSend(v29, "removeScriptMessageHandlerForName:", off_1000D03D8);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "configuration"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userContentController"));
      objc_msgSend(v32, "addScriptMessageHandler:name:", v26, off_1000D03D8);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "configuration"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "userContentController"));
      objc_msgSend(v35, "removeScriptMessageHandlerForName:", off_1000D03E0);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "configuration"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "userContentController"));
      objc_msgSend(v38, "addScriptMessageHandler:name:", v26, off_1000D03E0);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v39, "setUIDelegate:", self);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "scrollView"));
      objc_msgSend(v41, "setDelegate:", self);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v42, "addSubview:", v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v44, "sendSubviewToBack:", v45);

      -[HODiscoverWebViewController _addWebViewConstraints](self, "_addWebViewConstraints");
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v46, "addObserver:selector:name:object:", self, "reloadWebView:", UIApplicationWillEnterForegroundNotification, 0);

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v47, "addObserver:selector:name:object:", self, "applicationWentIntoBackground:", UIApplicationDidEnterBackgroundNotification, 0);

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v48, "addObserver:selector:name:object:", self, "contentSizeDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));

    if (!v49)
    {
      v50 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
      -[HODiscoverWebViewController setWebViewActivityIndicator:](self, "setWebViewActivityIndicator:", v50);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
      objc_msgSend(v51, "setHidesWhenStopped:", 1);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
      objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
      objc_msgSend(v53, "addSubview:", v54);

      -[HODiscoverWebViewController _addConstraintsForWebViewActivityIndicator](self, "_addConstraintsForWebViewActivityIndicator");
    }
  }
}

- (void)_addContentViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v31[4];
  _QWORD v32[4];

  if (_os_feature_enabled_impl("HomeApp", "adaptive_navigation")
    && _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "safeAreaLayoutGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:"));
    v32[0] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "safeAreaLayoutGuide"));
    v25 = v3;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:"));
    v32[1] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
    v32[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v32[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = v18;
    v15 = v19;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:"));
    v31[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v26 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:"));
    v31[1] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v21 = v17;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v4));
    v31[2] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    v31[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
  }

}

- (void)_addWebViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v31[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarManager"));
  objc_msgSend(v7, "statusBarFrame");
  v9 = v8;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v31[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v31[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v9));
  v31[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  v31[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)_addConnectionIssueOverlayViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_addConstraintsForWebViewActivityIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v14[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_updateNetworkConnectionState:(unint64_t)a3
{
  void *v5;
  HODiscoverConnectionIssueOverlayView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));

  if (!v5)
  {
    v6 = -[HODiscoverConnectionIssueOverlayView initWithFrame:withDelegate:]([HODiscoverConnectionIssueOverlayView alloc], "initWithFrame:withDelegate:", self, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[HODiscoverWebViewController setConnectionIssueOverlayView:](self, "setConnectionIssueOverlayView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
    objc_msgSend(v8, "addSubview:", v9);

    -[HODiscoverWebViewController _addConnectionIssueOverlayViewConstraints](self, "_addConnectionIssueOverlayViewConstraints");
LABEL_5:
    if (a3 == 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
      objc_msgSend(v14, "setConnectionIssueType:", 2);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
      objc_msgSend(v15, "setHidden:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v11 = 1;
      objc_msgSend(v13, "setHidden:", 1);
    }
    else if (a3 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
      objc_msgSend(v16, "setConnectionIssueType:", 1);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
      objc_msgSend(v17, "setHidden:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v13, "setHidden:", 1);
      v11 = 0;
    }
    else
    {
      if (a3)
      {
LABEL_14:
        -[HODiscoverWebViewController setCurrentConnectionIssueState:](self, "setCurrentConnectionIssueState:", a3);
        return;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController connectionIssueOverlayView](self, "connectionIssueOverlayView"));
      v11 = 1;
      objc_msgSend(v10, "setHidden:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      objc_msgSend(v12, "setHidden:", 0);

      if (-[HODiscoverWebViewController hasConnectedToNetwork](self, "hasConnectedToNetwork"))
      {
LABEL_13:
        -[HODiscoverWebViewController setHasConnectedToNetwork:](self, "setHasConnectedToNetwork:", v11);
        goto LABEL_14;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
      objc_msgSend(v13, "reloadWebViews");
    }

    goto LABEL_13;
  }
  if (-[HODiscoverWebViewController currentConnectionIssueState](self, "currentConnectionIssueState") != a3)
    goto LABEL_5;
}

- (void)_updateNavigationBarAppearenceFromOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scrollView"));
  objc_msgSend(v4, "contentOffset");
  v6 = v5 / 20.0;

  if (v6 <= 1.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
    v14 = v13;
    if (v6 >= 0.0)
    {
      objc_msgSend(v13, "_setTitleOpacity:", v6);

      v15 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationBar"));
      v10 = v9;
      v11 = v6;
    }
    else
    {
      objc_msgSend(v13, "_setTitleOpacity:", 0.0);

      v15 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationBar"));
      v10 = v9;
      v11 = 0.0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
    objc_msgSend(v8, "_setTitleOpacity:", 1.0);

    v15 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationBar"));
    v10 = v9;
    v11 = 1.0;
  }
  objc_msgSend(v9, "_setBackgroundOpacity:", v11);

}

- (void)_startWebViewActivityIndicator
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E728;
  v4[3] = &unk_1000B61F0;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 1.5));
  -[HODiscoverWebViewController setWebViewActivityIndicatorDelayTimer:](self, "setWebViewActivityIndicatorDelayTimer:", v3);

}

- (void)_stopWebViewActivityIndicator
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicatorDelayTimer](self, "webViewActivityIndicatorDelayTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicatorDelayTimer](self, "webViewActivityIndicatorDelayTimer"));
    objc_msgSend(v4, "invalidate");

  }
  -[HODiscoverWebViewController setWebViewActivityIndicatorDelayTimer:](self, "setWebViewActivityIndicatorDelayTimer:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webViewActivityIndicator](self, "webViewActivityIndicator"));
  objc_msgSend(v5, "stopAnimating");

}

- (void)reloadWebView:(id)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  unsigned int v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController applicationBackgroundedDate](self, "applicationBackgroundedDate", a3));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = fabs(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  objc_msgSend(v6, "cacheRefreshTimeInterval");
  if (v5 > v7)
  {

    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  v9 = objc_msgSend(v8, "allowForcedCacheReload");

  if (v9)
  {
LABEL_5:
    v10 = (id)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    objc_msgSend(v10, "reloadWebViews");

  }
}

- (void)applicationWentIntoBackground:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[HODiscoverWebViewController setApplicationBackgroundedDate:](self, "setApplicationBackgroundedDate:", v4);

}

- (void)contentSizeDidChange:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController applicationBackgroundedDate](self, "applicationBackgroundedDate", a3));
  objc_msgSend(v9, "timeIntervalSinceNow");
  v4 = fabs(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  objc_msgSend(v5, "cacheRefreshTimeInterval");
  if (v4 > v6)
  {

LABEL_6:
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  v8 = objc_msgSend(v7, "allowForcedCacheReload");

  if ((v8 & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    objc_msgSend(v9, "reloadWebViews");
    goto LABEL_6;
  }
}

- (void)pushNewDiscoverWebViewControllerWithURLString:(id)a3
{
  id v4;
  void *v5;
  HODiscoverModalWebViewController *v6;

  v4 = a3;
  v6 = -[HODiscoverModalWebViewController initWithURLString:]([HODiscoverModalWebViewController alloc], "initWithURLString:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)presentModalDiscoverWebViewControllerWithURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HODiscoverModalWebViewController *v7;

  v4 = a3;
  v7 = -[HODiscoverModalWebViewController initWithURLString:]([HODiscoverModalWebViewController alloc], "initWithURLString:", v4);

  if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController presentationController](v7, "presentationController"));
    objc_msgSend(v5, "setDelegate:", self);

    -[HODiscoverModalWebViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", self);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)exitToAppleStoreAppOrSafariWithURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v4 = objc_msgSend(v3, "openURL:", v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  objc_msgSend(v4, "setContentOffset:", 0.0);

  -[HODiscoverWebViewController _updateNavigationBarAppearenceFromOffset](self, "_updateNavigationBarAppearenceFromOffset");
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pinchGestureRecognizer"));
  objc_msgSend(v5, "setEnabled:", 0);

}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)webViewNavigationStateUpdated:(id)a3 navigationState:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));

  if (v7 == v6)
  {
    if (a4 == 2)
    {
      -[HODiscoverWebViewController _stopWebViewActivityIndicator](self, "_stopWebViewActivityIndicator");
      v8 = 2;
    }
    else
    {
      if (a4 == 1)
      {
        -[HODiscoverWebViewController _stopWebViewActivityIndicator](self, "_stopWebViewActivityIndicator");
      }
      else
      {
        if (a4)
          return;
        -[HODiscoverWebViewController _startWebViewActivityIndicator](self, "_startWebViewActivityIndicator");
      }
      v8 = 0;
    }
    -[HODiscoverWebViewController _updateNetworkConnectionState:](self, "_updateNetworkConnectionState:", v8);
  }
}

- (void)connectionIssueOverlayRetryButtonPressed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
  objc_msgSend(v2, "reloadWebViews");

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  HODiscoverModalPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HODiscoverModalPresentationController initWithPresentedViewController:presentingViewController:]([HODiscoverModalPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[HODiscoverWebViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate", a3);
}

- (NSDate)applicationBackgroundedDate
{
  return self->_applicationBackgroundedDate;
}

- (void)setApplicationBackgroundedDate:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBackgroundedDate, a3);
}

- (UIActivityIndicatorView)webViewActivityIndicator
{
  return self->_webViewActivityIndicator;
}

- (void)setWebViewActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_webViewActivityIndicator, a3);
}

- (NSTimer)webViewActivityIndicatorDelayTimer
{
  return self->_webViewActivityIndicatorDelayTimer;
}

- (void)setWebViewActivityIndicatorDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_webViewActivityIndicatorDelayTimer, a3);
}

- (BOOL)hasConnectedToNetwork
{
  return self->_hasConnectedToNetwork;
}

- (HODiscoverConnectionIssueOverlayView)connectionIssueOverlayView
{
  return self->_connectionIssueOverlayView;
}

- (void)setConnectionIssueOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIssueOverlayView, a3);
}

- (unint64_t)currentConnectionIssueState
{
  return self->_currentConnectionIssueState;
}

- (void)setCurrentConnectionIssueState:(unint64_t)a3
{
  self->_currentConnectionIssueState = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSString)urlString
{
  return self->_urlString;
}

@end
