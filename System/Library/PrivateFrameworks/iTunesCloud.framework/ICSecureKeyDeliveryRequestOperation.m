@implementation ICSecureKeyDeliveryRequestOperation

- (void)execute
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  char v28;
  _QWORD v29[5];
  uint8_t buf[4];
  ICSecureKeyDeliveryRequestOperation *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v3 = MEMORY[0x1E0C809B0];
  v36 = *MEMORY[0x1E0C80C00];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke;
  v29[3] = &unk_1E4390F50;
  v29[4] = self;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v29, a2);
  -[ICSecureKeyDeliveryRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2114;
    v33 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Executing request %{public}@", buf, 0x16u);
  }

  objc_msgSend(v5, "certificateURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyServerURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    objc_msgSend(v5, "resourceLoadingRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "contentKeyRequest"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      goto LABEL_8;
    }
    objc_msgSend(v5, "serverPlaybackContextData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
LABEL_8:
      v11 = objc_msgSend(v5, "isITunesStoreRequest");
      objc_msgSend(v5, "requestContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v3;
          v22[1] = 3221225472;
          v22[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_6;
          v22[3] = &unk_1E4390FB8;
          v22[4] = self;
          v27 = v4;
          v23 = v5;
          v24 = v9;
          v28 = v11;
          v25 = v12;
          v26 = v13;
          v14 = v13;
          -[ICSecureKeyDeliveryRequestOperation _createServerPlaybackContextWithCompletion:](self, "_createServerPlaybackContextWithCompletion:", v22);

LABEL_22:
          goto LABEL_23;
        }
        v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v31 = self;
          v19 = "[%{public}@]: [SKD] - Requesting iTunes Store content with a non-store request context.";
          goto LABEL_20;
        }
      }
      else
      {
        v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v31 = self;
          v19 = "[%{public}@]: [SKD] - Missing request context.";
LABEL_20:
          _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        }
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v14);
      goto LABEL_22;
    }
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing content key request data", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = CFSTR("Missing content key request data");
  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v31 = self;
      v32 = 2114;
      v33 = v7;
      v34 = 2114;
      v35 = v9;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing certificate URL: %{public}@ or key server URL: %{public}@", buf, 0x20u);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = CFSTR("Missing certificate URL or key server URL");
  }
  objc_msgSend(v16, "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7101, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v12);
LABEL_23:

}

- (id)_createDefaultProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICSecureKeyDeliveryRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("spc"));

  }
  if (objc_msgSend(v5, "shouldIncludeDeviceGUID"))
  {
    objc_msgSend(v6, "deviceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("guid"));

  }
  objc_msgSend(v7, "setObject:forKey:", &unk_1E43E68F8, CFSTR("id"));
  objc_msgSend(v5, "contentURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("uri"));
  v12 = objc_msgSend(v5, "rentalID");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("rental-id"));

  }
  if (objc_msgSend(v5, "skippedRentalCheckout"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("skipped-rental-checkout"));
  v14 = objc_msgSend(v5, "leaseActionType") - 1;
  if (v14 <= 2)
    objc_msgSend(v7, "setObject:forKey:", off_1E4391028[v14], CFSTR("lease-action"));
  v22 = CFSTR("fairplay-streaming-request");
  v20[1] = CFSTR("streaming-keys");
  v21[0] = &unk_1E43E6910;
  v19 = v7;
  v20[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_createSimplifiedProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[ICSecureKeyDeliveryRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("spc"));

  }
  if (objc_msgSend(v5, "shouldIncludeDeviceGUID"))
  {
    objc_msgSend(v6, "deviceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("guid"));

  }
  objc_msgSend(v5, "contentURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("keyUri"));
  objc_msgSend(v5, "adamID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("adamId"));
  if (objc_msgSend(v5, "isOfflineDownload"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("offline"));

  return v7;
}

- (id)_createPodcastLicenseProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICSecureKeyDeliveryRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("spc"));

  }
  objc_msgSend(v5, "contentURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("uri"));
  objc_msgSend(v5, "adamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("adam-id"));
  objc_msgSend(v6, "setObject:forKey:", &unk_1E43E6910, CFSTR("id"));
  v14[1] = CFSTR("license-requests");
  v15[0] = &unk_1E43E6910;
  v13 = v6;
  v14[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_createServerPlaybackContextWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[ICSecureKeyDeliveryRequest serverPlaybackContextData](self->_request, "serverPlaybackContextData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICSecureKeyDeliveryRequest serverPlaybackContextData](self->_request, "serverPlaybackContextData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);
  }
  else
  {
    -[ICSecureKeyDeliveryRequest requestContext](self->_request, "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSecureKeyDeliveryRequest isITunesStoreRequest](self->_request, "isITunesStoreRequest");
    v7 = (objc_class *)objc_opt_class();
    -[ICSecureKeyDeliveryRequest certificateURL](self->_request, "certificateURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v8);
    objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
    v10 = (void *)objc_msgSend([v7 alloc], "initWithURLRequest:requestContext:", v9, v6);
    objc_msgSend(v10, "enableLoadURLMetricsWithRequestName:", CFSTR("skd/certificate"));
    +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke;
    v12[3] = &unk_1E4391008;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v10, v12);

  }
}

- (ICSecureKeyDeliveryRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "bodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "contentKeyRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "resourceLoadingRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke_82;
      v30[3] = &unk_1E4390FE0;
      v12 = *(void **)(a1 + 40);
      v30[4] = *(_QWORD *)(a1 + 32);
      v31 = v12;
      objc_msgSend(v7, "makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:", v6, v11, MEMORY[0x1E0C9AA70], v30);
      v13 = v31;
    }
    else
    {
      if (!v8)
      {
        v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v33 = v26;
          _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - No contentKeyRequest or resourceLoadingRequest provided", buf, 0xCu);
        }

        v27 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7101, CFSTR("No contentKeyRequest or resourceLoadingRequest provided"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v27 + 16))(v27, 0, v11);
        goto LABEL_18;
      }
      objc_msgSend(v8, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "host");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dataUsingEncoding:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v9, "streamingContentKeyRequestDataForApp:contentIdentifier:options:error:", v6, v18, 0, &v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v29;
      if (v20)
      {
        v21 = v20;
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v33 = v23;
          v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to create content key request data. err=%{public}@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), 0, v21, CFSTR("Failed to create content key request data"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      v13 = v28;
    }

LABEL_18:
    goto LABEL_19;
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v33 = v15;
    v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to load certificate data with error: %{public}@", buf, 0x16u);
  }

  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7300, v5, CFSTR("Failed to load certificate data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
LABEL_19:

}

void __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to create content key request data. err=%{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), 0, v6, CFSTR("Failed to create content key request data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished with error %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[37];
  if (v10)
  {
    (*(void (**)(_QWORD, id, id))(v10 + 16))(v9[37], v5, v6);
    v9 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v9, "finishWithError:", v6);

}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "requestProtocolType");
    if (v7 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createPodcastLicenseProtocolRequestBodyUsingPlaybackContextData:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 1)
        objc_msgSend(*(id *)(a1 + 32), "_createSimplifiedProtocolRequestBodyUsingPlaybackContextData:", v5);
      else
        objc_msgSend(*(id *)(a1 + 32), "_createDefaultProtocolRequestBodyUsingPlaybackContextData:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v8;
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, &v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    v15 = v14;
    if (!v13 || v14)
    {
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        v40 = 2114;
        v41 = v15;
        _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to serialize key server request data with error: %{public}@", buf, 0x16u);
      }

      v30 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7101, v15, CFSTR("Failed to serialize key server request data"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v16);
    }
    else
    {
      v32 = v6;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", *(_QWORD *)(a1 + 48));
      v31 = v13;
      objc_msgSend(v16, "setHTTPBody:", v13);
      objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      if (objc_msgSend(*(id *)(a1 + 40), "requestProtocolType") == 2
        && objc_msgSend(*(id *)(a1 + 40), "leaseActionType") == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "accountDSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 40), "accountDSID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forHTTPHeaderField:", v19, CFSTR("X-Secure-Invalidation-Dsid"));

        }
      }
      v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURLRequest:requestContext:", v16, *(_QWORD *)(a1 + 56));
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "adamID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "longLongValue") == 0;
      objc_msgSend(*(id *)(a1 + 32), "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("skd/key?shared=%d&persistent=%d"), v24, objc_msgSend(v25, "isOfflineDownload"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "enableLoadURLMetricsWithRequestName:", v26);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_20;
      v33[3] = &unk_1E4390F90;
      v33[4] = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(a1 + 64);
      v36 = *(id *)(a1 + 72);
      v34 = *(id *)(a1 + 40);
      v35 = v5;
      objc_msgSend(v27, "enqueueDataRequest:withCompletionHandler:", v20, v33);

      v13 = v31;
      v6 = v32;
      v15 = 0;
    }

  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v39 = v10;
      v40 = 2114;
      v41 = v6;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to generate server playback context data with error: %{public}@", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7101, v6, CFSTR("Failed to generate server playback context data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);
  }

}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  ICSecureKeyDeliveryResponse *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "parsedBodyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "requestProtocolType");
    if (v7 == 2)
    {
      objc_msgSend(v6, "ic_arrayValueForKey:", CFSTR("license-responses"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      if (v7 == 1)
      {
        v8 = v6;
        if (!v8)
        {
LABEL_5:
          v9 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v43 = v10;
            v44 = 2114;
            v45 = 0;
            _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing key dictionary in response: %{public}@", buf, 0x16u);
          }

          v11 = *(_QWORD *)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
          v12 = (ICSecureKeyDeliveryResponse *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, ICSecureKeyDeliveryResponse *))(v11 + 16))(v11, 0, v12);
          goto LABEL_38;
        }
LABEL_28:
        v12 = -[ICSecureKeyDeliveryResponse initWithResponseDictionary:serverPlaybackContextData:]([ICSecureKeyDeliveryResponse alloc], "initWithResponseDictionary:serverPlaybackContextData:", v8, *(_QWORD *)(a1 + 48));
        if (-[ICSecureKeyDeliveryResponse status](v12, "status"))
        {
          v23 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v43 = v24;
            v44 = 2114;
            v45 = v8;
            _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Received non-zero status in response: %{public}@", buf, 0x16u);
          }

          v25 = *(_QWORD *)(a1 + 56);
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v27 = -[ICSecureKeyDeliveryResponse status](v12, "status");
          v28 = CFSTR("ICKeyServerError");
          v29 = CFSTR("Key server returned non-zero status in response");
          v30 = v26;
        }
        else
        {
          if (objc_msgSend(*(id *)(a1 + 40), "leaseActionType") == 3
            || (-[ICSecureKeyDeliveryResponse contentKeyContextData](v12, "contentKeyContextData"),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              v43 = v34;
              _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Loaded successfully.", buf, 0xCu);
            }

            (*(void (**)(_QWORD, ICSecureKeyDeliveryResponse *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v12, 0);
            goto LABEL_38;
          }
          v35 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v43 = v36;
            v44 = 2114;
            v45 = v8;
            _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Missing content key context data in response: %{public}@", buf, 0x16u);
          }

          v25 = *(_QWORD *)(a1 + 56);
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v28 = CFSTR("ICError");
          v29 = CFSTR("Missing content key context data in response");
          v27 = -7102;
        }
        objc_msgSend(v30, "msv_errorWithDomain:code:debugDescription:", v28, v27, v29, (_QWORD)v37);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v31);

LABEL_38:
        goto LABEL_39;
      }
      objc_msgSend(v6, "ic_dictionaryValueForKey:", CFSTR("fairplay-streaming-response"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v18;
      if (v18)
      {
        objc_msgSend(v18, "ic_arrayValueForKey:", CFSTR("streaming-keys"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v19 = v18;
      v8 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v8)
      {
        v20 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v19);
            v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            if (_NSIsNSDictionary())
            {
              v8 = v22;
              goto LABEL_25;
            }
          }
          v8 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_25:

    }
    if (!v8)
      goto LABEL_5;
    goto LABEL_28;
  }
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v43 = v14;
    v44 = 2114;
    v45 = v5;
    _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Key server request returned error: %{public}@.", buf, 0x16u);
  }

  v15 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7102, v5, CFSTR("Key server request returned error"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v8);
LABEL_39:

}

@end
