@implementation ICSagaGetAccountStatusRequest

- (ICSagaGetAccountStatusRequest)initWithStoreRequestContext:(id)a3
{
  id v5;
  ICSagaGetAccountStatusRequest *v6;
  ICSagaGetAccountStatusRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSagaGetAccountStatusRequest;
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
  v6[2] = __67__ICSagaGetAccountStatusRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  ICStoreRequestContext *storeRequestContext;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  ICStoreRequestContext *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  ICSagaGetAccountStatusRequest *v13;
  __int16 v14;
  ICStoreRequestContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    storeRequestContext = self->_storeRequestContext;
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = storeRequestContext;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Gathering iTunes match account status for context %{public}@", buf, 0x16u);
  }

  -[ICStoreRequestContext identity](self->_storeRequestContext, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "privacyAcknowledgementRequiredForMusic");

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Skipping saga account status request because privacy acknowledgement is required", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v9);
  }
  else
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_storeRequestContext;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__ICSagaGetAccountStatusRequest_execute__block_invoke;
    v11[3] = &unk_1E4391658;
    v11[4] = self;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", v10, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __40__ICSagaGetAccountStatusRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  ICStoreURLRequest *v15;
  void *v16;
  ICStoreURLRequest *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 312) = objc_msgSend(v5, "BOOLValueForBagKey:", CFSTR("isMatchServiceEnabled"));
  objc_msgSend(v5, "stringForBagKey:", CFSTR("cloud-welcome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = v7 != 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 0;
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch the bag to obtain match status url. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identityStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v10, "getPropertiesForUserIdentity:error:", v11, &v21);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (unint64_t)v21;

    if (v12 | v13)
    {
      objc_msgSend(v5, "stringForBagKey:", CFSTR("getMatchStatusSrv"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = [ICStoreURLRequest alloc];
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[ICStoreURLRequest initWithURL:requestContext:](v15, "initWithURL:requestContext:", v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));

        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __40__ICSagaGetAccountStatusRequest_execute__block_invoke_6;
        v20[3] = &unk_1E4391630;
        v20[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v18, "enqueueDataRequest:withCompletionHandler:", v17, v20);

      }
      else
      {
        v19 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
        v17 = (ICStoreURLRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "finishWithError:", v17);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
    }

  }
}

void __40__ICSagaGetAccountStatusRequest_execute__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received match status response: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("isMatchSubscriber"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = objc_msgSend(v9, "BOOLValue");

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __67__ICSagaGetAccountStatusRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 304);
      v8 = *(unsigned __int8 *)(v6 + 312);
      v9 = *(unsigned __int8 *)(v6 + 313);
      v10 = *(unsigned __int8 *)(v6 + 314);
      objc_msgSend(v3, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544642;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      v21 = 1024;
      v22 = v8;
      v23 = 1024;
      v24 = v9;
      v25 = 1024;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Finished gathering iTunes match account status for context %{public}@. isEnabled=%{BOOL}u, canSubscribe = %{BOOL}u, isSubscriber=%{BOOL}u error=%{public}@", (uint8_t *)&v17, 0x32u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v12 + 304);
    v14 = *(unsigned __int8 *)(v12 + 312);
    v15 = *(unsigned __int8 *)(v12 + 313);
    v16 = *(unsigned __int8 *)(v12 + 314);
    v17 = 138544386;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    v21 = 1024;
    v22 = v14;
    v23 = 1024;
    v24 = v15;
    v25 = 1024;
    v26 = v16;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished gathering iTunes match account status for context %{public}@. isEnabled=%{BOOL}u, canSubscribe = %{BOOL}u, isSubscriber=%{BOOL}u", (uint8_t *)&v17, 0x28u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
