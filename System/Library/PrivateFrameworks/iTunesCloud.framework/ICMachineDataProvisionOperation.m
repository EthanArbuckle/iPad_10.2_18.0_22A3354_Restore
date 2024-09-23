@implementation ICMachineDataProvisionOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[ICMachineDataOperation requestContext](self, "requestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ICMachineDataProvisionOperation_execute__block_invoke;
  v6[3] = &unk_1E438E900;
  v6[4] = self;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v6);

}

- (void)_finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[ICMachineDataOperation completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICMachineDataOperation completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
  -[ICAsyncOperation finishWithError:](self, "finishWithError:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionSession, 0);
}

void __42__ICMachineDataProvisionOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  ICADIProvisionSession *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id obj;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "protocolVersion") == 2)
  {
    v7 = -1;
  }
  else
  {
    objc_msgSend(v5, "DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "unsignedLongLongValue");

  }
  v9 = -[ICADIProvisionSession initWithAccountID:]([ICADIProvisionSession alloc], "initWithAccountID:", v7);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 320);
  *(_QWORD *)(v10 + 320) = v9;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3063;
  v32 = __Block_byref_object_dispose__3064;
  v33 = 0;
  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[40];
  objc_msgSend(v12, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id *)(v29 + 5);
  obj = (id)v29[5];
  v27 = 0;
  v16 = objc_msgSend(v13, "startWithServerActionData:returningClientData:error:", v14, &v27, &obj);
  v17 = v27;
  objc_storeStrong(v15, obj);

  if ((v16 & 1) != 0)
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __42__ICMachineDataProvisionOperation_execute__block_invoke_2;
    v22[3] = &unk_1E438A2E8;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v17;
    v24 = &v28;
    v25 = v7;
    objc_msgSend(v18, "getBagForRequestContext:withCompletionHandler:", v19, v22);

  }
  else
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v29[5];
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "failed to start machine data provisioning. err=%{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v29[5]);
  }

  _Block_object_dispose(&v28, 8);
}

void __42__ICMachineDataProvisionOperation_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  ICStoreURLRequest *v22;
  void *v23;
  ICStoreURLRequest *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[6];
  id obj;
  id v31;
  uint8_t buf[16];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "_finishWithError:", a3);
  }
  else
  {
    v7 = objc_msgSend(v6, "protocolVersion");
    v8 = CFSTR("md-finish-provisioning");
    if (v7 == 2)
      v8 = CFSTR("amd-finish-provisioning");
    v9 = v8;
    objc_msgSend(v5, "urlForBagKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v10);
      objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 40), "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("clientData"));

      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("guid"));
      if (objc_msgSend(*(id *)(a1 + 32), "protocolVersion") == 1)
      {
        v16 = *(_QWORD *)(a1 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v17 + 40);
        v31 = 0;
        v18 = ICFairPlayCopyKeyBagSyncData(v16, 1, &v31, &obj);
        v19 = v31;
        objc_storeStrong((id *)(v17 + 40), obj);
        if (v18 && v19)
          objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("kbsync"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("dsId"));

      }
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHTTPBody:", v21);

      v22 = [ICStoreURLRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "requestContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[ICStoreURLRequest initWithURLRequest:requestContext:](v22, "initWithURLRequest:requestContext:", v11, v23);

      -[ICURLRequest setMaxRetryCount:](v24, "setMaxRetryCount:", 0);
      -[ICURLRequest setPrioritize:](v24, "setPrioritize:", 1);
      +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __42__ICMachineDataProvisionOperation_execute__block_invoke_19;
      v29[3] = &unk_1E438A2C0;
      v26 = *(_QWORD *)(a1 + 48);
      v29[4] = *(_QWORD *)(a1 + 32);
      v29[5] = v26;
      objc_msgSend(v25, "enqueueDataRequest:withCompletionHandler:", v24, v29);

    }
    else
    {
      v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "failed to perform machine data provisioning because the url is missing from the bag", buf, 2u);
      }

      v28 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_finishWithError:", v11);
    }

  }
}

void __42__ICMachineDataProvisionOperation_execute__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  void *v21;
  id v22;
  id obj;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "failed to perform machine data provisioning request. err=%{public}@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_finishWithError:", v8);
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("transportKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("keybag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("settingInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
    {
      if (v11)
      {
        if (!objc_msgSend(v10, "length")
          || (v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8),
              obj = *(id *)(v13 + 40),
              v14 = ICFairPlayImportKeybagData(v10, &obj),
              objc_storeStrong((id *)(v13 + 40), obj),
              v14))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
          v17 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v22 = *(id *)(v18 + 40);
          v19 = objc_msgSend(v17, "endWithMessageData:transportKey:error:", v15, v16, &v22);
          objc_storeStrong((id *)(v18 + 40), v22);
          if ((v19 & 1) == 0)
          {
            v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              *(_DWORD *)buf = 138543362;
              v25 = v21;
              _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "failed to end machine data provisioning. err=%{public}@", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

        }
      }
    }

  }
}

@end
