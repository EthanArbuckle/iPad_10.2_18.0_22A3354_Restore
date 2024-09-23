@implementation ICMusicSubscriptionRequest

- (ICMusicSubscriptionRequest)initWithStoreRequestContext:(id)a3 requestType:(int64_t)a4 requestingOfflineSlot:(BOOL)a5
{
  id v9;
  ICMusicSubscriptionRequest *v10;
  ICMusicSubscriptionRequest *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionRequest;
  v10 = -[ICRequestOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storeRequestContext, a3);
    v11->_requestType = a4;
    v11->_requestingOfflineSlot = a5;
  }

  return v11;
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
  v5[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke;
  v5[3] = &unk_1E4391658;
  v5[4] = self;
  objc_msgSend(v3, "getBagForRequestContext:withCompletionHandler:", storeRequestContext, v5);

}

- (id)_bagKeyForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self = *off_1E4389998[a3];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v7, "_bagKeyForRequestType:", v7[39]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlForBagKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-apple-use-amd"));
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend((id)v27[5], "setObject:forKey:", v12, CFSTR("guid"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "deviceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isWatch");

      if (v14)
      {
        +[ICNanoPairedDeviceStatusMonitor sharedMonitor](ICNanoPairedDeviceStatusMonitor, "sharedMonitor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pairedDeviceMediaGUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend((id)v27[5], "setObject:forKey:", v16, CFSTR("companion-guid"));

      }
      v17 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v17 + 320))
      {
        objc_msgSend((id)v27[5], "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isRequestingSlot"));
        v17 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v17 + 304), "identityStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_13;
      v23[3] = &unk_1E4389978;
      v23[4] = *(_QWORD *)(a1 + 32);
      v20 = v10;
      v24 = v20;
      v25 = &v26;
      objc_msgSend(v18, "getPropertiesForUserIdentity:completionHandler:", v19, v23);

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishWithError:", v22);

    }
  }

}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[5];
  void (**v23)(_QWORD, _QWORD);
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get user identity properties. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_14;
    v27[3] = &unk_1E4389928;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v28 = v10;
    v29 = v11;
    v30 = 0;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v27);
    objc_msgSend(v5, "DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

    v25 = 0;
    v26 = 0;
    v15 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", -1, &v26, 0, &v25);
    v16 = v26;
    v17 = v25;
    if (v15)
    {
      +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_28;
      v22[3] = &unk_1E4389950;
      v19 = *(_QWORD *)(a1 + 48);
      v22[4] = *(_QWORD *)(a1 + 32);
      v24 = v19;
      v23 = v12;
      objc_msgSend(v18, "generateSubscriptionBagRequestWithAccountUniqueIdentifier:transactionType:machineIDData:completionHandler:", v14, 312, v16, v22);

    }
    else
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate machine data for subscription request. err=%{public}@", buf, 0x16u);
      }

      v12[2](v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }

  }
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_14(uint64_t a1, uint64_t a2)
{
  void *v3;
  ICStoreURLRequest *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 100, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setHTTPBody:", v3);
  v4 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304));
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_2;
  v7[3] = &unk_1E438E870;
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  objc_msgSend(v5, "enqueueDataRequest:withCompletionHandler:", v4, v7);

}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_28(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@  failed to generate subscription bag sync data. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v7, CFSTR("sbsync"));
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(void))(a1[5] + 16))();

}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
    return;
  }
  objc_msgSend(a2, "parsedBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received subscription response %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("statusCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = -7102;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v7, "intValue");
  if (v8)
  {
LABEL_10:
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICStoreServerError"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v9;
LABEL_11:
    objc_msgSend(v13, "finishWithError:", v14);
    goto LABEL_12;
  }
  ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = *(void **)(a1 + 32);
    v14 = 0;
    goto LABEL_11;
  }
  +[ICMusicSubscriptionFairPlayController sharedController](ICMusicSubscriptionFairPlayController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_23;
  v15[3] = &unk_1E438A0C8;
  v11 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v11;
  objc_msgSend(v10, "importSubscriptionKeyBagData:completionHandler:", v9, v15);

LABEL_12:
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to import subscription keybag. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);

}

@end
