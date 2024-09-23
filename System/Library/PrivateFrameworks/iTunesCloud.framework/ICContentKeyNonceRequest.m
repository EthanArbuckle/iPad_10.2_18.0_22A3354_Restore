@implementation ICContentKeyNonceRequest

- (ICContentKeyNonceRequest)initWithStoreRequestContext:(id)a3 adamID:(id)a4 accountDSID:(id)a5 keyServerURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICContentKeyNonceRequest *v15;
  ICContentKeyNonceRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICContentKeyNonceRequest;
  v15 = -[ICRequestOperation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeRequestContext, a3);
    objc_storeStrong((id *)&v16->_adamID, a4);
    objc_storeStrong((id *)&v16->_accountDSID, a5);
    objc_storeStrong((id *)&v16->_keyServerURL, a6);
  }

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
  v6[2] = __55__ICContentKeyNonceRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  NSNumber *adamID;
  void *v5;
  void *v6;
  NSNumber *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  ICStoreURLRequest *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  ICContentKeyNonceRequest *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    adamID = self->_adamID;
    if (!adamID)
      adamID = (NSNumber *)&unk_1E43E6718;
    v27[0] = adamID;
    v26[0] = CFSTR("adamID");
    v26[1] = CFSTR("DSID");
    ICCreateLoggableValueForDSID(self->_accountDSID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Executing nonce request with params: %{public}@", buf, 0x16u);

  }
  v7 = self->_adamID;
  if (!v7)
    v7 = (NSNumber *)&unk_1E43E6718;
  v24[0] = CFSTR("adam-id");
  v24[1] = CFSTR("id");
  v25[0] = v7;
  v25[1] = &unk_1E43E6730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("nonce-requests");
  v23[0] = &unk_1E43E6730;
  v21 = v8;
  v22[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  v13 = v12;
  if (!v11 || v12)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to serialize key server request data with error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7101, v13, CFSTR("Failed to serialize key server request data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", self->_keyServerURL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v14, "setHTTPBody:", v11);
    -[NSNumber stringValue](self->_accountDSID, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Secure-Invalidation-Dsid"));

    objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v16 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v14, self->_storeRequestContext);
    -[ICURLRequest enableLoadURLMetricsWithRequestName:](v16, "enableLoadURLMetricsWithRequestName:", CFSTR("skd/nonce"));
    +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __35__ICContentKeyNonceRequest_execute__block_invoke;
    v19[3] = &unk_1E4391630;
    v19[4] = self;
    objc_msgSend(v17, "enqueueDataRequest:withCompletionHandler:", v16, v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __35__ICContentKeyNonceRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  ICContentKeyNonceResponse *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v36 = 138543362;
      v37 = v11;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed Nonce request", (uint8_t *)&v36, 0xCu);
    }

    objc_msgSend(v5, "parsedBodyDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v36 = 138543618;
      v37 = v14;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Received response %@", (uint8_t *)&v36, 0x16u);
    }

    if (!v12)
    {
      v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_QWORD *)(a1 + 32);
        v36 = 138543362;
        v37 = v34;
        _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Received empty response", (uint8_t *)&v36, 0xCu);
      }

      v35 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("Received empty response"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "finishWithError:", v16);
      goto LABEL_24;
    }
    objc_msgSend(v12, "ic_arrayValueForKey:", CFSTR("nonce-responses"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "objectAtIndexedSubscript:", 0), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = (void *)v17;
      v19 = -[ICContentKeyNonceResponse initWithResponseDictionary:]([ICContentKeyNonceResponse alloc], "initWithResponseDictionary:", v17);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 336);
      *(_QWORD *)(v20 + 336) = v19;

      v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "status");
      if (v22)
      {
        v23 = v22;
        v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *(_QWORD *)(a1 + 32);
          v36 = 138543618;
          v37 = v25;
          v38 = 2114;
          v39 = v12;
          _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Received non-zero status code response: %{public}@", (uint8_t *)&v36, 0x16u);
        }

        v26 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICKeyServerError"), v23, CFSTR("received non-zero status in nonce response"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "finishWithError:", v27);

        goto LABEL_20;
      }
      v31 = *(void **)(a1 + 32);
      v32 = 0;
    }
    else
    {
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 32);
        v36 = 138543618;
        v37 = v29;
        v38 = 2114;
        v39 = v12;
        _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Received a response with no nonce-responses: %{public}@", (uint8_t *)&v36, 0x16u);
      }

      v30 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("Received a response with no nonce-responses"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = v18;
    }
    objc_msgSend(v31, "finishWithError:", v32);
LABEL_20:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "msv_description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543618;
    v37 = v9;
    v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Completed Nonce request error=%{public}@", (uint8_t *)&v36, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
LABEL_25:

}

uint64_t __55__ICContentKeyNonceRequest_performWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), a2);
}

@end
