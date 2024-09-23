@implementation ICMusicKitURLRequest

void __85__ICMusicKitURLRequest__buildMusicKitURLRequestWithBaseURLRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8200, v6, CFSTR("Failed to fetch developer token from %@."), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_setDeveloperToken:", v5);
    v8 = objc_msgSend(*(id *)(a1 + 48), "personalizationMethod");
    if (v8 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "_buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest:developerToken:completionHandler:", *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 64));
    }
    else if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "_buildEquivalentStoreURLRequestWithDeveloperToken:completionHandler:", v5, *(_QWORD *)(a1 + 64));
    }
  }

}

- (void)_setDeveloperToken:(id)a3
{
  NSString *v4;
  NSString *developerToken;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_developerToken;
  developerToken = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    developerToken = self->_developerToken;
    self->_developerToken = v8;
LABEL_4:

  }
}

- (ICStoreURLRequest)_pendingEquivalentStoreURLRequest
{
  -[ICMusicKitURLRequest _updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:](self, "_updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:", self->_pendingEquivalentStoreURLRequest);
  return self->_pendingEquivalentStoreURLRequest;
}

void __61__ICMusicKitURLRequest_buildURLRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isContentProtectionEnabled")
      && (objc_msgSend(v6, "isDeviceClassCUnlocked") & 1) == 0)
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Request was issued before before first unlock, returning error.", (uint8_t *)&v11, 0xCu);
      }

      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7006, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_buildMusicKitURLRequestWithBaseURLRequest:completionHandler:", v5, *(_QWORD *)(a1 + 40));
    }

  }
}

- (void)_buildMusicKitURLRequestWithBaseURLRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICMusicKitURLRequest *v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[ICMusicKitURLRequest requestContext](self, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "developerTokenProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__ICMusicKitURLRequest__buildMusicKitURLRequestWithBaseURLRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E4390158;
  v16 = v10;
  v17 = self;
  v19 = v6;
  v20 = v7;
  v18 = v8;
  v11 = v6;
  v12 = v8;
  v13 = v7;
  v14 = v10;
  objc_msgSend(v14, "fetchDeveloperTokenForClientInfo:completionHandler:", v9, v15);

}

void __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  ICStoreRequestContext *v7;
  id v8;
  ICStoreRequestContext *v9;
  ICStoreURLRequest *v10;
  void *v11;
  ICStoreURLRequest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  ICStoreURLRequest *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v4 = (void *)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("Authorization"));
    objc_msgSend(*(id *)(a1 + 40), "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [ICStoreRequestContext alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke_2;
    v20[3] = &unk_1E4390188;
    v8 = v6;
    v21 = v8;
    v9 = -[ICStoreRequestContext initWithBlock:](v7, "initWithBlock:", v20);
    v10 = [ICStoreURLRequest alloc];
    objc_msgSend(*(id *)(a1 + 40), "resumeData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICStoreURLRequest initWithURLRequest:requestContext:resumeData:](v10, "initWithURLRequest:requestContext:resumeData:", v4, v9, v11);

    -[ICURLRequest setPrioritize:](v12, "setPrioritize:", objc_msgSend(*(id *)(a1 + 40), "prioritize"));
    -[ICURLRequest setCancelOnHTTPErrors:](v12, "setCancelOnHTTPErrors:", objc_msgSend(*(id *)(a1 + 40), "cancelOnHTTPErrors"));
    -[ICURLRequest setMaxRetryCount:](v12, "setMaxRetryCount:", objc_msgSend(*(id *)(a1 + 40), "maxRetryCount"));
    objc_msgSend(*(id *)(a1 + 40), "additionalHTTPCookies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreURLRequest setAdditionalHTTPCookies:](v12, "setAdditionalHTTPCookies:", v13);

    -[ICURLRequest setType:](v12, "setType:", objc_msgSend(*(id *)(a1 + 40), "type"));
    objc_msgSend(*(id *)(a1 + 40), "responseDataURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICURLRequest setResponseDataURL:](v12, "setResponseDataURL:", v14);

    objc_msgSend(*(id *)(a1 + 40), "_updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:", v12);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 272);
    if (v16)
    {
      objc_msgSend(v16, "machineDataSyncState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStoreURLRequest setMachineDataSyncState:](v12, "setMachineDataSyncState:", v17);

      v15 = *(_QWORD *)(a1 + 40);
    }
    objc_storeStrong((id *)(v15 + 272), v12);
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to equivalent store URL request to build the actual URL request: %{public}@.", buf, 0x16u);
    }

    -[ICStoreURLRequest buildURLRequestWithCompletionHandler:](v12, "buildURLRequestWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
}

- (ICMusicKitRequestContext)requestContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMusicKitURLRequest;
  -[ICURLRequest requestContext](&v3, sel_requestContext);
  return (ICMusicKitRequestContext *)(id)objc_claimAutoreleasedReturnValue();
}

- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return -[ICMusicKitURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", a3, a4, 0);
}

- (void)_buildEquivalentStoreURLRequestWithDeveloperToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ICMusicKitURLRequest *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ICURLRequest urlRequest](self, "urlRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke;
  v12[3] = &unk_1E43901B0;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  -[ICMusicKitURLRequest _buildStoreURLRequestWithUpdatedDomains:completionHandler:](self, "_buildStoreURLRequestWithUpdatedDomains:completionHandler:", v9, v12);

}

- (void)_updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICURLRequest currentURLRequest](self, "currentURLRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentURLRequest:", v4);

  objc_msgSend(v7, "setRedirectCount:", -[ICURLRequest redirectCount](self, "redirectCount"));
  objc_msgSend(v7, "setRequestState:", -[ICURLRequest requestState](self, "requestState"));
  -[ICURLRequest error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setError:", v5);

  objc_msgSend(v7, "setHandlingType:", -[ICURLRequest handlingType](self, "handlingType"));
  -[ICURLRequest retryReason](self, "retryReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRetryReason:", v6);

  -[ICURLRequest retryDelay](self, "retryDelay");
  objc_msgSend(v7, "setRetryDelay:");

}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  char v7;
  __CFString *v8;
  char v9;
  unint64_t v10;
  __CFString *v11;

  v3 = (__CFString *)a3;
  v4 = CFSTR("developer-token-invalidated");
  if (v3 == CFSTR("developer-token-invalidated"))
  {
    v11 = CFSTR("developer-token-invalidated");
LABEL_11:

    goto LABEL_12;
  }
  v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("developer-token-invalidated"));

  if ((v5 & 1) != 0)
  {
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  v6 = CFSTR("music-user-token-invalidated");
  if (v3 == CFSTR("music-user-token-invalidated"))
  {
    v11 = CFSTR("music-user-token-invalidated");
    goto LABEL_11;
  }
  v7 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("music-user-token-invalidated"));

  if ((v7 & 1) != 0)
    goto LABEL_12;
  v8 = CFSTR("other");
  if (v3 == CFSTR("other"))
  {
    v11 = CFSTR("other");
    goto LABEL_11;
  }
  v9 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("other"));

  if ((v9 & 1) != 0)
    goto LABEL_12;
  v10 = +[ICStoreURLRequest _defaultMaxRetryCountForReason:](ICStoreURLRequest, "_defaultMaxRetryCountForReason:", v3);
LABEL_13:

  return v10;
}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  ICMusicKitURLRequest *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __61__ICMusicKitURLRequest_buildURLRequestWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E4390128;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)ICMusicKitURLRequest;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[ICURLRequest buildURLRequestWithCompletionHandler:](&v4, sel_buildURLRequestWithCompletionHandler_, v5);

}

- (NSDictionary)additionalHTTPCookies
{
  if (self->_additionalHTTPCookies)
    return self->_additionalHTTPCookies;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

+ (Class)_responseClass
{
  return (Class)objc_opt_class();
}

- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v8;
  id v9;
  ICMusicKitURLRequest *v10;
  ICMusicKitURLRequest *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitURLRequest.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[requestContext isKindOfClass:[ICMusicKitRequestContext class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)ICMusicKitURLRequest;
  v10 = -[ICURLRequest initWithURLRequest:requestContext:resumeData:](&v14, sel_initWithURLRequest_requestContext_resumeData_, v8, v9, 0);
  v11 = v10;
  if (v10)
    -[ICURLRequest setCancelOnHTTPErrors:](v10, "setCancelOnHTTPErrors:", 0);

  return v11;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSString *cachedDescription;

  v3 = self->_cachedDescription;
  if (!v3)
  {
    -[ICMusicKitURLRequest _description](self, "_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v5;

    v3 = self->_cachedDescription;
  }
  return v3;
}

- (id)_description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[ICMusicKitURLRequest requestContext](self, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; requestContext = %@"), v7);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHTTPCookies, 0);
  objc_storeStrong((id *)&self->_developerToken, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_pendingEquivalentStoreURLRequest, 0);
}

- (ICMusicKitURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  ICMusicKitURLRequest *v9;

  v6 = (void *)MEMORY[0x1E0C92C80];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICMusicKitURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", v8, v7, 0);

  return v9;
}

- (void)_buildStoreURLRequestWithUpdatedDomains:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicKitURLRequest requestContext](self, "requestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__ICMusicKitURLRequest__buildStoreURLRequestWithUpdatedDomains_completionHandler___block_invoke;
    v10[3] = &unk_1E4390DA0;
    v12 = v7;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v9, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

- (id)_buildStoreURLRequestWithUpdatedDomains:(id)a3 withBag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  ICMusicKitURLRequest *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  ICMusicKitURLRequest *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "dictionaryForBagKey:", CFSTR("ampMusicAPIRegexDomains"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2112;
      v40 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding Music API Domain Regex Dictionary from %@", buf, 0x16u);
    }

    v9 = &unk_1E43E6F58;
  }
  else if (!v9)
  {
    goto LABEL_23;
  }
  objc_msgSend(v9, "ic_dictionaryValueForKey:", CFSTR("default"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_stringValueForKey:", CFSTR("domain"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
    goto LABEL_22;
  if (!v12)
    goto LABEL_22;
  objc_msgSend(v6, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v13);

  if (!v16)
    goto LABEL_22;
  v30 = self;
  objc_msgSend(v6, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v18);
  v36 = v18;
  v35 = objc_msgSend(v18, "length");
  objc_msgSend(v9, "ic_arrayValueForKey:", CFSTR("endpoints"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    goto LABEL_21;
  v32 = v8;
  v33 = v19;
  v31 = v7;
  if (!objc_msgSend(v20, "count"))
    goto LABEL_20;
  v22 = 0;
  v34 = v6;
  while (1)
  {
    objc_msgSend(v21, "objectAtIndex:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isNSDictionary"))
      break;
LABEL_19:

    if (++v22 >= (unint64_t)objc_msgSend(v21, "count"))
      goto LABEL_20;
  }
  objc_msgSend(v23, "ic_stringValueForKey:", CFSTR("domain"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ic_stringValueForKey:", CFSTR("pattern"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "length") || !objc_msgSend(v25, "length"))
  {
LABEL_18:

    goto LABEL_19;
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v25, 1, 0);
  if (!objc_msgSend(v26, "numberOfMatchesInString:options:range:", v18, 0, 0, v35) || !objc_msgSend(v24, "length"))
  {

    v6 = v34;
    goto LABEL_18;
  }
  _ICLogCategoryDefault();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v38 = v30;
    v39 = 2114;
    v40 = v36;
    v41 = 2114;
    v42 = v24;
    v43 = 2048;
    v44 = v22;
    _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating URL: %{public}@ with matched host %{public}@ from pattern at index %lu", buf, 0x2Au);
  }

  objc_msgSend(v33, "setHost:", v24);
  v6 = v34;
LABEL_20:
  v19 = v33;
  objc_msgSend(v33, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  objc_msgSend(v32, "setURL:", v27);

  v7 = v31;
LABEL_21:

LABEL_22:
LABEL_23:

  return v8;
}

- (void)_buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest:(id)a3 developerToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke;
  v15[3] = &unk_1E4390228;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  -[ICMusicKitURLRequest _buildStoreURLRequestWithUpdatedDomains:completionHandler:](self, "_buildStoreURLRequestWithUpdatedDomains:completionHandler:", v11, v15);

}

- (NSString)_developerToken
{
  return self->_developerToken;
}

- (void)setAdditionalHTTPCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  ICMusicUserTokenFetchRequest *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    v4 = (void *)objc_msgSend(a2, "mutableCopy");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "count"))
      objc_msgSend(v4, "ic_appendHTTPCookies:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("Authorization"));
    objc_msgSend(*(id *)(a1 + 32), "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICStoreURLRequest _shouldPersonalizeRequestForRequestContext:personalizationStyle:](ICStoreURLRequest, "_shouldPersonalizeRequestForRequestContext:personalizationStyle:", v6, objc_msgSend(v6, "_storeRequestPersonalizationStyle"));
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "unpersonalized";
      v10 = *(_QWORD *)(a1 + 32);
      if (v7)
        v9 = "personalized";
      *(_DWORD *)buf = 138543618;
      v27 = v10;
      v28 = 2082;
      v29 = v9;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Building %{public}s URL request.", buf, 0x16u);
    }

    if (v7)
    {
      objc_msgSend(v6, "clientInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICMusicUserTokenFetchRequest initWithDeveloperToken:clientInfo:options:]([ICMusicUserTokenFetchRequest alloc], "initWithDeveloperToken:clientInfo:options:", *(_QWORD *)(a1 + 40), v11, 0);
      objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", 25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_99;
      v19[3] = &unk_1E4390200;
      v14 = v4;
      v15 = *(_QWORD *)(a1 + 32);
      v20 = v14;
      v21 = v15;
      v25 = *(id *)(a1 + 56);
      v22 = v6;
      v23 = v11;
      v24 = *(id *)(a1 + 48);
      v16 = v11;
      -[ICMusicUserTokenFetchRequest performRequestOnOperationQueue:withResponseHandler:](v12, "performRequestOnOperationQueue:withResponseHandler:", v13, v19);

    }
    else
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2114;
        v29 = (const char *)v4;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping personalization; issuing request merely decorated with a developer token: %{public}@.",
          buf,
          0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_99(uint64_t a1, void *a2, void *a3)
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
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("ICError")))
    {
      v12 = objc_msgSend(v7, "code");

      if (v12 == -8101)
      {
        v13 = objc_msgSend(*(id *)(a1 + 40), "_retryCountForReason:", CFSTR("developer-token-invalidated"));
        v14 = objc_msgSend(*(id *)(a1 + 40), "_maxRetryCountForReason:", CFSTR("developer-token-invalidated"));
        if (v13 < v14)
        {
          v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543362;
            v30 = v16;
            _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unauthorized to fetch user token. Invalidating developer token.", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "_incrementRetryCountForReason:", CFSTR("developer-token-invalidated"));
          objc_msgSend(*(id *)(a1 + 48), "developerTokenProvider");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_106;
          v26[3] = &unk_1E43901D8;
          v26[4] = *(_QWORD *)(a1 + 40);
          v18 = *(_QWORD *)(a1 + 56);
          v27 = *(id *)(a1 + 64);
          v28 = *(id *)(a1 + 72);
          objc_msgSend(v17, "invalidateCachedDeveloperTokenForClientInfo:completionHandler:", v18, v26);

          goto LABEL_17;
        }
        v22 = v14;
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8101, v7, CFSTR("Unauthorized to fetch user token, but reached maximum retry count for developer token invalidation; aborting."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v17, "msv_description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v30 = v24;
          v31 = 2114;
          v32 = v25;
          v33 = 2114;
          v34 = CFSTR("developer-token-invalidated");
          v35 = 2048;
          v36 = v13;
          v37 = 2048;
          v38 = v22;
          _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x34u);

        }
LABEL_16:
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8102, v7, CFSTR("Failed to fetch user token."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "msv_description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

    }
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, CFSTR("Music-User-Token"));
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Issuing request decorated with both a developer token and a user token: %{public}@.", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_18:

}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_106(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
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
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully invalidated developer token; retrying building URL request.",
        (uint8_t *)&v10,
        0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_buildMusicKitURLRequestWithBaseURLRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8101, a3, CFSTR("Unauthorized to fetch user token, but developer token invalidation failed; aborting."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  ICClientInfo *v5;
  void *v6;
  void *v7;
  ICClientInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMac");

  if (v4)
  {
    v5 = [ICClientInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICClientInfo initWithBundleIdentifier:](v5, "initWithBundleIdentifier:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v8 = (ICClientInfo *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setClientInfo:", v8);

  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDeviceInfo:", v9);

  objc_msgSend(*(id *)(a1 + 32), "authenticationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAuthenticationProvider:", v10);

  objc_msgSend(*(id *)(a1 + 32), "networkConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNetworkConstraints:", v11);

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdentity:", v12);

  objc_msgSend(*(id *)(a1 + 32), "delegatedIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegatedIdentity:", v13);

  objc_msgSend(*(id *)(a1 + 32), "identityStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdentityStore:", v14);

  objc_msgSend(*(id *)(a1 + 32), "storeDialogResponseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStoreDialogResponseHandler:", v15);

  objc_msgSend(v16, "setAllowsExpiredBags:", objc_msgSend(*(id *)(a1 + 32), "allowsExpiredBags"));
  objc_msgSend(v16, "setPersonalizationStyle:", objc_msgSend(*(id *)(a1 + 32), "_storeRequestPersonalizationStyle"));

}

void __82__ICMusicKitURLRequest__buildStoreURLRequestWithUpdatedDomains_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_buildStoreURLRequestWithUpdatedDomains:withBag:", *(_QWORD *)(a1 + 40), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copy");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

@end
