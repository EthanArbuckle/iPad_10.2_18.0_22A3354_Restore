@implementation ICMediaAPIURLMappingProvider

- (id)getCurrentURLMappingSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  ICMediaAPIURLMappingSet *v7;
  NSObject *v8;
  int v10;
  ICMediaAPIURLMappingProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ICMediaAPIURLMappingProvider _loadCacheDictionary](self, "_loadCacheDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load mapping cache", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "ic_arrayValueForKey:", CFSTR("mappings"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load url mappings from cache file", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v6 = v5;
  v7 = -[ICMediaAPIURLMappingSet initWithResponsePayload:]([ICMediaAPIURLMappingSet alloc], "initWithResponsePayload:", v5);
LABEL_10:

  return v7;
}

- (void)updateURLMappingsWithCompletion:(id)a3
{
  id v4;
  ICStoreRequestContext *v5;
  void *v6;
  ICStoreRequestContext *v7;
  void *v8;
  ICStoreRequestContext *v9;
  id v10;
  _QWORD v11[5];
  ICStoreRequestContext *v12;
  id v13;

  v4 = a3;
  v5 = [ICStoreRequestContext alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICStoreRequestContext initWithIdentity:](v5, "initWithIdentity:", v6);

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke;
  v11[3] = &unk_1E4390DA0;
  v12 = v7;
  v13 = v4;
  v11[4] = self;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v9, v11);

}

- (void)clearCachedURLMappings
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  ICMediaAPIURLMappingProvider *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing cache file", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMediaAPIURLMappingProvider _cacheFileURL](self, "_cacheFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v4, "removeItemAtURL:error:", v5, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove cache file. err=%{public}@", buf, 0x16u);
    }

  }
}

- (void)setCurrentURLMappingSet:(id)a3
{
  id v4;

  objc_msgSend(a3, "responsePayload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMediaAPIURLMappingProvider _saveCachedResponsePayload:eTag:](self, "_saveCachedResponsePayload:eTag:", v4, 0);

}

- (id)_cacheFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  MSVMobileHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.iTunesCloud/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("media_api_url_map.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_loadCacheDictionary
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  ICMediaAPIURLMappingProvider *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ICMediaAPIURLMappingProvider _cacheFileURL](self, "_cacheFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v3, &v8);
  v5 = v8;
  if (!v4)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load cache from file. err=%{public}@", buf, 0x16u);
    }

  }
  return v4;
}

- (void)_saveCachedResponsePayload:(id)a3 eTag:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  ICMediaAPIURLMappingProvider *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("mappings"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("etag"));
  -[ICMediaAPIURLMappingProvider _cacheFileURL](self, "_cacheFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  LOBYTE(v8) = objc_msgSend(v9, "writeToURL:error:", v10, &v13);
  v11 = v13;

  if ((v8 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save cache dicationry. err=%{public}@", buf, 0x16u);
    }

  }
}

void __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICURLRequest *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("url-regex-map"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v6);
      objc_msgSend(*(id *)(a1 + 32), "_loadCacheDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_stringValueForKey:", CFSTR("etag"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v7, "setValue:forHTTPHeaderField:", v9, CFSTR("ETag"));
      v10 = -[ICURLRequest initWithURLRequest:requestContext:]([ICURLRequest alloc], "initWithURLRequest:requestContext:", v7, *(_QWORD *)(a1 + 40));
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke_14;
      v17[3] = &unk_1E4391008;
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v10, v17);

    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Regex map file url is missing from the bag - skipping", buf, 0xCu);
      }

      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
    }

  }
  else
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ICMediaAPIURLMappingSet *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch url mapping file from server. err=%{public}@", (uint8_t *)&v18, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "parsedBodyArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v18 = 138543618;
        v19 = v11;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetched updated url mappings %{public}@", (uint8_t *)&v18, 0x16u);
      }

      objc_msgSend(v5, "urlResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_valueForHTTPHeaderField:", CFSTR("ETag"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_saveCachedResponsePayload:eTag:", v9, v13);
      v14 = -[ICMediaAPIURLMappingSet initWithResponsePayload:]([ICMediaAPIURLMappingSet alloc], "initWithResponsePayload:", v9);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to parse url mappings from response body", (uint8_t *)&v18, 0xCu);
      }

      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v12);
    }

  }
}

+ (ICMediaAPIURLMappingProvider)sharedProvider
{
  if (sharedProvider___onceToken != -1)
    dispatch_once(&sharedProvider___onceToken, &__block_literal_global_34490);
  return (ICMediaAPIURLMappingProvider *)(id)sharedProvider___mappingProvider;
}

void __46__ICMediaAPIURLMappingProvider_sharedProvider__block_invoke()
{
  ICMediaAPIURLMappingProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ICMediaAPIURLMappingProvider);
  v1 = (void *)sharedProvider___mappingProvider;
  sharedProvider___mappingProvider = (uint64_t)v0;

}

@end
