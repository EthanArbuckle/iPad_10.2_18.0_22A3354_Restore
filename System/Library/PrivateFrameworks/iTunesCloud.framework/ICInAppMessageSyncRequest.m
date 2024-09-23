@implementation ICInAppMessageSyncRequest

- (ICInAppMessageSyncRequest)initWithStoreRequestContext:(id)a3 fromRevision:(unint64_t)a4
{
  id v7;
  ICInAppMessageSyncRequest *v8;
  ICInAppMessageSyncRequest *v9;
  void **p_storeRequestContext;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICInAppMessageSyncRequest;
  v8 = -[ICRequestOperation init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    p_storeRequestContext = (void **)&v8->_storeRequestContext;
    objc_storeStrong((id *)&v8->_storeRequestContext, a3);
    v11 = objc_msgSend(v7, "copyWithBlock:", &__block_literal_global_27347);
    v12 = *p_storeRequestContext;
    *p_storeRequestContext = (void *)v11;

    v9->_fromRevision = a4;
  }

  return v9;
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
  v6[2] = __63__ICInAppMessageSyncRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICStoreRequestContext identityStore](self->_storeRequestContext, "identityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreRequestContext identity](self->_storeRequestContext, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke;
  v5[3] = &unk_1E438E900;
  v5[4] = self;
  objc_msgSend(v3, "getPropertiesForUserIdentity:completionHandler:", v4, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncResponse, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load account properties. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 304);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke_4;
    v12[3] = &unk_1E438E8D8;
    v12[4] = v10;
    v13 = v5;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", v11, v12);

  }
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ICInAppMessageConfiguration *v9;
  void *v10;
  ICInAppMessageConfiguration *v11;
  void *v12;
  ICIAMSynchronizeMessagesRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  ICStoreURLRequest *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  ICIAMSynchronizeMessagesRequest *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    v9 = [ICInAppMessageConfiguration alloc];
    objc_msgSend(v5, "dictionaryForBagKey:", CFSTR("inAppMessages"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICInAppMessageConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    -[ICInAppMessageConfiguration syncURL](v11, "syncURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(ICIAMSynchronizeMessagesRequest);
      objc_msgSend(*(id *)(a1 + 40), "DSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICIAMSynchronizeMessagesRequest setDSID:](v13, "setDSID:", objc_msgSend(v14, "longLongValue"));

      -[ICIAMSynchronizeMessagesRequest setActiveCommandsOnly:](v13, "setActiveCommandsOnly:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) != 0);
      -[ICIAMSynchronizeMessagesRequest setCommandSerialNumber:](v13, "setCommandSerialNumber:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deviceGUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICIAMSynchronizeMessagesRequest setDeviceID:](v13, "setDeviceID:", v16);

      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 320);
        *(_DWORD *)buf = 138543875;
        v32 = v18;
        v33 = 2048;
        v34 = v19;
        v35 = 2113;
        v36 = v13;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending sync request with revision %lld; %{private}@",
          buf,
          0x20u);
      }

      -[ICIAMSynchronizeMessagesRequest data](v13, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v12);
        objc_msgSend(v21, "setHTTPBody:", v20);
        objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v21, "setValue:forHTTPHeaderField:", CFSTR("application/x-protobuf"), CFSTR("Content-Type"));
        v22 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v21, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke_12;
        v30[3] = &unk_1E4391630;
        v30[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v23, "enqueueDataRequest:withCompletionHandler:", v22, v30);

      }
      else
      {
        v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v32 = v28;
          _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to serialize request object", buf, 0xCu);
        }

        v29 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "finishWithError:", v21);
      }

    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v32 = v25;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to find bag key for url endpoint", buf, 0xCu);
      }

      v26 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v13 = (ICIAMSynchronizeMessagesRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "finishWithError:", v13);
    }

  }
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  ICIAMSynchronizeMessagesResponse *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync request failed. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    v9 = v6;
  }
  else
  {
    v10 = [ICIAMSynchronizeMessagesResponse alloc];
    objc_msgSend(v5, "bodyData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICIAMSynchronizeMessagesResponse initWithData:](v10, "initWithData:", v11);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 312);
    *(_QWORD *)(v13 + 312) = v12;

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312))
    {
      v9 = 0;
    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to decode response object", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);

}

uint64_t __63__ICInAppMessageSyncRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), a2);
}

void __70__ICInAppMessageSyncRequest_initWithStoreRequestContext_fromRevision___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  ICClientInfo *v4;
  id v5;

  v5 = a2;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMac");

  if (v3)
  {
    v4 = -[ICClientInfo initWithSystemApplicationType:]([ICClientInfo alloc], "initWithSystemApplicationType:", 0);
    objc_msgSend(v5, "setClientInfo:", v4);

  }
}

@end
