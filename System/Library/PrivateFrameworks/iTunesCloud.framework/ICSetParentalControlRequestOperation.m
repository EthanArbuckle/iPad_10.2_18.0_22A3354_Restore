@implementation ICSetParentalControlRequestOperation

- (ICSetParentalControlRequestOperation)initWithRequestContext:(id)a3 allowsExplicitContent:(BOOL)a4 isAutomatic:(BOOL)a5
{
  id v9;
  ICSetParentalControlRequestOperation *v10;
  ICSetParentalControlRequestOperation *v11;

  v9 = a3;
  v10 = -[ICRequestOperation init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestContext, a3);
    v11->_allowsExplicitContent = a4;
    v11->_automatic = a5;
  }

  return v11;
}

- (void)execute
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  ICSetParentalControlRequestOperation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing setParentalControl request", buf, 0xCu);
  }

  -[ICStoreRequestContext identityStore](self->_requestContext, "identityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreRequestContext identity](self->_requestContext, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ICSetParentalControlRequestOperation_execute__block_invoke;
  v6[3] = &unk_1E438E900;
  v6[4] = self;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v6);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSetParentalControlRequestOperation;
  -[ICSetParentalControlRequestOperation cancel](&v4, sel_cancel);
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_storeURLRequest);

}

- (void)_buildAndSendRequestForURL:(id)a3
{
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  ICStoreURLRequest *v15;
  ICStoreURLRequest *storeURLRequest;
  void *v17;
  void *v18;
  void *v19;
  ICStoreURLRequest *v20;
  _QWORD v21[5];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = objc_alloc(MEMORY[0x1E0CB39D8]);
  if (self->_allowsExplicitContent)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("enabled"), v6);
  v8 = objc_alloc(MEMORY[0x1E0CB39D8]);
  if (self->_automatic)
    v9 = CFSTR("2");
  else
    v9 = CFSTR("1");
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("manual"), v9);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  v22[0] = v7;
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueryItems:", v12);

  objc_msgSend(v11, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHTTPBody:", v14);
  v15 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v4, self->_requestContext);
  storeURLRequest = self->_storeURLRequest;
  self->_storeURLRequest = v15;

  -[ICRequestOperation progress](self, "progress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLRequest progress](self->_storeURLRequest, "progress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addChild:withPendingUnitCount:", v18, 100);

  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_storeURLRequest;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__ICSetParentalControlRequestOperation__buildAndSendRequestForURL___block_invoke;
  v21[3] = &unk_1E4391630;
  v21[4] = self;
  objc_msgSend(v19, "enqueueDataRequest:withCompletionHandler:", v20, v21);

}

- (void)_getURLFromBagAndSendRequest
{
  void *v3;
  ICStoreRequestContext *requestContext;
  _QWORD v5[5];

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__ICSetParentalControlRequestOperation__getURLFromBagAndSendRequest__block_invoke;
  v5[3] = &unk_1E4391658;
  v5[4] = self;
  objc_msgSend(v3, "getBagForRequestContext:withCompletionHandler:", requestContext, v5);

}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (void)setAllowsExplicitContent:(BOOL)a3
{
  self->_allowsExplicitContent = a3;
}

- (BOOL)isAutomatic
{
  return self->_automatic;
}

- (void)setAutomatic:(BOOL)a3
{
  self->_automatic = a3;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (ICStoreURLRequest)storeURLRequest
{
  return self->_storeURLRequest;
}

- (void)setStoreURLRequest:(id)a3
{
  objc_storeStrong((id *)&self->_storeURLRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __68__ICSetParentalControlRequestOperation__getURLFromBagAndSendRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("push-notification-allowexplicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_buildAndSendRequestForURL:", v8);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing setParentalControl url in bag - skipping", (uint8_t *)&v13, 0xCu);
      }

      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithError:", v12);

    }
  }

}

void __67__ICSetParentalControlRequestOperation__buildAndSendRequestForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setParentalControl request failed. err=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "parsedBody");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setParentalControl request returned response %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __47__ICSetParentalControlRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "DSID");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "_getURLFromBagAndSendRequest");
    }
    else
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(v14 + 312), "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        v28 = 2114;
        v29 = v15;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no DSID for account %{public}@", buf, 0x16u);

      }
      v22 = *MEMORY[0x1E0CB2938];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Set parental control failed  [no DSID for user identity] - userIdentity=%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "finishWithError:", v21);

      v4 = 0;
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v6 + 312), "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no properties for account %{public}@", buf, 0x16u);

    }
    v24 = *MEMORY[0x1E0CB2938];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Set parental control failed [no propertires for user identity]- userIdentity=%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v12);

  }
}

@end
