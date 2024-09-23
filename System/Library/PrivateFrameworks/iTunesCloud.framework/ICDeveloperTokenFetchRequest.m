@implementation ICDeveloperTokenFetchRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDeveloperTokenFetchRequest;
  v4 = a3;
  -[ICRemoteRequestOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientInfo, CFSTR("clientInfo"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_clientType, CFSTR("clientType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

void __39__ICDeveloperTokenFetchRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Media token request finished for client identifier %{public}@. error=%{public}@", (uint8_t *)&v14, 0x20u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Media token request finished for client identifier %{public}@.", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didFetchMediaToken:withError:", v6, v5);
}

- (void)_didFetchMediaToken:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  AMSMediaTokenService *mediaTokenService;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  ICDeveloperTokenFetchRequest *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "tokenString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRemoteRequestOperation setResponse:](self, "setResponse:", v7);
  if (!v6)
  {
    v21 = 0;
    goto LABEL_17;
  }
  v8 = v6;
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CFD808];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CFD808]))
  {
    v11 = objc_msgSend(v8, "code");

    if (v11 == 301)
    {
      objc_msgSend(v8, "msv_underlyingError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", v10))
      {
        v14 = objc_msgSend(v12, "code");

        if (v14 != 301)
          goto LABEL_8;
        v13 = v8;
        v8 = v12;
      }

LABEL_8:
      objc_msgSend(v8, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CFD828]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      ICURLResponseStatusCodeGetExtendedDescription(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (v17 == 404)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          -[ICClientInfo clientIdentifier](self->_clientInfo, "clientIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8200, v8, CFSTR("Media API Token Service responded with status code: %@. This suggests that \"%@\" was likely not registered as a valid client identifier."), v18, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v27 = CFSTR("Media API Token Service's response was invalid (status code: %@).");
        v28 = v18;
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v27 = CFSTR("Media API Token Service's response was invalid.");
      }
      objc_msgSend(v26, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8200, v8, v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      if (v21)
        goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8200, v8, CFSTR("Failed to fetch media token from %@."), self->_mediaTokenService);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v21, "msv_description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = self;
    v31 = 2114;
    v32 = v23;
    _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

  }
LABEL_17:
  mediaTokenService = self->_mediaTokenService;
  self->_mediaTokenService = 0;

  objc_msgSend(v21, "msv_errorByRemovingUnsafeUserInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestOperation finishWithError:](self, "finishWithError:", v25);

}

void __83__ICDeveloperTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "response");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (void)performRequestOnOperationQueue:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICDeveloperTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke;
  v8[3] = &unk_1E43915E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", a3, v8);

}

- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3 options:(unint64_t)a4
{
  id v6;
  ICDeveloperTokenFetchRequest *v7;
  uint64_t v8;
  ICClientInfo *clientInfo;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeveloperTokenFetchRequest;
  v7 = -[ICRequestOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    clientInfo = v7->_clientInfo;
    v7->_clientInfo = (ICClientInfo *)v8;

    v7->_clientType = 0;
    v7->_options = a4;
  }

  return v7;
}

- (ICDeveloperTokenFetchRequest)initWithCoder:(id)a3
{
  id v4;
  ICDeveloperTokenFetchRequest *v5;
  uint64_t v6;
  ICClientInfo *clientInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDeveloperTokenFetchRequest;
  v5 = -[ICRemoteRequestOperation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v6;

    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  }

  return v5;
}

- (void)execute
{
  NSObject *v3;
  id v4;
  AMSMediaTokenService *v5;
  AMSMediaTokenService *mediaTokenService;
  void *v7;
  NSObject *v8;
  AMSMediaTokenService *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  ICDeveloperTokenFetchRequest *v14;
  __int16 v15;
  AMSMediaTokenService *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing request.", buf, 0xCu);
  }

  if (-[ICDeveloperTokenFetchRequest isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v4);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_createMediaTokenServiceForClientInfo:clientType:requester:", self->_clientInfo, self->_clientType, self);
    v5 = (AMSMediaTokenService *)objc_claimAutoreleasedReturnValue();
    mediaTokenService = self->_mediaTokenService;
    self->_mediaTokenService = v5;

    -[ICClientInfo clientIdentifier](self->_clientInfo, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_options & 1) != 0)
      objc_msgSend((id)objc_opt_class(), "_invalidateCachedDeveloperTokenForClientInfo:requester:usingMediaTokenService:", self->_clientInfo, self, self->_mediaTokenService);
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_mediaTokenService;
      *(_DWORD *)buf = 138543874;
      v14 = self;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting developer token using %{public}@ with client identifier %{public}@.", buf, 0x20u);
    }

    -[AMSMediaTokenService fetchMediaToken](self->_mediaTokenService, "fetchMediaToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__ICDeveloperTokenFetchRequest_execute__block_invoke;
    v11[3] = &unk_1E438EC80;
    v11[4] = self;
    v12 = v7;
    v4 = v7;
    objc_msgSend(v10, "addFinishBlock:", v11);

  }
}

+ (id)_createMediaTokenServiceForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "bagProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bagProfileVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544130;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated AMSBag with profile %{public}@ and version %{public}@: <AMSBag: %p>.", (uint8_t *)&v18, 0x2Au);
  }

  objc_msgSend(v7, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB50]), "initWithClientIdentifier:bag:", v13, v11);
  v15 = v14;
  if ((unint64_t)a4 <= 1)
    objc_msgSend(v14, "setClientType:", a4);
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated AMSMediaTokenService with client identifier %{public}@: %{public}@.", (uint8_t *)&v18, 0x20u);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTokenService, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3
{
  return -[ICDeveloperTokenFetchRequest initWithClientInfo:options:](self, "initWithClientInfo:options:", a3, 0);
}

- (void)performRequestWithResponseHandler:(id)a3
{
  -[ICDeveloperTokenFetchRequest performRequestOnOperationQueue:withResponseHandler:](self, "performRequestOnOperationQueue:withResponseHandler:", 0, a3);
}

- (int64_t)clientType
{
  return self->_clientType;
}

+ (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5 completionHandler:(id)a6
{
  void (**v10)(id, uint64_t, _QWORD);
  id v11;
  id v12;
  id v13;

  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a1, "_createMediaTokenServiceForClientInfo:clientType:requester:", v12, a4, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invalidateCachedDeveloperTokenForClientInfo:requester:usingMediaTokenService:", v12, v11, v13);

  v10[2](v10, 1, 0);
}

+ (void)_invalidateCachedDeveloperTokenForClientInfo:(id)a3 requester:(id)a4 usingMediaTokenService:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "invalidateMediaToken");
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated cached developer token using %{public}@ with client identifier %{public}@.", (uint8_t *)&v12, 0x20u);

  }
}

@end
