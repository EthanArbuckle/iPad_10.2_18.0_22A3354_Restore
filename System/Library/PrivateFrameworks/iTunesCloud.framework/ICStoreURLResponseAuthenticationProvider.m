@implementation ICStoreURLResponseAuthenticationProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "currentURLRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegatedIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_valueForHTTPHeaderField:", CFSTR("X-WHA-Token"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v13)
  {
    objc_msgSend(v12, "identityStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E438F330;
    v23 = v9;
    v16 = v9;
    objc_msgSend(v15, "removeDelegateTokenForUserIdentity:completionHandler:", v13, v22);

    v17 = v23;
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E438E7E8;
    v19[4] = self;
    v21 = v9;
    v20 = v12;
    v18 = v9;
    -[ICStoreURLResponseAuthenticationProvider _adjustedAuthenticationPolicyForResponse:withCompletionHandler:](self, "_adjustedAuthenticationPolicyForResponse:withCompletionHandler:", v8, v19);

    v17 = v21;
  }

}

- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[ICStoreURLResponseAuthenticationProvider _performAuthenticationUsingRequestContext:usingVerificationInteractionLevel:withCompletionHandler:](self, "_performAuthenticationUsingRequestContext:usingVerificationInteractionLevel:withCompletionHandler:", v7, -[ICURLResponseAuthenticationProvider interactionLevel](self, "interactionLevel"), v6);

}

- (void)_performAuthenticationUsingRequestContext:(id)a3 usingVerificationInteractionLevel:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  ICUserVerificationRequest *v25;
  ICStoreRequestContext *v26;
  void *v27;
  ICStoreRequestContext *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[4];
  void (**v32)(id, _QWORD, id);
  id v33;
  uint8_t buf[4];
  ICStoreURLResponseAuthenticationProvider *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = v8;
  if (objc_msgSend(v10, "personalizationStyle") != 1
    || (objc_msgSend(v10, "identity"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "privacyAcknowledgementRequiredForMusic"), v12, v11, !v13))
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a4 > 5)
        v17 = CFSTR("unknown");
      else
        v17 = off_1E438B0D0[a4];
      v18 = v17;
      *(_DWORD *)buf = 138543874;
      v35 = self;
      v36 = 2114;
      v37 = v18;
      v38 = 2114;
      v39 = v10;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing %{public}@ authentication using request context %{public}@", buf, 0x20u);

    }
    objc_msgSend(v10, "identity");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = -[__CFString allowsAccountEstablishment](v15, "allowsAccountEstablishment");
    if (a4 == 1 && v19)
    {
      objc_msgSend(v10, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identityAllowingEstablishment:", 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v21;
    }
    objc_msgSend(v10, "identityStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v22, "getVerificationContextForUserIdentity:error:", v15, &v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    if (v24 || !v23)
    {
      v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v35 = self;
        v36 = 2114;
        v37 = v15;
        v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get verification context for identity %{public}@. error=%{public}@", buf, 0x20u);
      }

      v25 = (ICUserVerificationRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      -[ICUserVerificationRequest setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get verification context for identity %@"), v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICUserVerificationRequest setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CB2938]);

      if (v24)
      {
        v9[2](v9, 0, v24);
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v25);
      v28 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v28);
    }
    else
    {
      objc_msgSend(v23, "setInteractionLevel:", a4);
      objc_msgSend(v23, "setDebugReason:", CFSTR("Server requested authentication"));
      v25 = -[ICUserVerificationRequest initWithVerificationContext:]([ICUserVerificationRequest alloc], "initWithVerificationContext:", v23);
      v26 = [ICStoreRequestContext alloc];
      objc_msgSend(v10, "clientInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[ICStoreRequestContext initWithIdentity:identityStore:clientInfo:](v26, "initWithIdentity:identityStore:clientInfo:", v15, v22, v27);

      -[ICUserVerificationRequest setStoreRequestContext:](v25, "setStoreRequestContext:", v28);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __142__ICStoreURLResponseAuthenticationProvider__performAuthenticationUsingRequestContext_usingVerificationInteractionLevel_withCompletionHandler___block_invoke;
      v31[3] = &unk_1E438F330;
      v32 = v9;
      -[ICUserVerificationRequest performWithResponseHandler:](v25, "performWithResponseHandler:", v31);

    }
    goto LABEL_23;
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping automatic re-authentication because the user hasn't accepted the latest privacy link, and personalization is automatic", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v15);
LABEL_24:

}

- (void)_adjustedAuthenticationPolicyForResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  int64_t v14;
  void (**v15)(id, _BOOL8, int64_t);

  v15 = (void (**)(id, _BOOL8, int64_t))a4;
  v6 = a3;
  v7 = -[ICURLResponseAuthenticationProvider interactionLevel](self, "interactionLevel");
  objc_msgSend(v6, "urlResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Allow-Auth-Types"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsObject:", CFSTR("silent")) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = -[ICURLResponseAuthenticationProvider interactionLevel](self, "interactionLevel");
      if (v14 == 2)
      {
        v7 = 0;
        v13 = 1;
      }
      else
      {
        v13 = v14 != 1;
      }
    }

  }
  else
  {
    v13 = 1;
  }
  v15[2](v15, v13, v7);

}

uint64_t __142__ICStoreURLResponseAuthenticationProvider__performAuthenticationUsingRequestContext_usingVerificationInteractionLevel_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performAuthenticationUsingRequestContext:usingVerificationInteractionLevel:withCompletionHandler:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = objc_msgSend(v5, "interactionLevel");
      if (v6 > 5)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E438B0D0[v6];
      v8 = v7;
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Not authenticating because %{public}@ authentication is not allowed for this response", (uint8_t *)&v11, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7402, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

@end
