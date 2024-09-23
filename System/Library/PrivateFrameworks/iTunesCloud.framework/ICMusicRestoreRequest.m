@implementation ICMusicRestoreRequest

- (ICMusicRestoreRequest)initWithRequestContext:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  ICMusicRestoreRequest *v9;
  ICMusicRestoreRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicRestoreRequest;
  v9 = -[ICRequestOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestContext, a3);
    objc_storeStrong((id *)&v10->_requestParameters, a4);
  }

  return v10;
}

- (void)performRestoreRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__ICMusicRestoreRequest_performRestoreRequestWithCompletionHandler___block_invoke;
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
  void *v5;
  ICStoreRequestContext *requestContext;
  void *v7;
  char v8;
  id v9;
  _QWORD v10[5];

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isIPhone") & 1) != 0)
    goto LABEL_4;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isIPad"))
  {

LABEL_4:
LABEL_5:
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    requestContext = self->_requestContext;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__ICMusicRestoreRequest_execute__block_invoke;
    v10[3] = &unk_1E4391658;
    v10[4] = self;
    objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", requestContext, v10);

    return;
  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isIPod");

  if ((v8 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRequestOperation finishWithError:](self, "finishWithError:", v9);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICMusicRestoreRequest;
  -[ICMusicRestoreRequest cancel](&v4, sel_cancel);
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_storeURLRequest);

}

- (id)_serializedBodyDataWithAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int ContextIdentifierForFolderPath;
  id v13;
  _BOOL4 v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  ICMusicRestoreRequestParameters *requestParameters;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  ICMusicRestoreRequest *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  unsigned int v46;
  void *v47;
  uint8_t buf[4];
  ICMusicRestoreRequest *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("device-name"));
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("guid"));
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("serial-number"));
  v46 = 0;
  v45 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v46, &v45);
  v13 = v45;
  if (ContextIdentifierForFolderPath)
  {
    v44 = 0;
    v43 = v13;
    v14 = ICFairPlayCopyKeyBagSyncDataWithContextID(v46, objc_msgSend(v4, "unsignedLongLongValue"), 1, &v44, &v43);
    v15 = v44;
    v16 = v43;

    v41 = v15;
    if (v14)
    {
      objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("kbsync"));
    }
    else
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v49 = self;
        v50 = 2114;
        v51 = 0;
        v52 = 2114;
        v53 = v16;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Copying keybag sync data for path %{public}@ failed with error: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      v50 = 2114;
      v51 = v13;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting context ID failed with error: %{public}@", buf, 0x16u);
    }

    v41 = 0;
    v16 = v13;
  }
  v40 = v16;
  requestParameters = self->_requestParameters;
  if (requestParameters)
  {
    v37 = v9;
    v20 = (void *)MEMORY[0x1E0C99D80];
    -[ICMusicRestoreRequestParameters adamID](requestParameters, "adamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters flavor](self->_requestParameters, "flavor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters storeFrontID](self->_requestParameters, "storeFrontID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters mediaKind](self->_requestParameters, "mediaKind");
    v36 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters accountID](self->_requestParameters, "accountID");
    v38 = v5;
    v39 = v7;
    v25 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters title](self->_requestParameters, "title");
    v27 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequestParameters matchStatus](v27->_requestParameters, "matchStatus");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, CFSTR("item-id"), v22, CFSTR("flavor"), v23, CFSTR("store-front-id"), v24, CFSTR("kind"), v26, CFSTR("account-id"), v28, CFSTR("title"), v29, CFSTR("match-status"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    self = v27;
    v4 = v25;
    v5 = v38;
    v7 = v39;

    v11 = v36;
    v47 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", v31, CFSTR("items"));

    v9 = v37;
  }
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v42;

  if (!v32)
  {
    v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      v50 = 2114;
      v51 = v33;
      _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Serializing request body failed with error: %{public}@", buf, 0x16u);
    }

  }
  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __32__ICMusicRestoreRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICMusicRestoreBagConfiguration *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  ICMusicRestoreBagConfiguration *v32;
  id v33;
  _BYTE *v34;
  uint8_t v35[16];
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "finishWithError:", v6);
  }
  else if (objc_msgSend(v7, "isCancelled"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

  }
  else
  {
    objc_msgSend(v5, "dictionaryForBagKey:", CFSTR("p2-content-restore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (_NSIsNSDictionary() & 1) != 0)
    {
      v11 = -[ICMusicRestoreBagConfiguration initWithServerConfiguration:]([ICMusicRestoreBagConfiguration alloc], "initWithServerConfiguration:", v10);
      -[ICMusicRestoreBagConfiguration allowedKinds](v11, "allowedKinds");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "containsObject:", CFSTR("song")) & 1) != 0)
      {
        -[ICMusicRestoreBagConfiguration allowedMatchStatus](v11, "allowedMatchStatus");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "matchStatus");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13 && v14 && (objc_msgSend(v13, "containsObject:", v14) & 1) == 0)
        {
          _ICLogCategoryDefault();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = objc_msgSend(v15, "longLongValue");
            _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_ERROR, "StoreMatchStatus is not in acceptable list - allowedMatchStatus=%{public}@, itemMatchStatus=%lld", buf, 0x16u);
          }

          v27 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "finishWithError:", v28);

        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v37 = __Block_byref_object_copy__9616;
          v38 = __Block_byref_object_dispose__9617;
          -[ICMusicRestoreBagConfiguration restoreURL](v11, "restoreURL");
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "identityStore");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __32__ICMusicRestoreRequest_execute__block_invoke_31;
            v29[3] = &unk_1E438B600;
            v18 = v16;
            v19 = *(_QWORD *)(a1 + 32);
            v30 = v18;
            v31 = v19;
            v34 = buf;
            v32 = v11;
            v33 = v5;
            objc_msgSend(v17, "getPropertiesForUserIdentity:completionHandler:", v18, v29);

          }
          else
          {
            _ICLogCategoryDefault();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v35 = 0;
              _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "Error reading restore URL from bag", v35, 2u);
            }

            v25 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "finishWithError:", v18);
          }

          _Block_object_dispose(buf, 8);
        }

      }
      else
      {
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = CFSTR("song");
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v12;
          _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "Asset type %{public}@ is not present in allowed restore kinds (%{public}@)", buf, 0x16u);
        }

        v23 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "finishWithError:", v13);
      }

    }
    else
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "Error reading restore configuration from bag", buf, 2u);
      }

      v21 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v11 = (ICMusicRestoreBagConfiguration *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishWithError:", v11);
    }

  }
}

void __32__ICMusicRestoreRequest_execute__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  ICStoreURLRequest *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v43 = v23;
      v44 = 2114;
      v45 = v7;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "Could not get properties for %{public}@, error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(v5, "DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "serialNumber");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("serial-number"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "ic_URLByAppendingQueryParameters:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

      }
      v37 = (void *)v13;
      v17 = objc_msgSend(*(id *)(a1 + 48), "shouldGZip");
      objc_msgSend(*(id *)(a1 + 40), "_serializedBodyDataWithAccountID:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v36 = v12;
      if (v17 && objc_msgSend(v18, "length"))
      {
        MSVGzipCompressData();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          v35 = v20;

          v21 = CFSTR("gzip");
          v19 = v35;
        }
        else
        {
          v21 = 0;
        }

        v12 = v36;
      }
      else
      {
        v21 = 0;
      }
      if (objc_msgSend(v19, "length"))
      {
        objc_msgSend(v11, "setCachePolicy:", 1);
        objc_msgSend(v11, "setHTTPBody:", v19);
        objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
        if (v21)
          objc_msgSend(v11, "setValue:forHTTPHeaderField:", v21, CFSTR("Content-Encoding"));
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("com.apple.atc"), CFSTR("X-Apple-Issuing-Process"));
        v26 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304));
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(void **)(v27 + 312);
        *(_QWORD *)(v27 + 312) = v26;

        +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 40);
        v31 = *(_QWORD *)(v30 + 312);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __32__ICMusicRestoreRequest_execute__block_invoke_45;
        v39[3] = &unk_1E438BF78;
        v39[4] = v30;
        v40 = v10;
        v41 = *(id *)(a1 + 56);
        objc_msgSend(v29, "enqueueDataRequest:withCompletionHandler:", v31, v39);

        v12 = v36;
      }
      else
      {
        v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_ERROR, "Error serializing request body data", buf, 2u);
        }

        v33 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7005, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "finishWithError:", v34);

      }
    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v43 = v9;
        v44 = 2114;
        v45 = v8;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "Invalid userName (%{public}@), DSID (%{public}@)", buf, 0x16u);
      }

      v25 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "finishWithError:", v10);
    }

  }
}

void __32__ICMusicRestoreRequest_execute__block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ICMediaRedownloadResponse *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(a2, "parsedBodyDictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[ICMediaRedownloadResponse initWithResponseDictionary:requestDate:urlBag:]([ICMediaRedownloadResponse alloc], "initWithResponseDictionary:requestDate:urlBag:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 320);
  *(_QWORD *)(v7 + 320) = v6;

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
}

void __68__ICMusicRestoreRequest_performRestoreRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(_QWORD *)(v2 + 312) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 320);
  *(_QWORD *)(v4 + 320) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 304);
  *(_QWORD *)(v8 + 304) = 0;

}

@end
