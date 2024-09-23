@implementation ICLibraryAuthServiceClientTokenProvider

- (ICLibraryAuthServiceClientTokenProvider)init
{
  ICLibraryAuthServiceClientTokenProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  uint64_t v7;
  NSMutableDictionary *tokenCache;
  void *v9;
  objc_class *v10;
  AFMultiUserConnection *v11;
  AFMultiUserConnection *siriConnection;
  void *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)ICLibraryAuthServiceClientTokenProvider;
  v2 = -[ICLibraryAuthServiceClientTokenProvider init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = (NSMutableDictionary *)v7;

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v9 = (void *)getAFMultiUserConnectionClass_softClass;
    v20 = getAFMultiUserConnectionClass_softClass;
    if (!getAFMultiUserConnectionClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getAFMultiUserConnectionClass_block_invoke;
      v16[3] = &unk_1E4391138;
      v16[4] = &v17;
      __getAFMultiUserConnectionClass_block_invoke((uint64_t)v16);
      v9 = (void *)v18[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v17, 8);
    v11 = (AFMultiUserConnection *)objc_alloc_init(v10);
    siriConnection = v2->_siriConnection;
    v2->_siriConnection = v11;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification_, CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSXPCConnection *xpcClientConnection;
  NSXPCConnection *v5;
  NSXPCListener *xpcServiceListener;
  NSXPCListener *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  xpcClientConnection = self->_xpcClientConnection;
  if (xpcClientConnection)
  {
    -[NSXPCConnection invalidate](xpcClientConnection, "invalidate");
    v5 = self->_xpcClientConnection;
    self->_xpcClientConnection = 0;

  }
  xpcServiceListener = self->_xpcServiceListener;
  if (xpcServiceListener)
  {
    -[NSXPCListener invalidate](xpcServiceListener, "invalidate");
    v7 = self->_xpcServiceListener;
    self->_xpcServiceListener = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)ICLibraryAuthServiceClientTokenProvider;
  -[ICLibraryAuthServiceClientTokenProvider dealloc](&v8, sel_dealloc);
}

- (void)startService
{
  NSObject *v3;
  NSXPCListener *v4;
  NSXPCListener *xpcServiceListener;
  void *v6;
  int v7;
  ICLibraryAuthServiceClientTokenProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting system service...", (uint8_t *)&v7, 0xCu);
  }

  self->_isService = 1;
  -[ICLibraryAuthServiceClientTokenProvider _loadCache](self, "_loadCache");
  -[ICLibraryAuthServiceClientTokenProvider _updateEntriesForAccountsChanges](self, "_updateEntriesForAccountsChanges");
  -[ICLibraryAuthServiceClientTokenProvider _updateRefreshTimer](self, "_updateRefreshTimer");
  v4 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.itunescloud.library-auth-token-provider"));
  xpcServiceListener = self->_xpcServiceListener;
  self->_xpcServiceListener = v4;

  -[NSXPCListener setDelegate:](self->_xpcServiceListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcServiceListener, "resume");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleUserIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), 0);

}

- (void)stopService
{
  NSObject *v3;
  NSXPCListener *xpcServiceListener;
  int v5;
  ICLibraryAuthServiceClientTokenProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping system service...", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCListener invalidate](self->_xpcServiceListener, "invalidate");
  xpcServiceListener = self->_xpcServiceListener;
  self->_xpcServiceListener = 0;

}

- (void)getTokenForcingRefresh:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, _QWORD, id);
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, id))a4;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "getPropertiesForUserIdentity:error:", v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get identity properties for token request. err=%{public}@", buf, 0x16u);
    }

    v6[2](v6, 0, v10);
  }
  else
  {
    objc_msgSend(v9, "DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__ICLibraryAuthServiceClientTokenProvider_getTokenForcingRefresh_completion___block_invoke;
      v17[3] = &unk_1E438D448;
      v18 = v6;
      -[ICLibraryAuthServiceClientTokenProvider getTokenForDSID:forceRefresh:completion:](self, "getTokenForDSID:forceRefresh:completion:", v12, v4, v17);
      v13 = v18;
    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = self;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ not fetching library token because there's no active account", buf, 0xCu);
      }

      v20 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch library token [no DSID on active account] - properties=%@"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v16);

    }
  }

}

- (void)getAllTokensForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void (**v27)(id, _QWORD, id);
  void *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  void (**v33)(id, _QWORD, id);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, id))a4;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unsafeBackend");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v7, "allStoreAccountsWithError:", &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }

    v5[2](v5, 0, v9);
  }
  else
  {
    v24 = v4;
    v26 = v7;
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "isAuthenticated")
            && (objc_msgSend(v17, "ic_homeUserIdentifiers"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "count"),
                v18,
                v19))
          {
            objc_msgSend(v17, "ic_DSID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

            objc_msgSend(v17, "ic_DSID");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v17, v21);
          }
          else
          {
            v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v41 = self;
              v42 = 2112;
              v43 = v17;
              _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping account %@ because either the DSID is missing or it has no home user ids", buf, 0x16u);
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke;
      v30[3] = &unk_1E4390530;
      v30[4] = self;
      v5 = v27;
      v33 = v27;
      v31 = v11;
      v22 = v28;
      v32 = v28;
      -[ICLibraryAuthServiceClientTokenProvider getTokenResultsForDSIDs:forceRefresh:completion:](self, "getTokenResultsForDSIDs:forceRefresh:completion:", v31, v24, v30);

      v9 = 0;
      v7 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v27;
      ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

      v9 = 0;
      v7 = v26;
      v22 = v28;
    }

    v8 = v25;
  }

}

- (void)getTokenForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 243, CFSTR("getTokenForDSID requires a valid DSID"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__ICLibraryAuthServiceClientTokenProvider_getTokenForDSID_forceRefresh_completion___block_invoke;
  v13[3] = &unk_1E438D498;
  v14 = v10;
  v11 = v10;
  -[ICLibraryAuthServiceClientTokenProvider getTokenResultForDSID:forceRefresh:completion:](self, "getTokenResultForDSID:forceRefresh:completion:", v9, v6, v13);

}

- (void)getTokenResultForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  ICAsyncBlockOperation *v13;
  ICAsyncBlockOperation *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  ICLibraryAuthServiceClientTokenProvider *v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[24];
  _BOOL4 v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 250, CFSTR("getTokenForDSID requires a valid DSID"));

  }
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    ICCreateLoggableValueForDSID(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 1024;
    v25 = v6;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token result for DSID %{public}@. forceRefresh=%{BOOL}u", buf, 0x1Cu);

  }
  memset(buf, 0, sizeof(buf));
  -[ICLibraryAuthServiceClientTokenProvider _checkTokenPresetsForDSID:forceRefresh:](self, "_checkTokenPresetsForDSID:forceRefresh:", v9, v6);
  if (buf[16])
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, *(_QWORD *)buf, *(_QWORD *)&buf[8]);
  }
  else
  {
    v13 = [ICAsyncBlockOperation alloc];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke;
    v19 = &unk_1E438D538;
    v20 = self;
    v21 = v9;
    v23 = v6;
    v22 = v10;
    v14 = -[ICAsyncBlockOperation initWithStartHandler:](v13, "initWithStartHandler:", &v16);
    -[ICAsyncBlockOperation setName:](v14, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.getTokenResultForDSID"), v16, v17, v18, v19, v20);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);

  }
}

- (void)getTokenResultsForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  ICAsyncBlockOperation *v11;
  id v12;
  id v13;
  ICAsyncBlockOperation *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  ICLibraryAuthServiceClientTokenProvider *v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2112;
    v26 = v8;
    v27 = 1024;
    v28 = v6;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token results for DSIDs %@. forceRefresh=%{BOOL}u", buf, 0x1Cu);
  }

  v11 = [ICAsyncBlockOperation alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke;
  v18 = &unk_1E438D538;
  v19 = v8;
  v20 = self;
  v22 = v6;
  v21 = v9;
  v12 = v9;
  v13 = v8;
  v14 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", &v15);
  -[ICAsyncBlockOperation setName:](v14, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.getTokenResultsForDSIDs"), v15, v16, v17, v18);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);

}

- (id)cachedTokenAndResetCache:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cachedTokenAndResetCache %d", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__22482;
  v15 = __Block_byref_object_dispose__22483;
  v16 = 0;
  v6 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__ICLibraryAuthServiceClientTokenProvider_cachedTokenAndResetCache___block_invoke;
  v10[3] = &unk_1E438D588;
  v12 = buf;
  v7 = v6;
  v11 = v7;
  -[ICLibraryAuthServiceClientTokenProvider getTokenForcingRefresh:completion:](self, "getTokenForcingRefresh:completion:", v3, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (void)addTokenResult:(id)a3 forDSID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICAsyncBlockOperation *v12;
  id v13;
  id v14;
  id v15;
  ICAsyncBlockOperation *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  ICLibraryAuthServiceClientTokenProvider *v22;
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 374, CFSTR("addTokenResult requires a valid DSID"));

  }
  v12 = [ICAsyncBlockOperation alloc];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke;
  v21 = &unk_1E438FB38;
  v22 = self;
  v23 = v9;
  v24 = v10;
  v25 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  v16 = -[ICAsyncBlockOperation initWithStartHandler:](v12, "initWithStartHandler:", &v18);
  -[ICAsyncBlockOperation setName:](v16, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.addTokenResult"), v18, v19, v20, v21, v22);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16);

}

- (void)getTokenStatusForDSIDs:(id)a3 forcingRefresh:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  ICAsyncBlockOperation *v11;
  id v12;
  id v13;
  ICAsyncBlockOperation *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  ICLibraryAuthServiceClientTokenProvider *v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token status", buf, 0xCu);
  }

  v11 = [ICAsyncBlockOperation alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke;
  v18 = &unk_1E438D538;
  v22 = a4;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v12 = v9;
  v13 = v8;
  v14 = -[ICAsyncBlockOperation initWithStartHandler:](v11, "initWithStartHandler:", &v15);
  -[ICAsyncBlockOperation setName:](v14, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.addTokenResult"), v15, v16, v17, v18);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v14);

}

- (void)getTokenStatusForcingRefresh:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, _QWORD, id);
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, id))a4;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "getPropertiesForUserIdentity:error:", v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get identity properties for token request. err=%{public}@", buf, 0x16u);
    }

    v6[2](v6, 0, v10);
  }
  else
  {
    objc_msgSend(v9, "DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __83__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForcingRefresh_completion___block_invoke;
      v18[3] = &unk_1E438D600;
      v19 = v12;
      v20 = v6;
      -[ICLibraryAuthServiceClientTokenProvider getTokenStatusForDSIDs:forcingRefresh:completion:](self, "getTokenStatusForDSIDs:forcingRefresh:completion:", v13, v4, v18);

      v14 = v19;
    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = self;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not fetching library token because there's no active account", buf, 0xCu);
      }

      v22 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch library token [no DSID on active account] - properties=%@"), v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v17);

    }
  }

}

- (void)getAllTokenStatusForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void (**v27)(id, _QWORD, id);
  void *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  void (**v33)(id, _QWORD, id);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, id))a4;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unsafeBackend");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v7, "allStoreAccountsWithError:", &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }

    v5[2](v5, 0, v9);
  }
  else
  {
    v24 = v4;
    v26 = v7;
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "isAuthenticated")
            && (objc_msgSend(v17, "ic_homeUserIdentifiers"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "count"),
                v18,
                v19))
          {
            objc_msgSend(v17, "ic_DSID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

            objc_msgSend(v17, "ic_DSID");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v17, v21);
          }
          else
          {
            v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v41 = self;
              v42 = 2112;
              v43 = v17;
              _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping account %@ because either the DSID is missing or it has no home user ids", buf, 0x16u);
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke;
      v30[3] = &unk_1E4390530;
      v30[4] = self;
      v5 = v27;
      v33 = v27;
      v31 = v11;
      v22 = v28;
      v32 = v28;
      -[ICLibraryAuthServiceClientTokenProvider getTokenStatusForDSIDs:forcingRefresh:completion:](self, "getTokenStatusForDSIDs:forcingRefresh:completion:", v31, v24, v30);

      v9 = 0;
      v7 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v27;
      ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

      v9 = 0;
      v7 = v26;
      v22 = v28;
    }

    v8 = v25;
  }

}

- (void)_refreshTokenForDSID:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  ICStoreRequestContext *v17;
  uint64_t v18;
  id v19;
  ICStoreRequestContext *v20;
  ICLibraryAuthServiceClientTokenRequest *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing token for DSID %@", buf, 0x16u);
  }

  if (v6)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[ICLibraryAuthServiceClientTokenProvider _loggableTokenCacheDictionary](self, "_loggableTokenCacheDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Current token status: %{public}@", buf, 0x16u);

    }
    if (!-[ICLibraryAuthServiceClientTokenProvider _isPrivacyAcknowledgementRequiredForAccountDSID:](self, "_isPrivacyAcknowledgementRequiredForAccountDSID:", v8))
    {
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isAudioAccessory"))
        v14 = 2;
      else
        v14 = 1;

      goto LABEL_16;
    }
  }
  else if (!-[ICLibraryAuthServiceClientTokenProvider _isPrivacyAcknowledgementRequiredForAccountDSID:](self, "_isPrivacyAcknowledgementRequiredForAccountDSID:", v8))
  {
    v14 = 1;
LABEL_16:
    v17 = [ICStoreRequestContext alloc];
    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke;
    v25[3] = &unk_1E438D628;
    v19 = v8;
    v26 = v19;
    v27 = v14;
    v20 = -[ICStoreRequestContext initWithBlock:](v17, "initWithBlock:", v25);
    v21 = -[ICLibraryAuthServiceClientTokenRequest initWithStoreRequestContext:]([ICLibraryAuthServiceClientTokenRequest alloc], "initWithStoreRequestContext:", v20);
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke_2;
    v22[3] = &unk_1E438D650;
    v22[4] = self;
    v23 = v19;
    v24 = v9;
    -[ICLibraryAuthServiceClientTokenRequest performRequestWithResponseHandler:](v21, "performRequestWithResponseHandler:", v22);

    v16 = v26;
    goto LABEL_17;
  }
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Not refreshing token for DSID %@ because privacy acknowledgement is required", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLibraryAuthServiceClientTokenProvider _updateTokenCacheEntryForDSID:tokenResult:error:](self, "_updateTokenCacheEntryForDSID:tokenResult:error:", v8, 0, v16);
  -[ICLibraryAuthServiceClientTokenProvider _commitCache](self, "_commitCache");
  -[ICLibraryAuthServiceClientTokenProvider _updateRefreshTimer](self, "_updateRefreshTimer");
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v16);
LABEL_17:

}

- (void)_refreshTokensForDSIDs:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ICStoreRequestContext *v24;
  ICStoreRequestContext *v25;
  ICLibraryAuthServiceClientTokenRequest *v26;
  id v27;
  id v28;
  ICStoreRequestContext *v29;
  uint64_t v30;
  ICStoreRequestContext *v31;
  ICLibraryAuthServiceBulkClientTokenRequest *v32;
  id v33;
  id v34;
  id v35;
  id obj;
  _BOOL4 v37;
  _QWORD v39[5];
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD block[5];
  id v45;
  id v46;
  _QWORD *v47;
  _BYTE *v48;
  _QWORD v49[6];
  NSObject *v50;
  id v51;
  NSObject *v52;
  _BYTE *v53;
  _QWORD *v54;
  _QWORD v55[6];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[3];
  char v61;
  uint8_t v62[4];
  ICLibraryAuthServiceClientTokenProvider *v63;
  __int16 v64;
  void *v65;
  uint8_t v66[128];
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;

  v37 = a4;
  v71 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a5;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing tokens for DSIDs %@", buf, 0x16u);
  }

  if (v37)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ICLibraryAuthServiceClientTokenProvider _loggableTokenCacheDictionary](self, "_loggableTokenCacheDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Current token status: %{public}@", buf, 0x16u);

    }
    if (!-[ICLibraryAuthServiceClientTokenProvider _isPrivacyAcknowledgementRequiredForAccountDSID:](self, "_isPrivacyAcknowledgementRequiredForAccountDSID:", 0))
    {
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isAudioAccessory"))
        v10 = 2;
      else
        v10 = 1;

      goto LABEL_31;
    }
  }
  else if (!-[ICLibraryAuthServiceClientTokenProvider _isPrivacyAcknowledgementRequiredForAccountDSID:](self, "_isPrivacyAcknowledgementRequiredForAccountDSID:", 0))
  {
    v10 = 1;
LABEL_31:
    v29 = [ICStoreRequestContext alloc];
    v30 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_68;
    v43[3] = &__block_descriptor_40_e31_v16__0__ICStoreRequestContext_8l;
    v43[4] = v10;
    v31 = -[ICStoreRequestContext initWithBlock:](v29, "initWithBlock:", v43);
    v32 = -[ICLibraryAuthServiceBulkClientTokenRequest initWithStoreRequestContext:accountDSIDs:]([ICLibraryAuthServiceBulkClientTokenRequest alloc], "initWithStoreRequestContext:accountDSIDs:", v31, v35);
    v39[0] = v30;
    v39[1] = 3221225472;
    v39[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_3;
    v39[3] = &unk_1E438D760;
    v39[4] = self;
    v40 = v35;
    v41 = v34;
    v42 = v10;
    v33 = v34;
    -[ICLibraryAuthServiceBulkClientTokenRequest performRequestWithResponseHandler:](v32, "performRequestWithResponseHandler:", v39);

    goto LABEL_32;
  }
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Not performing bulk refresh because privacy acknowledgement is required for the primary account", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v68 = __Block_byref_object_copy__22482;
  v69 = __Block_byref_object_dispose__22483;
  v70 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v61 = 0;
  v12 = dispatch_group_create();
  v13 = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._refreshTokensForDSIDs.resultsGroup", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v35;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v57;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v57 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          ICCreateLoggableValueForDSID(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v62 = 138543618;
          v63 = self;
          v64 = 2114;
          v65 = v21;
          _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token for DSID %{public}@", v62, 0x16u);

        }
        if (v37)
        {
          +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "isAudioAccessory"))
            v23 = 2;
          else
            v23 = 1;

        }
        else
        {
          v23 = 1;
        }
        v24 = [ICStoreRequestContext alloc];
        v55[0] = v17;
        v55[1] = 3221225472;
        v55[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke;
        v55[3] = &unk_1E438D628;
        v55[4] = v19;
        v55[5] = v23;
        v25 = -[ICStoreRequestContext initWithBlock:](v24, "initWithBlock:", v55);
        dispatch_group_enter(v12);
        v26 = -[ICLibraryAuthServiceClientTokenRequest initWithStoreRequestContext:]([ICLibraryAuthServiceClientTokenRequest alloc], "initWithStoreRequestContext:", v25);
        v49[0] = v17;
        v49[1] = 3221225472;
        v49[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2;
        v49[3] = &unk_1E438D6A0;
        v49[4] = self;
        v49[5] = v19;
        v50 = v13;
        v53 = buf;
        v51 = v14;
        v54 = v60;
        v52 = v12;
        -[ICLibraryAuthServiceClientTokenRequest performRequestWithResponseHandler:](v26, "performRequestWithResponseHandler:", v49);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v15);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_67;
  block[3] = &unk_1E438D6C8;
  v46 = v34;
  v47 = v60;
  block[4] = self;
  v45 = v14;
  v48 = buf;
  v27 = v34;
  v28 = v14;
  dispatch_group_notify(v12, v13, block);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(buf, 8);

LABEL_32:
}

- (void)_handleLibraryAuthServiceClientTokenDidChangeDistributedNotification:(id)a3
{
  NSObject *v4;
  ICAsyncBlockOperation *v5;
  ICAsyncBlockOperation *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got change notification", buf, 0xCu);
  }

  v5 = [ICAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__ICLibraryAuthServiceClientTokenProvider__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification___block_invoke;
  v7[3] = &unk_1E438D788;
  v7[4] = self;
  v6 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", v7);
  -[ICAsyncBlockOperation setName:](v6, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._handleLibraryAuthServiceClientTokenDidChangeDistributedNotification"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);

}

- (id)_clientConnection
{
  NSXPCConnection *xpcClientConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSXPCConnection *v16;
  uint64_t v17;
  NSXPCConnection *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connecting to token provider service", buf, 0xCu);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloud.library-auth-token-provider"), 0);
    v6 = self->_xpcClientConnection;
    self->_xpcClientConnection = v5;

    -[NSXPCConnection setExportedObject:](self->_xpcClientConnection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5C08A8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getTokenResultsForDSIDs_forceRefresh_completion_, 0, 1);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getTokenStatusForDSIDs_forcingRefresh_completion_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcClientConnection, "setRemoteObjectInterface:", v7);
    objc_initWeak((id *)buf, self);
    v16 = self->_xpcClientConnection;
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke;
    v22[3] = &unk_1E4391400;
    objc_copyWeak(&v23, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v16, "setInterruptionHandler:", v22);
    v18 = self->_xpcClientConnection;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke_136;
    v20[3] = &unk_1E4391400;
    objc_copyWeak(&v21, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v18, "setInvalidationHandler:", v20);
    -[NSXPCConnection resume](self->_xpcClientConnection, "resume");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);

    xpcClientConnection = self->_xpcClientConnection;
  }
  return xpcClientConnection;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[ICLibraryAuthServiceClientTokenProvider _clientConnection](self, "_clientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__ICLibraryAuthServiceClientTokenProvider__remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E43915E8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_loadCache
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *tokenCache;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authServiceClientTokenCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  tokenCache = self->_tokenCache;
  self->_tokenCache = v5;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ICLibraryAuthServiceClientTokenProvider__loadCache__block_invoke;
  v9[3] = &unk_1E438E6C0;
  v9[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[ICLibraryAuthServiceClientTokenProvider _loggableTokenCacheDictionary](self, "_loggableTokenCacheDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached tokens: %{public}@", buf, 0x16u);

  }
}

- (DevicePresetTokenResult)_checkTokenPresetsForDSID:(SEL)a3 forceRefresh:(id)a4
{
  _BOOL4 v5;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  DevicePresetTokenResult *result;
  __int128 v14;
  BOOL v15;

  v5 = a5;
  v8 = a4;
  retstr->var0 = 0;
  retstr->var1 = 0;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "presetsFound");

  if (v10)
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugRefreshConfiguration");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugFetchConfiguration");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLibraryAuthServiceClientTokenProvider _devicePresetForConfiguration:withDSID:](self, "_devicePresetForConfiguration:withDSID:", v12, v8);
    *(_OWORD *)&retstr->var0 = v14;
    retstr->var2 = v15;

  }
  else
  {
    retstr->var2 = 0;
  }

  return result;
}

- (DevicePresetTokenResult)_devicePresetForConfiguration:(SEL)a3 withDSID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DevicePresetTokenResult *result;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  retstr->var0 = 0;
  retstr->var1 = 0;
  if (!v7)
    goto LABEL_10;
  if (!objc_msgSend(v7, "allDSIDsShouldError"))
  {
    if (objc_msgSend(v7, "allDSIDsShouldSucceed"))
    {
      v23[0] = CFSTR("generatedAtMillis");
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSince1970");
      objc_msgSend(v9, "numberWithDouble:", v10 * 1000.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      v24[1] = &unk_1E43E67A8;
      v23[1] = CFSTR("lifespanMillis");
      v23[2] = CFSTR("timeToLiveMillis");
      v24[2] = &unk_1E43E67C0;
      v23[3] = CFSTR("token");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v13;
      v23[4] = CFSTR("tokenID");
      v21[0] = CFSTR("deviceGUID");
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("dsid");
      v22[0] = v15;
      v22[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[4] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      retstr->var0 = -[ICLibraryAuthServiceClientTokenResult initWithResponseDictionary:]([ICLibraryAuthServiceClientTokenResult alloc], "initWithResponseDictionary:", v17);
      retstr->var2 = 1;

      goto LABEL_11;
    }
    objc_msgSend(v7, "errorDSIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") && objc_msgSend(v18, "containsObject:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      retstr->var1 = (id)objc_claimAutoreleasedReturnValue();
      retstr->var2 = 1;

      goto LABEL_11;
    }

LABEL_10:
    retstr->var2 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
  retstr->var1 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var2 = 1;
LABEL_11:

  return result;
}

- (void)_commitCache
{
  void *v3;
  NSMutableDictionary *tokenCache;
  void *v5;
  void *v6;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_isService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 977, CFSTR("Committing the cache is not allowed from a client"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_tokenCache, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokenCache = self->_tokenCache;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ICLibraryAuthServiceClientTokenProvider__commitCache__block_invoke;
  v10[3] = &unk_1E438FA60;
  v10[4] = self;
  v11 = v3;
  v9 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokenCache, "enumerateKeysAndObjectsUsingBlock:", v10);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setAuthServiceClientTokenCache:", v6);

}

- (void)_updateRefreshTimer
{
  NSMutableDictionary *tokenCache;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  double v9;
  _QWORD v10[5];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__22482;
  v22 = __Block_byref_object_dispose__22483;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__22482;
  v16 = __Block_byref_object_dispose__22483;
  v17 = 0;
  tokenCache = self->_tokenCache;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke;
  v11[3] = &unk_1E438D7B0;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokenCache, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (v19[5])
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v13[5];
      v7 = v19[5];
      *(_DWORD *)buf = 138543874;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting timer to refresh library auth token for DSID %@ at %{public}@}", buf, 0x20u);
    }

    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80898], 0);
    objc_msgSend((id)v19[5], "timeIntervalSinceNow");
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v9);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808D8], 0);
    xpc_dictionary_set_int64(v8, "token_refresh_dsid", objc_msgSend((id)v13[5], "longLongValue"));
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_164;
    v10[3] = &unk_1E438D828;
    v10[4] = self;
    xpc_activity_register("com.apple.itunescloud.library_auth_token_refresh_timer", v8, v10);

  }
  else
  {
    xpc_activity_unregister("com.apple.itunescloud.library_auth_token_refresh_timer");
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

- (BOOL)_shouldStopBackgroundRefreshForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  v8 = 0;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ICError"));

    if (v6)
    {
      v7 = objc_msgSend(v4, "code");
      if ((unint64_t)(v7 + 7403) < 4 || v7 == -7007)
        v8 = 1;
    }
  }

  return v8;
}

- (void)_updateTokenCacheEntryForDSID:(id)a3 tokenResult:(id)a4 error:(id)a5
{
  NSMutableDictionary *tokenCache;
  id v9;
  id v10;
  ICLibraryAuthServiceClientTokenStatus *v11;
  void *v12;
  id v13;

  v13 = a4;
  tokenCache = self->_tokenCache;
  v9 = a5;
  v10 = a3;
  -[NSMutableDictionary objectForKey:](tokenCache, "objectForKey:", v10);
  v11 = (ICLibraryAuthServiceClientTokenStatus *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    v11 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
  if (v13)
    -[ICLibraryAuthServiceClientTokenStatus setTokenResult:](v11, "setTokenResult:", v13);
  -[ICLibraryAuthServiceClientTokenStatus setShouldExcludeFromBackgroundRefresh:](v11, "setShouldExcludeFromBackgroundRefresh:", -[ICLibraryAuthServiceClientTokenProvider _shouldStopBackgroundRefreshForError:](self, "_shouldStopBackgroundRefreshForError:", v9));
  -[ICLibraryAuthServiceClientTokenStatus setLastError:](v11, "setLastError:", v9);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  -[ICLibraryAuthServiceClientTokenStatus setLastUpdateAttemptTime:](v11, "setLastUpdateAttemptTime:");

  -[NSMutableDictionary setObject:forKey:](self->_tokenCache, "setObject:forKey:", v11, v10);
}

- (BOOL)_isPrivacyAcknowledgementRequiredForAccountDSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ICPrivacyInfo sharedPrivacyInfo](ICPrivacyInfo, "sharedPrivacyInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "privacyAcknowledgementRequiredForIdentifier:", CFSTR("Music"))
    && (objc_msgSend(v5, "privacyAcknowledgementRequiredForIdentifier:", CFSTR("TV")) & 1) != 0;

  return v6;
}

- (BOOL)_updateEntriesForAccountsChanges
{
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  NSMutableDictionary *tokenCache;
  BOOL v29;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  BOOL v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  char v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  ICLibraryAuthServiceClientTokenProvider *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "supportsMultipleITunesAccounts");
  +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v4, "allStoreAccountsWithError:", &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v47;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke;
  v45[3] = &__block_descriptor_33_e19_B16__0__ACAccount_8l;
  v46 = v3;
  objc_msgSend(v5, "msv_filter:", v45);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "msv_map:", &__block_literal_global_22471);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[ICLibraryAuthServiceClientTokenProvider _loggableTokenCacheDictionary](self, "_loggableTokenCacheDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v55 = self;
    v56 = 2114;
    v57 = v7;
    v58 = 2114;
    v59 = v32;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reconciling cache entries %{public}@ with current account list %{public}@", buf, 0x20u);

  }
  if (v33)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v55 = self;
      v56 = 2114;
      v57 = v33;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v34, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v34;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v13, "ic_DSID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v8, "addObject:", v14);
          if (objc_msgSend(v13, "isAuthenticated"))
          {
            -[NSMutableDictionary objectForKey:](self->_tokenCache, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (v16)
            {
              v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                ICCreateLoggableValueForDSID(v14);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = self;
                v56 = 2112;
                v57 = v18;
                _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Pre-fetching library token for new account with DSID %@", buf, 0x16u);

              }
              -[ICLibraryAuthServiceClientTokenProvider getTokenResultForDSID:forceRefresh:completion:](self, "getTokenResultForDSID:forceRefresh:completion:", v14, 0, &__block_literal_global_177);
            }
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v10);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSMutableDictionary allKeys](self->_tokenCache, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if ((-[NSObject containsObject:](v8, "containsObject:", v24) & 1) == 0)
          {
            v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              ICCreateLoggableValueForDSID(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = self;
              v56 = 2112;
              v57 = v26;
              _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing token entry for non-existent or inactive account DSID %@", buf, 0x16u);

            }
            -[NSMutableDictionary removeObjectForKey:](self->_tokenCache, "removeObjectForKey:", v24);
            *((_BYTE *)v49 + 24) = 1;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      }
      while (v21);
    }

  }
  v27 = -[ICLibraryAuthServiceClientTokenProvider _isPrivacyAcknowledgementRequiredForAccountDSID:](self, "_isPrivacyAcknowledgementRequiredForAccountDSID:", 0);
  tokenCache = self->_tokenCache;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_178;
  v35[3] = &unk_1E438D8D0;
  v36 = v27;
  v35[4] = &v48;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokenCache, "enumerateKeysAndObjectsUsingBlock:", v35);
  v29 = *((_BYTE *)v49 + 24) != 0;

  _Block_object_dispose(&v48, 8);
  return v29;
}

- (id)_loggableTokenCacheDictionary
{
  void *v3;
  NSMutableDictionary *tokenCache;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_tokenCache, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokenCache = self->_tokenCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICLibraryAuthServiceClientTokenProvider__loggableTokenCacheDictionary__block_invoke;
  v7[3] = &unk_1E438D7D8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokenCache, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  ICAsyncBlockOperation *v4;
  ICAsyncBlockOperation *v5;
  _QWORD v6[5];

  v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__ICLibraryAuthServiceClientTokenProvider__handleUserIdentityStoreDidChangeNotification___block_invoke;
  v6[3] = &unk_1E438D788;
  v6[4] = self;
  v5 = -[ICAsyncBlockOperation initWithStartHandler:](v4, "initWithStartHandler:", v6);
  -[ICAsyncBlockOperation setName:](v5, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._handleUserIdentityStoreDidChangeNotification"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5C08A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);
  objc_msgSend(v7, "setExportedObject:", self);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke;
  v17[3] = &unk_1E438D8F8;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  objc_msgSend(v7, "setInterruptionHandler:", v17);
  v11 = v9;
  v12 = 3221225472;
  v13 = __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke_181;
  v14 = &unk_1E438D8F8;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_msgSend(v7, "setInvalidationHandler:", &v11);
  -[ICLibraryAuthServiceClientTokenProvider _addConnection:](self, "_addConnection:", v7, v11, v12, v13, v14);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_addConnection:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICLibraryAuthServiceClientTokenProvider__addConnection___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)_removeConnection:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICLibraryAuthServiceClientTokenProvider__removeConnection___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriConnection, 0);
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_tokenCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __61__ICLibraryAuthServiceClientTokenProvider__removeConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__ICLibraryAuthServiceClientTokenProvider__addConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted", (uint8_t *)&v5, 0xCu);
    }

    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

void __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke_181(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated", (uint8_t *)&v5, 0xCu);
    }

    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

void __89__ICLibraryAuthServiceClientTokenProvider__handleUserIdentityStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_updateEntriesForAccountsChanges"))
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Rescheduling a refresh due to account changes", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateRefreshTimer");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  }
  objc_msgSend(v3, "finishWithError:", 0);

}

void __72__ICLibraryAuthServiceClientTokenProvider__loggableTokenCacheDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  ICCreateLoggableValueForDSID(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

uint64_t __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "ic_isLocalAccount") & 1) != 0)
  {
    v4 = 0;
  }
  else if (*(_BYTE *)(a1 + 32))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isActive");
  }

  return v4;
}

void __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_178(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "shouldExcludeFromBackgroundRefresh");
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "lastError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ICError")) & 1) != 0)
      {
        v9 = objc_msgSend(v7, "code");

        if (v9 == -7007)
        {
          objc_msgSend(v10, "setShouldExcludeFromBackgroundRefresh:", 0);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        }
      }
      else
      {

      }
    }

    v5 = v10;
  }

}

uint64_t __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_description");
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "shouldExcludeFromBackgroundRefresh") & 1) == 0)
  {
    objc_msgSend(v7, "tokenResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expirationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v7, "lastUpdateAttemptTime");
    if (v15 != 0.0 && v14 < v15 + 600.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }
    if (!v12)
      goto LABEL_13;
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(void **)(v17 + 40);
    if (v18)
    {
      if (objc_msgSend(v18, "compare:", v12) != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      v17 = *(_QWORD *)(a1[5] + 8);
    }
    objc_storeStrong((id *)(v17 + 40), v12);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    goto LABEL_13;
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    objc_msgSend(v7, "lastError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping background refresh of DSID %@. last error: %{public}@}", (uint8_t *)&v19, 0x20u);

  }
LABEL_14:

}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_164(uint64_t a1, xpc_activity_t activity)
{
  xpc_object_t v3;
  void *v4;
  ICAsyncBlockOperation *v5;
  uint64_t v6;
  id v7;
  ICAsyncBlockOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = xpc_activity_copy_criteria(activity);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v3, "token_refresh_dsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ICAsyncBlockOperation alloc];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_2;
  v12 = &unk_1E438D800;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v14 = v6;
  v7 = v4;
  v8 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", &v9);
  -[ICAsyncBlockOperation setName:](v8, "setName:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.tokenRefreshTimer"), v9, v10, v11, v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addOperation:", v8);

}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "longLongValue")
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count") < 2)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing token for DSID %@", buf, 0x16u);
    }

    v16 = a1 + 32;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v16 + 8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_167;
    v19[3] = &unk_1E438D4C0;
    v20 = v3;
    objc_msgSend(v15, "_refreshTokenForDSID:forExternalRequest:completion:", v14, 0, v19);
    v9 = v20;
  }
  else
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing bulk token refresh", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v8 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_165;
    v23[3] = &unk_1E438D7D8;
    v9 = v6;
    v24 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v23);
    if (objc_msgSend(v9, "count"))
    {
      v10 = *(void **)(a1 + 40);
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_166;
      v21[3] = &unk_1E438D560;
      v22 = v3;
      objc_msgSend(v10, "_refreshTokensForDSIDs:forExternalRequest:completion:", v9, 0, v21);

    }
    else
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ No DSIDs available to refresh - ignoring", buf, 0xCu);
      }

      objc_msgSend(v3, "finishWithError:", 0);
    }

  }
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "shouldExcludeFromBackgroundRefresh") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

uint64_t __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

void __55__ICLibraryAuthServiceClientTokenProvider__commitCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB36F8];
  v12 = 0;
  v6 = a2;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize token result to cache. err=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v9);
  }

}

void __53__ICLibraryAuthServiceClientTokenProvider__loadCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  ICLibraryAuthServiceClientTokenStatus *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSString() && _NSIsNSData() && objc_msgSend(v5, "longLongValue") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v15);
    v8 = (ICLibraryAuthServiceClientTokenStatus *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v9;
    if (v8)
    {
      if (v9)
        goto LABEL_6;
    }
    else
    {

      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v13)
      {
        v8 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
        -[ICLibraryAuthServiceClientTokenStatus setTokenResult:](v8, "setTokenResult:", v13);
      }
      else
      {
        v8 = 0;
      }

      if (v10)
      {
LABEL_6:
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v17 = v12;
          v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize cached token result data. err=%{public}@", buf, 0x16u);
        }

LABEL_15:
        goto LABEL_16;
      }
    }
    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, v7);
    goto LABEL_15;
  }
LABEL_16:

}

void __78__ICLibraryAuthServiceClientTokenProvider__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get remote object proxy. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client connection interrupted", (uint8_t *)&v3, 0xCu);
  }

}

void __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke_136(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)WeakRetained[7];
  WeakRetained[7] = 0;

}

void __112__ICLibraryAuthServiceClientTokenProvider__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing token cache for external change notification", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICLibraryAuthServiceClientTokenDidChangeNotification"), 0);

  objc_msgSend(v3, "finishWithError:", 0);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  ICStoreURLResponseAuthenticationProvider *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentity:", v4);

  v5 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setAuthenticationProvider:", v5);

  objc_msgSend(v6, "setAllowsExpiredBags:", 1);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  __int128 v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "tokenResult");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5;
  if (!(v5 | v6))
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("token result missing from response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_66;
  block[3] = &unk_1E438D678;
  v17 = *(_OWORD *)(a1 + 32);
  v18 = (id)v6;
  v19 = v7;
  v21 = *(_QWORD *)(a1 + 72);
  v11 = *(NSObject **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 80);
  v20 = v12;
  v22 = v13;
  v14 = v7;
  v15 = (id)v6;
  dispatch_sync(v11, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_67(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_commitCache");
  objc_msgSend(*(id *)(a1 + 32), "_updateRefreshTimer");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  }
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v4, "count"))
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, v5);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_68(uint64_t a1, void *a2)
{
  void *v3;
  ICStoreURLResponseAuthenticationProvider *v4;
  id v5;

  v5 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v3);

  v4 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setAuthenticationProvider:", v4);

  objc_msgSend(v5, "setAllowsExpiredBags:", 1);
  objc_msgSend(v5, "setPersonalizationStyle:", 2);

}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  ICStoreRequestContext *v23;
  uint64_t v24;
  ICStoreRequestContext *v25;
  ICLibraryAuthServiceClientTokenRequest *v26;
  id v27;
  id v28;
  id obj;
  NSObject *queue;
  id v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  _BYTE *v37;
  _QWORD block[4];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD v44[6];
  NSObject *v45;
  id v46;
  NSObject *v47;
  _BYTE *v48;
  _QWORD *v49;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[3];
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  uint8_t v67[128];
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v32 = a3;
  if (v32)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      v69 = v32;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new tokens for DSIDs %@. err=%{public}@", buf, 0x20u);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v58 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "_updateTokenCacheEntryForDSID:tokenResult:error:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), 0, v32);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "_commitCache");
    objc_msgSend(*(id *)(a1 + 32), "_updateRefreshTimer");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v69 = __Block_byref_object_copy__22482;
    v70 = __Block_byref_object_dispose__22483;
    v71 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v56 = 0;
    v12 = dispatch_group_create();
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._refreshTokensForDSIDs.resultsGroup", 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = *(id *)(a1 + 40);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          dispatch_group_enter(v12);
          objc_msgSend(v31, "tokenResultForAccountDSID:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              v21 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v61 = 138543874;
              v62 = v21;
              v63 = 2112;
              v64 = v17;
              v65 = 2114;
              v66 = v18;
              _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %@: %{public}@", v61, 0x20u);
            }

            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_74;
            block[3] = &unk_1E438D738;
            v39 = v13;
            v40 = v18;
            v41 = v17;
            v42 = *(_QWORD *)(a1 + 32);
            v43 = v55;
            dispatch_sync(queue, block);
            dispatch_group_leave(v12);

          }
          else
          {
            if (v20)
            {
              v22 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v61 = 138543618;
              v62 = v22;
              v63 = 2112;
              v64 = v17;
              _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ No token result for DSID %@ - attempting to fetch it individually", v61, 0x16u);
            }

            v23 = [ICStoreRequestContext alloc];
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_71;
            v50[3] = &unk_1E438D628;
            v24 = *(_QWORD *)(a1 + 56);
            v50[4] = v17;
            v50[5] = v24;
            v25 = -[ICStoreRequestContext initWithBlock:](v23, "initWithBlock:", v50);
            v26 = -[ICLibraryAuthServiceClientTokenRequest initWithStoreRequestContext:]([ICLibraryAuthServiceClientTokenRequest alloc], "initWithStoreRequestContext:", v25);
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_72;
            v44[3] = &unk_1E438D6A0;
            v44[4] = *(_QWORD *)(a1 + 32);
            v44[5] = v17;
            v45 = queue;
            v48 = buf;
            v46 = v13;
            v49 = v55;
            v47 = v12;
            -[ICLibraryAuthServiceClientTokenRequest performRequestWithResponseHandler:](v26, "performRequestWithResponseHandler:", v44);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      }
      while (v14);
    }

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_75;
    v33[3] = &unk_1E438D6C8;
    v33[4] = *(_QWORD *)(a1 + 32);
    v36 = v55;
    v27 = *(id *)(a1 + 48);
    v34 = v13;
    v35 = v27;
    v37 = buf;
    v28 = v13;
    dispatch_group_notify(v12, queue, v33);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  ICStoreURLResponseAuthenticationProvider *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentity:", v4);

  v5 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setAuthenticationProvider:", v5);

  objc_msgSend(v6, "setAllowsExpiredBags:", 1);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_72(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  __int128 v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "tokenResult");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5;
  if (!(v5 | v6))
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_73;
  v18[3] = &unk_1E438D710;
  v19 = *(_OWORD *)(a1 + 32);
  v20 = (id)v6;
  v21 = (id)v5;
  v11 = *(_QWORD *)(a1 + 72);
  v22 = v7;
  v24 = v11;
  v12 = *(NSObject **)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 80);
  v23 = v13;
  v25 = v14;
  v15 = v7;
  v16 = (id)v5;
  v17 = (id)v6;
  dispatch_sync(v12, v18);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_74(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 56), "_updateTokenCacheEntryForDSID:tokenResult:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  return result;
}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_75(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_commitCache");
  objc_msgSend(*(id *)(a1 + 32), "_updateRefreshTimer");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  }
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v4, "count"))
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, v5);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_73(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateTokenCacheEntryForDSID:tokenResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 64);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 56);
      v11 = 138543874;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new token for DSID %@. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %@: %{public}@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_66(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateTokenCacheEntryForDSID:tokenResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 56);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 56);
      v11 = 138543874;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new token for DSID %{public}@. err=%{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
}

void __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  ICStoreURLResponseAuthenticationProvider *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentity:", v4);

  v5 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setAuthenticationProvider:", v5);

  objc_msgSend(v6, "setAllowsExpiredBags:", 1);
  objc_msgSend(v6, "setPersonalizationStyle:", 2);

}

void __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "tokenResult");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5;
  if (!(v5 | v6))
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = 138544130;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2114;
    v20 = v7;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Finished fetching new token for DSID %@. err=%{public}@. token=%@", (uint8_t *)&v15, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateTokenCacheEntryForDSID:tokenResult:error:", *(_QWORD *)(a1 + 40), v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "_commitCache");
  objc_msgSend(*(id *)(a1 + 32), "_updateRefreshTimer");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t i;
  id v32;
  void *v33;
  NSObject *queue;
  void *v35;
  _QWORD block[4];
  id v38;
  id v39;
  _BYTE *v40;
  _QWORD v41[6];
  NSObject *v42;
  id v43;
  id v44;
  NSObject *v45;
  _BYTE *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t v56[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint8_t v60[128];
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v28 = a3;
  if (v28)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch all client tokens. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__22482;
    v63 = __Block_byref_object_dispose__22483;
    v64 = 0;
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.allTokens", 0);
    v7 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = *(id *)(a1 + 40);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v8)
    {
      v30 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35
            || (objc_msgSend(v35, "tokenResult"),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v10, "token"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = v11 == 0,
                v11,
                v10,
                v12))
          {
            v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v25 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v56 = 138543618;
              v57 = v25;
              v58 = 2112;
              v59 = v9;
              _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ No token result for DSID %@ in bulk response - this will be treated as an error", v56, 0x16u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v9);
            v13 = objc_claimAutoreleasedReturnValue();
            -[NSObject ic_homeUserIdentifiers](v13, "ic_homeUserIdentifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = *(_QWORD *)(a1 + 32);
              v17 = objc_msgSend(v14, "count");
              *(_DWORD *)v56 = 138543618;
              v57 = v16;
              v58 = 2050;
              v59 = v17;
              _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ iterating through home %{public}lu identifiers", v56, 0x16u);
            }

            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v32 = v14;
            v18 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  v21 = v4;
                  if (*(_QWORD *)v48 != v19)
                    objc_enumerationMutation(v32);
                  v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                  dispatch_group_enter(v7);
                  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
                  objc_msgSend(v22, "UUIDString");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v41[0] = MEMORY[0x1E0C809B0];
                  v41[1] = 3221225472;
                  v41[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_55;
                  v41[3] = &unk_1E438D470;
                  v41[4] = *(_QWORD *)(a1 + 32);
                  v41[5] = v22;
                  v46 = buf;
                  v42 = queue;
                  v43 = v33;
                  v44 = v35;
                  v45 = v7;
                  objc_msgSend(v23, "getSharedUserIdForHomeUserId:completion:", v24, v41);

                  v4 = v21;
                }
                v18 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v18);
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_2;
    block[3] = &unk_1E438EA18;
    v26 = *(id *)(a1 + 56);
    v38 = v33;
    v39 = v26;
    v40 = buf;
    v27 = v33;
    dispatch_group_notify(v7, queue, block);

    _Block_object_dispose(buf, 8);
  }

}

void __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed getting user ids for home user id %{public}@. Err=%{public}@", buf, 0x20u);
  }

  if (!v5 || v6)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544131;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      v25 = 2113;
      v26 = v5;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ failed fetching siri shared user id for homeIdentifier %{public}@:%{private}@. err=%{public}@", buf, 0x2Au);
    }

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v16 = v6;
    v11 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_56;
    block[3] = &unk_1E4391230;
    v10 = *(NSObject **)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = v5;
    v20 = *(id *)(a1 + 64);
    dispatch_sync(v10, block);

    v11 = v18;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

uint64_t __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __83__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 56))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "setObject:forKey:", v11, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v7);
    }

  }
  v12 = objc_msgSend(v4, "count");
  if (v12 == objc_msgSend(*(id *)(a1 + 32), "count"))
    goto LABEL_13;
  v13 = *(_BYTE **)(a1 + 40);
  if (!v13[32])
  {
    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_2;
    v32[3] = &unk_1E43915E8;
    v34 = *(id *)(a1 + 48);
    v20 = v3;
    v33 = v20;
    objc_msgSend(v13, "_remoteObjectProxyWithErrorHandler:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(unsigned __int8 *)(a1 + 56);
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_3;
    v29[3] = &unk_1E438D5D8;
    v23 = *(_QWORD *)(a1 + 32);
    v29[4] = *(_QWORD *)(a1 + 40);
    v31 = *(id *)(a1 + 48);
    v30 = v20;
    objc_msgSend(v21, "getTokenStatusForDSIDs:forcingRefresh:completion:", v23, v22, v29);

    v18 = v34;
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v14 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_4;
    v24[3] = &unk_1E4390530;
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v25 = v15;
    v26 = v16;
    v28 = v17;
    v27 = v3;
    objc_msgSend(v13, "_refreshTokensForDSIDs:forExternalRequest:completion:", v15, 1, v24);

    v18 = v25;
LABEL_18:

    goto LABEL_19;
  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v3, "finishWithError:", 0);
LABEL_19:

}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
  v5 = a2;
  v4(v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9 = a3;
  v6 = a2;
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);
}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "msv_errorByRemovingUnsafeUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v5, v14);

  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v4);
}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  ICLibraryAuthServiceClientTokenStatus *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[32])
  {
    v5 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
    -[ICLibraryAuthServiceClientTokenStatus setTokenResult:](v5, "setTokenResult:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_commitCache");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification"), 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(v3, "finishWithError:", 0);

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_2;
    v20[3] = &unk_1E43915E8;
    v22 = *(id *)(a1 + 56);
    v8 = v3;
    v21 = v8;
    objc_msgSend(v4, "_remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_3;
    v14[3] = &unk_1E438D5B0;
    v12 = v10;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v18 = v8;
    objc_msgSend(v9, "addTokenResult:forDSID:completion:", v12, v11, v14);

  }
}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  ICLibraryAuthServiceClientTokenStatus *v3;
  id v4;

  v4 = a2;
  if (!v4)
  {
    v3 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
    -[ICLibraryAuthServiceClientTokenStatus setTokenResult:](v3, "setTokenResult:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v4);

}

void __68__ICLibraryAuthServiceClientTokenProvider_cachedTokenAndResetCache___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tokenResult");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {

          goto LABEL_14;
        }
        v13 = (void *)v12;
        objc_msgSend(v3, "setObject:forKey:", v12, v10);
        if (objc_msgSend(v13, "isExpired")
          && (objc_msgSend(v11, "shouldExcludeFromBackgroundRefresh") & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  v14 = objc_msgSend(v3, "count");
  if (v14 == objc_msgSend(*(id *)(a1 + 32), "count") && !*(_BYTE *)(a1 + 56))
  {
    v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v16 = v34;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v52 = v28;
      v53 = 2114;
      v54 = v3;
      _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ getTokenResultsForDSIDs returning cached token results %{public}@", buf, 0x16u);
    }

    v29 = *(_QWORD *)(a1 + 48);
    v30 = (void *)objc_msgSend(v3, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v29 + 16))(v29, v30, 0);

    if (objc_msgSend(v4, "count"))
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2112;
        v54 = v4;
        _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing expired tokens for DSIDs %@", buf, 0x16u);
      }

      v33 = *(void **)(a1 + 40);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_45;
      v46[3] = &unk_1E438D560;
      v46[4] = v33;
      objc_msgSend(v33, "getTokenResultsForDSIDs:forceRefresh:completion:", v4, 1, v46);
    }
    objc_msgSend(v34, "finishWithError:", 0);
  }
  else
  {
    v15 = *(_BYTE **)(a1 + 40);
    v16 = v34;
    if (v15[32])
    {
      v17 = *(_QWORD *)(a1 + 32);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_3;
      v35[3] = &unk_1E438D600;
      v37 = *(id *)(a1 + 48);
      v36 = v34;
      objc_msgSend(v15, "_refreshTokensForDSIDs:forExternalRequest:completion:", v17, 1, v35);

      v18 = v37;
    }
    else
    {
      v19 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_46;
      v43[3] = &unk_1E43915E8;
      v45 = *(id *)(a1 + 48);
      v20 = v34;
      v44 = v20;
      objc_msgSend(v15, "_remoteObjectProxyWithErrorHandler:", v43);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(a1 + 32);
      v23 = *(unsigned __int8 *)(a1 + 56);
      v38[0] = v19;
      v38[1] = 3221225472;
      v38[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_2;
      v38[3] = &unk_1E4390530;
      v24 = v22;
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(void **)(a1 + 48);
      v39 = v24;
      v40 = v25;
      v42 = v26;
      v41 = v20;
      objc_msgSend(v21, "getTokenResultsForDSIDs:forceRefresh:completion:", v24, v23, v38);

      v18 = v45;
    }

  }
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
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
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to refresh tokens. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
  v5 = a2;
  v4(v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_updateTokenCacheEntryForDSID:tokenResult:error:", v12, v13, v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);

}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v6 = a2;
  objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !*(_BYTE *)(a1 + 56))
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v33 = v15;
      v34 = 2114;
      v35 = v5;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ getTokenResultForDSID returning cached token result %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (objc_msgSend(v5, "isExpired"))
    {
      v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v33 = v17;
        v34 = 2112;
        v35 = v18;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing expired token for DSID %@", buf, 0x16u);
      }

      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_39;
      v31[3] = &unk_1E438D4C0;
      v31[4] = v19;
      objc_msgSend(v19, "getTokenResultForDSID:forceRefresh:completion:", v20, 1, v31);
    }
    objc_msgSend(v3, "finishWithError:", 0);
  }
  else
  {
    v6 = *(_BYTE **)(a1 + 32);
    if (v6[32])
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_3;
      v21[3] = &unk_1E438D510;
      v7 = *(_QWORD *)(a1 + 40);
      v23 = *(id *)(a1 + 48);
      v22 = v3;
      objc_msgSend(v6, "_refreshTokenForDSID:forExternalRequest:completion:", v7, 1, v21);

      v8 = v23;
    }
    else
    {
      v9 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_40;
      v28[3] = &unk_1E43915E8;
      v30 = *(id *)(a1 + 48);
      v10 = v3;
      v29 = v10;
      objc_msgSend(v6, "_remoteObjectProxyWithErrorHandler:", v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int8 *)(a1 + 56);
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_2;
      v24[3] = &unk_1E438D4E8;
      v13 = *(void **)(a1 + 40);
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = v13;
      v27 = *(id *)(a1 + 48);
      v26 = v10;
      objc_msgSend(v11, "getTokenResultForDSID:forceRefresh:completion:", v25, v12, v24);

      v8 = v30;
    }

  }
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
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
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to refresh the token. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
  v5 = a2;
  v4(v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v7 = a2;
  objc_msgSend(v5, "_updateTokenCacheEntryForDSID:tokenResult:error:", v6, v7, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v8);
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v6 = a2;
  objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);
}

void __83__ICLibraryAuthServiceClientTokenProvider_getTokenForDSID_forceRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "token");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  NSObject *v28;
  uint64_t i;
  id v30;
  void *v31;
  NSObject *queue;
  void *v33;
  _QWORD block[4];
  id v35;
  id v36;
  _BYTE *v37;
  _QWORD v38[6];
  NSObject *v39;
  id v40;
  id v41;
  NSObject *v42;
  _BYTE *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t v53[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint8_t v57[128];
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v25 = a3;
  if (v25)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch all client tokens. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__22482;
    v60 = __Block_byref_object_dispose__22483;
    v61 = 0;
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.allTokens", 0);
    v8 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = *(id *)(a1 + 40);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v9)
    {
      v27 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v27)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v10);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33
            || (objc_msgSend(v33, "token"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = v11 == 0,
                v11,
                v12))
          {
            v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            v28 = v21;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v53 = 138543618;
              v54 = v22;
              v55 = 2112;
              v56 = v10;
              _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ No token result for DSID %@ in bulk response - this will be treated as an error", v53, 0x16u);
            }
          }
          else
          {
            dispatch_group_enter(v8);
            objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v10);
            v13 = objc_claimAutoreleasedReturnValue();
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v28 = v13;
            -[NSObject ic_homeUserIdentifiers](v13, "ic_homeUserIdentifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v45;
              v30 = v14;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v45 != v16)
                    objc_enumerationMutation(v30);
                  v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                  dispatch_group_enter(v8);
                  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
                  objc_msgSend(v18, "UUIDString");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v38[0] = MEMORY[0x1E0C809B0];
                  v38[1] = 3221225472;
                  v38[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_29;
                  v38[3] = &unk_1E438D470;
                  v38[4] = *(_QWORD *)(a1 + 32);
                  v38[5] = v18;
                  v43 = buf;
                  v39 = queue;
                  v40 = v31;
                  v41 = v33;
                  v42 = v8;
                  objc_msgSend(v19, "getSharedUserIdForHomeUserId:completion:", v20, v38);

                }
                v14 = v30;
                v15 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v15);
            }

            dispatch_group_leave(v8);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_2;
    block[3] = &unk_1E438EA18;
    v23 = *(id *)(a1 + 56);
    v35 = v31;
    v36 = v23;
    v37 = buf;
    v24 = v31;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(buf, 8);
  }

}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544131;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2113;
      v21 = v5;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed fetching siri shared user id for homeIdentifier %{public}@:%{private}@. err=%{public}@", buf, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_30;
    block[3] = &unk_1E4391230;
    v8 = *(NSObject **)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = v5;
    v15 = *(id *)(a1 + 64);
    dispatch_sync(v8, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

uint64_t __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_30(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 48), "token");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __77__ICLibraryAuthServiceClientTokenProvider_getTokenForcingRefresh_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (ICLibraryAuthServiceClientTokenProvider)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICLibraryAuthServiceClientTokenProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_sOnceToken != -1)
    dispatch_once(&sharedProvider_sOnceToken, block);
  return (ICLibraryAuthServiceClientTokenProvider *)(id)sharedProvider_sSharedProvider;
}

void __57__ICLibraryAuthServiceClientTokenProvider_sharedProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedProvider_sSharedProvider;
  sharedProvider_sSharedProvider = (uint64_t)v0;

}

@end
