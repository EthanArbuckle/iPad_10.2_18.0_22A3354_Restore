@implementation ICMusicUserTokenFetchRequest

- (ICMusicUserTokenFetchRequest)initWithDeveloperToken:(id)a3 clientInfo:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  ICMusicUserTokenFetchRequest *v11;
  ICMusicUserTokenFetchRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICMusicUserTokenFetchRequest;
  v11 = -[ICRequestOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_developerToken, a3);
    objc_storeStrong((id *)&v12->_clientInfo, a4);
    v12->_options = a5;
  }

  return v12;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  -[ICMusicUserTokenFetchRequest performRequestOnOperationQueue:withResponseHandler:](self, "performRequestOnOperationQueue:withResponseHandler:", 0, a3);
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
  v8[2] = __83__ICMusicUserTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke;
  v8[3] = &unk_1E43915E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", a3, v8);

}

- (ICMusicUserTokenFetchRequest)initWithCoder:(id)a3
{
  id v4;
  ICMusicUserTokenFetchRequest *v5;
  uint64_t v6;
  ICClientInfo *clientInfo;
  uint64_t v8;
  NSString *developerToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicUserTokenFetchRequest;
  v5 = -[ICRemoteRequestOperation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    developerToken = v5->_developerToken;
    v5->_developerToken = (NSString *)v8;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICMusicUserTokenFetchRequest;
  v4 = a3;
  -[ICRemoteRequestOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientInfo, CFSTR("clientInfo"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_developerToken, CFSTR("developerToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  ICStoreRequestContext *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  ICStoreRequestContext *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *developerToken;
  NSObject *v27;
  id v28;
  _QWORD v29[7];
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  ICMusicUserTokenFetchRequest *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[ICMusicUserTokenFetchRequest isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:");

    return;
  }
  if (!-[NSString length](self->_developerToken, "length"))
  {
    v12 = CFSTR("Missing developer token for user token request.");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7101, CFSTR("Invalid request: %@"), v12);
    v9 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v9);
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[ICStoreRequestContext msv_description](v9, "msv_description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invalid request. %{public}@", buf, 0x16u);

    }
    goto LABEL_16;
  }
  -[ICClientInfo requestingBundleIdentifier](self->_clientInfo, "requestingBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v12 = CFSTR("Missing requesting bundle identifier for user token request.");
    goto LABEL_13;
  }
  -[ICClientInfo requestingBundleVersion](self->_clientInfo, "requestingBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v12 = CFSTR("Missing requesting bundle version for user token request.");
    goto LABEL_13;
  }
  +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "privacyAcknowledgementRequiredForMusic");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7007, CFSTR("Not getting music user token because privacy acknowledgement is required."));
    v9 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[ICStoreRequestContext msv_description](v9, "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

    }
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v9);
  }
  else
  {
    v15 = [ICStoreRequestContext alloc];
    v16 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __39__ICMusicUserTokenFetchRequest_execute__block_invoke;
    v31[3] = &unk_1E4390188;
    v31[4] = self;
    v9 = -[ICStoreRequestContext initWithBlock:](v15, "initWithBlock:", v31);
    -[ICStoreRequestContext identityStore](v9, "identityStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreRequestContext identity](v9, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v17, "getPropertiesForUserIdentity:error:", v18, &v30);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (unint64_t)v30;

    if (v19 | v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "qualityOfService");

      if ((self->_options & 1) != 0)
      {
        _ICLogCategoryDefault();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v33 = self;
          _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: shouldIgnoreCache = YES.", buf, 0xCu);
        }

        -[ICMusicUserTokenFetchRequest _executeByPerformingStoreRequestWithContext:qualityOfService:](self, "_executeByPerformingStoreRequestWithContext:qualityOfService:", v9, v24);
      }
      else
      {
        +[ICMusicUserTokenCache sharedCache](ICMusicUserTokenCache, "sharedCache");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        developerToken = self->_developerToken;
        v29[0] = v16;
        v29[1] = 3221225472;
        v29[2] = __39__ICMusicUserTokenFetchRequest_execute__block_invoke_30;
        v29[3] = &unk_1E438BF50;
        v29[4] = self;
        v29[5] = v9;
        v29[6] = v24;
        objc_msgSend(v25, "getCachedUserTokenForDeveloperToken:requestContext:completion:", developerToken, v9, v29);

      }
    }
    else
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@: No active account. Failing request.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7401, CFSTR("No active account."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICRequestOperation finishWithError:](self, "finishWithError:", v22);

    }
  }
LABEL_16:

}

- (void)_executeByPerformingStoreRequestWithContext:(id)a3 qualityOfService:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke;
  v9[3] = &unk_1E438BFA0;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerToken, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

void __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  ICStoreURLRequest *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get bag with error %{public}@.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v42 = v9;
      v43 = 2114;
      v44 = v5;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Got bag with %{public}@.", buf, 0x16u);
    }

    objc_msgSend(v5, "urlForBagKey:", CFSTR("createMusicToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "deviceInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v10);
      objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      objc_msgSend(v11, "deviceGUID");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("guid"));
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 328);
      v36 = v11;
      v37 = v10;
      v35 = (void *)v14;
      if (v16)
      {
        objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("assertion"));
        v15 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v15 + 320), "requestingBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_12;
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "objectForKey:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "timeIntervalSince1970");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), llround(v21 * 1000.0));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v22, CFSTR("tcc-acceptance-date"));

      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHTTPBody:", v23);
      v24 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v13, *(_QWORD *)(a1 + 40));
      -[ICURLRequest setCancelOnHTTPErrors:](v24, "setCancelOnHTTPErrors:", 0);
      +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sessionWithQualityOfService:", *(_QWORD *)(a1 + 48));
      v34 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke_54;
      v38[3] = &unk_1E438BF78;
      v27 = *(void **)(a1 + 40);
      v38[4] = *(_QWORD *)(a1 + 32);
      v39 = v27;
      v40 = v17;
      v28 = v17;
      objc_msgSend(v26, "enqueueDataRequest:withCompletionHandler:", v24, v38);

      v29 = v36;
      v10 = v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7201, CFSTR("Could not find URL to get music user token."));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v29, "msv_description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v32;
        v43 = 2114;
        v44 = v33;
        _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v29);
    }

  }
}

void __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  _BYTE buf[24];
  NSObject *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "parsedBodyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("error_description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v9 = v8;
  else
    v9 = 0;
  v10 = objc_msgSend(v6, "statusCode");

  ICURLResponseStatusCodeGetExtendedDescription(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v13 = v12;
  if (v5)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v37 = v11;
    v15 = "%{public}@: Finished with error %{public}@ and status code %{public}@.";
    v16 = v13;
    v17 = OS_LOG_TYPE_ERROR;
    v18 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    v15 = "%{public}@: Finished with status code %{public}@.";
    v16 = v13;
    v17 = OS_LOG_TYPE_DEFAULT;
    v18 = 22;
  }
  _os_log_impl(&dword_1A03E3000, v16, v17, v15, buf, v18);
LABEL_10:

  if (v10 == 401)
  {
    if (!v9)
      v9 = CFSTR("This is most likely due to an expired or otherwise invalid developer token");
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8101, CFSTR("Failed to fetch music user token with %@ status code. %@."), v11, v9, *(_OWORD *)buf, *(_QWORD *)&buf[16], v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v20, "msv_description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  if (v10 == 403)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -8100, CFSTR("Response error: %@"), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Music user token was revoked. Error description: %{public}@", buf, 0x16u);
    }

    if (*(_QWORD *)(a1 + 48))
    {
      v23 = TCCAccessSetForBundleId();
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v37) = v23;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoked TCC access for %{public}@ with status %{BOOL}u.", buf, 0x1Cu);
      }
LABEL_31:

    }
  }
  else
  {
    if (!v5 && v10 == 200)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("music_token"));
      v24 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        v24 = v24;
        objc_msgSend(*(id *)(a1 + 32), "setResponse:", v24);
        v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v24;
          _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Music user token: \"%@\".", buf, 0x16u);
        }

        +[ICMusicUserTokenCache sharedCache](ICMusicUserTokenCache, "sharedCache");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setCachedUserToken:forDeveloperToken:requestContext:completion:", v24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), *(_QWORD *)(a1 + 40), 0);

        v20 = 0;
      }
      else
      {
        v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = CFSTR("music_token");
          *(_WORD *)&buf[22] = 2114;
          v37 = v24;
          v38 = 2114;
          v39 = v35;
          _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Server reported success, but %{public}@ was not a string: %{public}@ (of type %{public}@).", buf, 0x2Au);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("%@ in response is of unexpected type."), CFSTR("music_token"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_31;
    }
    v20 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v20);

}

void __39__ICMusicUserTokenFetchRequest_execute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v3);

  objc_msgSend(v4, "setClientInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
}

uint64_t __39__ICMusicUserTokenFetchRequest_execute__block_invoke_30(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResponse:", a2);
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Found music user token in cache.", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Did not find music user token in cache.", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_executeByPerformingStoreRequestWithContext:qualityOfService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

void __83__ICMusicUserTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "response");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "msv_errorByRemovingUnsafeUserInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
