@implementation ICLibraryAuthServiceBulkClientTokenRequest

- (ICLibraryAuthServiceBulkClientTokenRequest)initWithStoreRequestContext:(id)a3 accountDSIDs:(id)a4
{
  id v7;
  id v8;
  ICLibraryAuthServiceBulkClientTokenRequest *v9;
  ICLibraryAuthServiceBulkClientTokenRequest *v10;
  uint64_t v11;
  NSSet *accountDSIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICLibraryAuthServiceBulkClientTokenRequest;
  v9 = -[ICRequestOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeRequestContext, a3);
    v11 = objc_msgSend(v8, "copy");
    accountDSIDs = v10->_accountDSIDs;
    v10->_accountDSIDs = (NSSet *)v11;

  }
  return v10;
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
  v6[2] = __80__ICLibraryAuthServiceBulkClientTokenRequest_performRequestWithResponseHandler___block_invoke;
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
  v5[2] = __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke;
  v5[3] = &unk_1E4391658;
  v5[4] = self;
  objc_msgSend(v3, "getBagForRequestContext:withCompletionHandler:", storeRequestContext, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSIDs, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  ICStoreURLRequest *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  void *v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("library-auth-service-token-url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5[38], "identityStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      objc_msgSend(v6, "getPropertiesForUserIdentity:error:", v7, &v58);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v58;

      if (v9)
      {
        v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(v11 + 304), "identity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v11;
          v64 = 2114;
          v65 = v12;
          v66 = 2114;
          v67 = v9;
          _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load properties for account %{public}@. err=%{public}@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
      }
      else if (v8)
      {
        v47 = v4;
        objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
        v45 = v14;
        objc_msgSend(v14, "setCachePolicy:", 1);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "deviceGUID");
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("guid"));
        v44 = (void *)v17;
        v48 = v15;
        v49 = a1;
        v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "mutableCopy");
        v46 = v8;
        objc_msgSend(v8, "DSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICHTTPCookieStore sharedCookieStore](ICHTTPCookieStore, "sharedCookieStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v18;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v55 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mz_at_ssl-%@"), v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "getCookieWithName:userIdentifier:", v26, v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                v59[0] = CFSTR("dsid");
                v59[1] = CFSTR("sslToken");
                v60[0] = v25;
                objc_msgSend(v27, "value");
                v29 = objc_claimAutoreleasedReturnValue();
                v60[1] = v29;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v30);

              }
              else
              {
                v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v31 = *(_QWORD *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  v63 = v31;
                  v64 = 2112;
                  v65 = v25;
                  _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load sslToken for account DSID %@ - skipping", buf, 0x16u);
                }
              }

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
          }
          while (v22);
        }

        objc_msgSend(v48, "setObject:forKey:", v51, CFSTR("dsids"));
        v53 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v48, 1, &v53);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v53;
        if (v32)
        {
          v34 = v45;
          objc_msgSend(v45, "setHTTPBody:", v32);
          objc_msgSend(v45, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
          v35 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v45, *(_QWORD *)(*(_QWORD *)(v49 + 32) + 304));
          +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke_26;
          v52[3] = &unk_1E4391630;
          v52[4] = *(_QWORD *)(v49 + 32);
          objc_msgSend(v36, "enqueueDataRequest:withCompletionHandler:", v35, v52);

          v8 = v46;
          v4 = v47;
          v9 = 0;
          v37 = v44;
        }
        else
        {
          v42 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          v9 = 0;
          v8 = v46;
          v37 = v44;
          v34 = v45;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = *(_QWORD *)(v49 + 32);
            *(_DWORD *)buf = 138543618;
            v63 = v43;
            v64 = 2114;
            v65 = v33;
            _os_log_impl(&dword_1A03E3000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize request body. err=%{public}@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(v49 + 32), "finishWithError:", v33);
          v4 = v47;
        }

      }
      else
      {
        v38 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v63 = v39;
          _os_log_impl(&dword_1A03E3000, v38, OS_LOG_TYPE_ERROR, "%{public}@ No active account - failing request", buf, 0xCu);
        }

        v40 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7406, CFSTR("This request requires an active iTunes account"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "finishWithError:", v41);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "finishWithError:", v13);

    }
  }
}

void __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  ICLibraryAuthServiceBulkClientTokenResponse *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v14 = 138543618;
        v15 = v8;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Recevied token response %@", (uint8_t *)&v14, 0x16u);
      }

      v9 = -[ICLibraryAuthServiceBulkClientTokenResponse initWithResponseDictionary:]([ICLibraryAuthServiceBulkClientTokenResponse alloc], "initWithResponseDictionary:", v6);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 312);
      *(_QWORD *)(v10 + 312) = v9;

      v5 = 0;
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ failed to parse token response", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __80__ICLibraryAuthServiceBulkClientTokenRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), a2);
}

@end
