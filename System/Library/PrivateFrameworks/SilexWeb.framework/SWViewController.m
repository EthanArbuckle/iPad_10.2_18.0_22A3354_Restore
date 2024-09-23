@implementation SWViewController

- (SWViewController)initWithWebView:(id)a3 setupManager:(id)a4 scriptsManager:(id)a5 messageHandlerManager:(id)a6 navigationManager:(id)a7 errorReporter:(id)a8 documentStateReporter:(id)a9 timeoutManager:(id)a10 terminationManager:(id)a11 contentRuleManager:(id)a12 reachabilityProvider:(id)a13 logger:(id)a14 sessionManager:(id)a15 datastoreSynchronizationManager:(id)a16 localDatastoreManager:(id)a17 URLSchemeHandlerManager:(id)a18
{
  id v23;
  id v24;
  id v25;
  SWViewController *v26;
  SWViewController *v27;
  id *p_webView;
  uint64_t v29;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v23 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v39 = a8;
  v38 = a9;
  v24 = a10;
  v45 = a11;
  v37 = a12;
  v36 = a13;
  v35 = a14;
  v34 = a15;
  v33 = a16;
  v32 = a17;
  v25 = a18;
  v51.receiver = self;
  v51.super_class = (Class)SWViewController;
  v26 = -[SWViewController initWithNibName:bundle:](&v51, sel_initWithNibName_bundle_, 0, 0);
  v27 = v26;
  if (v26)
  {
    p_webView = (id *)&v26->_webView;
    objc_storeStrong((id *)&v26->_webView, a3);
    objc_msgSend(*p_webView, "setNavigationDelegate:", v27);
    objc_msgSend(*p_webView, "setUIDelegate:", v27);
    objc_msgSend(*p_webView, "_setFullscreenDelegate:", v27);
    objc_msgSend(*p_webView, "_setInputDelegate:", v27);
    objc_storeStrong((id *)&v27->_setupManager, a4);
    objc_storeStrong((id *)&v27->_scriptsManager, a5);
    objc_storeStrong((id *)&v27->_messageHandlerManager, a6);
    objc_storeStrong((id *)&v27->_navigationManager, a7);
    objc_storeStrong((id *)&v27->_errorReporter, a8);
    objc_storeStrong((id *)&v27->_documentStateReporter, a9);
    objc_storeStrong((id *)&v27->_timeoutManager, a10);
    objc_storeStrong((id *)&v27->_terminationManager, a11);
    objc_storeStrong((id *)&v27->_contentRuleManager, a12);
    objc_storeStrong((id *)&v27->_reachabilityProvider, a13);
    objc_storeStrong((id *)&v27->_logger, a14);
    objc_storeStrong((id *)&v27->_sessionManager, a15);
    objc_storeStrong((id *)&v27->_datastoreSynchronizationManager, a16);
    objc_storeStrong((id *)&v27->_localDatastoreManager, a17);
    objc_storeStrong((id *)&v27->_URLSchemeHandlerManager, a18);
    objc_initWeak(&location, v27);
    v29 = MEMORY[0x24BDAC760];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke;
    v48[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v24, "onTimeout:", v48);
    v46[0] = v29;
    v46[1] = 3221225472;
    v46[2] = __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke_2;
    v46[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v47, &location);
    objc_msgSend(v45, "onRetry:", v46);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }

  return v27;
}

void __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("about:blank"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "loadURL:", v1);

}

void __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loader");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "load");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWViewController;
  -[SWViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SWViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SWViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWViewController webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWViewController;
  -[SWViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  if (!self->_isWebViewPresentingInFullScreen)
  {
    -[SWViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWViewController;
  -[SWViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SWViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseAllMediaPlaybackWithCompletionHandler:", 0);

}

- (void)prewarm
{
  id v2;
  id v3;

  -[SWViewController webView](self, "webView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "loadHTMLString:baseURL:", &stru_24DA0D700, 0);

}

- (void)webViewSetNeedsLayout
{
  id v2;

  -[SWViewController webView](self, "webView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[SWViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)loadURL:(id)a3
{
  -[SWViewController loadURL:cachePolicy:](self, "loadURL:cachePolicy:", a3, 0);
}

- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id *);
  void *v12;
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __40__SWViewController_loadURL_cachePolicy___block_invoke;
  v12 = &unk_24DA0C600;
  objc_copyWeak(v14, &location);
  v7 = v6;
  v13 = v7;
  v14[1] = (id)a4;
  +[SWLoader loaderWithBlock:](SWLoader, "loaderWithBlock:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWViewController initiateLoadingWithLoader:](self, "initiateLoadingWithLoader:", v8, v9, v10, v11, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __40__SWViewController_loadURL_cachePolicy___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19[2];

  v2 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "sessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refresh");

  objc_msgSend(a1[4], "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("about:blank"));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "documentStateReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "documentWillUnload");
  else
    objc_msgSend(v8, "documentStartedLoading");

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindValue:forKey:", v12, CFSTR("URL"));

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "contentRuleManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureContentRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__SWViewController_loadURL_cachePolicy___block_invoke_2;
  v17[3] = &unk_24DA0C5D8;
  v18 = a1[4];
  objc_copyWeak(v19, v2);
  v19[1] = a1[6];
  v16 = (id)objc_msgSend(v15, "then:", v17);

  objc_destroyWeak(v19);
}

id __40__SWViewController_loadURL_cachePolicy___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isFileURL");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttribution:", 1);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(v5, "setQuery:", 0);
    objc_msgSend(v5, "setFragment:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadFileRequest:allowingReadAccessToURL:", v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:cachePolicy:timeoutInterval:", v3, *(_QWORD *)(a1 + 48), 10.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttribution:", 1);
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "webView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "loadRequest:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __43__SWViewController_loadHTMLString_baseURL___block_invoke;
  v14 = &unk_24DA0C650;
  objc_copyWeak(&v17, &location);
  v8 = v7;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  +[SWLoader loaderWithBlock:](SWLoader, "loaderWithBlock:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWViewController initiateLoadingWithLoader:](self, "initiateLoadingWithLoader:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __43__SWViewController_loadHTMLString_baseURL___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "sessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refresh");

  objc_msgSend(a1[4], "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("about:blank"));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "documentStateReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "documentWillUnload");
  else
    objc_msgSend(v8, "documentStartedLoading");

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindValue:forKey:", v12, CFSTR("baseURL"));

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "contentRuleManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureContentRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __43__SWViewController_loadHTMLString_baseURL___block_invoke_2;
  v17[3] = &unk_24DA0C628;
  v18 = a1[4];
  objc_copyWeak(&v20, v2);
  v19 = a1[5];
  v16 = (id)objc_msgSend(v15, "then:", v17);

  objc_destroyWeak(&v20);
}

id __43__SWViewController_loadHTMLString_baseURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttribution:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadSimulatedRequest:responseHTMLString:", v2, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SWViewController localDatastoreManager](self, "localDatastoreManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SWViewController sessionManager](self, "sessionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateDatastore:originatingSession:forceUpdate:completion:", v9, v11, v5, v8);

}

- (void)initiateLoadingWithLoader:(id)a3
{
  id v4;

  -[SWViewController setLoader:](self, "setLoader:", a3);
  -[SWViewController loader](self, "loader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "load");

}

- (BOOL)allowsRemoteInspection
{
  void *v2;
  char v3;

  -[SWViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_allowsRemoteInspection");

  return v3;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[SWViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDeveloperExtrasEnabled:", v3);

  -[SWViewController webView](self, "webView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInspectable:", v3);

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v3;

  -[SWViewController terminationManager](self, "terminationManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webContentProcessTerminated");

}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id v5;

  -[SWViewController documentStateReporter](self, "documentStateReporter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentIsReady");

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "navigationType"))
  {
    v8 = 1;
LABEL_5:
    v7[2](v7, v8);
    goto LABEL_6;
  }
  -[SWViewController navigationManager](self, "navigationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "actionForRequest:", v10);

  if (v11 <= 2)
  {
    v8 = qword_218DC9E98[v11];
    goto LABEL_5;
  }
LABEL_6:

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[SWViewController errorReporter](self, "errorReporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportError:", v6);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[SWViewController errorReporter](self, "errorReporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportError:", v6);

}

- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SWViewController navigationManager](self, "navigationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1840];
  objc_msgSend(v5, "linkURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "requestWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v6, "shouldPreviewRequest:", v9);

  return (char)v7;
}

- (id)webView:(id)a3 previewingViewControllerForElement:(id)a4 defaultActions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  -[SWViewController navigationManager](self, "navigationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1840];
  objc_msgSend(v6, "linkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewViewControllerForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)webView:(id)a3 commitPreviewingViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SWViewController navigationManager](self, "navigationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitViewController:", v5);

}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
  -[SWViewController setIsWebViewPresentingInFullScreen:](self, "setIsWebViewPresentingInFullScreen:", 1);
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  -[SWViewController setIsWebViewPresentingInFullScreen:](self, "setIsWebViewPresentingInFullScreen:", 0);
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[SWViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputAccessoryView
{
  void *v2;
  void *v3;

  -[SWViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInputAccessoryView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SWViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAccessoryView:", v4);

  -[SWViewController firstResponder](self, "firstResponder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadInputViews");

}

- (void)setTextInputTraits:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWViewController webView](self, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextInputTraits:", v4);

}

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWViewController webView](self, "webView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShortcutsBarWithLeadingGroups:trailingGroups:", v7, v6);

}

- (void)removeMenusForIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWViewController webView](self, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMenusForIdentifiers:", v4);

}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWMessageHandlerManager)messageHandlerManager
{
  return self->_messageHandlerManager;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (BOOL)focusShouldStartInputSession
{
  return self->_focusShouldStartInputSession;
}

- (void)setFocusShouldStartInputSession:(BOOL)a3
{
  self->_focusShouldStartInputSession = a3;
}

- (SWContentRuleManager)contentRuleManager
{
  return self->_contentRuleManager;
}

- (SWWebView)webView
{
  return self->_webView;
}

- (SWSetupManager)setupManager
{
  return self->_setupManager;
}

- (SWErrorReporting)errorReporter
{
  return self->_errorReporter;
}

- (SWDocumentStateReporting)documentStateReporter
{
  return self->_documentStateReporter;
}

- (SWTimeoutManager)timeoutManager
{
  return self->_timeoutManager;
}

- (SWProcessTerminationManager)terminationManager
{
  return self->_terminationManager;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (SWLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (SWSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager
{
  return self->_datastoreSynchronizationManager;
}

- (SWURLSchemeHandlerManager)URLSchemeHandlerManager
{
  return self->_URLSchemeHandlerManager;
}

- (SWDatastoreManager)localDatastoreManager
{
  return self->_localDatastoreManager;
}

- (BOOL)isWebViewPresentingInFullScreen
{
  return self->_isWebViewPresentingInFullScreen;
}

- (void)setIsWebViewPresentingInFullScreen:(BOOL)a3
{
  self->_isWebViewPresentingInFullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDatastoreManager, 0);
  objc_storeStrong((id *)&self->_URLSchemeHandlerManager, 0);
  objc_storeStrong((id *)&self->_datastoreSynchronizationManager, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_terminationManager, 0);
  objc_storeStrong((id *)&self->_timeoutManager, 0);
  objc_storeStrong((id *)&self->_documentStateReporter, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentRuleManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_messageHandlerManager, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
}

@end
