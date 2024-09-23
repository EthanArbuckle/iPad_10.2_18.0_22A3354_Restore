@implementation ICMediaUserStateCenter

void __39__ICMediaUserStateCenter_allUserStates__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (NSArray)allUserStates
{
  NSObject *accessQueue;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  ICMediaUserStateCenter *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6038;
  v13 = __Block_byref_object_dispose__6039;
  v14 = 0;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__ICMediaUserStateCenter_allUserStates__block_invoke;
  v8[3] = &unk_1E4391568;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend((id)v10[5], "count");
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Accessing all user states, user states found: %lu", buf, 0x16u);
  }

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (id)initLazily
{
  id v3;

  v3 = -[ICMediaUserStateCenter _initLazily:]([ICMediaUserStateCenter alloc], "_initLazily:", 1);

  return v3;
}

- (id)_initLazily:(BOOL)a3
{
  _BOOL4 v3;
  ICMediaUserStateCenter *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *completionHandlersQueue;
  uint64_t v9;
  NSMutableArray *refreshUserStateCompletionHandlers;
  ICCloudClient *v11;
  ICCloudClient *cloudClient;
  NSObject *v13;
  NSObject *v14;
  ICMediaUserStateCenter *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  ICMediaUserStateCenter *v22;
  BOOL v23;
  objc_super v24;
  uint8_t buf[4];
  ICMediaUserStateCenter *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)ICMediaUserStateCenter;
  v4 = -[ICMediaUserStateCenter init](&v24, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserStateCenter.accessQueue", 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserStateCenter.completionHandlersQueue", 0);
    completionHandlersQueue = v4->_completionHandlersQueue;
    v4->_completionHandlersQueue = (OS_dispatch_queue *)v7;

    v4->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    refreshUserStateCompletionHandlers = v4->_refreshUserStateCompletionHandlers;
    v4->_refreshUserStateCompletionHandlers = (NSMutableArray *)v9;

    v11 = objc_alloc_init(ICCloudClient);
    cloudClient = v4->_cloudClient;
    v4->_cloudClient = v11;

    v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v4;
      v27 = 1024;
      v28 = v3;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _initLazily %{BOOL}u", buf, 0x12u);
    }

    v14 = v4->_accessQueue;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __38__ICMediaUserStateCenter__initLazily___block_invoke;
    v21 = &unk_1E438E600;
    v23 = v3;
    v15 = v4;
    v22 = v15;
    dispatch_async(v14, &v18);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v15, sel__handleServerStateUpdatedNotification_, CFSTR("ICMediaUserStateCenterServerStateUpdatedNotification"), 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ICMediaUserStateCenter;
  -[ICMediaUserStateCenter dealloc](&v4, sel_dealloc);
}

- (ICMediaUserState)activeUserState
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  ICMediaUserStateCenter *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ICMediaUserStateCenter allUserStates](self, "allUserStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_firstWhere:", &__block_literal_global_18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Accessing active user state: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  return (ICMediaUserState *)v4;
}

- (void)refreshUserStatesWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  ICMediaUserStateCenter *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (!a3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke;
    v13[3] = &unk_1E438ADA0;
    v14 = v6;
    -[ICMediaUserStateCenter _onAsyncServer:](self, "_onAsyncServer:", v13);
    v10 = v14;
LABEL_8:

    goto LABEL_9;
  }
  if ((a3 & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_3;
    v11[3] = &unk_1E438ADA0;
    v12 = v6;
    -[ICMediaUserStateCenter _onAsyncServer:](self, "_onAsyncServer:", v11);
    v10 = v12;
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ refreshUserStatesWithOptions:completion: called with invalid options: %lu", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v9);

LABEL_9:
}

- (void)refreshUserStatesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *completionHandlersQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;
  __int128 *p_buf;
  _QWORD v15[5];
  __int128 buf;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Force refreshing user states, calling refreshUserStatesWithCompletion:", (uint8_t *)&buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke;
  v15[3] = &unk_1E4390F20;
  v15[4] = self;
  v7 = (void *)MEMORY[0x1A1AFA8D0](v15);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 0;
  completionHandlersQueue = self->_completionHandlersQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_3;
  block[3] = &unk_1E438EA18;
  p_buf = &buf;
  block[4] = self;
  v9 = v4;
  v13 = v9;
  dispatch_sync(completionHandlersQueue, block);
  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_4;
    v10[3] = &unk_1E438ADC8;
    v10[4] = self;
    v11 = v7;
    -[ICMediaUserStateCenter _onAsyncServer:](self, "_onAsyncServer:", v10);

  }
  _Block_object_dispose(&buf, 8);

}

- (id)_establishClientConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *xpcConnection;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSXPCConnection *v11;
  NSXPCConnection *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSXPCConnection *v26;
  void *v28;
  ICCloudServerListenerEndpointProvider *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  ICMediaUserStateCenter *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: No connection found, creating new connection", buf, 0xCu);
    }

    v29 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    v34 = 0;
    -[ICCloudServerListenerEndpointProvider listenerEndpointForService:error:](v29, "listenerEndpointForService:error:", 5, &v34);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    v8 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    v9 = v8;
    v28 = v7;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "msv_description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v10;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@: created xpc connection from listener endpoint error=%{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: created xpc connection from listener endpoint", buf, 0xCu);
    }

    if (v6)
    {
      v11 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
      v12 = self->_xpcConnection;
      self->_xpcConnection = v11;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DD9C8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getUserStatesForcingRefresh_withReply_, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getUserStatesForcingRefresh_withReply_, 1, 1);

      v18 = (void *)MEMORY[0x1E0C99E60];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getCachedUserStatesWithReply_, 0, 1);

      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_refreshSocialProfilesWithReply_, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_refreshSocialProfilesWithReply_, 1, 1);

      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v13);
      objc_initWeak((id *)buf, self);
      v25 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __52__ICMediaUserStateCenter__establishClientConnection__block_invoke;
      v32[3] = &unk_1E4391400;
      objc_copyWeak(&v33, (id *)buf);
      -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v32);
      v30[0] = v25;
      v30[1] = 3221225472;
      v30[2] = __52__ICMediaUserStateCenter__establishClientConnection__block_invoke_86;
      v30[3] = &unk_1E4391400;
      objc_copyWeak(&v31, (id *)buf);
      -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v30);
      -[NSXPCConnection resume](self->_xpcConnection, "resume");
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v7;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed listenerEndpointForService:ICCloudServerSupportedServiceMediaUserStateCenterServer, err=%{public}@", buf, 0x16u);
      }
    }

    xpcConnection = self->_xpcConnection;
  }
  v26 = xpcConnection;
  os_unfair_lock_unlock(p_lock);
  return v26;
}

- (void)_clearConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *xpcConnection;
  NSObject *completionHandlersQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(p_lock);
  completionHandlersQueue = self->_completionHandlersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICMediaUserStateCenter__clearConnection__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(completionHandlersQueue, block);
}

- (id)_getUserStatesForcingRefresh:(BOOL)a3
{
  id v3;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6038;
  v11 = __Block_byref_object_dispose__6039;
  v12 = (id)MEMORY[0x1E0C9AA60];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke;
  v5[3] = &unk_1E438AE18;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[ICMediaUserStateCenter _onSyncServer:](self, "_onSyncServer:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)_onAsyncServer:(id)a3
{
  id v4;
  ICCloudClient *cloudClient;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cloudClient = self->_cloudClient;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ICMediaUserStateCenter__onAsyncServer___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient performBlockAfterServerSetup:](cloudClient, "performBlockAfterServerSetup:", v7);

}

- (void)_onSyncServer:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[ICMediaUserStateCenter _establishClientConnection](self, "_establishClientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6038;
  v15 = __Block_byref_object_dispose__6039;
  v16 = 0;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__ICMediaUserStateCenter__onSyncServer___block_invoke;
    v10[3] = &unk_1E438AE40;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, v12[5]);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICMediaUserStateError"), 9001, CFSTR("Failed to create connection for sync server"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12[5];
    v12[5] = v8;

    v4[2](v4, 0, v12[5]);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)_handleServerStateUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  ICMediaUserStateCenter *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICMediaUserStateCenter _getUserStatesForcingRefresh:](self, "_getUserStatesForcingRefresh:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received notification: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[ICMediaUserStateCenter _applyServerStateUpdatedWithUserStates:](self, "_applyServerStateUpdatedWithUserStates:", v5);

}

- (void)_applyServerStateUpdatedWithUserStates:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ICMediaUserStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke;
  block[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)setAllUserStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUserStates, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_completionHandlersQueue, 0);
  objc_storeStrong((id *)&self->_refreshUserStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6)))
        {

          v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v15 = v8;
            v16 = 2114;
            v17 = CFSTR("ICMediaUserStateCenterUserStatesDidChangeNotification");
            _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ User states updated. Posting %{public}@", buf, 0x16u);
          }

          objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke_95;
          block[3] = &unk_1E43913D8;
          block[4] = *(_QWORD *)(a1 + 40);
          dispatch_async(MEMORY[0x1E0C80D38], block);
          return;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v4)
        continue;
      break;
    }
  }

}

void __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke_95(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICMediaUserStateCenterUserStatesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __40__ICMediaUserStateCenter__onSyncServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: _onServer: completed error=%{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9001, v3, CFSTR("Failed to create connection for sync server"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __41__ICMediaUserStateCenter__onAsyncServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_establishClientConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6038;
  v12 = __Block_byref_object_dispose__6039;
  v13 = 0;
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__ICMediaUserStateCenter__onAsyncServer___block_invoke_2;
    v7[3] = &unk_1E438AE40;
    v7[4] = *(_QWORD *)(a1 + 32);
    v7[5] = &v8;
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICMediaUserStateError"), 9002, CFSTR("Failed to create connection for async server"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9[5];
    v9[5] = v5;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(&v8, 8);

}

void __41__ICMediaUserStateCenter__onAsyncServer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create async server to get user states, err=%{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9002, v3, CFSTR("Failed to create connection for async server"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _onSyncServer: completed error=%{public}@", buf, 0x16u);

    }
    v11 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create sync server to get user states, err=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _onSyncServer: completed", buf, 0xCu);
    }

    v14 = *(unsigned __int8 *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke_89;
    v15[3] = &unk_1E438ADF0;
    v15[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "getUserStatesForcingRefresh:withReply:", v14, v15);
  }

}

void __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __42__ICMediaUserStateCenter__clearConnection__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C9AA60];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9004, 0, CFSTR("XPC connection was invalidated."));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v5, v8);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __52__ICMediaUserStateCenter__establishClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "%{public}@: XPC connection interrupted.", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "_clearConnection");
}

void __52__ICMediaUserStateCenter__establishClientConnection__block_invoke_86(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_ERROR, "%{public}@: XPC connection invalidated.", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "_clearConnection");
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_2;
  block[3] = &unk_1E4391230;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 32), "count") != 0;
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 32);
  v4 = (id)MEMORY[0x1A1AFA8D0](v2);
  objc_msgSend(v3, "addObject:", v4);

}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _onAsyncServer: completed error=%{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9002, v6, CFSTR("Error creating async server during force refresh user states"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _onAsyncServer: completed", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_25;
    v13[3] = &unk_1E438C2C0;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getUserStatesForcingRefresh:withReply:", 1, v13);
    v11 = v14;
  }

}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9003, a3, CFSTR("Failed to force refresh user states"));
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9002, a3, CFSTR("Error creating async server"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_2;
    v6[3] = &unk_1E438C2C0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(a2, "getUserStatesForcingRefresh:withReply:", 1, v6);

  }
}

void __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICMediaUserStateError"), 9002, a3, CFSTR("Error creating async server"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_4;
    v6[3] = &unk_1E438C2C0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(a2, "refreshSocialProfilesWithReply:", v6);

  }
}

uint64_t __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__ICMediaUserStateCenter_activeUserState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

void __38__ICMediaUserStateCenter__initLazily___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__ICMediaUserStateCenter__initLazily___block_invoke_2;
    v9[3] = &unk_1E438AD48;
    v10 = v3;
    objc_msgSend(v10, "_onAsyncServer:", v9);

  }
  else
  {
    objc_msgSend(v3, "_getUserStatesForcingRefresh:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched userStates from init", buf, 0xCu);
    }

  }
}

void __38__ICMediaUserStateCenter__initLazily___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__ICMediaUserStateCenter__initLazily___block_invoke_3;
  v3[3] = &unk_1E438AD20;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "getCachedUserStatesWithReply:", v3);

}

uint64_t __38__ICMediaUserStateCenter__initLazily___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyServerStateUpdatedWithUserStates:", a2);
}

+ (ICMediaUserStateCenter)shared
{
  if (shared_sOnceToken != -1)
    dispatch_once(&shared_sOnceToken, &__block_literal_global_6106);
  return (ICMediaUserStateCenter *)(id)shared_sShared;
}

void __32__ICMediaUserStateCenter_shared__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICMediaUserStateCenter _initLazily:]([ICMediaUserStateCenter alloc], "_initLazily:", 0);
  v1 = (void *)shared_sShared;
  shared_sShared = (uint64_t)v0;

}

@end
