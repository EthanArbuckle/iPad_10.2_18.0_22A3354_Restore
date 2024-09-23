@implementation HODiscoverWebViewManager

- (HODiscoverWebViewManager)init
{
  HODiscoverWebViewManager *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HODiscoverWebViewManager;
  v2 = -[HODiscoverWebViewManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    -[HODiscoverWebViewManager setWebViewCache:](v2, "setWebViewCache:", v3);

    -[HODiscoverWebViewManager setAllowForcedCacheReload:](v2, "setAllowForcedCacheReload:", 0);
    -[HODiscoverWebViewManager setCacheRefreshTimeInterval:](v2, "setCacheRefreshTimeInterval:", 15.0);
  }
  return v2;
}

- (id)getURLStringFromLocaleDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  CFPropertyListRef v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("region")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("storefront")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://asa.commerce.apple.com/home/%@/%@/landing"), v4, v5));
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

    v9 = (void *)CFPreferencesCopyAppValue(CFSTR("HOStoreForceStagingURL"), v8);
    if (objc_msgSend(v9, "BOOLValue"))
      v10 = CFPreferencesCopyAppValue(CFSTR("HOStoreStagingURLValue"), v8);
    else
      v10 = v6;
    v13 = (void *)v10;

  }
  else
  {
    if (HFForceStoreToUseStagingURL())
    {
      v11 = HFStoreStagingURLString();
      v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    }
    else
    {
      v12 = v6;
    }
    v13 = v12;
  }

  return v13;
}

- (void)setWebViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_webViewCache, a3);
}

- (void)setCacheRefreshTimeInterval:(double)a3
{
  self->_cacheRefreshTimeInterval = a3;
}

- (void)setAllowForcedCacheReload:(BOOL)a3
{
  self->_allowForcedCacheReload = a3;
}

+ (id)sharedInstance
{
  if (qword_1000D27E0 != -1)
    dispatch_once(&qword_1000D27E0, &stru_1000B7A10);
  return (id)qword_1000D27D8;
}

- (void)populateWebViewCache:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getURLStringFromLocaleDictionary:](self, "getURLStringFromLocaleDictionary:", v8));
    v7 = -[HODiscoverWebViewManager webViewForURLString:](self, "webViewForURLString:", v6);

  }
}

- (id)webViewForURLString:(id)a3
{
  return -[HODiscoverWebViewManager webViewForURLString:dependentWebViewURLString:](self, "webViewForURLString:dependentWebViewURLString:", a3, 0);
}

- (id)webViewForURLString:(id)a3 dependentWebViewURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager createWebViewForURL:dependentWebViewURLString:](self, "createWebViewForURL:dependentWebViewURLString:", v10, v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewCacheValue valueWithWebView:](HODiscoverWebViewCacheValue, "valueWithWebView:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "webView"));
    objc_msgSend(v16, "setNavigationDelegate:", self);

    v17 = HFLogForCategory(65);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[HODiscoverWebViewManager webViewForURLString:dependentWebViewURLString:]";
      v25 = 2112;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%s) Discover webView created with url:[%@]", (uint8_t *)&v23, 0x16u);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v6));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "webView"));

  return v21;
}

- (void)preload:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "count"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = v14;
    do
    {
      v8 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));

      if (v4)
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v4 - 1));

        v5 = (void *)v9;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewForURLString:dependentWebViewURLString:](self, "webViewForURLString:dependentWebViewURLString:", v6, v5));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
      objc_msgSend(v12, "setWebView:", v10);

      v13 = ++v4 >= (unint64_t)objc_msgSend(v14, "count");
      v7 = v14;
    }
    while (!v13);

  }
}

- (id)createWebViewForURL:(id)a3 dependentWebViewURLString:(id)a4
{
  id v6;
  id v7;
  id v8;
  HODiscoverWebViewMessageHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)WKWebViewConfiguration);
  objc_msgSend(v8, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(v8, "setMediaTypesRequiringUserActionForPlayback:", 1);
  objc_msgSend(v8, "_setCanShowWhileLocked:", 0);
  v9 = objc_alloc_init(HODiscoverWebViewMessageHandler);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userContentController"));
  objc_msgSend(v10, "addScriptMessageHandler:name:", v9, CFSTR("preload"));

  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "webView"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "processPool"));
      objc_msgSend(v8, "setProcessPool:", v15);

      objc_msgSend(v8, "_setRelatedWebView:", v13);
    }

  }
  v16 = objc_alloc((Class)WKWebView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v17, "bounds");
  v18 = objc_msgSend(v16, "initWithFrame:configuration:", v8);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getUserAgent](self, "getUserAgent"));
  objc_msgSend(v18, "setCustomUserAgent:", v19);

  objc_msgSend(v18, "setAllowsLinkPreview:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getURLRequestForURL:](self, "getURLRequestForURL:", v7));

  v21 = objc_msgSend(v18, "loadRequest:", v20);
  return v18;
}

- (id)getUserAgent
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager userAgent](self, "userAgent"));

  if (v3)
    return (id)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager userAgent](self, "userAgent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoDictionary"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleDisplayName")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleShortVersionString")));
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    v18 = 0uLL;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "operatingSystemVersion");
    else
      v18 = 0uLL;

    v12 = objc_msgSend(CFSTR("macOS"), "copy");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld.%ld.%ld"), v18, 0));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemName"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "systemVersion"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getDeviceName](self, "getDeviceName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@ %@/%@ model/%@"), v7, v8, v12, v14, v15));
  -[HODiscoverWebViewManager setUserAgent:](self, "setUserAgent:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager userAgent](self, "userAgent"));
  return v17;
}

- (void)reloadWebViews
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039E80;
  v4[3] = &unk_1000B7A38;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);

}

- (id)getURLRequestForURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", a3, 0, 10.0));
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = objc_msgSend(CFSTR("x-request-id"), "copy");
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v6, v7);

  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v8 = objc_msgSend(CFSTR("qLNV8QsuL3e6ebtuBB8nT8GZse9N/aQ3lYTD2gDtPsU="), "copy");
    v9 = objc_msgSend(CFSTR("x-hov-cbp"), "copy");
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v8, v9);

  }
  v10 = objc_msgSend(v4, "copy");

  return v10;
}

- (id)getDeviceName
{
  utsname v3;

  memset(&v3, 0, 512);
  uname(&v3);
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v3.machine, 4));
}

- (unint64_t)getWebViewNavigationStateForWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:", v4));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

  }
  v13 = objc_msgSend(v10, "navigationState");

  return (unint64_t)v13;
}

- (id)getWebViewURLKeyFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003A380;
    v12[3] = &unk_1000B7A60;
    v13 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "na_firstKeyPassingTest:", v12));

  }
  return v10;
}

- (void)updateWebViewRefreshIntervalFromServerResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;

  v4 = a3;
  v5 = objc_msgSend(CFSTR("\\/landing"), "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = -[HODiscoverWebViewManager doesURLContainPath:urlResponseString:](self, "doesURLContainPath:urlResponseString:", v5, v7);

  if (v8)
  {
    v9 = objc_msgSend(CFSTR("x-hov-ti"), "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForHTTPHeaderField:", v9));

    v11 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v11, "setNumberStyle:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "numberFromString:", v10));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "doubleValue");
    else
      v14 = 15.0;
    -[HODiscoverWebViewManager setCacheRefreshTimeInterval:](self, "setCacheRefreshTimeInterval:", v14);
    v15 = HFLogForCategory(65);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[HODiscoverWebViewManager cacheRefreshTimeInterval](self, "cacheRefreshTimeInterval");
      v18 = 136315650;
      v19 = "-[HODiscoverWebViewManager updateWebViewRefreshIntervalFromServerResponse:]";
      v20 = 2112;
      v21 = v10;
      v22 = 2048;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(%s) Discover Tab refresh interval HTTP header value:[%@], cacheRefreshTimeInterval value:[%lf]", (uint8_t *)&v18, 0x20u);
    }

  }
}

- (void)failedWebViewNavigation:(id)a3 navigation:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;

  v7 = a3;
  v8 = a5;
  -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:", v7));
  v10 = HFLogForCategory(65);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
    v20 = 136315906;
    v21 = "-[HODiscoverWebViewManager failedWebViewNavigation:navigation:withError:]";
    v22 = 2112;
    v23 = v19;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "(%s) error occurred during Discover webView Navigation to url:[%@] with error: %@, from requested URL:[%@]", (uint8_t *)&v20, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
  objc_msgSend(v13, "setNavigationState:", 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v9));
    objc_msgSend(v15, "webViewNavigationStateUpdated:navigationState:", v7, objc_msgSend(v17, "navigationState"));

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void (**v8)(id, uint64_t);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

  v14 = objc_opt_class(NSHTTPURLResponse);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));

  if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  -[HODiscoverWebViewManager updateWebViewRefreshIntervalFromServerResponse:](self, "updateWebViewRefreshIntervalFromServerResponse:", v17);
  if (v13)
  {
    if ((char *)objc_msgSend(v17, "statusCode") - 400 > (char *)0xC7)
    {
      v30 = objc_msgSend(CFSTR("\\/covers.html"), "copy");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URL"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));
      v33 = -[HODiscoverWebViewManager doesURLContainPath:urlResponseString:](self, "doesURLContainPath:urlResponseString:", v30, v32);

      if (v33)
      {
        v18 = 1;
        -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", 1);
      }
      else
      {
        -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", 0);
        v18 = 1;
      }
      objc_msgSend(v13, "setNavigationState:", 1);
    }
    else
    {
      -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", 0);
      objc_msgSend(v13, "setNavigationState:", 2);
      v18 = 0;
    }
    v19 = v11;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:", v37));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v19));

    if ((+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall") & 1) != 0)
      goto LABEL_9;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "webView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "URL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "host"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "host"));
    v25 = objc_msgSend(v22, "isEqualToString:", v24);

    if (v25)
    {
LABEL_9:
      v26 = objc_msgSend(CFSTR("\\/covers.html"), "copy");
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URL"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "absoluteString"));
      v29 = -[HODiscoverWebViewManager doesURLContainPath:urlResponseString:](self, "doesURLContainPath:urlResponseString:", v26, v28);

      -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", v29);
      v18 = 1;
      objc_msgSend(v13, "setNavigationState:", 1);
    }
    else
    {
      -[HODiscoverWebViewManager setAllowForcedCacheReload:](self, "setAllowForcedCacheReload:", 0);
      objc_msgSend(v13, "setNavigationState:", 2);
      v18 = 0;
    }
  }
  v8[2](v8, v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
    objc_msgSend(v35, "webViewNavigationStateUpdated:navigationState:", v37, objc_msgSend(v13, "navigationState"));

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  objc_msgSend(v7, "setNavigationState:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5));
    objc_msgSend(v9, "webViewNavigationStateUpdated:navigationState:", v12, objc_msgSend(v11, "navigationState"));

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[HODiscoverWebViewManager failedWebViewNavigation:navigation:withError:](self, "failedWebViewNavigation:navigation:withError:", a3, a4, a5);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:", v12));
  if (objc_msgSend(v12, "isLoading"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
    objc_msgSend(v7, "setNavigationState:", 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewManager webViewCache](self, "webViewCache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5));
    objc_msgSend(v9, "webViewNavigationStateUpdated:navigationState:", v12, objc_msgSend(v11, "navigationState"));

  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  -[HODiscoverWebViewManager failedWebViewNavigation:navigation:withError:](self, "failedWebViewNavigation:navigation:withError:", a3, a4, a5);
}

- (BOOL)doesURLContainPath:(id)a3 urlResponseString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    v16 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v5, 0, &v16));
    v10 = v16;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstMatchInString:options:range:", v7, 0, 0, v8));
    v12 = HFLogForCategory(65);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[HODiscoverWebViewManager doesURLContainPath:urlResponseString:]";
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v5;
      v23 = 1024;
      v24 = v11 != 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%s) Did Discover webview response came from url:[%@] with pathPattern:[%@] - [%d]", buf, 0x26u);
    }

    v14 = v11 != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HODiscoverWebViewManagerWebViewNavigationDelegate)delegate
{
  return (HODiscoverWebViewManagerWebViewNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowForcedCacheReload
{
  return self->_allowForcedCacheReload;
}

- (double)cacheRefreshTimeInterval
{
  return self->_cacheRefreshTimeInterval;
}

- (NSMutableDictionary)webViewCache
{
  return self->_webViewCache;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_webViewCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
