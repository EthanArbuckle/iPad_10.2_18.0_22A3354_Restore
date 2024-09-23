@implementation PKObjectDownloader

+ (id)sharedImageAssetDownloader
{
  if (qword_1ECF22560 != -1)
    dispatch_once(&qword_1ECF22560, &__block_literal_global_100);
  return (id)_MergedGlobals_231;
}

void __48__PKObjectDownloader_sharedImageAssetDownloader__block_invoke()
{
  void *v0;
  PKObjectDownloader *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeoutIntervalForResource:", 30.0);
  objc_msgSend(v3, "setRequestCachePolicy:", 0);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PKObjectDownloader initWithSession:]([PKObjectDownloader alloc], "initWithSession:", v0);
  v2 = (void *)_MergedGlobals_231;
  _MergedGlobals_231 = (uint64_t)v1;

}

- (PKObjectDownloader)init
{
  void *v3;
  PKObjectDownloader *v4;

  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKObjectDownloader initWithSession:](self, "initWithSession:", v3);

  return v4;
}

- (PKObjectDownloader)initWithSession:(id)a3
{
  id v5;
  PKObjectDownloader *v6;
  PKObjectDownloader *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v10;
  NSMutableDictionary *downloads;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *pendingURLs;
  NSMutableSet *v14;
  NSMutableSet *downloadingURLs;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKObjectDownloader;
  v6 = -[PKObjectDownloader init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = dispatch_queue_create("com.apple.passKitCore.PKObjectDownloader", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    downloads = v7->_downloads;
    v7->_downloads = v10;

    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    pendingURLs = v7->_pendingURLs;
    v7->_pendingURLs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    downloadingURLs = v7->_downloadingURLs;
    v7->_downloadingURLs = v14;

    objc_msgSend(v5, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_concurrentRequests = objc_msgSend(v16, "HTTPMaximumConnectionsPerHost");

  }
  return v7;
}

- (void)_handleResponseForURL:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKObjectDownloader__handleResponseForURL_data_response_error___block_invoke;
  block[3] = &unk_1E2AC0F68;
  block[4] = self;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, block);

}

void __64__PKObjectDownloader__handleResponseForURL_data_response_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_logStringFromResponse:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: response: %@ error: %@", buf, 0x16u);

    }
    objc_msgSend(v2, "completionHandlers");
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_schedulePendingDownloads");
  }
  else if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logStringFromResponse:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Found no matching download for response: %@ error: %@", buf, 0x16u);

  }
}

- (void)_schedulePendingDownloads
{
  id v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableOrderedSet *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_pendingURLs;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412290;
    v19 = v6;
    v20 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v11 = -[NSMutableSet count](self->_downloadingURLs, "count", v19);
        if (v11 < -[PKObjectDownloader concurrentRequests](self, "concurrentRequests"))
        {
          -[NSMutableDictionary objectForKey:](self->_downloads, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          PKLogFacilityTypeGetObject(2uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "task");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "currentRequest");
            v15 = v4;
            v16 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKObjectDownloader _logStringFromRequest:](self, "_logStringFromRequest:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v27 = v18;
            _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Performing queued request:%@", buf, 0xCu);

            v3 = v16;
            v4 = v15;
            v8 = v20;

            v7 = v21;
          }

          -[PKObjectDownloader _scheduleDownload:forURL:](self, "_scheduleDownload:forURL:", v12, v10);
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  -[NSMutableOrderedSet removeObjectsInArray:](self->_pendingURLs, "removeObjectsInArray:", v3);
}

- (void)_scheduleDownload:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_downloadingURLs, "containsObject:", v7) & 1) != 0)
  {
    PKLogFacilityTypeGetObject(2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "task");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObjectDownloader _logStringFromRequest:](self, "_logStringFromRequest:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Error - attempted to schedule already downloading request:%@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    -[NSMutableSet addObject:](self->_downloadingURLs, "addObject:", v7);
    objc_msgSend(v6, "task");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject resume](v8, "resume");
  }

}

- (id)cachedDataForURL:(id)a3
{
  NSURLSession *session;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  session = self->_session;
  v5 = a3;
  -[NSURLSession configuration](session, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C92C80];
  v9 = objc_msgSend(v6, "requestCachePolicy");
  objc_msgSend(v6, "timeoutIntervalForRequest");
  objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cachedResponseForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v11, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v19 = objc_msgSend(v15, "statusCode");
    PKLogFacilityTypeGetObject(2uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v15 && v19 >= 200 && v19 <= 299)
    {
      if (v21)
      {
        -[PKObjectDownloader _logStringFromCachedResponse:data:](self, "_logStringFromCachedResponse:data:", v11, v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v22;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Returning cached data for response: %@", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      if (v21)
      {
        -[PKObjectDownloader _logStringFromCachedResponse:data:](self, "_logStringFromCachedResponse:data:", v11, v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v23;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Not returning cached data for response since the status was not 200: %@", (uint8_t *)&v25, 0xCu);

      }
      v20 = v13;
      v13 = 0;
    }

    v16 = v13;
    v18 = v16;
  }
  else
  {
    PKLogFacilityTypeGetObject(2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[PKObjectDownloader _logStringFromRequest:](self, "_logStringFromRequest:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: No cached data found for request: %@", (uint8_t *)&v25, 0xCu);

    }
    v18 = 0;
  }

  return v18;
}

- (void)downloadFromUrl:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[PKObjectDownloader session](self, "session");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C92C80];
  objc_msgSend(v13, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requestCachePolicy");
  objc_msgSend(v13, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeoutIntervalForRequest");
  objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKObjectDownloader downloadWithRequest:completionHandler:](self, "downloadWithRequest:completionHandler:", v12, v6);
}

- (void)downloadWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *queue;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E2ABE1E8;
    v14[4] = self;
    v15 = v8;
    v16 = v6;
    v17 = v7;
    dispatch_async(queue, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(2uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: No URL for request: %@", buf, 0xCu);
    }

    if (v7)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, 0);
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v13);

    }
  }

}

void __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKObjectDownload *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, void *);
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    PKLogFacilityTypeGetObject(2uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_logStringFromRequest:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKObjectDownloader: Queueing completion onto existing download for: %@", buf, 0xCu);

    }
    objc_msgSend(v2, "completionHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    objc_msgSend(v5, "addObject:", v6);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(PKObjectDownload);
    -[PKObjectDownload completionHandlers](v8, "completionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));
    v11 = *(void **)(a1 + 48);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke_27;
    v22 = &unk_1E2ACDFA0;
    v23 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v24, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObjectDownload setTask:](v8, "setTask:", v12, v19, v20, v21, v22, v23);
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    v14 = objc_msgSend(*(id *)(a1 + 32), "concurrentRequests");
    PKLogFacilityTypeGetObject(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 >= v14)
    {
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "_logStringFromRequest:", *(_QWORD *)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Queueing request:%@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "_logStringFromRequest:", *(_QWORD *)(a1 + 48));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Performing request:%@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_scheduleDownload:forURL:", v8, *(_QWORD *)(a1 + 40));
    }

  }
}

void __60__PKObjectDownloader_downloadWithRequest_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_handleResponseForURL:data:response:error:", v11, v10, v9, v8);

}

- (id)_logStringFromRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "HTTPMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHTTPHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n%@ %@\n%@\n%@\n"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_logStringFromCachedResponse:(id)a3 data:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKObjectDownloader _logStringFromResponse:data:](self, "_logStringFromResponse:data:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_logStringFromResponse:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v5;
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "statusCode");
    objc_msgSend(v9, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "length");

    objc_msgSend(v8, "stringWithFormat:", CFSTR("\n%@ %ld\n%@\nData length: %lu\n"), v10, v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "length");

    objc_msgSend(v8, "stringWithFormat:", CFSTR("\n%@\nData length: %lu\n"), v10, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PKObjectDownloader_invalidate__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__PKObjectDownloader_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidateAndCancel");
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)concurrentRequests
{
  return self->_concurrentRequests;
}

- (void)setConcurrentRequests:(int64_t)a3
{
  self->_concurrentRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadingURLs, 0);
  objc_storeStrong((id *)&self->_pendingURLs, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
