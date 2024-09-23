@implementation ICPushNotificationsRegisterAPNSTokenRequest

- (ICPushNotificationsRegisterAPNSTokenRequest)initWithRequestContext:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  ICPushNotificationsRegisterAPNSTokenRequest *v8;
  uint64_t v9;
  ICStoreRequestContext *requestContext;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPushNotificationsRegisterAPNSTokenRequest;
  v8 = -[ICRequestOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    requestContext = v8->_requestContext;
    v8->_requestContext = (ICStoreRequestContext *)v9;

    objc_storeStrong((id *)&v8->_token, a4);
  }

  return v8;
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
  v6[2] = __81__ICPushNotificationsRegisterAPNSTokenRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  ICPushNotificationsRegisterAPNSTokenRequest *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_token)
  {
    -[ICPushNotificationsRegisterAPNSTokenRequest _registerAPNSToken](self, "_registerAPNSToken");
  }
  else
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Cannot register nil token.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE48], CFSTR("Bug"), CFSTR("ICPushNotificationsRegisterAPNSTokenRequest"), CFSTR("Token is nil"), 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v4);

  }
}

- (void)_registerAPNSToken
{
  NSObject *v3;
  NSData *token;
  void *v5;
  ICStoreRequestContext *requestContext;
  _QWORD v7[5];
  uint8_t buf[4];
  ICPushNotificationsRegisterAPNSTokenRequest *v9;
  __int16 v10;
  NSData *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    token = self->_token;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = token;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ registering APNS token %{public}@", buf, 0x16u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICPushNotificationsRegisterAPNSTokenRequest__registerAPNSToken__block_invoke;
  v7[3] = &unk_1E4391658;
  v7[4] = self;
  objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", requestContext, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __65__ICPushNotificationsRegisterAPNSTokenRequest__registerAPNSToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICStoreURLRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v39 = v7;
      v40 = 2114;
      v41 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(a2, "dictionaryForBagKey:", CFSTR("push-notifications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("register-success"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("environment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v35 = v9;
      v36 = v8;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deviceGUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("guid"));

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deviceName");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend(v17, "name", v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataUsingEncoding:allowLossyConversion:", 4, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("device-name-data"));

      }
      objc_msgSend(v17, "serialNumber", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("serial-number"));
      v34 = v10;
      if (v10)
        v21 = v10;
      else
        v21 = (void *)*MEMORY[0x1E0CFE130];
      objc_msgSend(v12, "setObject:forKey:", v21, CFSTR("environment"));
      objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), CFSTR("token"));
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v11, "setHTTPBody:", v22);
      v23 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICURLRequest progress](v23, "progress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addChild:withPendingUnitCount:", v25, 100);

      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __65__ICPushNotificationsRegisterAPNSTokenRequest__registerAPNSToken__block_invoke_28;
      v37[3] = &unk_1E4391630;
      v37[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v26, "enqueueDataRequest:withCompletionHandler:", v23, v37);

      v9 = v35;
      v8 = v36;
      v27 = (void *)v33;
      v10 = v34;
    }
    else
    {
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v39 = v29;
        _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Missing register-success url in bag - skipping", buf, 0xCu);
      }

      v30 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "finishWithError:", v27);
    }

  }
}

void __65__ICPushNotificationsRegisterAPNSTokenRequest__registerAPNSToken__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  ICPushNotificationsResponse *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ request failed. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ recieved response %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v10 = -[ICPushNotificationsResponse initWithResponseDictionary:]([ICPushNotificationsResponse alloc], "initWithResponseDictionary:", v6);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 320);
    *(_QWORD *)(v11 + 320) = v10;

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __81__ICPushNotificationsRegisterAPNSTokenRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), a2);
  return result;
}

@end
