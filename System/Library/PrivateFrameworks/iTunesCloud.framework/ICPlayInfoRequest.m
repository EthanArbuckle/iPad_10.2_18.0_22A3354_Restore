@implementation ICPlayInfoRequest

- (ICPlayInfoRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICPlayInfoRequest *v5;
  uint64_t v6;
  ICStoreRequestContext *requestContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayInfoRequest;
  v5 = -[ICRequestOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;

  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ICPlayInfoRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  ICStoreRequestContext *requestContext;
  void *v5;
  NSNumber *v6;
  NSNumber *contentIdentifier;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *subscriptionPlaybackType;
  NSString *playerGUID;
  NSData *SICData;
  void *v18;
  ICStoreRequestContext *v19;
  NSObject *v20;
  void *v21;
  ICStoreRequestContext *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  ICPlayInfoRequest *v29;
  __int16 v30;
  ICStoreRequestContext *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestContext = self->_requestContext;
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = requestContext;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Executing playInfo request with context %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_DSID;
  if (v6
    || (-[ICPlayInfoRequest _getSinfParamValue:](self, "_getSinfParamValue:", 1),
        (v6 = (NSNumber *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("dsid"));
    contentIdentifier = self->_contentIdentifier;
    if (contentIdentifier)
    {
      objc_msgSend(v5, "setObject:forKey:", contentIdentifier, CFSTR("content-id"));
    }
    else
    {
      -[ICPlayInfoRequest _getSinfParamValue:](self, "_getSinfParamValue:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (-[ICPlayInfoRequest _hasRentalInfo](self, "_hasRentalInfo"))
        {
          v27 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("rental-ids");
        }
        else
        {
          v26 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("key-ids");
        }
        objc_msgSend(v5, "setObject:forKey:", v9, v10);

      }
    }
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("guid"));
    objc_msgSend(v12, "deviceModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("hw.model"));
    subscriptionPlaybackType = self->_subscriptionPlaybackType;
    if (subscriptionPlaybackType)
      objc_msgSend(v5, "setObject:forKey:", subscriptionPlaybackType, CFSTR("subPlayType"));
    playerGUID = self->_playerGUID;
    if (playerGUID)
      objc_msgSend(v5, "setObject:forKey:", playerGUID, CFSTR("player-guid"));
    SICData = self->_SICData;
    if (SICData)
      objc_msgSend(v5, "setObject:forKey:", SICData, CFSTR("sic"));
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (ICStoreRequestContext *)v25;
    if (v19)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize body data. err=%{public}@", buf, 0x16u);
      }

      -[ICRequestOperation finishWithError:](self, "finishWithError:", v19);
    }
    else
    {
      +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_requestContext;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __28__ICPlayInfoRequest_execute__block_invoke;
      v23[3] = &unk_1E438E8D8;
      v23[4] = self;
      v24 = v18;
      objc_msgSend(v21, "getBagForRequestContext:withCompletionHandler:", v22, v23);

    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = 0;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to extract account DSID. err=%{public}@", buf, 0x16u);
    }

    -[ICRequestOperation finishWithError:](self, "finishWithError:", 0);
  }

}

- (id)_getSinfParamValue:(int)a3
{
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_sinfs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v14 = 0;
        v10 = objc_retainAutorelease(v9);
        hZZRqgZwI(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v3, (uint64_t)&v14);
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_hasRentalInfo
{
  int ContextIdentifierForFolderPath;
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  _QWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  unsigned int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v19 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v20, &v19);
  v4 = v19;
  LOBYTE(v5) = 0;
  if (ContextIdentifierForFolderPath)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_sinfs;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v14[0] = 0;
          v14[1] = 0;
          v10 = v20;
          v11 = objc_retainAutorelease(v9);
          RbFpir(v10, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (uint64_t)v14);
          if (!v12)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (NSString)playerGUID
{
  return self->_playerGUID;
}

- (void)setPlayerGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSData)SICData
{
  return self->_SICData;
}

- (void)setSICData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSNumber)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)subscriptionPlaybackType
{
  return self->_subscriptionPlaybackType;
}

- (void)setSubscriptionPlaybackType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPlaybackType, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_SICData, 0);
  objc_storeStrong((id *)&self->_playerGUID, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __28__ICPlayInfoRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ICStoreURLRequest *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("get-play-info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v9, "setCachePolicy:", 1);
      objc_msgSend(v9, "setHTTPBody:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
      v10 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __28__ICPlayInfoRequest_execute__block_invoke_32;
      v15[3] = &unk_1E4391630;
      v15[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v10, v15);

    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Request URL not found - failing request", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithError:", v9);
    }

  }
}

void __28__ICPlayInfoRequest_execute__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  ICPlayInfoResponse *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (!objc_msgSend(v7, "ic_intValueForKey:", CFSTR("status")))
      {
        v16 = -[ICPlayInfoResponse initWithResponseDictionary:]([ICPlayInfoResponse alloc], "initWithResponseDictionary:", v8);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 312);
        *(_QWORD *)(v17 + 312) = v16;

        v6 = 0;
        goto LABEL_10;
      }
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = (int)objc_msgSend(v8, "ic_intValueForKey:", CFSTR("status"));
      v11 = CFSTR("ICStoreServerError");
      v12 = v9;
      v13 = v8;
    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v19 = 138543362;
        v20 = v15;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ failed to parse response", (uint8_t *)&v19, 0xCu);
      }

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v11 = CFSTR("ICError");
      v10 = -7102;
      v13 = 0;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v11, v10, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

}

void __48__ICPlayInfoRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
