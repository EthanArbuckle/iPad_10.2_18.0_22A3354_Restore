@implementation ICMusicAccountNotificationsSettingsRequestOperation

- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4
{
  id v7;
  ICMusicAccountNotificationsSettingsRequestOperation *v8;
  ICMusicAccountNotificationsSettingsRequestOperation *v9;

  v7 = a3;
  v8 = -[ICRequestOperation init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestContext, a3);
    v9->_requestMethod = a4;
  }

  return v9;
}

- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4 andBodyDictionary:(id)a5
{
  id v9;
  id v10;
  ICMusicAccountNotificationsSettingsRequestOperation *v11;
  ICMusicAccountNotificationsSettingsRequestOperation *v12;

  v9 = a3;
  v10 = a5;
  v11 = -[ICRequestOperation init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    v12->_requestMethod = a4;
    objc_storeStrong((id *)&v12->_bodyDictionary, a5);
  }

  return v12;
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
  v6[2] = __89__ICMusicAccountNotificationsSettingsRequestOperation_performRequestWithResponseHandler___block_invoke;
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

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke;
  v5[3] = &unk_1E438E900;
  v5[4] = self;
  objc_msgSend(v3, "getPropertiesForUserIdentity:completionHandler:", v4, v5);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICMusicAccountNotificationsSettingsRequestOperation;
  -[ICMusicAccountNotificationsSettingsRequestOperation cancel](&v4, sel_cancel);
  +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_storeURLRequest);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyDictionary, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  if (a2 | a3)
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 312);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_2;
    v9[3] = &unk_1E4391658;
    v9[4] = v6;
    objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", v7, v9);

  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v8);

  }
}

void __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  ICStoreURLRequest *v17;
  ICStoreURLRequest *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  ICStoreURLRequest *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
    return;
  }
  objc_msgSend(a2, "dictionaryForBagKey:", CFSTR("musicFriends"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336))
    v5 = CFSTR("setPushNotificationSettings");
  else
    v5 = CFSTR("getPushNotificationSettings");
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99E98], "ic_queryParametersDictionaryFromString:", CFSTR("v=2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v10);

    objc_msgSend(MEMORY[0x1E0C99E98], "ic_queryParametersDictionaryFromString:", CFSTR("serviceId=com.apple.Music"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v11);

    objc_msgSend(v8, "ic_URLByAppendingQueryParameters:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v12);
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 336) == 1)
    {
      v15 = *(_QWORD *)(v14 + 344);
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (ICStoreURLRequest *)v25;
      v18 = v17;
      if (!v16 || v17)
      {
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344);
          *(_DWORD *)buf = 138543618;
          v27 = v18;
          v28 = 2114;
          v29 = v23;
          _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "Failed to serialize body data. error=%{public}@, bodyDictionary=%{public}@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v18);
        goto LABEL_17;
      }
      objc_msgSend(v13, "setHTTPBody:", v16);
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json; charset=UTF-8"), CFSTR("Content-Type"));

      v19 = CFSTR("POST");
    }
    else
    {
      v19 = CFSTR("GET");
    }
    objc_msgSend(v13, "setHTTPMethod:", v19);
    v18 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
    +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_23;
    v24[3] = &unk_1E4391630;
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "enqueueDataRequest:withCompletionHandler:", v18, v24);
LABEL_17:

    goto LABEL_18;
  }
  v20 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "finishWithError:", v21);

LABEL_18:
}

uint64_t __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  ICMusicAccountNotificationsSettingsResponse *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = [ICMusicAccountNotificationsSettingsResponse alloc];
  objc_msgSend(v3, "parsedBodyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ICMusicAccountNotificationsSettingsResponse initWithResponseDictionary:](v4, "initWithResponseDictionary:", v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 328);
  *(_QWORD *)(v7 + 328) = v6;

  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

uint64_t __89__ICMusicAccountNotificationsSettingsRequestOperation_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), a2);
}

@end
