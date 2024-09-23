@implementation ICInAppReportEventRequest

- (ICInAppReportEventRequest)initWithStoreRequestContext:(id)a3 messageIdentifier:(id)a4 params:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICInAppReportEventRequest *v12;
  ICInAppReportEventRequest *v13;
  uint64_t v14;
  NSString *messageIdentifier;
  uint64_t v16;
  NSDictionary *params;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICInAppReportEventRequest;
  v12 = -[ICRequestOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeRequestContext, a3);
    v14 = objc_msgSend(v10, "copy");
    messageIdentifier = v13->_messageIdentifier;
    v13->_messageIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    params = v13->_params;
    v13->_params = (NSDictionary *)v16;

  }
  return v13;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__ICInAppReportEventRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E438E500;
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
  v5[2] = __36__ICInAppReportEventRequest_execute__block_invoke;
  v5[3] = &unk_1E438E900;
  v5[4] = self;
  objc_msgSend(v3, "getPropertiesForUserIdentity:completionHandler:", v4, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __36__ICInAppReportEventRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
    v12[2] = __36__ICInAppReportEventRequest_execute__block_invoke_1;
    v12[3] = &unk_1E438E8D8;
    v12[4] = v10;
    v13 = v5;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", v11, v12);

  }
}

void __36__ICInAppReportEventRequest_execute__block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ICInAppMessageConfiguration *v9;
  void *v10;
  ICInAppMessageConfiguration *v11;
  void *v12;
  ICIAMLogEventRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  ICIAMLogEventRequest *v19;
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
  _QWORD v31[5];
  ICIAMLogEventRequest *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
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
      v34 = v8;
      v35 = 2114;
      v36 = v6;
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

    -[ICInAppMessageConfiguration reportEventURL](v11, "reportEventURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(ICIAMLogEventRequest);
      objc_msgSend(*(id *)(a1 + 40), "DSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICIAMLogEventRequest setDSID:](v13, "setDSID:", objc_msgSend(v14, "longLongValue"));

      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deviceGUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICIAMLogEventRequest setDeviceID:](v13, "setDeviceID:", v16);

      -[ICIAMLogEventRequest setApplicationMessageIdentifier:](v13, "setApplicationMessageIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 320);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __36__ICInAppReportEventRequest_execute__block_invoke_6;
      v31[3] = &unk_1E438FA60;
      v31[4] = v17;
      v19 = v13;
      v32 = v19;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v31);
      -[ICIAMLogEventRequest data](v19, "data");
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
        v30[2] = __36__ICInAppReportEventRequest_execute__block_invoke_13;
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
          v34 = v28;
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
        v34 = v25;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to find bag key for url endpoint", buf, 0xCu);
      }

      v26 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v19 = (ICIAMLogEventRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "finishWithError:", v19);
    }

  }
}

void __36__ICInAppReportEventRequest_execute__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICIAMParameter *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSString() && (_NSIsNSString() & 1) != 0)
  {
    v7 = objc_alloc_init(ICIAMParameter);
    -[ICIAMParameter setKey:](v7, "setKey:", v5);
    -[ICIAMParameter setValue:](v7, "setValue:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addEventParameters:", v7);
  }
  else
  {
    v7 = (ICIAMParameter *)os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543874;
      v10 = v8;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1A03E3000, &v7->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid message parm: {%{public}@ : %{public}@}", (uint8_t *)&v9, 0x20u);
    }
  }

}

void __36__ICInAppReportEventRequest_execute__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Log event request failed. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);

}

uint64_t __63__ICInAppReportEventRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
