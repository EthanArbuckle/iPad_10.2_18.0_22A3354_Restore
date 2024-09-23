@implementation ICLibraryAuthServiceClientTokenRequest

- (ICLibraryAuthServiceClientTokenRequest)initWithStoreRequestContext:(id)a3
{
  id v5;
  ICLibraryAuthServiceClientTokenRequest *v6;
  ICLibraryAuthServiceClientTokenRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLibraryAuthServiceClientTokenRequest;
  v6 = -[ICRequestOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeRequestContext, a3);

  return v7;
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
  v6[2] = __76__ICLibraryAuthServiceClientTokenRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  void *v3;
  ICStoreRequestContext *storeRequestContext;
  _QWORD v5[5];

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke;
  v5[3] = &unk_1E4391658;
  v5[4] = self;
  objc_msgSend(v3, "getBagForRequestContext:withCompletionHandler:", storeRequestContext, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4808;
    v16 = __Block_byref_object_dispose__4809;
    objc_msgSend(v5, "urlForBagKey:", CFSTR("library-auth-service-token-url"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(id **)(a1 + 32);
    if (v13[5])
    {
      objc_msgSend(v7[38], "identityStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_2;
      v11[3] = &unk_1E438A838;
      v11[4] = *(_QWORD *)(a1 + 32);
      v11[5] = &v12;
      objc_msgSend(v8, "getPropertiesForUserIdentity:completionHandler:", v9, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v10);

    }
    _Block_object_dispose(&v12, 8);

  }
}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ICStoreURLRequest *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("dsid"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("guid"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_URLByAppendingQueryParameters:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v13, "setCachePolicy:", 1);
    v14 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
    +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_10;
    v20[3] = &unk_1E4391630;
    v20[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v15, "enqueueDataRequest:withCompletionHandler:", v14, v20);

  }
  else
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v17 + 304), "identity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no properties for account %{public}@", buf, 0x16u);

    }
    v19 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithError:", v4);
  }

}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  ICLibraryAuthServiceClientTokenResponse *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  ICLibraryAuthServiceClientTokenResponse *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a2, "urlResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "statusCode");
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v25 = 138543874;
      v26 = v10;
      v27 = 2114;
      v28 = v6;
      v29 = 1024;
      v30 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received error %{public}@. http status code=%d", (uint8_t *)&v25, 0x1Cu);
    }

    v11 = -[ICLibraryAuthServiceClientTokenResponse initWithResultCode:]([ICLibraryAuthServiceClientTokenResponse alloc], "initWithResultCode:", v8);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 312);
    *(_QWORD *)(v12 + 312) = v11;

  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v7 = (void *)v14;
      v15 = -[ICLibraryAuthServiceClientTokenResponse initWithResponseDictionary:]([ICLibraryAuthServiceClientTokenResponse alloc], "initWithResponseDictionary:", v14);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 312);
      *(_QWORD *)(v16 + 312) = v15;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "tokenResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "token");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (!v20)
      {
        v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v25 = 138543618;
          v26 = v22;
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ no token in library auth service response: %{public}@", (uint8_t *)&v25, 0x16u);
        }

      }
      v6 = 0;
    }
    else
    {
      v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to parse token response", (uint8_t *)&v25, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
}

uint64_t __76__ICLibraryAuthServiceClientTokenRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), a2);
}

@end
