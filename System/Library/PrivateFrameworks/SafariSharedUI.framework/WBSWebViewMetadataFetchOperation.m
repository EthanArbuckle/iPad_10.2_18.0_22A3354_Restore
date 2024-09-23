@implementation WBSWebViewMetadataFetchOperation

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSWebViewMetadataFetchOperation;
  -[WBSWebViewMetadataFetchOperation dealloc](&v2, sel_dealloc);
}

- (WKWebViewConfiguration)webViewConfiguration
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v2, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOfflineApplicationCacheIsEnabled:", 0);

  objc_msgSend(v2, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend(v2, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  return (WKWebViewConfiguration *)v2;
}

- (CGSize)webViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpWebViewAndStartOffscreenFetching
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  -[WBSWebViewMetadataFetchOperation webViewSize](self, "webViewSize");
  v5 = v4;
  v7 = v6;
  -[WBSWebViewMetadataFetchOperation webViewConfiguration](self, "webViewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__WBSWebViewMetadataFetchOperation__setUpWebViewAndStartOffscreenFetching__block_invoke;
  v10[3] = &unk_1E5449058;
  objc_copyWeak(&v12, &location);
  v9 = WeakRetained;
  v11 = v9;
  objc_msgSend(v9, "webViewMetadataFetchOperation:getWebViewOfSize:withConfiguration:completionHandler:", self, v8, v10, v5, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __74__WBSWebViewMetadataFetchOperation__setUpWebViewAndStartOffscreenFetching__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isCancelled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "webViewMetadataFetchOperation:didFinishUsingWebView:", v5, v6);
      objc_msgSend(v5, "_setStatus:", 2);
    }
    else
    {
      objc_storeStrong(v5 + 34, a2);
      objc_msgSend(v5[34], "setNavigationDelegate:", v5);
      objc_msgSend(v5, "didCreateWebView");
      objc_msgSend(v5, "startOffscreenFetching");
    }
  }

}

- (void)clearWebView
{
  id WeakRetained;
  WKWebView *webView;

  if (self->_webView)
  {
    -[WBSWebViewMetadataFetchOperation willClearWebView](self, "willClearWebView");
    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", 0);
    -[WKWebView stopLoading](self->_webView, "stopLoading");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "webViewMetadataFetchOperation:didFinishUsingWebView:", self, self->_webView);

    webView = self->_webView;
    self->_webView = 0;

  }
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  WBSWebViewMetadataFetchOperation *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 1);
  if (-[WBSWebViewMetadataFetchOperation isCancelled](self, "isCancelled"))
  {
    -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
    v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543618;
      v7 = objc_opt_class();
      v8 = 2048;
      v9 = self;
      _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Aborted fetch operation <%{public}@ %p> due to cancellation", buf, 0x16u);

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__WBSWebViewMetadataFetchOperation_start__block_invoke;
    block[3] = &unk_1E5441CB8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __41__WBSWebViewMetadataFetchOperation_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUpWebViewAndStartOffscreenFetching");
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBSWebViewMetadataFetchOperation;
  -[WBSWebViewMetadataFetchOperation cancel](&v4, sel_cancel);
  if ((-[WBSWebViewMetadataFetchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (-[WBSSiteMetadataFetchOperation isExecuting](self, "isExecuting"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__WBSWebViewMetadataFetchOperation_cancel__block_invoke;
      block[3] = &unk_1E5441CB8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __42__WBSWebViewMetadataFetchOperation_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearWebView");
  return objc_msgSend(*(id *)(a1 + 32), "_setStatus:", 2);
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

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  -[WBSWebViewMetadataFetchOperation didFailFetchWithError:](self, "didFailFetchWithError:", a5, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[WBSWebViewMetadataFetchOperation didFailFetchWithError:](self, "didFailFetchWithError:", a5, a4);
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariSharedUI.WBSWebViewMetadataFetchOperation"), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSWebViewMetadataFetchOperation didFailFetchWithError:](self, "didFailFetchWithError:", v4);

}

- (WBSWebViewMetadataFetchOperationDelegate)delegate
{
  return (WBSWebViewMetadataFetchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
