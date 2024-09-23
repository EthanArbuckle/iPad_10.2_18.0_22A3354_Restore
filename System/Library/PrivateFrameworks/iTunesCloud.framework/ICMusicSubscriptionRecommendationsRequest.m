@implementation ICMusicSubscriptionRecommendationsRequest

- (ICMusicSubscriptionRecommendationsRequest)initWithRequestContext:(id)a3 seedItemID:(int64_t)a4 isLibraryID:(BOOL)a5 maxResultCount:(int64_t)a6
{
  id v11;
  ICMusicSubscriptionRecommendationsRequest *v12;
  ICMusicSubscriptionRecommendationsRequest *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICMusicSubscriptionRecommendationsRequest;
  v12 = -[ICRequestOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestContext, a3);
    v13->_seedItemID = a4;
    v13->_isLibraryID = a5;
    v13->_maxResultCount = a6;
  }

  return v13;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ICMusicSubscriptionRecommendationsRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  int64_t seedItemID;
  _BOOL4 isLibraryID;
  void *v6;
  ICStoreRequestContext *requestContext;
  _QWORD v8[5];
  uint8_t buf[4];
  ICMusicSubscriptionRecommendationsRequest *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    seedItemID = self->_seedItemID;
    isLibraryID = self->_isLibraryID;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2048;
    v12 = seedItemID;
    v13 = 1024;
    v14 = isLibraryID;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with seed itemID %lld, isLibraryID=%d", buf, 0x1Cu);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke;
  v8[3] = &unk_1E4391658;
  v8[4] = self;
  objc_msgSend(v6, "getBagForRequestContext:forceRefetch:withCompletionHandler:", requestContext, 0, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsList, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICStoreRequestContext *v14;
  void *v15;
  ICStoreRequestContext *v16;
  void *v17;
  ICStoreRequestContext *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  ICStoreRequestContext *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "finishWithError:");

  }
  else
  {
    if (*(_BYTE *)(v3 + 320))
      v5 = CFSTR("cloudId");
    else
      v5 = CFSTR("adamId");
    v24[0] = v5;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(_QWORD *)(v3 + 312);
    v8 = v5;
    objc_msgSend(v6, "numberWithLongLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v24[1] = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = CFSTR("version");
    v25[1] = v12;
    v25[2] = CFSTR("1.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [ICStoreRequestContext alloc];
    +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICStoreRequestContext initWithIdentity:](v14, "initWithIdentity:", v15);

    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_2;
    v21[3] = &unk_1E438B0B0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v13;
    v23 = v16;
    v18 = v16;
    v19 = v13;
    objc_msgSend(v17, "getBagForRequestContext:forceRefetch:withCompletionHandler:", v18, 0, v21);

  }
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ICStoreURLRequest *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("pmlt-url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
      if (v7)
      {
        v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v18 = v9;
          v19 = 2114;
          v20 = v7;
          _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize recommended content request. err= %{public}@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v4);
        objc_msgSend(v12, "setHTTPBody:", v6);
        objc_msgSend(v12, "setCachePolicy:", 1);
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("Software"), CFSTR("X-Mme-Client-Application"));
        v13 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v12, *(_QWORD *)(a1 + 48));
        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_21;
        v15[3] = &unk_1E4391630;
        v15[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v14, "enqueueDataRequest:withCompletionHandler:", v13, v15);

      }
    }
    else
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishWithError:", v11);

    }
  }
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v7;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to fetch recommended content. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("recommendedContentIds"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 336);
      *(_QWORD *)(v11 + 336) = v10;

      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
    }
    else
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ no response body - treating as failure", (uint8_t *)&v17, 0xCu);
      }

      v15 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishWithError:", v16);

    }
  }

}

uint64_t __79__ICMusicSubscriptionRecommendationsRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), a2);
}

@end
