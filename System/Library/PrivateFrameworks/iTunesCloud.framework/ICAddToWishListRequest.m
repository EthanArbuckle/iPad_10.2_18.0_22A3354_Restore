@implementation ICAddToWishListRequest

- (ICAddToWishListRequest)initWithRequestContext:(id)a3 buyParams:(id)a4 storeItemID:(int64_t)a5 itemName:(id)a6 itemKind:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICAddToWishListRequest *v17;
  ICAddToWishListRequest *v18;
  uint64_t v19;
  NSString *buyParams;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICAddToWishListRequest;
  v17 = -[ICRequestOperation init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestContext, a3);
    v19 = objc_msgSend(v14, "copy");
    buyParams = v18->_buyParams;
    v18->_buyParams = (NSString *)v19;

    v18->_storeItemID = a5;
    objc_storeStrong((id *)&v18->_itemName, a6);
    objc_storeStrong((id *)&v18->_itemKind, a7);
  }

  return v18;
}

- (ICAddToWishListRequest)initWithRequestContext:(id)a3 platformMetadataItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  ICAddToWishListRequest *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "offerWithType:", CFSTR("buy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "name");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v8, "buyParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "storeAdamID");
  objc_msgSend(v6, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICAddToWishListRequest initWithRequestContext:buyParams:storeItemID:itemName:itemKind:](self, "initWithRequestContext:buyParams:storeItemID:itemName:itemKind:", v7, v13, v14, v12, v15);

  return v16;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ICAddToWishListRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  int64_t storeItemID;
  NSString *itemName;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICAddToWishListRequest *v10;
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
    itemName = self->_itemName;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2048;
    v12 = storeItemID;
    v13 = 2114;
    v14 = itemName;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with storeID=%lld, itemName=%{public}@", buf, 0x20u);
  }

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__ICAddToWishListRequest_execute__block_invoke;
  v8[3] = &unk_1E438E900;
  v8[4] = self;
  objc_msgSend(v6, "getPropertiesForUserIdentity:completionHandler:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __33__ICAddToWishListRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  if (a2 | a3)
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 304);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__ICAddToWishListRequest_execute__block_invoke_2;
    v9[3] = &unk_1E4391658;
    v9[4] = v6;
    objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", v7, v9);

  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v8);

  }
}

void __33__ICAddToWishListRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICStoreURLRequest *v16;
  void *v17;
  _QWORD v18[13];

  if (!a3)
  {
    v18[11] = v3;
    v18[12] = v4;
    objc_msgSend(a2, "urlForBagKey:", CFSTR("addToWishlistBaseUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("id"));

    v10 = *(_QWORD **)(a1 + 32);
    if (v10[39])
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "ic_queryParametersDictionaryFromString:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v11);

      v10 = *(_QWORD **)(a1 + 32);
    }
    v12 = v10[41];
    if (v12)
    {
      objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("wishlistItemName"));
      v10 = *(_QWORD **)(a1 + 32);
    }
    v13 = v10[42];
    if (v13)
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("kind"));
    objc_msgSend(v6, "ic_URLByAppendingQueryParameters:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v14);
    objc_msgSend(v15, "setCachePolicy:", 1);
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("Software"), CFSTR("X-Mme-Client-Application"));
    v16 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
    +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __33__ICAddToWishListRequest_execute__block_invoke_3;
    v18[3] = &unk_1E4391630;
    v18[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v17, "enqueueDataRequest:withCompletionHandler:", v16, v18);

  }
}

void __33__ICAddToWishListRequest_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICAddToWishListResponse *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = [ICAddToWishListResponse alloc];
  objc_msgSend(v6, "parsedBodyDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ICAddToWishListResponse initWithResponseDictionary:](v7, "initWithResponseDictionary:", v8);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 344);
  *(_QWORD *)(v10 + 344) = v9;

  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v13 + 344);
    v15 = 138543874;
    v16 = v13;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished with err=%{public}@, response=%{public}@", (uint8_t *)&v15, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
}

uint64_t __53__ICAddToWishListRequest_performWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), a2);
}

@end
