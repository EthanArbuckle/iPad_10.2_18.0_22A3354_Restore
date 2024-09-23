@implementation SXEmbedComponentView

- (SXEmbedComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReporting:(id)a15
{
  id v20;
  id v21;
  id v22;
  SXEmbedComponentView *v23;
  SXEmbedComponentView *v24;
  uint64_t v25;
  TFMultiDelegate *scriptMessageHandler;
  void *v27;
  uint64_t v28;
  NSMutableSet *expectedMessages;
  SWCrashRetryThrottler *v30;
  SWCrashRetryThrottler *webCrashRetryThrottler;
  void *v32;
  SXSceneStateMonitor *sceneStateMonitor;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;

  v20 = a3;
  v44 = a4;
  v21 = a5;
  v22 = a6;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v36 = a14;
  v35 = a15;
  v49.receiver = self;
  v49.super_class = (Class)SXEmbedComponentView;
  v23 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v49, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, v20, v44, v21, v22);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_reachabilityProvider, a7);
    objc_storeStrong((id *)&v24->_embedDataProvider, a8);
    objc_storeStrong((id *)&v24->_actionHandler, a9);
    objc_storeStrong((id *)&v24->_layoutInvalidator, a10);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEB4798]), "initWithDelegate:delegateProtocol:", v24, &unk_254F5EBE8);
    scriptMessageHandler = v24->_scriptMessageHandler;
    v24->_scriptMessageHandler = (TFMultiDelegate *)v25;

    objc_storeStrong((id *)&v24->_dataStore, a11);
    objc_storeStrong((id *)&v24->_relatedWebViewCache, a12);
    objc_storeStrong((id *)&v24->_proxyAuthenticationHandler, a13);
    objc_storeStrong((id *)&v24->_sceneStateMonitor, a14);
    objc_storeStrong((id *)&v24->_analyticsReporting, a15);
    -[SXComponentView viewport](v24, "viewport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addViewportChangeListener:forOptions:", v24, 8);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    expectedMessages = v24->_expectedMessages;
    v24->_expectedMessages = (NSMutableSet *)v28;

    v30 = (SWCrashRetryThrottler *)objc_alloc_init(MEMORY[0x24BE90788]);
    webCrashRetryThrottler = v24->_webCrashRetryThrottler;
    v24->_webCrashRetryThrottler = v30;

    -[SXComponentView contentView](v24, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setClipsToBounds:", 1);

    objc_initWeak(&location, v24);
    sceneStateMonitor = v24->_sceneStateMonitor;
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __282__SXEmbedComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_reachabilityProvider_embedDataProvider_actionHandler_layoutInvalidator_websiteDataStore_relatedWebViewCache_proxyAuthenticationHandler_sceneStateMonitor_analyticsReporting___block_invoke;
    v46[3] = &unk_24D6873B8;
    objc_copyWeak(&v47, &location);
    -[SXSceneStateMonitor performOnSceneDidDisconnect:](sceneStateMonitor, "performOnSceneDidDisconnect:", v46);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }

  return v24;
}

void __282__SXEmbedComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_reachabilityProvider_embedDataProvider_actionHandler_layoutInvalidator_websiteDataStore_relatedWebViewCache_proxyAuthenticationHandler_sceneStateMonitor_analyticsReporting___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pauseAllMediaPlaybackWithCompletionHandler:", 0);

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SXEmbedComponentView removeScriptMessageHandlers](self, "removeScriptMessageHandlers");
  v3.receiver = self;
  v3.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView dealloc](&v3, sel_dealloc);
}

- (void)loadComponent:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView loadComponent:](&v6, sel_loadComponent_, a3);
  -[SXComponentView viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "appearState");

  if (v5 == 2)
    -[SXEmbedComponentView prewarmWebView](self, "prewarmWebView");
}

- (void)renderContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  -[SXEmbedComponentView loadEmbedIfNeeded](self, "loadEmbedIfNeeded");
}

- (void)discardContents
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView discardContents](&v6, sel_discardContents);
  -[SXEmbedComponentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView webViewPresentingInFullscreen](self, "webViewPresentingInFullscreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[SXEmbedComponentView webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)willPresentComponentWithChanges:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView willPresentComponentWithChanges:](&v5, sel_willPresentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (-[SXEmbedComponentView shouldLayoutWebView](self, "shouldLayoutWebView"))
  {
    -[SXEmbedComponentView webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[SXEmbedComponentView discardContents](self, "discardContents");
  }
}

- (void)presentComponentWithChanges:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXEmbedComponentView;
  -[SXComponentView presentComponentWithChanges:](&v4, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXEmbedComponentView loadEmbedIfNeeded](self, "loadEmbedIfNeeded");
}

- (void)loadEmbedIfNeeded
{
  if (!-[SXEmbedComponentView hasLoadedEmbedData](self, "hasLoadedEmbedData"))
    -[SXEmbedComponentView loadEmbedData](self, "loadEmbedData");
  -[SXEmbedComponentView displayEmbedIfNeeded](self, "displayEmbedIfNeeded");
}

- (void)loadEmbedData
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_217023000, v6, v7, "Failed to load embed, network unavailable, component-identifier=%{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)displayEmbedIfNeeded
{
  SXWebContentLoadEvent *v3;
  void *v4;
  void *v5;
  SXWebContentLoadEvent *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double Height;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  CGSize v39;
  CGRect v40;

  v38 = *MEMORY[0x24BDAC8D0];
  -[SXEmbedComponentView loadWebViewIfNeeded](self, "loadWebViewIfNeeded");
  if (-[SXEmbedComponentView shouldLayoutWebView](self, "shouldLayoutWebView"))
  {
    v3 = [SXWebContentLoadEvent alloc];
    -[SXEmbedComponentView embedResource](self, "embedResource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SXWebContentLoadEvent initWithURL:](v3, "initWithURL:", v5);
    -[SXEmbedComponentView setLoadEvent:](self, "setLoadEvent:", v6);

    -[SXComponentView contentFrame](self, "contentFrame");
    v8 = v7;
    -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maximumWidth");
    v11 = v10;

    if (v8 >= v11)
      v8 = v11;
    -[SXComponentView contentFrame](self, "contentFrame");
    Height = CGRectGetHeight(v40);
    v13 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v39.width = v8;
      v39.height = Height;
      NSStringFromCGSize(v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentView component](self, "component");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v15;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_217023000, v14, OS_LOG_TYPE_DEFAULT, "Starting layout for embed with size: %{public}@, component-identifier=%{public}@", buf, 0x16u);

    }
    -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", v8, Height);
    -[SXEmbedComponentView showActivityIndicator:](self, "showActivityIndicator:", 1);
    -[SXEmbedComponentView reloadEmbed](self, "reloadEmbed");
  }
  else if (-[SXEmbedComponentView shouldShowWebView](self, "shouldShowWebView"))
  {
    v18 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[SXComponentView component](self, "component");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_impl(&dword_217023000, v19, OS_LOG_TYPE_DEFAULT, "Display embed, component-identifier=%{public}@", buf, 0xCu);

    }
    -[SXEmbedComponentView showActivityIndicator:](self, "showActivityIndicator:", 0);
    -[SXEmbedComponentView webView](self, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", v23, v24);

    -[SXEmbedComponentView webView](self, "webView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "alpha");
    v27 = v26;

    if (v27 == 0.0)
    {
      if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
      {
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __44__SXEmbedComponentView_displayEmbedIfNeeded__block_invoke;
        v33[3] = &unk_24D6874A8;
        v33[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v33, 0, 0.2, 0.0);
      }
      else
      {
        -[SXEmbedComponentView webView](self, "webView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAlpha:", 1.0);

      }
    }
    else
    {
      -[SXEmbedComponentView webView](self, "webView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "superview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        -[SXComponentView contentView](self, "contentView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXEmbedComponentView webView](self, "webView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v31);

      }
    }
  }
}

void __44__SXEmbedComponentView_displayEmbedIfNeeded__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)prewarmWebView
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SXEmbedComponentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[SXEmbedComponentView failedLoading](self, "failedLoading"))
  {
    v4 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[SXComponentView component](self, "component");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_217023000, v5, OS_LOG_TYPE_DEFAULT, "Prewarming web view, component-identifier=%{public}@", (uint8_t *)&v8, 0xCu);

    }
    -[SXEmbedComponentView loadWebView](self, "loadWebView");
  }
}

- (void)loadWebViewIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[SXEmbedComponentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || (v4 = -[SXComponentView hasRenderedContents](self, "hasRenderedContents"), v3 = 0, !v4))
  {

  }
  else if (!-[SXEmbedComponentView failedLoading](self, "failedLoading"))
  {
    v5 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[SXComponentView component](self, "component");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v8;
      _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Setting up web view, component-identifier=%{public}@", buf, 0xCu);

    }
    -[SXEmbedComponentView loadWebView](self, "loadWebView");
  }
}

- (void)loadWebView
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 138543362;
    v57 = v6;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Setting up web view, component-identifier=%{public}@", (uint8_t *)&v56, 0xCu);

  }
  -[SXEmbedComponentView errorLabel](self, "errorLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  v8 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("document.body.style.webkitUserSelect = 'none';"),
                 1,
                 0);
  objc_msgSend(v8, "addUserScript:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v10, "setMediaTypesRequiringUserActionForPlayback:", -[SXEmbedComponentView userActionMediaTypes](self, "userActionMediaTypes"));
  objc_msgSend(v10, "setAllowsAirPlayForMediaPlayback:", 0);
  objc_msgSend(v10, "setAllowsPictureInPictureMediaPlayback:", 0);
  objc_msgSend(v10, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);
  -[SXEmbedComponentView dataStore](self, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWebsiteDataStore:", v11);

  -[SXEmbedComponentView relatedWebViewCache](self, "relatedWebViewCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "baseURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relatedWebViewForBaseURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setRelatedWebView:", v15);
  objc_msgSend(MEMORY[0x24BDFA8E8], "embedProcessPool");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProcessPool:", v16);

  v17 = objc_alloc_init(MEMORY[0x24BDFA8E0]);
  objc_msgSend(v17, "setJavaScriptCanOpenWindowsAutomatically:", 1);
  -[SXEmbedComponentView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if (v19 == 1)
    objc_msgSend(v17, "_setFullScreenEnabled:", 1);
  objc_msgSend(v17, "_setShouldAllowUserInstalledFonts:", 0);
  objc_msgSend(v10, "setPreferences:", v17);
  objc_msgSend(v10, "setUserContentController:", v8);
  -[SXComponentView contentFrame](self, "contentFrame");
  v21 = v20;
  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "maximumWidth");
  v24 = v23;

  if (v21 >= v24)
    v21 = v24;
  -[SXComponentView contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA918]), "initWithFrame:configuration:", v10, v27, v29, v21, v31);
  -[SXEmbedComponentView setWebView:](self, "setWebView:", v32);

  -[SXEmbedComponentView webView](self, "webView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setScrollsToTop:", 0);

  -[SXEmbedComponentView webView](self, "webView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentInsetAdjustmentBehavior:", 2);

  -[SXEmbedComponentView webView](self, "webView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setScrollEnabled:", 0);

  -[SXEmbedComponentView webView](self, "webView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDelegate:", self);

  -[SXEmbedComponentView webView](self, "webView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_setFullscreenDelegate:", self);

  -[SXEmbedComponentView webView](self, "webView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scrollView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAlwaysBounceVertical:", 0);

  -[SXEmbedComponentView webView](self, "webView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAlwaysBounceHorizontal:", 0);

  -[SXEmbedComponentView webView](self, "webView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBackgroundColor:", v47);

  -[SXEmbedComponentView webView](self, "webView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setOpaque:", 0);

  -[SXEmbedComponentView webView](self, "webView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setNavigationDelegate:", self);

  -[SXEmbedComponentView webView](self, "webView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setUIDelegate:", self);

  -[SXEmbedComponentView webView](self, "webView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAlpha:", 0.0);

  -[SXEmbedComponentView relatedWebViewCache](self, "relatedWebViewCache");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView webView](self, "webView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "baseURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "storeRelatedWebView:baseURL:", v53, v55);

}

- (void)reloadEmbed
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (-[SXEmbedComponentView hasLoadedEmbedData](self, "hasLoadedEmbedData"))
  {
    -[SXEmbedComponentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        -[SXComponentView component](self, "component");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v7;
        _os_log_impl(&dword_217023000, v5, OS_LOG_TYPE_DEFAULT, "Start loading embed, component-identifier=%{public}@", (uint8_t *)&v37, 0xCu);

      }
      -[SXEmbedComponentView webViewPresentingInFullscreen](self, "webViewPresentingInFullscreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)SXEmbedLog;
        if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          -[SXComponentView component](self, "component");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543362;
          v38 = v12;
          _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Web view in fullscreen, keeping it alive, component-identifier=%{public}@", (uint8_t *)&v37, 0xCu);

        }
        -[SXEmbedComponentView removeScriptMessageHandlers](self, "removeScriptMessageHandlers");
        -[SXEmbedComponentView setWebView:](self, "setWebView:", 0);
        -[SXEmbedComponentView loadWebViewIfNeeded](self, "loadWebViewIfNeeded");
      }
      -[SXComponentView contentFrame](self, "contentFrame");
      -[SXEmbedComponentView setCurrentlyLayoutingForSize:](self, "setCurrentlyLayoutingForSize:", v13, v14);
      -[SXEmbedComponentView addScriptMessageHandlers](self, "addScriptMessageHandlers");
      v15 = (void *)MEMORY[0x24BDB7458];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("about:blank"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestWithURL:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setAttribution:", 1);
      -[SXEmbedComponentView webView](self, "webView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "loadSimulatedRequest:responseHTMLString:", v17, &stru_24D68E0F8);

      -[SXEmbedComponentView layoutInvalidator](self, "layoutInvalidator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentView component](self, "component");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mightInvalidateComponent:", v21);

      -[SXEmbedComponentView webView](self, "webView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", 0.0);

      -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "baseURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc(MEMORY[0x24BDFA900]);
      -[SXEmbedComponentView userScript](self, "userScript");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithSource:injectionTime:forMainFrameOnly:", v26, 1, 0);

      -[SXEmbedComponentView webView](self, "webView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userContentController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addUserScript:", v27);

      objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAttribution:", 1);
      -[SXEmbedComponentView HTML](self, "HTML");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedComponentView enclosingHTML](self, "enclosingHTML");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedComponentView HTMLByEnclosingHTML:withHTML:](self, "HTMLByEnclosingHTML:withHTML:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[SXEmbedComponentView webView](self, "webView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "loadSimulatedRequest:responseHTMLString:", v31, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedComponentView setInitialNavigation:](self, "setInitialNavigation:", v36);

    }
  }
}

- (void)layoutWebViewForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double MidX;
  void *v9;
  id v10;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  -[SXEmbedComponentView webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, width, height);

  -[SXEmbedComponentView webView](self, "webView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MidX = CGRectGetMidX(v11);
  -[SXComponentView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v10, "setCenter:", MidX, CGRectGetMidY(v12));

}

- (void)finalizeLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGSize v22;
  CGRect v23;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v22.width = width;
    v22.height = height;
    NSStringFromCGSize(v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_217023000, v7, OS_LOG_TYPE_DEFAULT, "Finalizing layout with size: %{public}@, component-identifier=%{public}@", (uint8_t *)&v17, 0x16u);

  }
  -[SXEmbedComponentView layoutInvalidator](self, "layoutInvalidator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView bounds](self, "bounds");
  v13 = (id)objc_msgSend(v11, "invalidateComponent:suggestedSize:", v12, CGRectGetWidth(v23), height);

  -[SXEmbedComponentView setCurrentlyLayoutingForSize:](self, "setCurrentlyLayoutingForSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[SXEmbedComponentView setCurrentLayoutSize:](self, "setCurrentLayoutSize:", width, height);
  -[SXComponentView viewport](self, "viewport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[SXEmbedComponentView setCurrentViewportSize:](self, "setCurrentViewportSize:", v15, v16);

  -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", width, height);
  -[SXEmbedComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", 0);
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "appearState"))
  {
    if (objc_msgSend(v6, "appearState") == 2)
      -[SXEmbedComponentView prewarmWebView](self, "prewarmWebView");
  }
  else
  {
    -[SXEmbedComponentView webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pauseAllMediaPlaybackWithCompletionHandler:", 0);

  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  float v36;
  double v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  float v80;
  float v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  int v88;
  void *v89;
  __int16 v90;
  _WORD v91[17];

  *(_QWORD *)&v91[13] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ANFExpect"));

  if (v7)
  {
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v5, "body");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentView component](self, "component");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 138543618;
        v89 = v11;
        v90 = 2114;
        *(_QWORD *)v91 = v13;
        _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Expect message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);

      }
      -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
    goto LABEL_53;
  }
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ANFDone"));

  if (!v17)
  {
    objc_msgSend(v5, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("ANFUpdate"));

    if (v39)
    {
      v40 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        objc_msgSend(v5, "body");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentView component](self, "component");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 138543618;
        v89 = v42;
        v90 = 2114;
        *(_QWORD *)v91 = v44;
        _os_log_impl(&dword_217023000, v41, OS_LOG_TYPE_DEFAULT, "Update message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);

      }
      objc_msgSend(v5, "body");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKey:", CFSTR("height"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(v46, "floatValue");
        if (v47 != 0.0)
        {
          v48 = v47;
          -[SXComponentView contentFrame](self, "contentFrame");
          v50 = v49;
          -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "maximumWidth");
          v53 = v52;

          if (v50 >= v53)
            v50 = v53;
          -[SXEmbedComponentView initialScale](self, "initialScale");
          v55 = ceil(v54 * v48);
          -[SXEmbedComponentView currentLayoutSize](self, "currentLayoutSize");
          if (v50 != v57 || v55 != v56)
            -[SXEmbedComponentView finalizeLayoutForSize:](self, "finalizeLayoutForSize:", v50, v55);
        }
      }
    }
    else
    {
      objc_msgSend(v5, "name");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("ANFFailed"));

      if (!v59)
        goto LABEL_53;
      v60 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v60;
        objc_msgSend(v5, "body");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentView component](self, "component");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 138543618;
        v89 = v62;
        v90 = 2114;
        *(_QWORD *)v91 = v64;
        _os_log_impl(&dword_217023000, v61, OS_LOG_TYPE_DEFAULT, "Failed message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "unknownError");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedComponentView handleError:](self, "handleError:", v46);
    }

    goto LABEL_53;
  }
  objc_msgSend(v5, "body");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v5, "body");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "containsObject:", v23);
      -[SXComponentView component](self, "component");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 138543874;
      v89 = v21;
      v90 = 1024;
      *(_DWORD *)v91 = v24;
      v91[2] = 2114;
      *(_QWORD *)&v91[3] = v26;
      _os_log_impl(&dword_217023000, v20, OS_LOG_TYPE_DEFAULT, "Done message received: %{public}@, expected=%d, component-identifier=%{public}@", (uint8_t *)&v88, 0x1Cu);

    }
    objc_msgSend(v5, "body");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v5, "body");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v29, "objectForKey:", CFSTR("key"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "containsObject:", v31);

        if (v33)
        {
          objc_msgSend(v5, "body");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", CFSTR("height"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v35, "floatValue");
            v37 = v36;
          }
          else
          {
            v37 = 1.79769313e308;
          }
          -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "removeObject:", v31);

LABEL_39:
          v33 = 1;
          goto LABEL_40;
        }
      }
      else
      {
        v33 = 0;
      }
      v37 = 1.79769313e308;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "body");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "containsObject:", v66);

        if (!v67)
        {
          v33 = 1;
          v37 = 1.79769313e308;
LABEL_41:
          -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "count");

          if (v33 && !v70)
          {
            v71 = (void *)SXEmbedLog;
            if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
            {
              v72 = v71;
              -[SXComponentView component](self, "component");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "identifier");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = 138543362;
              v89 = v74;
              _os_log_impl(&dword_217023000, v72, OS_LOG_TYPE_DEFAULT, "No more messages expected, finalizing layout, component-identifier=%{public}@", (uint8_t *)&v88, 0xCu);

            }
            if (v37 == 1.79769313e308)
            {
              -[SXEmbedComponentView webView](self, "webView");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "scrollView");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "contentSize");
              v37 = v77;

            }
            objc_msgSend(v5, "body");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectForKey:", CFSTR("width"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "floatValue");
            v81 = v80;

            if (v81 == 0.0)
            {
              -[SXComponentView contentFrame](self, "contentFrame");
              v83 = v82;
              -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "maximumWidth");
              v86 = v85;

              if (v83 >= v86)
                v83 = v86;
            }
            else
            {
              v83 = v81;
            }
            -[SXEmbedComponentView initialScale](self, "initialScale");
            -[SXEmbedComponentView finalizeLayoutForSize:](self, "finalizeLayoutForSize:", v83, ceil(v37 * v87));
            -[SXEmbedComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", 0);
          }
          goto LABEL_53;
        }
        -[SXEmbedComponentView expectedMessages](self, "expectedMessages");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "body");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObject:", v35);
        v37 = 1.79769313e308;
        goto LABEL_39;
      }
      v33 = 1;
      v37 = 1.79769313e308;
      v31 = v30;
    }
LABEL_40:

    goto LABEL_41;
  }
LABEL_53:

}

- (void)handleError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double Width;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v4;
    v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Received error while attempting to load embed: %{public}@, component-identifier=%{public}@", (uint8_t *)&v23, 0x16u);

  }
  -[SXEmbedComponentView layoutInvalidator](self, "layoutInvalidator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelPendingInvalidationForComponent:", v10);

  -[SXEmbedComponentView setFailedLoading:](self, "setFailedLoading:", 1);
  -[SXEmbedComponentView showActivityIndicator:](self, "showActivityIndicator:", 0);
  v11 = objc_alloc(MEMORY[0x24BDF6B68]);
  -[SXComponentView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v28);
  -[SXComponentView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = (void *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v29));
  -[SXEmbedComponentView setErrorLabel:](self, "setErrorLabel:", v15);

  -[SXEmbedComponentView errorLabel](self, "errorLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[SXEmbedComponentView errorLabel](self, "errorLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", 1);

  -[SXEmbedComponentView errorLabel](self, "errorLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView unableToLoadMessage](self, "unableToLoadMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v19);

  -[SXComponentView contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedComponentView errorLabel](self, "errorLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[SXEmbedComponentView removeScriptMessageHandlers](self, "removeScriptMessageHandlers");
  -[SXEmbedComponentView webView](self, "webView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeFromSuperview");

  -[SXEmbedComponentView setWebView:](self, "setWebView:", 0);
  -[SXEmbedComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", v4);

}

- (id)unableToLoadMessage
{
  void *v2;
  void *v3;

  SXBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Couldn’t Load Content"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  SXLinkAction *v24;
  void *v25;
  void *v26;
  SXLinkAction *v27;
  void *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v12, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v17;
    v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_217023000, v15, OS_LOG_TYPE_DEFAULT, "Navigating to URL %{public}@ in reponse to new window for component-identifier=%{public}@", (uint8_t *)&v31, 0x16u);

  }
  objc_msgSend(v12, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("about:blank"));

  if ((v23 & 1) == 0)
  {
    v24 = [SXLinkAction alloc];
    objc_msgSend(v12, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SXLinkAction initWithURL:](v24, "initWithURL:", v26);

    -[SXEmbedComponentView actionHandler](self, "actionHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentView webView](self, "webView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    objc_msgSend(v28, "handleAction:sourceView:sourceRect:invocationType:", v27, self, 0);

  }
  return 0;
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SXEmbedComponentView usingElementFullscreen](self, "usingElementFullscreen"))
    -[SXEmbedComponentView webViewExitedFullscreen:](self, "webViewExitedFullscreen:", v4);

}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
  -[SXEmbedComponentView webViewEnteredFullscreen:](self, "webViewEnteredFullscreen:", a3);
  -[SXEmbedComponentView setUsingElementFullscreen:](self, "setUsingElementFullscreen:", 1);
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  -[SXEmbedComponentView webViewExitedFullscreen:](self, "webViewExitedFullscreen:", a3);
  -[SXEmbedComponentView setUsingElementFullscreen:](self, "setUsingElementFullscreen:", 0);
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Web view crashed, attempting reload, component-identifier=%{public}@", (uint8_t *)&v16, 0xCu);

  }
  -[SXEmbedComponentView webView](self, "webView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    -[SXEmbedComponentView showActivityIndicator:](self, "showActivityIndicator:", 1);
    -[SXEmbedComponentView webCrashRetryThrottler](self, "webCrashRetryThrottler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldReloadAfterWebProcessCrash");

    if (v11)
    {
      -[SXEmbedComponentView removeScriptMessageHandlers](self, "removeScriptMessageHandlers");
      -[SXEmbedComponentView reloadEmbed](self, "reloadEmbed");
    }
    else
    {
      v12 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        -[SXComponentView component](self, "component");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_217023000, v13, OS_LOG_TYPE_DEFAULT, "Stopped reloading after crash, threshold reached, component-identifier=%{public}@", (uint8_t *)&v16, 0xCu);

      }
    }
  }

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "code") != -999 && objc_msgSend(v10, "code") != -1002)
    -[SXEmbedComponentView handleError:](self, "handleError:", v10);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "code") != -999 && objc_msgSend(v10, "code") != -1002)
    -[SXEmbedComponentView handleError:](self, "handleError:", v10);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[SXEmbedComponentView initialNavigation](self, "initialNavigation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SXComponentView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentView webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SXEmbedComponentView setInitialNavigation:](self, "setInitialNavigation:", 0);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  SXEmbedComponentView *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __80__SXEmbedComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v18 = &unk_24D68BE98;
  v11 = v9;
  v19 = v11;
  v20 = self;
  v12 = v8;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x219A070A8](&v15);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v15, v16, v17, v18))
    v14[2](v14);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __80__SXEmbedComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  void *v2;
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
  double v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SXLinkAction *v23;
  void *v24;
  void *v25;
  SXLinkAction *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "targetFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isMainFrame"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("about:blank")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "targetFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("about:blank")) & 1) != 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "targetFrame");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "request");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v32 = v10;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "shouldAllowRequestToURL:"))
    {
      objc_msgSend(*(id *)(a1 + 48), "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(*(id *)(a1 + 48), "alpha");
        v12 = v13;
        v15 = v14 > 0.0;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

    v10 = v32;
  }
  else
  {
    v15 = 0;
  }

  if (!v15)
    goto LABEL_7;
  v16 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(void **)(a1 + 32);
    v18 = v16;
    objc_msgSend(v17, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "component");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v20;
    v37 = 2114;
    v38 = v22;
    _os_log_impl(&dword_217023000, v18, OS_LOG_TYPE_DEFAULT, "Navigating to URL %{public}@ in response to navigation action for component-identifier=%{public}@", buf, 0x16u);

  }
  v23 = [SXLinkAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SXLinkAction initWithURL:](v23, "initWithURL:", v25);

  objc_msgSend(*(id *)(a1 + 40), "actionHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  objc_msgSend(v27, "handleAction:sourceView:sourceRect:invocationType:", v26, v28, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[SXEmbedComponentView proxyAuthenticationHandler](self, "proxyAuthenticationHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleAuthenticationChallenge:completion:", v8, v7);

}

- (BOOL)shouldAllowRequestToURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("https"));

  }
  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("about:blank"));

  return v5 | v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v4;

  objc_msgSend(a3, "pinchGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

}

- (id)enclosingHTML
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enclosingHTML");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "containsString:", CFSTR("{initial_scale}")))
  {
    -[SXEmbedComponentView initialScale](self, "initialScale");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{initial_scale}"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)HTMLByEnclosingHTML:(id)a3 withHTML:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", a4, a3);
}

- (double)initialScale
{
  double Width;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  -[SXComponentView contentFrame](self, "contentFrame");
  Width = CGRectGetWidth(v9);
  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumWidth");
  v6 = v5;

  if (v6 >= 1.0)
    v7 = v6;
  else
    v7 = 1.0;
  return fmin(Width / v7, 1.0);
}

- (SXEmbedType)embedConfiguration
{
  SXEmbedType *embedConfiguration;
  void *v4;
  void *v5;
  void *v6;
  SXEmbedType *v7;
  SXEmbedType *v8;

  embedConfiguration = self->_embedConfiguration;
  if (!embedConfiguration)
  {
    -[SXEmbedComponentView embedDataProvider](self, "embedDataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "embedType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "embedForType:", v6);
    v7 = (SXEmbedType *)objc_claimAutoreleasedReturnValue();
    v8 = self->_embedConfiguration;
    self->_embedConfiguration = v7;

    embedConfiguration = self->_embedConfiguration;
  }
  return embedConfiguration;
}

- (BOOL)shouldLayoutWebView
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  -[SXEmbedComponentView currentLayoutSize](self, "currentLayoutSize");
  v4 = v3;
  -[SXComponentView contentFrame](self, "contentFrame");
  if (v4 == v5)
    return 0;
  -[SXEmbedComponentView webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SXEmbedComponentView HTML](self, "HTML");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && -[SXComponentView hasRenderedContents](self, "hasRenderedContents"))
    {
      -[SXEmbedComponentView currentlyLayoutingForSize](self, "currentlyLayoutingForSize");
      v9 = v8;
      v11 = v10;
      -[SXComponentView contentFrame](self, "contentFrame");
      v14 = v11 != v13 || v9 != v12;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldShowWebView
{
  double v3;
  double v4;
  double v5;
  void *v6;
  _BOOL4 v7;

  -[SXEmbedComponentView currentLayoutSize](self, "currentLayoutSize");
  v4 = v3;
  -[SXComponentView contentFrame](self, "contentFrame");
  if (v4 == v5)
  {
    -[SXEmbedComponentView webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = !-[SXEmbedComponentView failedLoading](self, "failedLoading");
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)hasLoadedEmbedData
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SXEmbedComponentView HTML](self, "HTML");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SXEmbedComponentView userScript](self, "userScript");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = -[SXEmbedComponentView failedLoading](self, "failedLoading");

  }
  else
  {
    v5 = -[SXEmbedComponentView failedLoading](self, "failedLoading");
  }

  return v5;
}

- (void)showActivityIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *activityIndicator;
  void *v8;
  void *v9;
  void *v10;
  double MidX;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v3 = a3;
  -[SXEmbedComponentView activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v6;

      -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
      -[SXComponentView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_activityIndicator);

    }
    -[SXEmbedComponentView activityIndicator](self, "activityIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    MidX = CGRectGetMidX(v14);
    -[SXComponentView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v9, "setCenter:", MidX, CGRectGetMidY(v15));

    -[SXEmbedComponentView activityIndicator](self, "activityIndicator");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startAnimating");
  }
  else
  {
    if (!v5)
      return;
    -[SXEmbedComponentView activityIndicator](self, "activityIndicator");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimating");
  }

}

- (SXEmbedResource)embedResource
{
  SXEmbedResource *embedResource;
  void *v4;
  void *v5;
  void *v6;
  SXEmbedResource *v7;
  SXEmbedResource *v8;

  embedResource = self->_embedResource;
  if (!embedResource)
  {
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceForIdentifier:", v6);
    v7 = (SXEmbedResource *)objc_claimAutoreleasedReturnValue();
    v8 = self->_embedResource;
    self->_embedResource = v7;

    embedResource = self->_embedResource;
  }
  return embedResource;
}

- (unint64_t)userActionMediaTypes
{
  void *v2;
  uint64_t v3;

  -[SXEmbedComponentView embedConfiguration](self, "embedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autoPlayMedia");

  if ((unint64_t)(v3 + 1) > 3)
    return -1;
  else
    return qword_21713C700[v3 + 1];
}

- (void)addScriptMessageHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[SXEmbedComponentView hasRegisteredScriptMessageHandlers](self, "hasRegisteredScriptMessageHandlers"))
  {
    -[SXEmbedComponentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userContentController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[SXEmbedComponentView scriptMessageHandler](self, "scriptMessageHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addScriptMessageHandler:name:", v5, CFSTR("ANFExpect"));

    -[SXEmbedComponentView scriptMessageHandler](self, "scriptMessageHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addScriptMessageHandler:name:", v6, CFSTR("ANFDone"));

    -[SXEmbedComponentView scriptMessageHandler](self, "scriptMessageHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addScriptMessageHandler:name:", v7, CFSTR("ANFUpdate"));

    -[SXEmbedComponentView scriptMessageHandler](self, "scriptMessageHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addScriptMessageHandler:name:", v8, CFSTR("ANFFailed"));

    -[SXEmbedComponentView setHasRegisteredScriptMessageHandlers:](self, "setHasRegisteredScriptMessageHandlers:", 1);
  }
}

- (void)removeScriptMessageHandlers
{
  void *v3;
  void *v4;
  id v5;

  if (-[SXEmbedComponentView hasRegisteredScriptMessageHandlers](self, "hasRegisteredScriptMessageHandlers"))
  {
    -[SXEmbedComponentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userContentController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeScriptMessageHandlerForName:", CFSTR("ANFExpect"));
    objc_msgSend(v5, "removeScriptMessageHandlerForName:", CFSTR("ANFDone"));
    objc_msgSend(v5, "removeScriptMessageHandlerForName:", CFSTR("ANFUpdate"));
    objc_msgSend(v5, "removeScriptMessageHandlerForName:", CFSTR("ANFFailed"));
    -[SXEmbedComponentView setHasRegisteredScriptMessageHandlers:](self, "setHasRegisteredScriptMessageHandlers:", 0);

  }
}

- (BOOL)allowHierarchyRemoval
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v6, sel_allowHierarchyRemoval);
  -[SXEmbedComponentView webViewPresentingInFullscreen](self, "webViewPresentingInFullscreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return !v4 && v3;
}

- (void)webViewEnteredFullscreen:(id)a3
{
  id v4;

  -[SXEmbedComponentView setWebViewPresentingInFullscreen:](self, "setWebViewPresentingInFullscreen:", a3);
  -[SXEmbedComponentView setWebView:](self, "setWebView:", 0);
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willReturnToFullscreenForComponent:", self);

}

- (void)webViewExitedFullscreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SXEmbedComponentView webView](self, "webView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXEmbedComponentView webViewPresentingInFullscreen](self, "webViewPresentingInFullscreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "removeFromSuperview");
  else
    -[SXEmbedComponentView setWebView:](self, "setWebView:", v5);

  -[SXEmbedComponentView setWebViewPresentingInFullscreen:](self, "setWebViewPresentingInFullscreen:", 0);
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willDismissFullscreenCanvasForComponent:", self);

}

- (void)reportLoadEventWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SXEmbedComponentView loadEvent](self, "loadEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXEmbedComponentView loadEvent](self, "loadEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v9);

    -[SXEmbedComponentView loadEvent](self, "loadEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "determineEndDate");

    -[SXEmbedComponentView analyticsReporting](self, "analyticsReporting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentView loadEvent](self, "loadEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportEvent:", v8);

    -[SXEmbedComponentView setLoadEvent:](self, "setLoadEvent:", 0);
  }

}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (void)setEmbedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_embedConfiguration, a3);
}

- (void)setEmbedResource:(id)a3
{
  objc_storeStrong((id *)&self->_embedResource, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (SWCrashRetryThrottler)webCrashRetryThrottler
{
  return self->_webCrashRetryThrottler;
}

- (void)setWebCrashRetryThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_webCrashRetryThrottler, a3);
}

- (WKWebView)webViewPresentingInFullscreen
{
  return self->_webViewPresentingInFullscreen;
}

- (void)setWebViewPresentingInFullscreen:(id)a3
{
  objc_storeStrong((id *)&self->_webViewPresentingInFullscreen, a3);
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (NSString)HTML
{
  return self->_HTML;
}

- (void)setHTML:(id)a3
{
  objc_storeStrong((id *)&self->_HTML, a3);
}

- (NSString)userScript
{
  return self->_userScript;
}

- (void)setUserScript:(id)a3
{
  objc_storeStrong((id *)&self->_userScript, a3);
}

- (NSMutableSet)expectedMessages
{
  return self->_expectedMessages;
}

- (void)setExpectedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_expectedMessages, a3);
}

- (BOOL)failedLoading
{
  return self->_failedLoading;
}

- (void)setFailedLoading:(BOOL)a3
{
  self->_failedLoading = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (CGSize)currentlyLayoutingForSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentlyLayoutingForSize.width;
  height = self->_currentlyLayoutingForSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentlyLayoutingForSize:(CGSize)a3
{
  self->_currentlyLayoutingForSize = a3;
}

- (CGSize)currentLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentLayoutSize.width;
  height = self->_currentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentLayoutSize:(CGSize)a3
{
  self->_currentLayoutSize = a3;
}

- (CGSize)currentViewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentViewportSize.width;
  height = self->_currentViewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentViewportSize:(CGSize)a3
{
  self->_currentViewportSize = a3;
}

- (WKNavigation)initialNavigation
{
  return self->_initialNavigation;
}

- (void)setInitialNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_initialNavigation, a3);
}

- (BOOL)hasRegisteredScriptMessageHandlers
{
  return self->_hasRegisteredScriptMessageHandlers;
}

- (void)setHasRegisteredScriptMessageHandlers:(BOOL)a3
{
  self->_hasRegisteredScriptMessageHandlers = a3;
}

- (TFMultiDelegate)scriptMessageHandler
{
  return self->_scriptMessageHandler;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXRelatedWebViewCache)relatedWebViewCache
{
  return self->_relatedWebViewCache;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (BOOL)usingElementFullscreen
{
  return self->_usingElementFullscreen;
}

- (void)setUsingElementFullscreen:(BOOL)a3
{
  self->_usingElementFullscreen = a3;
}

- (SXWebContentLoadEvent)loadEvent
{
  return self->_loadEvent;
}

- (void)setLoadEvent:(id)a3
{
  objc_storeStrong((id *)&self->_loadEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadEvent, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_relatedWebViewCache, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_initialNavigation, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_expectedMessages, 0);
  objc_storeStrong((id *)&self->_userScript, 0);
  objc_storeStrong((id *)&self->_HTML, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_webViewPresentingInFullscreen, 0);
  objc_storeStrong((id *)&self->_webCrashRetryThrottler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_embedResource, 0);
  objc_storeStrong((id *)&self->_embedConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
}

@end
