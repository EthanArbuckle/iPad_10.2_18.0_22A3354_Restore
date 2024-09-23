@implementation SXEmbedVideoComponentView

- (SXEmbedVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SXEmbedVideoComponentView *v22;
  SXEmbedVideoComponentView *v23;
  uint64_t v24;
  UIActivityIndicatorView *activityIndicator;
  void *v26;
  void *v27;
  SWCrashRetryThrottler *v28;
  SWCrashRetryThrottler *webCrashRetryThrottler;
  SXSceneStateMonitor *sceneStateMonitor;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v37 = a9;
  v35 = a10;
  v34 = a11;
  v32 = v17;
  v33 = a12;
  v42.receiver = self;
  v42.super_class = (Class)SXEmbedVideoComponentView;
  v22 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v42, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, v16, v17, v18, v19, v20, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_actionHandler, a10);
    objc_storeStrong((id *)&v23->_dataStore, a11);
    objc_storeStrong((id *)&v23->_proxyAuthenticationHandler, a12);
    objc_storeStrong((id *)&v23->_sceneStateMonitor, a9);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v23->_activityIndicator;
    v23->_activityIndicator = (UIActivityIndicatorView *)v24;

    -[SXComponentView contentView](v23, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v23->_activityIndicator);

    -[SXComponentView viewport](v23, "viewport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addViewportChangeListener:forOptions:", v23, 8);

    v28 = (SWCrashRetryThrottler *)objc_alloc_init(MEMORY[0x24BE90788]);
    webCrashRetryThrottler = v23->_webCrashRetryThrottler;
    v23->_webCrashRetryThrottler = v28;

    objc_initWeak(&location, v23);
    sceneStateMonitor = v23->_sceneStateMonitor;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __226__SXEmbedVideoComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_sceneStateMonitor_actionHandler_websiteDataStore_proxyAuthenticationHandler___block_invoke;
    v39[3] = &unk_24D6873B8;
    objc_copyWeak(&v40, &location);
    -[SXSceneStateMonitor performOnSceneDidDisconnect:](sceneStateMonitor, "performOnSceneDidDisconnect:", v39);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v23;
}

void __226__SXEmbedVideoComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_sceneStateMonitor_actionHandler_websiteDataStore_proxyAuthenticationHandler___block_invoke(uint64_t a1)
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

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)SXEmbedVideoComponentView;
  -[SXComponentView presentComponentWithChanges:](&v5, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (-[SXEmbedVideoComponentView webViewIsLoaded](self, "webViewIsLoaded"))
  {
    -[SXEmbedVideoComponentView webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    -[SXEmbedVideoComponentView updateWebViewToWidth:](self, "updateWebViewToWidth:", CGRectGetWidth(v6));

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double MidX;
  void *v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)SXEmbedVideoComponentView;
  -[SXEmbedVideoComponentView layoutSubviews](&v7, sel_layoutSubviews);
  -[SXEmbedVideoComponentView activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v8);
  -[SXComponentView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v9));

}

- (void)renderContents
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXEmbedVideoComponentView;
  -[SXComponentView renderContents](&v6, sel_renderContents);
  if (!-[SXEmbedVideoComponentView webViewIsLoaded](self, "webViewIsLoaded"))
  {
    -[SXEmbedVideoComponentView activityIndicator](self, "activityIndicator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAnimating");

    -[SXComponentView component](self, "component");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedVideoComponentView initializeWebViewWithURL:](self, "initializeWebViewWithURL:", v5);

  }
}

- (void)discardContents
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXEmbedVideoComponentView;
  -[SXComponentView discardContents](&v4, sel_discardContents);
  if (!-[SXEmbedVideoComponentView isPresentingFullscreen](self, "isPresentingFullscreen"))
  {
    -[SXEmbedVideoComponentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[SXEmbedVideoComponentView setWebView:](self, "setWebView:", 0);
    -[SXEmbedVideoComponentView setWebViewIsLoaded:](self, "setWebViewIsLoaded:", 0);
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v5;

  if (!objc_msgSend(a3, "appearState"))
  {
    -[SXEmbedVideoComponentView webView](self, "webView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pauseAllMediaPlaybackWithCompletionHandler:", 0);

  }
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_93);
  return (id)sharedConfiguration_configuration;
}

void __48__SXEmbedVideoComponentView_sharedConfiguration__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v0 = objc_alloc_init(MEMORY[0x24BDFA920]);
  v1 = (void *)sharedConfiguration_configuration;
  sharedConfiguration_configuration = (uint64_t)v0;

  objc_msgSend((id)sharedConfiguration_configuration, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend((id)sharedConfiguration_configuration, "setMediaTypesRequiringUserActionForPlayback:", -1);
  objc_msgSend((id)sharedConfiguration_configuration, "setAllowsAirPlayForMediaPlayback:", 0);
  objc_msgSend((id)sharedConfiguration_configuration, "setAllowsPictureInPictureMediaPlayback:", 0);
  v2 = (void *)sharedConfiguration_configuration;
  v3 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  objc_msgSend(v2, "setUserContentController:", v3);

  v4 = (void *)sharedConfiguration_configuration;
  objc_msgSend(MEMORY[0x24BDFA8E8], "embedProcessPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcessPool:", v5);

  objc_msgSend((id)sharedConfiguration_configuration, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("document.body.style.webkitUserSelect = 'none';"),
              1,
              0);
  objc_msgSend((id)sharedConfiguration_configuration, "userContentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUserScript:", v10);

  v7 = objc_alloc_init(MEMORY[0x24BDFA8E0]);
  objc_msgSend(v7, "_setShouldAllowUserInstalledFonts:", 0);
  objc_msgSend(v7, "setTextInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 1)
    objc_msgSend(v7, "_setFullScreenEnabled:", 1);
  objc_msgSend((id)sharedConfiguration_configuration, "setPreferences:", v7);

}

- (void)initializeWebViewWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  WKWebView *v10;
  WKWebView *webView;
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
  SXWebContentLoadEvent *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  CGRect v47;

  v4 = a3;
  -[SXEmbedVideoComponentView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "sharedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedVideoComponentView dataStore](self, "dataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWebsiteDataStore:", v7);

    v8 = objc_alloc(MEMORY[0x24BDFA918]);
    -[SXComponentView contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = (WKWebView *)objc_msgSend(v8, "initWithFrame:configuration:", v6);
    webView = self->_webView;
    self->_webView = v10;

    -[SXEmbedVideoComponentView webView](self, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollsToTop:", 0);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentInsetAdjustmentBehavior:", 2);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", 0);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBounces:", 0);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAutoresizingMask:", 18);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNavigationDelegate:", self);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUIDelegate:", self);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setFullscreenDelegate:", self);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    -[SXEmbedVideoComponentView webView](self, "webView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    -[SXComponentView contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedVideoComponentView webView](self, "webView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

  }
  v28 = -[SXWebContentLoadEvent initWithURL:]([SXWebContentLoadEvent alloc], "initWithURL:", v4);
  -[SXEmbedVideoComponentView setLoadEvent:](self, "setLoadEvent:", v28);

  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "scheme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@://%@"), v30, v31);
  v46 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v46);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAttribution:", 1);
  v34 = (void *)MEMORY[0x24BDD17C8];
  -[SXComponentView contentFrame](self, "contentFrame");
  v36 = v35;
  -[SXComponentView contentFrame](self, "contentFrame");
  v38 = v37;
  -[SXComponentView contentFrame](self, "contentFrame");
  v40 = v39;
  objc_msgSend(v4, "absoluteString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "stringWithFormat:", CFSTR("<style>* {padding: 0; margin: 0}</style></style><meta name='viewport' content='width=%f, user-scalable=no, initial-scale=1, max-scale=1'><iframe width='%f' height='%f' src='%@' frameborder='0' allowfullscreen></iframe>"),
    v36,
    v38,
    v40,
    v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXEmbedVideoComponentView webView](self, "webView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v43, "loadSimulatedRequest:responseHTMLString:", v33, v42);

  -[SXEmbedVideoComponentView setWebViewIsLoaded:](self, "setWebViewIsLoaded:", 1);
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1);
  -[SXEmbedVideoComponentView webView](self, "webView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "frame");
  -[SXEmbedVideoComponentView updateWebViewToWidth:](self, "updateWebViewToWidth:", CGRectGetWidth(v47));

}

- (void)updateWebViewToWidth:(double)a3
{
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SXComponentView contentFrame](self, "contentFrame", a3);
  v6 = (int)v5;
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("var iframe = document.getElementsByTagName('iframe')[0]; iframe.style.width = '%dpx'; iframe.style.height = '%dpx';"),
    v6,
    (int)v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluateJavaScript:completionHandler:", v9, 0);

}

- (CGRect)transitionContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[SXEmbedVideoComponentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SXEmbedVideoComponentView superview](self, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentView convertRect:toView:](self, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)handleError:(id)a3
{
  id v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  v12 = a3;
  v4 = objc_alloc(MEMORY[0x24BDF6B68]);
  -[SXEmbedVideoComponentView bounds](self, "bounds");
  v5 = CGRectGetWidth(v13) + -20.0;
  -[SXEmbedVideoComponentView bounds](self, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:", 10.0, 10.0, v5, CGRectGetHeight(v14) + -20.0);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setTextAlignment:", 1);
  SXBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Couldn’t Load Content"), &stru_24D68E0F8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  -[SXEmbedVideoComponentView addSubview:](self, "addSubview:", v6);
  -[SXEmbedVideoComponentView activityIndicator](self, "activityIndicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopAnimating");

  -[SXEmbedVideoComponentView webView](self, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[SXEmbedVideoComponentView setWebView:](self, "setWebView:", 0);
  if (v12)
  {
    -[SXEmbedVideoComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "unknownError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedVideoComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", v11);

  }
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v7;
  SXLinkAction *v8;
  void *v9;
  void *v10;
  SXLinkAction *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = [SXLinkAction alloc];
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXLinkAction initWithURL:](v8, "initWithURL:", v10);

  -[SXEmbedVideoComponentView actionHandler](self, "actionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentView webView](self, "webView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "handleAction:sourceView:sourceRect:invocationType:", v11, self, 0);

  return 0;
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SXEmbedVideoComponentView webView](self, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SXEmbedVideoComponentView webCrashRetryThrottler](self, "webCrashRetryThrottler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldReloadAfterWebProcessCrash");

    if (v7)
    {
      -[SXComponentView component](self, "component");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXEmbedVideoComponentView initializeWebViewWithURL:](self, "initializeWebViewWithURL:", v8);

    }
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  _QWORD v12[4];
  id v13;
  SXEmbedVideoComponentView *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__SXEmbedVideoComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v12[3] = &unk_24D68D870;
  v9 = v7;
  v13 = v9;
  v14 = self;
  v10 = v8;
  v15 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x219A070A8](v12);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v11[2](v11);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __85__SXEmbedVideoComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
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
  SXLinkAction *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  SXLinkAction *v18;

  if (objc_msgSend(*(id *)(a1 + 32), "navigationType"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("about:blank")) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "targetFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("about:blank")) & 1) != 0)
  {

LABEL_5:
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  v17 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v17, "shouldAllowRequestToURL:", v10);

  if (!(_DWORD)v17)
    goto LABEL_6;
  v11 = [SXLinkAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SXLinkAction initWithURL:](v11, "initWithURL:", v13);

  objc_msgSend(*(id *)(a1 + 40), "actionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v14, "handleAction:sourceView:sourceRect:invocationType:", v18, v15, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
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

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__SXEmbedVideoComponentView_webView_didFinishNavigation___block_invoke;
  v5[3] = &unk_24D6874A8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, a4, 0.15);
  -[SXEmbedVideoComponentView reportLoadEventWithError:](self, "reportLoadEventWithError:", 0);
}

void __57__SXEmbedVideoComponentView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  if (a5)
    -[SXEmbedVideoComponentView handleError:](self, "handleError:", a5, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (a5)
    -[SXEmbedVideoComponentView handleError:](self, "handleError:", a5, a4);
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[SXEmbedVideoComponentView proxyAuthenticationHandler](self, "proxyAuthenticationHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleAuthenticationChallenge:completion:", v8, v7);

}

- (unint64_t)analyticsMediaType
{
  return 2;
}

- (unint64_t)analyticsVideoType
{
  return 2;
}

- (BOOL)allowHierarchyRemoval
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXEmbedVideoComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v5, sel_allowHierarchyRemoval);
  return v3 & ~-[SXEmbedVideoComponentView isPresentingFullscreen](self, "isPresentingFullscreen");
}

- (void)webViewEnteredFullscreen:(id)a3
{
  id v4;

  -[SXEmbedVideoComponentView setIsPresentingFullscreen:](self, "setIsPresentingFullscreen:", 1);
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willReturnToFullscreenForComponent:", self);

}

- (void)webViewExitedFullscreen:(id)a3
{
  id v4;

  -[SXEmbedVideoComponentView setIsPresentingFullscreen:](self, "setIsPresentingFullscreen:", 0);
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willDismissFullscreenCanvasForComponent:", self);

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
  -[SXEmbedVideoComponentView loadEvent](self, "loadEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXEmbedVideoComponentView loadEvent](self, "loadEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v9);

    -[SXEmbedVideoComponentView loadEvent](self, "loadEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "determineEndDate");

    -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedVideoComponentView loadEvent](self, "loadEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportEvent:", v8);

    -[SXEmbedVideoComponentView setLoadEvent:](self, "setLoadEvent:", 0);
  }

}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
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

- (BOOL)webViewIsLoaded
{
  return self->_webViewIsLoaded;
}

- (void)setWebViewIsLoaded:(BOOL)a3
{
  self->_webViewIsLoaded = a3;
}

- (BOOL)isPresentingFullscreen
{
  return self->_isPresentingFullscreen;
}

- (void)setIsPresentingFullscreen:(BOOL)a3
{
  self->_isPresentingFullscreen = a3;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
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
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_webCrashRetryThrottler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end
