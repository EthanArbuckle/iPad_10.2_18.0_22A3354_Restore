@implementation WBSLPLinkMetadataProvider

+ (id)linkMetadataForURL:(id)a3 webView:(id)a4 iconCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2050000000;
  v11 = (void *)getLPMetadataProviderClass_softClass;
  v47 = (void *)getLPMetadataProviderClass_softClass;
  if (!getLPMetadataProviderClass_softClass)
  {
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = (uint64_t)__getLPMetadataProviderClass_block_invoke;
    v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E54424C0;
    v42 = (void (*)(uint64_t))&v44;
    __getLPMetadataProviderClass_block_invoke((uint64_t)&v38);
    v11 = *(void **)(v45 + 24);
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v44, 8);
  if (v12)
  {
    v13 = objc_alloc_init(v12);
    objc_msgSend(v9, "imageForHost:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = (uint64_t)&v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__11;
    v42 = __Block_byref_object_dispose__11;
    v15 = MEMORY[0x1E0C809B0];
    v43 = 0;
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke;
    v33 = &unk_1E5444770;
    v37 = &v38;
    v16 = v14;
    v34 = v16;
    v35 = v9;
    v36 = v10;
    v17 = (void *)MEMORY[0x1A85D45E4](&v30);
    objc_msgSend(v8, "URL", v30, v31, v32, v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isEqual:", v18);

    if (v19)
    {
      objc_msgSend(v13, "_startFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", v8, 1, v17);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_startFetchingMetadataForRequest:completionHandler:", v23, v17);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v24;

      objc_msgSend(v8, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v39 + 40), "setTitle:", v21);
    }

    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v26 = (void *)getLPImageClass_softClass;
    v52 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      v44 = v15;
      v45 = 3221225472;
      v46 = (uint64_t)__getLPImageClass_block_invoke;
      v47 = &unk_1E54424C0;
      v48 = &v49;
      __getLPImageClass_block_invoke((uint64_t)&v44);
      v26 = (void *)v50[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v49, 8);
    v28 = (void *)objc_msgSend([v27 alloc], "initWithPlatformImage:", v16);
    objc_msgSend(*(id *)(v39 + 40), "setIcon:", v28);

    v22 = *(id *)(v39 + 40);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
LABEL_7:
    v22 = 0;
  }

  return v22;
}

void __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke_cold_1(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_QWORD *)(a1 + 32) && v6)
      objc_msgSend(*(id *)(a1 + 40), "saveImage:forHost:", v6, *(_QWORD *)(a1 + 48));

  }
}

+ (id)unpackMetadataFromResponse:(id)a3
{
  return (id)objc_msgSend(a3, "metadata");
}

- (WBSLPLinkMetadataProvider)init
{
  return -[WBSLPLinkMetadataProvider initWithCacheDirectoryURL:](self, "initWithCacheDirectoryURL:", 0);
}

- (WBSLPLinkMetadataProvider)initWithCacheDirectoryURL:(id)a3
{
  id v4;
  WBSLPLinkMetadataProvider *v5;
  uint64_t v6;
  NSURL *cacheDirectoryURL;
  WBSLPLinkMetadataCache *v8;
  WBSLPLinkMetadataCache *v9;
  uint64_t v10;
  NSMutableDictionary *requestsToResponses;
  uint64_t v12;
  NSMutableDictionary *requestsToOperations;
  NSOperationQueue *v14;
  NSOperationQueue *operationQueue;
  void *v16;
  NSObject *v17;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *internalQueue;
  WBSLPLinkMetadataProvider *v21;
  _QWORD v23[4];
  WBSLPLinkMetadataProvider *v24;
  WBSLPLinkMetadataCache *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WBSLPLinkMetadataProvider;
  v5 = -[WBSLPLinkMetadataProvider init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cacheDirectoryURL = v5->_cacheDirectoryURL;
    v5->_cacheDirectoryURL = (NSURL *)v6;

    if (v5->_cacheDirectoryURL)
    {
      v8 = -[WBSLPLinkMetadataCache initWithCacheDirectoryURL:expirationInterval:]([WBSLPLinkMetadataCache alloc], "initWithCacheDirectoryURL:expirationInterval:", v5->_cacheDirectoryURL, 604800.0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __55__WBSLPLinkMetadataProvider_initWithCacheDirectoryURL___block_invoke;
      v23[3] = &unk_1E5444798;
      v24 = v5;
      v25 = v8;
      v9 = v8;
      -[WBSLPLinkMetadataCache openWithCompletionHandler:](v9, "openWithCompletionHandler:", v23);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    requestsToResponses = v5->_requestsToResponses;
    v5->_requestsToResponses = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    requestsToOperations = v5->_requestsToOperations;
    v5->_requestsToOperations = (NSMutableDictionary *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v14;

    -[NSOperationQueue setQualityOfService:](v5->_operationQueue, "setQualityOfService:", 17);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSLPLinkMetadataProvider.%@.%p._operationQueue"), objc_opt_class(), v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", v16);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSLPLinkMetadataProvider.%@.%p._internalQueue"), objc_opt_class(), v5);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), v17);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v19;

    v21 = v5;
  }

  return v5;
}

void __55__WBSLPLinkMetadataProvider_initWithCacheDirectoryURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = 1;
  return -[WBSLPLinkMetadataProvider _preparedResponseForRequest:](self, "_preparedResponseForRequest:", a3);
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WBSLPLinkMetadataProvider *v11;
  BOOL v12;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSLPLinkMetadataProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E54418B8;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __76__WBSLPLinkMetadataProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  void *v2;
  WBSLPLinkMetadataFetchOperation *v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_operationForRequest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = -[WBSLPLinkMetadataFetchOperation initWithRequest:operationCompletionHandler:]([WBSLPLinkMetadataFetchOperation alloc], "initWithRequest:operationCompletionHandler:", v4, 0);
    objc_msgSend(*(id *)(a1 + 40), "_setOperation:forRequest:", v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "_prepareCachedResponseForRequest:allowDelayedResponse:", v4, *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSLPLinkMetadataProvider_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __64__WBSLPLinkMetadataProvider_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeAllOperations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelAllOperations");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "savePendingChangesBeforeTermination");
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSLPLinkMetadataProvider *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__WBSLPLinkMetadataProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5441848;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __59__WBSLPLinkMetadataProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_operationForRequest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeOperationForRequest:", v3);
    objc_msgSend(v2, "cancel");
  }
  objc_msgSend(*(id *)(a1 + 40), "_discardPreparedResponseForRequest:", v3);

}

- (void)emptyCaches
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WBSLPLinkMetadataProvider_emptyCaches__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __40__WBSLPLinkMetadataProvider_emptyCaches__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllMetadataWithCompletionHandler:", &__block_literal_global_23);
}

- (void)_prepareCachedResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5444830;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  v11 = a4;
  -[WBSLPLinkMetadataProvider _getCachedMetadataForRequest:completionHandler:](self, "_getCachedMetadataForRequest:completionHandler:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  NSObject **v10;
  id v11;
  char v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_2;
    block[3] = &unk_1E5444808;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v12 = *(_BYTE *)(a1 + 48);
    dispatch_async(v6, block);
    objc_destroyWeak(&v11);

  }
}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  WBSLPLinkMetadataResponse *v3;
  void *v4;
  WBSLPLinkMetadataResponse *v5;
  WBSLPLinkMetadataFetchOperation *v6;
  uint64_t v7;
  WBSLPLinkMetadataFetchOperation *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(MEMORY[0x1E0CC11A8], "metadataWithDataRepresentation:"),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (id)v2;
    v3 = [WBSLPLinkMetadataResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSLPLinkMetadataResponse initWithURL:metadata:](v3, "initWithURL:metadata:", v4, v9);

    objc_msgSend(*(id *)(a1 + 48), "_notifyResponse:ofType:didReceiveNewData:forRequest:", v5, 0, 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = [WBSLPLinkMetadataFetchOperation alloc];
    v7 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_3;
    v10[3] = &unk_1E54447E0;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 40);
    v13 = *(_BYTE *)(a1 + 64);
    v8 = -[WBSLPLinkMetadataFetchOperation initWithRequest:operationCompletionHandler:](v6, "initWithRequest:operationCompletionHandler:", v7, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "addOperation:", v8);
    objc_msgSend(*(id *)(a1 + 48), "_setOperation:forRequest:", v8, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v12);
  }
}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didReceiveNewMetadata:forRequest:allowDelayedResponse:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)_didReceiveNewMetadata:(id)a3 forRequest:(id)a4 allowDelayedResponse:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5444858;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_copyWeak(&v15, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_2;
  v5[3] = &unk_1E5441970;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_cacheMetadata:forRequest:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_2(id *a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_3;
    block[3] = &unk_1E5441870;
    block[4] = WeakRetained;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_3(uint64_t a1)
{
  void *v2;
  WBSLPLinkMetadataResponse *v3;
  void *v4;
  WBSLPLinkMetadataResponse *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_operationForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    v3 = [WBSLPLinkMetadataResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSLPLinkMetadataResponse initWithURL:metadata:](v3, "initWithURL:metadata:", v4, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "_storePreparedResponse:forRequest:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_notifyResponse:ofType:didReceiveNewData:forRequest:", v5, 0, 1, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_removeOperationForRequest:", *(_QWORD *)(a1 + 40));

    v2 = v6;
  }

}

- (void)_getCachedMetadataForRequest:(id)a3 completionHandler:(id)a4
{
  WBSLPLinkMetadataCache *cache;
  id v6;
  void *v7;
  void (*v8)(void);
  id v9;

  cache = self->_cache;
  if (cache)
  {
    v6 = a4;
    objc_msgSend(a3, "url");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSLPLinkMetadataCache metadataForURLString:completionHandler:](cache, "metadataForURLString:completionHandler:", v7, v6);

  }
  else
  {
    v8 = (void (*)(void))*((_QWORD *)a4 + 2);
    v9 = a4;
    v8();
  }

}

- (void)_cacheMetadata:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSLPLinkMetadataCache *cache;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && self->_cache)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v8, "dataRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    cache = self->_cache;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke;
    v20[3] = &unk_1E5444880;
    v18 = v14;
    v21 = v18;
    v19 = v16;
    v22 = v19;
    v23 = v11;
    objc_copyWeak(&v24, &location);
    -[WBSLPLinkMetadataCache setMetadata:forURLString:completionHandler:](cache, "setMetadata:forURLString:completionHandler:", v12, v18, v20);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id))v10 + 2))(v10);
  }

}

void __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if (a2 && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = (void *)*((_QWORD *)WeakRetained + 5);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke_2;
      v8[3] = &unk_1E5441E68;
      v9 = *(id *)(a1 + 48);
      objc_msgSend(v5, "reuseMetadataOfURLString:forURLString:completionHandler:", v6, v7, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_notifyResponse:(id)a3 ofType:(int64_t)a4 didReceiveNewData:(BOOL)a5 forRequest:(id)a6
{
  _BOOL8 v6;
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v11;
  id v12;
  id WeakRetained;

  v6 = a5;
  p_providerDelegate = &self->_providerDelegate;
  v11 = a6;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v12, a4, v6, v11);

}

- (id)_preparedResponseForRequest:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_requestsToResponses;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToResponses, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)_discardPreparedResponseForRequest:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_requestsToResponses;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](self->_requestsToResponses, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)_storePreparedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self->_requestsToResponses;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToResponses, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (id)_operationForRequest:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToOperations, "objectForKeyedSubscript:", a3);
}

- (void)_setOperation:(id)a3 forRequest:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToOperations, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)_removeOperationForRequest:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_requestsToOperations, "removeObjectForKey:", a3);
}

- (void)_removeAllOperations
{
  -[NSMutableDictionary removeAllObjects](self->_requestsToOperations, "removeAllObjects");
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_requestsToOperations, 0);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
}

void __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Fetching Link Presentation metadata for share sheet failed: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
