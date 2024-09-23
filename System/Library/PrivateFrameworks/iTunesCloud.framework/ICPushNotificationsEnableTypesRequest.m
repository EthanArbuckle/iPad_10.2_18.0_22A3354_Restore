@implementation ICPushNotificationsEnableTypesRequest

- (ICPushNotificationsEnableTypesRequest)initWithRequestContext:(id)a3 notificationType:(id)a4 notificationParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICPushNotificationsEnableTypesRequest *v11;
  uint64_t v12;
  ICStoreRequestContext *requestContext;
  uint64_t v14;
  NSString *notificationType;
  uint64_t v16;
  NSDictionary *notificationParams;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICPushNotificationsEnableTypesRequest;
  v11 = -[ICRequestOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    requestContext = v11->_requestContext;
    v11->_requestContext = (ICStoreRequestContext *)v12;

    v14 = objc_msgSend(v9, "copy");
    notificationType = v11->_notificationType;
    v11->_notificationType = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    notificationParams = v11->_notificationParams;
    v11->_notificationParams = (NSDictionary *)v16;

  }
  return v11;
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
  v6[2] = __75__ICPushNotificationsEnableTypesRequest_performRequestWithResponseHandler___block_invoke;
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
  NSDictionary *notificationParams;
  void *v6;
  ICStoreRequestContext *requestContext;
  _QWORD v8[5];
  uint8_t buf[4];
  ICPushNotificationsEnableTypesRequest *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  NSDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    notificationType = self->_notificationType;
    notificationParams = self->_notificationParams;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = notificationType;
    v13 = 2114;
    v14 = notificationParams;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Enabling push notifications for type %{public}@ with params %{public}@", buf, 0x20u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ICPushNotificationsEnableTypesRequest_execute__block_invoke;
  v8[3] = &unk_1E4391658;
  v8[4] = self;
  objc_msgSend(v6, "getBagForRequestContext:withCompletionHandler:", requestContext, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_notificationParams, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __48__ICPushNotificationsEnableTypesRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v8, "objectForKey:", CFSTR("add-push-notification-type-url"));
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
      objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), CFSTR("parameters"));
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
      v26[2] = __48__ICPushNotificationsEnableTypesRequest_execute__block_invoke_17;
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
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing add-push-notification-type-url url in bag - skipping", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "finishWithError:", v10);
    }

  }
}

void __48__ICPushNotificationsEnableTypesRequest_execute__block_invoke_17(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ addPushNotification request failed. err=%{public}@", (uint8_t *)&v13, 0x16u);
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
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ addPushNotification request returned response %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v10 = -[ICPushNotificationsResponse initWithResponseDictionary:]([ICPushNotificationsResponse alloc], "initWithResponseDictionary:", v6);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 328);
    *(_QWORD *)(v11 + 328) = v10;

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

uint64_t __75__ICPushNotificationsEnableTypesRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), a2);
  return result;
}

@end
