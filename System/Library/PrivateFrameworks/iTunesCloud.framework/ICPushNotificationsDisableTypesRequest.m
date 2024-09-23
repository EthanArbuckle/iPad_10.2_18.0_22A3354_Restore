@implementation ICPushNotificationsDisableTypesRequest

- (ICPushNotificationsDisableTypesRequest)initWithRequestContext:(id)a3 notificationType:(id)a4
{
  id v6;
  id v7;
  ICPushNotificationsDisableTypesRequest *v8;
  uint64_t v9;
  ICStoreRequestContext *requestContext;
  uint64_t v11;
  NSString *notificationType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICPushNotificationsDisableTypesRequest;
  v8 = -[ICRequestOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    requestContext = v8->_requestContext;
    v8->_requestContext = (ICStoreRequestContext *)v9;

    v11 = objc_msgSend(v7, "copy");
    notificationType = v8->_notificationType;
    v8->_notificationType = (NSString *)v11;

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
  v6[2] = __76__ICPushNotificationsDisableTypesRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  NSString *notificationType;
  void *v5;
  ICStoreRequestContext *requestContext;
  _QWORD v7[5];
  uint8_t buf[4];
  ICPushNotificationsDisableTypesRequest *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    notificationType = self->_notificationType;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = notificationType;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Disabling push notifications for type %{public}@", buf, 0x16u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke;
  v7[3] = &unk_1E4391658;
  v7[4] = self;
  objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", requestContext, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
  ICStoreURLRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      v29 = 2114;
      v30 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(a2, "dictionaryForBagKey:", CFSTR("push-notification-types"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("remove-push-notification-type-url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v25 = v8;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v10);
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
      objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), CFSTR("notification-type"));
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v11, "setHTTPBody:", v17);
      v18 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICURLRequest progress](v18, "progress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addChild:withPendingUnitCount:", v20, 100);

      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke_15;
      v26[3] = &unk_1E4391630;
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "enqueueDataRequest:withCompletionHandler:", v18, v26);

      v8 = v25;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing remove-push-notification-type-url url in bag - skipping", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "finishWithError:", v10);
    }

  }
}

void __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke_15(uint64_t a1, void *a2, void *a3)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removePushNotification request failed. err=%{public}@", (uint8_t *)&v13, 0x16u);
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
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removePushNotification request returned response %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v10 = -[ICPushNotificationsResponse initWithResponseDictionary:]([ICPushNotificationsResponse alloc], "initWithResponseDictionary:", v6);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 320);
    *(_QWORD *)(v11 + 320) = v10;

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __76__ICPushNotificationsDisableTypesRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), a2);
  return result;
}

@end
