@implementation ICUserAuthenticationValidationRequest

- (ICUserAuthenticationValidationRequest)initWithUserIdentity:(id)a3
{
  id v4;
  ICStoreRequestContext *v5;
  id v6;
  ICStoreRequestContext *v7;
  ICUserAuthenticationValidationRequest *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = [ICStoreRequestContext alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ICUserAuthenticationValidationRequest_initWithUserIdentity___block_invoke;
  v10[3] = &unk_1E4390188;
  v11 = v4;
  v6 = v4;
  v7 = -[ICStoreRequestContext initWithBlock:](v5, "initWithBlock:", v10);
  v8 = -[ICUserAuthenticationValidationRequest initWithRequestContext:](self, "initWithRequestContext:", v7);

  return v8;
}

- (ICUserAuthenticationValidationRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICUserAuthenticationValidationRequest *v5;
  uint64_t v6;
  ICStoreRequestContext *requestContext;

  v4 = a3;
  v5 = -[ICUserAuthenticationValidationRequest init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;

  }
  return v5;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ICStoreRequestContext *requestContext;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  ICUserAuthenticationValidationRequest *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICStoreRequestContext identity](self->_requestContext, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ performing authentication validation for user identity %{public}@", buf, 0x16u);

  }
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke;
  v10[3] = &unk_1E438D3F8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", requestContext, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  ICStoreURLRequest *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v18 = v7;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch the bag. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("getSubscriptionStatusSrv"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[ICStoreURLRequest initWithURL:requestContext:]([ICStoreURLRequest alloc], "initWithURL:requestContext:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      -[ICURLRequest setMaxRetryCount:](v9, "setMaxRetryCount:", 0);
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_5;
      v15[3] = &unk_1E4391008;
      v11 = *(void **)(a1 + 40);
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v11;
      objc_msgSend(v10, "enqueueDataRequest:withCompletionHandler:", v9, v15);

    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Validation failed because the subscription status url is missing from the bag", buf, 0xCu);
      }

      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v9 = (ICStoreURLRequest *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, ICStoreURLRequest *))(v14 + 16))(v14, 0, v9);
    }

  }
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  ICMusicSubscriptionStatusResponse *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v7;
      v32 = 2114;
      v33 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch subscription status. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v29 = 0;
      v9 = +[ICMusicSubscriptionStatusResponse isValidSubscriptionStatusResponseDictionary:error:](ICMusicSubscriptionStatusResponse, "isValidSubscriptionStatusResponseDictionary:error:", v8, &v29);
      v10 = v29;
      if (v9)
      {
        v11 = -[ICMusicSubscriptionStatusResponse initWithResponseDictionary:expirationDate:]([ICMusicSubscriptionStatusResponse alloc], "initWithResponseDictionary:expirationDate:", v8, 0);
        -[ICMusicSubscriptionStatusResponse subscriptionStatus](v11, "subscriptionStatus");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "reasonType");

        v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13 == 4)
        {
          if (v15)
          {
            v16 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v31 = v16;
            _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Received invalidToken response - attempting to authenticate", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "authenticationProvider");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(a1 + 40);
          v20 = *(_QWORD *)(v18 + 8);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_7;
          v27[3] = &unk_1E43908A8;
          v27[4] = v18;
          v28 = v19;
          objc_msgSend(v17, "performAuthenticationUsingRequestContext:withCompletionHandler:", v20, v27);

        }
        else
        {
          if (v15)
          {
            v26 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v31 = v26;
            _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ authentication validation completed successfully", buf, 0xCu);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }

      }
      else
      {
        v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v31 = v25;
          v32 = 2114;
          v33 = v10;
          _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status response parsing failed with error: %{public}@.", buf, 0x16u);
        }

        (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v10);
      }
    }
    else
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed due to invalid response.", buf, 0xCu);
      }

      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v23 + 16))(v23, 0, v10);
    }

  }
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication complete. authenticated = %{BOOL}u, err = %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__ICUserAuthenticationValidationRequest_initWithUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  objc_msgSend(v3, "setStoreDialogResponseHandler:", 0);
  objc_msgSend(v3, "setAllowsExpiredBags:", 1);

}

@end
