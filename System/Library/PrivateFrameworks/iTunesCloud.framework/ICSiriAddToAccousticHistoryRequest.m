@implementation ICSiriAddToAccousticHistoryRequest

- (ICSiriAddToAccousticHistoryRequest)initWithRequestContext:(id)a3 storeItemID:(int64_t)a4 affiliateIdentifier:(id)a5
{
  id v9;
  id v10;
  ICSiriAddToAccousticHistoryRequest *v11;
  ICSiriAddToAccousticHistoryRequest *v12;
  uint64_t v13;
  NSString *affiliateIdentifier;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICSiriAddToAccousticHistoryRequest;
  v11 = -[ICRequestOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    v12->_storeItemID = a4;
    v13 = objc_msgSend(v10, "copy");
    affiliateIdentifier = v12->_affiliateIdentifier;
    v12->_affiliateIdentifier = (NSString *)v13;

  }
  return v12;
}

- (void)execute
{
  NSObject *v3;
  int64_t storeItemID;
  NSString *affiliateIdentifier;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICSiriAddToAccousticHistoryRequest *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    storeItemID = self->_storeItemID;
    affiliateIdentifier = self->_affiliateIdentifier;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2048;
    v12 = storeItemID;
    v13 = 2114;
    v14 = affiliateIdentifier;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with storeID %lld, affiliate %{public}@", buf, 0x20u);
  }

  -[ICStoreRequestContext identityStore](self->_requestContext, "identityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreRequestContext identity](self->_requestContext, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke;
  v8[3] = &unk_1E438E900;
  v8[4] = self;
  objc_msgSend(v6, "getPropertiesForUserIdentity:completionHandler:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 304);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2;
    v9[3] = &unk_1E4391658;
    v9[4] = v4;
    objc_msgSend(v3, "getBagForRequestContext:forceRefetch:withCompletionHandler:", v5, 0, v9);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ No active iTunes account - failing request", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v3);
  }

}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ICStoreURLRequest *v18;
  void *v19;
  _QWORD v20[5];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = -7401;
LABEL_3:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ICError"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v10);

    goto LABEL_9;
  }
  objc_msgSend(v5, "urlForBagKey:", CFSTR("addToSiriTagHistoryBaseUrl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "urlForBagKey:", CFSTR("addToTRHistoryBaseUrl"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v7 = *(void **)(a1 + 32);
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = -7201;
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("id");
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  if (v15)
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("affiliateID"));
  objc_msgSend(v11, "ic_URLByAppendingQueryParameters:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v16);
  objc_msgSend(v17, "setCachePolicy:", 1);
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("Software"), CFSTR("X-Mme-Client-Application"));
  v18 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2;
  v20[3] = &unk_1E4391630;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v19, "enqueueDataRequest:withCompletionHandler:", v18, v20);

LABEL_9:
}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished request with err %{public}@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
}

@end
