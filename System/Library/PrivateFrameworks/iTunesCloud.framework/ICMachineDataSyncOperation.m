@implementation ICMachineDataSyncOperation

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
  v6[2] = __37__ICMachineDataSyncOperation_execute__block_invoke;
  v6[3] = &unk_1E438E900;
  v6[4] = self;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v6);

}

- (void)_finishWithSyncState:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[ICMachineDataOperation completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICMachineDataOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[ICAsyncOperation finishWithError:](self, "finishWithError:", v6);

}

void __37__ICMachineDataSyncOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__12913;
  v40 = __Block_byref_object_dispose__12914;
  v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__12913;
  v34[4] = __Block_byref_object_dispose__12914;
  v35 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v30 = 0;
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
  objc_msgSend(*(id *)(a1 + 32), "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");
  objc_msgSend(*(id *)(a1 + 32), "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  tn46gtiuhw(v7, v10, objc_msgSend(v11, "length"), (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31, (uint64_t)&v30);
  v13 = v12;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v37[5];
    v37[5] = v14;

    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v37[5];
      *(_DWORD *)buf = 138543362;
      v43 = v17;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "failed to sync machine data. err=%{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishWithSyncState:error:", 0, v37[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithADIBytes:length:", v31, v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithADIBytes:length:", v33, v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__ICMachineDataSyncOperation_execute__block_invoke_3;
    v24[3] = &unk_1E438C158;
    v24[4] = *(_QWORD *)(a1 + 32);
    v27 = &v36;
    v22 = v18;
    v25 = v22;
    v23 = v19;
    v26 = v23;
    v28 = v34;
    v29 = v7;
    objc_msgSend(v20, "getBagForRequestContext:withCompletionHandler:", v21, v24);

  }
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __37__ICMachineDataSyncOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICStoreURLRequest *v18;
  void *v19;
  ICStoreURLRequest *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "failed to fetch url bag for machine data sync. err=%{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishWithSyncState:error:", 0, v6);
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "protocolVersion");
    v9 = CFSTR("md-sync-machine");
    if (v8 == 2)
      v9 = CFSTR("amd-sync-machine");
    v10 = v9;
    objc_msgSend(v5, "urlForBagKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("clientData"));

      objc_msgSend(*(id *)(a1 + 48), "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("machineId"));

      if (objc_msgSend(*(id *)(a1 + 32), "protocolVersion") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("dsId"));

      }
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHTTPBody:", v17);

      v18 = [ICStoreURLRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "requestContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ICStoreURLRequest initWithURLRequest:requestContext:](v18, "initWithURLRequest:requestContext:", v16, v19);

      -[ICURLRequest setMaxRetryCount:](v20, "setMaxRetryCount:", 0);
      -[ICURLRequest setPrioritize:](v20, "setPrioritize:", 1);
      +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __37__ICMachineDataSyncOperation_execute__block_invoke_16;
      v25[3] = &unk_1E438C130;
      v25[4] = *(_QWORD *)(a1 + 32);
      v26 = *(_OWORD *)(a1 + 56);
      objc_msgSend(v21, "enqueueDataRequest:withCompletionHandler:", v20, v25);

    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "failed to sync machine data because the bag is missing the request url", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }

  }
}

void __37__ICMachineDataSyncOperation_execute__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "failed to perform machine data sync request. err=%{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishWithSyncState:error:", 0, v5);
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v9 = 1;
    else
      v9 = v7 == 0;
    if (!v9)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("syncState"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(*(id *)(a1 + 32), "_finishWithSyncState:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

  }
}

@end
