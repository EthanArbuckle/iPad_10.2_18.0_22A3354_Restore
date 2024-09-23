@implementation WBSLPLinkMetadataFetchOperation

- (WBSLPLinkMetadataFetchOperation)initWithRequest:(id)a3 operationCompletionHandler:(id)a4
{
  id v6;
  WBSLPLinkMetadataFetchOperation *v7;
  uint64_t v8;
  id operationCompletionHandler;
  WBSLPLinkMetadataFetchOperation *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLPLinkMetadataFetchOperation;
  v7 = -[WBSSiteMetadataFetchOperation initWithRequest:](&v12, sel_initWithRequest_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    operationCompletionHandler = v7->_operationCompletionHandler;
    v7->_operationCompletionHandler = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  WBSLPLinkMetadataFetchOperation *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 1);
  if (-[WBSLPLinkMetadataFetchOperation isCancelled](self, "isCancelled"))
  {
    -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
    v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543618;
      v18 = objc_opt_class();
      v19 = 2048;
      v20 = self;
      _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Aborted fetch operation <%{public}@ %p> due to cancellation", buf, 0x16u);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C92C80];
    -[WBSSiteMetadataFetchOperation request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_nonAppInitiatedRequestWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CC11E0]);
    objc_msgSend(v9, "_setShouldDownloadMediaSubresources:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "_setFetchIsNotUserInitiated:", 1);
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[WBSSiteMetadataFetchOperation request](self, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138739971;
      v18 = (uint64_t)v13;
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Fetching LP metadata for URL: %{sensitive}@.", buf, 0xCu);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__WBSLPLinkMetadataFetchOperation_start__block_invoke;
    v14[3] = &unk_1E5449000;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "startFetchingMetadataForRequest:completionHandler:", v8, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

void __40__WBSLPLinkMetadataFetchOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v5)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __40__WBSLPLinkMetadataFetchOperation_start__block_invoke_cold_1(v8, WeakRetained, v6);
    }
    if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
    {
      v9 = WeakRetained[33];
      if (v9)
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
    objc_msgSend(WeakRetained, "_setStatus:", 2);
  }

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSLPLinkMetadataFetchOperation;
  -[WBSLPLinkMetadataFetchOperation cancel](&v3, sel_cancel);
  if ((-[WBSLPLinkMetadataFetchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (-[WBSSiteMetadataFetchOperation isExecuting](self, "isExecuting"))
      -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
  }
}

- (id)description
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

  return v8;
}

- (id)operationCompletionHandler
{
  return self->_operationCompletionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationCompletionHandler, 0);
}

void __40__WBSLPLinkMetadataFetchOperation_start__block_invoke_cold_1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138740227;
  v11 = v8;
  v12 = 2114;
  v13 = v9;
  _os_log_error_impl(&dword_1A840B000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch LP metadata for URL: %{sensitive}@ with error: %{public}@.", (uint8_t *)&v10, 0x16u);

}

@end
