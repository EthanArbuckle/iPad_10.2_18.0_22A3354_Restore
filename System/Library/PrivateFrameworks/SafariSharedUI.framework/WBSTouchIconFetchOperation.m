@implementation WBSTouchIconFetchOperation

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3
{

  return 0;
}

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[WBSTouchIconFetchOperation initWithRequest:allowFetchingOverCellularNetwork:completionHandler:](self, "initWithRequest:allowFetchingOverCellularNetwork:completionHandler:", a3, 1, a4);
}

- (WBSTouchIconFetchOperation)initWithRequest:(id)a3 allowFetchingOverCellularNetwork:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  WBSTouchIconFetchOperation *v10;
  WBSTouchIconFetchOperation *v11;
  uint64_t v12;
  id completionHandler;
  NSObject *v14;
  os_activity_t v15;
  OS_os_activity *activity;
  WBSTouchIconFetchOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (!v9)
    goto LABEL_5;
  v22.receiver = self;
  v22.super_class = (Class)WBSTouchIconFetchOperation;
  v10 = -[WBSSiteMetadataFetchOperation initWithRequest:](&v22, sel_initWithRequest_, v8);
  if (!v10)
  {
    objc_msgSend(v8, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:](WBSTouchIconFetchOperationResult, "resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:", v19, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v20);

    self = 0;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v11 = v10;
  v12 = MEMORY[0x1A85D45E4](v9);
  completionHandler = v11->_completionHandler;
  v11->_completionHandler = (id)v12;

  v11->_allowFetchingOverCellularNetwork = a4;
  objc_msgSend(v8, "activity");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = _os_activity_create(&dword_1A840B000, "Touch Icon Fetch Operation", v14, OS_ACTIVITY_FLAG_DEFAULT);

  activity = v11->_activity;
  v11->_activity = (OS_os_activity *)v15;

  self = v11;
  v17 = self;
LABEL_6:

  return v17;
}

- (BOOL)_shouldFetchOverPrivateRelay
{
  void *v2;
  unint64_t v3;

  -[WBSSiteMetadataFetchOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = ((unint64_t)objc_msgSend(v2, "options") >> 2) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WBSSiteMetadataFetchOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@, Request URL: %@>"), self, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[WBSSiteMetadataFetchOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WBSTouchIconFetchOperation *v4;
  WBSTouchIconFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (WBSTouchIconFetchOperation *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSSiteMetadataFetchOperation request](self, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSiteMetadataFetchOperation request](v5, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)webViewConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSTouchIconFetchOperation;
  -[WBSWebViewMetadataFetchOperation webViewConfiguration](&v8, sel_webViewConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setGroupIdentifier:", CFSTR("TouchIconExtractor"));
  if (self->_allowFetchingOverCellularNetwork)
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWebsiteDataStore:", v4);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF738]), "initNonPersistentConfiguration");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setAllowsCellularAccess:", 0);
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreWithConfiguration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWebsiteDataStore:", v5);

  }
  if (-[WBSTouchIconFetchOperation _shouldFetchOverPrivateRelay](self, "_shouldFetchOverPrivateRelay"))
  {
    objc_msgSend(v3, "defaultWebpagePreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v6, "_networkConnectionIntegrityPolicy") | 0x10);

  }
  return v3;
}

- (void)resetState
{
  NSTimer *loadingTimeoutTimer;
  NSArray *pendingTouchIconURLs;

  -[NSTimer invalidate](self->_loadingTimeoutTimer, "invalidate");
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = 0;

  pendingTouchIconURLs = self->_pendingTouchIconURLs;
  self->_pendingTouchIconURLs = 0;

  self->_state = 0;
}

- (void)loadRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WBSWebViewMetadataFetchOperation webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C92C80];
  -[WBSSiteMetadataFetchOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_nonAppInitiatedRequestWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "loadRequest:", v7);

  -[WBSTouchIconFetchOperation _scheduleTimeoutWithTimeInterval:](self, "_scheduleTimeoutWithTimeInterval:", 30.0);
}

- (void)didCompleteWithResult:(id)a3
{
  (*((void (**)(void))self->_completionHandler + 2))();
  -[WBSTouchIconFetchOperation clearWebView](self, "clearWebView");
  -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
}

- (void)_setUpRemoteObjectProxies
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *touchIconObserverInterface;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE9C99C8);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  touchIconObserverInterface = self->_touchIconObserverInterface;
  self->_touchIconObserverInterface = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](self->_touchIconObserverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didFetchTouchIconURLs_andFaviconURLs_forURL_, 0, 0);
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](self->_touchIconObserverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didFetchTouchIconURLs_andFaviconURLs_forURL_, 1, 0);
  -[WBSWebViewMetadataFetchOperation webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_remoteObjectRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerExportedObject:interface:", self, self->_touchIconObserverInterface);

}

- (void)_tearDownRemoteObjectProxies
{
  void *v3;
  id v4;

  -[WBSWebViewMetadataFetchOperation webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_remoteObjectRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExportedObject:interface:", self, self->_touchIconObserverInterface);

}

- (void)startOffscreenFetching
{
  NSObject *activity;
  _QWORD block[5];

  if (-[WBSTouchIconFetchOperation isCancelled](self, "isCancelled"))
  {
    -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
  }
  else
  {
    activity = self->_activity;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WBSTouchIconFetchOperation_startOffscreenFetching__block_invoke;
    block[3] = &unk_1E5441CB8;
    block[4] = self;
    os_activity_apply(activity, block);
  }
}

void __52__WBSTouchIconFetchOperation_startOffscreenFetching__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 141558275;
    v10 = 1752392040;
    v11 = 2117;
    v12 = v6;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Touch Icon fetch operation started for URL %{sensitive, mask.hash}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "loadRequest");
  v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138739971;
    v10 = v8;
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Started offscreen touch icon fetch request for %{sensitive}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)clearWebView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  -[WBSWebViewMetadataFetchOperation clearWebView](&v3, sel_clearWebView);
  -[NSTimer invalidate](self->_loadingTimeoutTimer, "invalidate");
}

- (void)_scheduleTimeoutWithTimeInterval:(double)a3
{
  void *v5;
  NSTimer *v6;
  NSTimer *loadingTimeoutTimer;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke;
  v8[3] = &unk_1E5442518;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, a3);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  os_activity_t *WeakRetained;
  os_activity_t *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_activity_t v9;

  v9 = a2;
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[36] == v9)
  {
    os_activity_apply(WeakRetained[41], &__block_literal_global_50);
    -[os_activity_t request](v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:](WBSTouchIconFetchOperationResult, "resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:", v7, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_activity_t didCompleteWithResult:](v4, "didCompleteWithResult:", v8);

  }
}

void __63__WBSTouchIconFetchOperation__scheduleTimeoutWithTimeInterval___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A840B000, v0, OS_LOG_TYPE_INFO, "Touch Icon fetch operation timed out.", v1, 2u);
  }
}

- (void)_downloadFirstValidImageWithURLs:(id)a3 failureHandler:(id)a4
{
  id v6;
  uint64_t allowFetchingOverCellularNetwork;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  allowFetchingOverCellularNetwork = self->_allowFetchingOverCellularNetwork;
  v8 = a3;
  if (-[WBSTouchIconFetchOperation _shouldFetchOverPrivateRelay](self, "_shouldFetchOverPrivateRelay"))
    allowFetchingOverCellularNetwork |= 4uLL;
  +[WBSImageFetchingURLSessionTaskManager sharedManager](WBSImageFetchingURLSessionTaskManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke;
  v11[3] = &unk_1E5446E80;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "downloadFirstValidImageWithURLs:options:completionHandler:", v8, allowFetchingOverCellularNetwork, v11);

}

void __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 328);
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_2;
  block[3] = &unk_1E5441EB8;
  block[4] = v16;
  v19 = v13;
  v36 = v19;
  v20 = v11;
  v37 = v20;
  v21 = v15;
  v38 = v21;
  os_activity_apply(v17, block);
  if (v20)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_66;
    v30[3] = &unk_1E5446E58;
    v30[4] = &v31;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v30);
    objc_msgSend(*(id *)(a1 + 32), "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(*(id *)(a1 + 32), "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "url");
    if ((isKindOfClass & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "host");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = *((_BYTE *)v32 + 24);
      +[WBSTouchIconFetchOperationResult resultWithFavicon:iconData:iconURL:host:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:](WBSTouchIconFetchOperationResult, "resultWithFavicon:iconData:iconURL:host:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:", v20, v12, v19, v26, 1, v14, v29);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "host");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "containsObject:", v19);
      +[WBSTouchIconFetchOperationResult resultWithTouchIcon:host:isFavicon:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:](WBSTouchIconFetchOperationResult, "resultWithTouchIcon:host:isFavicon:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:", v20, v26, v27 ^ 1u, 1, v14, *((unsigned __int8 *)v32 + 24));
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "didCompleteWithResult:", v28);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = v2;
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v8 = a1[6];
    v9 = a1[7];
    v10 = 141559811;
    v11 = 1752392040;
    v12 = 2117;
    v13 = v6;
    v14 = 2160;
    v15 = 1752392040;
    v16 = 2117;
    v17 = v7;
    v18 = 2160;
    v19 = 1752392040;
    v20 = 2117;
    v21 = v8;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2117;
    v25 = v9;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Downloaded image from first valid URL for URL %{sensitive, mask.hash}@. First valid URL %{sensitive, mask.hash}@, image %{sensitive, mask.hash}@, errors %{sensitive, mask.hash}@", (uint8_t *)&v10, 0x52u);

  }
}

uint64_t __78__WBSTouchIconFetchOperation__downloadFirstValidImageWithURLs_failureHandler___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "safari_isOrContainsClientSideNetworkError");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_downloadPendingTouchIconURLs
{
  NSObject *activity;
  uint64_t v4;
  NSArray *pendingTouchIconURLs;
  _QWORD v6[5];
  _QWORD block[5];

  activity = self->_activity;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  os_activity_apply(activity, block);
  self->_state = 3;
  pendingTouchIconURLs = self->_pendingTouchIconURLs;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke_70;
  v6[3] = &unk_1E5446EA8;
  v6[4] = self;
  -[WBSTouchIconFetchOperation _downloadFirstValidImageWithURLs:failureHandler:](self, "_downloadFirstValidImageWithURLs:failureHandler:", pendingTouchIconURLs, v6);
}

void __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 141558275;
    v8 = 1752392040;
    v9 = 2117;
    v10 = v6;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Downloading pending icon URLs for URL %{sensitive, mask.hash}@", (uint8_t *)&v7, 0x16u);

  }
}

void __59__WBSTouchIconFetchOperation__downloadPendingTouchIconURLs__block_invoke_70(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:](WBSTouchIconFetchOperationResult, "resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:", v5, 1, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "didCompleteWithResult:", v6);
}

- (void)didFailFetchWithError:(id)a3
{
  id v4;
  NSObject *activity;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  WBSTouchIconFetchOperation *v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSTouchIconFetchOperation;
  -[WBSWebViewMetadataFetchOperation didFailFetchWithError:](&v17, sel_didFailFetchWithError_, v4);
  activity = self->_activity;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke;
  v14 = &unk_1E5441848;
  v15 = self;
  v16 = v4;
  v6 = v4;
  os_activity_apply(activity, &v11);
  -[WBSSiteMetadataFetchOperation request](self, "request", v11, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSTouchIconFetchOperationResult resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:](WBSTouchIconFetchOperationResult, "resultForFetchFailureWithHost:pageRequestDidSucceed:response:error:", v9, 0, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTouchIconFetchOperation didCompleteWithResult:](self, "didCompleteWithResult:", v10);

}

void __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke_cold_1(a1, v2);
}

- (void)didCreateWebView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  -[WBSWebViewMetadataFetchOperation didCreateWebView](&v3, sel_didCreateWebView);
  -[WBSTouchIconFetchOperation _setUpRemoteObjectProxies](self, "_setUpRemoteObjectProxies");
}

- (void)willClearWebView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconFetchOperation;
  -[WBSWebViewMetadataFetchOperation willClearWebView](&v3, sel_willClearWebView);
  -[WBSTouchIconFetchOperation _tearDownRemoteObjectProxies](self, "_tearDownRemoteObjectProxies");
}

- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *activity;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSTimer *loadingTimeoutTimer;
  void *v17;
  id v18;
  void *v19;
  NSSet *v20;
  NSSet *touchIconURLs;
  int64_t state;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD block[4];
  id v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity = self->_activity;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke;
  block[3] = &unk_1E5441870;
  v13 = v8;
  v31 = v13;
  v14 = v9;
  v32 = v14;
  v15 = v10;
  v33 = v15;
  os_activity_apply(activity, block);
  -[NSTimer invalidate](self->_loadingTimeoutTimer, "invalidate");
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = 0;

  -[WBSSiteMetadataFetchOperation request](self, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(activity) = objc_opt_isKindOfClass();

  if ((activity & 1) != 0)
  {
    v18 = v14;
  }
  else
  {
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
  touchIconURLs = self->_touchIconURLs;
  self->_touchIconURLs = v20;

  state = self->_state;
  switch(state)
  {
    case 2:
      v23 = objc_msgSend(v19, "copy");
      v24 = (void *)v23;
      if (v23)
        v25 = (void *)v23;
      else
        v25 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&self->_pendingTouchIconURLs, v25);

      -[WBSTouchIconFetchOperation _downloadPendingTouchIconURLs](self, "_downloadPendingTouchIconURLs");
      break;
    case 1:
      v26 = objc_msgSend(v19, "copy");
      v27 = (void *)v26;
      if (v26)
        v28 = (void *)v26;
      else
        v28 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&self->_pendingTouchIconURLs, v28);

      break;
    case 0:
      self->_state = 1;
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke_78;
      v29[3] = &unk_1E5446EA8;
      v29[4] = self;
      -[WBSTouchIconFetchOperation _downloadFirstValidImageWithURLs:failureHandler:](self, "_downloadFirstValidImageWithURLs:failureHandler:", v19, v29);
      break;
  }

}

void __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = 141559299;
    v7 = 1752392040;
    v8 = 2117;
    v9 = v3;
    v10 = 2160;
    v11 = 1752392040;
    v12 = 2117;
    v13 = v4;
    v14 = 2160;
    v15 = 1752392040;
    v16 = 2117;
    v17 = v5;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Extracted touch icon URLs %{sensitive, mask.hash}@, favicon URLs %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x3Eu);
  }
}

uint64_t __74__WBSTouchIconFetchOperation_didFetchTouchIconURLs_andFaviconURLs_forURL___block_invoke_78(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 296))
    return objc_msgSend(*(id *)(a1 + 32), "_downloadPendingTouchIconURLs");
  *(_QWORD *)(v1 + 312) = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleTimeoutWithTimeInterval:", 10.0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v6;
  void *v7;
  unsigned int v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend(a4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safari_isHTTPFamilyURL");

  v9[2](v9, v8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_touchIconURLs, 0);
  objc_storeStrong((id *)&self->_pendingTouchIconURLs, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_touchIconObserverInterface, 0);
}

void __52__WBSTouchIconFetchOperation_didFailFetchWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 141558531;
  v9 = 1752392040;
  v10 = 2117;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1A840B000, v4, OS_LOG_TYPE_ERROR, "Failed to extract icon URLs for URL %{sensitive, mask.hash}@. %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
