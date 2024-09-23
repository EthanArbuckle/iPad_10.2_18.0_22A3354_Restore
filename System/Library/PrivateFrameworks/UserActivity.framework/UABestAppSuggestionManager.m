@implementation UABestAppSuggestionManager

- (UABestAppSuggestionManager)init
{
  UABestAppSuggestionManager *v2;
  UABestAppSuggestionManagerProxy *v3;
  UABestAppSuggestionManagerProxy *proxyManager;
  id v5;
  void *v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id to;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UABestAppSuggestionManager;
  v2 = -[UABestAppSuggestionManager init](&v21, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_copyWeak(&to, (id *)&v2->_delegate);
    v3 = objc_alloc_init(UABestAppSuggestionManagerProxy);
    proxyManager = v2->_proxyManager;
    v2->_proxyManager = v3;

    -[UABestAppSuggestionManagerProxy setWeakManager:](v2->_proxyManager, "setWeakManager:", v2);
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    UABestAppSuggestionManagerServiceName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithMachServiceName:options:", v6, 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v7;

    _LSGetBestAppSuggestionManagerProtocolInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v9);

    -[UABestAppSuggestionManager proxyManager](v2, "proxyManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v10);

    _LSGetBestAppSuggestionManagerResponseProtocolInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v11);

    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __34__UABestAppSuggestionManager_init__block_invoke;
    v16[3] = &unk_1E6008048;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &to);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v16);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __34__UABestAppSuggestionManager_init__block_invoke_12;
    v14[3] = &unk_1E6007898;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v14);
    -[NSXPCConnection resume](v2->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (UABestAppSuggestionManagerProxy)proxyManager
{
  return (UABestAppSuggestionManagerProxy *)objc_getProperty(self, a2, 40, 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[UABestAppSuggestionManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)UABestAppSuggestionManager;
  -[UABestAppSuggestionManager dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (id)bestAppSuggestions:(int64_t)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id location;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v5 = dispatch_semaphore_create(0);
  -[UABestAppSuggestionManager connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke;
  v17[3] = &unk_1E6007D28;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke_22;
    v14[3] = &unk_1E6008098;
    v14[4] = &v19;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "doDetermineBestAppSuggestionWithCompletionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  v10 = (void *)v20[5];
  if (v10 && objc_msgSend(v10, "count"))
  {
    if (a3 && objc_msgSend((id)v20[5], "count") > (unint64_t)a3)
    {
      objc_msgSend((id)v20[5], "subarrayWithRange:", 0, a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (id)v20[5];
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)bestAppSuggestion
{
  void *v2;
  void *v3;
  void *v4;

  -[UABestAppSuggestionManager bestAppSuggestions:](self, "bestAppSuggestions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastBestAppSuggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __34__UABestAppSuggestionManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  unsigned __int8 *v5;
  int v6;
  id *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "-- connection to useractivityd interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (unsigned __int8 *)WeakRetained;
    objc_sync_enter(v5);
    v6 = v5[16];
    v5[16] = 0;
    objc_sync_exit(v5);

    v7 = (id *)(a1 + 40);
    v8 = objc_loadWeakRetained(v7);
    if (v8
      && (v9 = v8,
          v10 = objc_loadWeakRetained(v7),
          v11 = objc_opt_respondsToSelector(),
          v10,
          v9,
          (v11 & 1) != 0))
    {
      _uaGetLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "-- calling .delegate with -(void) connectionInterrupted to tell client that the server has gone away.", v16, 2u);
      }

      v13 = objc_loadWeakRetained(v7);
      objc_msgSend(v13, "connectionInterrupted");

    }
    else if (v6)
    {
      _uaGetLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_INFO, "-- reestablishing connection to server because it was interrupted but the client has a delegate for us to call.", v15, 2u);
      }

      objc_msgSend(v5, "startListeningForBestAppSuggestions");
    }
  }

}

void __34__UABestAppSuggestionManager_init__block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_DEBUG, "-- Connection to useractivityd invalidated; this object won't work anymore.",
      v4,
      2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopListeningForBestAppSuggestions");

}

- (void)removeBestAppByUUID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "removeBestAppByUUID:%{public}@ opts=%{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[UABestAppSuggestionManager connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "doRemoveBestAppSuggestion:options:", v6, v7);

}

void __58__UABestAppSuggestionManager_removeBestAppByUUID_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)removeBestApp:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543875;
    v15 = v10;
    v16 = 2113;
    v17 = v6;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "removeBestApp:%{public}@/%{private}@ opts=%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v6, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UABestAppSuggestionManager removeBestAppByUUID:options:](self, "removeBestAppByUUID:options:", v13, v7);

}

- (void)invalidate
{
  NSObject *v3;
  UABestAppSuggestionManager *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "invalidate", v7, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[UABestAppSuggestionManager connection](v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UABestAppSuggestionManager connection](v4, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[UABestAppSuggestionManager setConnection:](v4, "setConnection:", 0);
  }
  objc_sync_exit(v4);

}

- (void)startListeningForBestAppSuggestions
{
  UABestAppSuggestionManager *v2;
  _BOOL4 listeningForBestAppSuggestions;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UABestAppSuggestion *lastBestAppSuggestion;
  uint8_t v10[16];

  v2 = self;
  objc_sync_enter(v2);
  listeningForBestAppSuggestions = v2->_listeningForBestAppSuggestions;
  v2->_listeningForBestAppSuggestions = 1;
  objc_sync_exit(v2);

  if (!listeningForBestAppSuggestions)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "-- Registering with useractivityd to receive bestAppSuggestion", v10, 2u);
    }

    -[UABestAppSuggestionManager connection](v2, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_16_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v2->_listeningForBestAppSuggestions = 1;
      -[UABestAppSuggestionManager delegate](v2, "delegate");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v2->_lastBestAppSuggestion && v7)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "bestAppSuggestionChanged:withAdditionalSuggestions:", 0, 0);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "bestAppSuggestionChanged:", 0);
        }
        lastBestAppSuggestion = v2->_lastBestAppSuggestion;
        v2->_lastBestAppSuggestion = 0;

      }
      objc_msgSend(v6, "doRegisterForBestAppChangeNotification");

    }
  }
}

void __65__UABestAppSuggestionManager_startListeningForBestAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)stopListeningForBestAppSuggestions
{
  UABestAppSuggestionManager *v2;
  _BOOL4 listeningForBestAppSuggestions;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = self;
  objc_sync_enter(v2);
  listeningForBestAppSuggestions = v2->_listeningForBestAppSuggestions;
  v2->_listeningForBestAppSuggestions = 0;
  objc_sync_exit(v2);

  if (listeningForBestAppSuggestions)
  {
    _uaGetLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEBUG, "-- Unregistering with useractivityd to receive bestAppSuggestion", v7, 2u);
    }

    -[UABestAppSuggestionManager connection](v2, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_21_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v6, "doUnregisterForBestAppChangeNotification");

  }
}

void __64__UABestAppSuggestionManager_stopListeningForBestAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)determineBestAppWithDelay:(double)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  -[UABestAppSuggestionManager bestAppSuggestion](self, "bestAppSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__UABestAppSuggestionManager_determineBestAppWithDelay_withBlock___block_invoke;
    v10[3] = &unk_1E6008070;
    v12 = v6;
    v11 = v7;
    dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

  }
  return 0;
}

uint64_t __66__UABestAppSuggestionManager_determineBestAppWithDelay_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke_22(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  double v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _uaGetLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uuid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    suggestedActionTypeString(objc_msgSend(v9, "type"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityType");
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peerDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peerDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peerDeviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545667;
    v40 = v33;
    v41 = 2114;
    v42 = v29;
    v43 = 2113;
    v44 = v28;
    v45 = 2113;
    v46 = v12;
    v47 = 2114;
    v48 = v8;
    v49 = 2048;
    v50 = a4;
    v51 = 2113;
    v52 = v13;
    v53 = 2113;
    v54 = v14;
    v55 = 2113;
    v56 = v15;
    v57 = 2048;
    v58 = objc_msgSend(v7, "count") - 1;
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ %{private}@ %{private}@ %{public}@ %g %{private}@ %{private}@ %{private}@ (and %lu more app suggestions)", buf, 0x66u);

    v9 = v11;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v24, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(WeakRetained, "createAppSuggestionFromActivityInfo:atTime:", v24, v8);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v27);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

}

- (BOOL)fetchAllNearbyAppSuggestions
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;

  _uaGetLogForCategory(CFSTR("multi-handoff"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "fetchAllNearbyAppSuggestions called", buf, 2u);
  }

  -[UABestAppSuggestionManager connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke_28;
  v7[3] = &unk_1E6007B48;
  v7[4] = buf;
  objc_msgSend(v5, "fetchAllNearbyAppSuggestions:", v7);
  LOBYTE(v4) = v9[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

void __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "Error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke_28(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("multi-handoff"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "expectResults: %@", (uint8_t *)&v6, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (void)queueFetchOfPayloadForBestAppSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 138543362;
    *(_QWORD *)((char *)&v17 + 4) = v7;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "queueFetchOfPayloadForBestAppSuggestion:%{public}@", (uint8_t *)&v17, 0xCu);

  }
  -[UABestAppSuggestionManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_31_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _uaGetLogForCategory(CFSTR("signposts"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      v17 = 0uLL;
      objc_msgSend(v11, "getUUIDBytes:", &v17);
      v13 = 0;
      v14 = 0;
      do
      {
        v14 = (*((_BYTE *)&v17 + v13 + 1) ^ *((_BYTE *)&v17 + v13)) | (v14 << 8);
        v13 += 2;
      }
      while (v13 != 16);

      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        objc_msgSend(v4, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = 138543362;
        *(_QWORD *)((char *)&v17 + 4) = v15;
        _os_signpost_emit_with_name_impl(&dword_1AF7EB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v14, "fetchUserActivityQueued", "Fetching handoff payload:%{public}@", (uint8_t *)&v17, 0xCu);

      }
    }

    objc_msgSend(v4, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doQueueFetchOfPayloadForBestAppSuggestion:completionHandler:", v16, &__block_literal_global_33_0);

  }
}

void __70__UABestAppSuggestionManager_queueFetchOfPayloadForBestAppSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "Error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)bestAppSuggestionWasLaunched:(id)a3 withInteractionType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    -[UABestAppSuggestionManager connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v10, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doLaunchFollowUp:interactionType:cancelled:", v9, a4, 0);

    }
    v6 = v10;
  }

}

- (void)bestAppSuggestionLaunchWasCancelled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[UABestAppSuggestionManager connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doLaunchFollowUp:interactionType:cancelled:", v7, 0, 1);

    }
    v4 = v8;
  }

}

- (id)createAppSuggestionFromActivityInfo:(id)a3 atTime:(id)a4
{
  id v5;
  UABestAppSuggestion *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v15;
  void *v16;
  UABestAppSuggestion *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v22 = a4;
  v5 = a3;
  v6 = [UABestAppSuggestion alloc];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dynamicActivityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "when");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "peerDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerDeviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "active");

  LOBYTE(v15) = v13;
  v17 = -[UABestAppSuggestion initWithBundleIdentifier:uuid:activityType:dynamicIdentifier:lastUpdateTime:lastActiveTime:type:deviceName:deviceIdentifier:deviceType:options:isActive:](v6, "initWithBundleIdentifier:uuid:activityType:dynamicIdentifier:lastUpdateTime:lastActiveTime:type:deviceName:deviceIdentifier:deviceType:options:isActive:", v7, v21, v20, v19, v22, v18, v8, v16, v10, v11, v12, v15);

  return v17;
}

- (BOOL)isActivityInfo:(id)a3 atTime:(id)a4 similarToAppSuggestion:(id)a5
{
  void *v5;
  void *v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = objc_msgSend(v9, "type");
    if (v12 == objc_msgSend(v11, "type"))
    {
      objc_msgSend(v9, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v14))
      {
        v16 = 0;
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v9, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v9, "bundleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v5;
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v16 = 0;
          goto LABEL_28;
        }
      }
      objc_msgSend(v9, "activityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v9, "activityType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activityType");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v16 = 0;
          goto LABEL_25;
        }
      }
      objc_msgSend(v9, "options");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v9, "options");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "options");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v5;
        if (!objc_msgSend(v5, "isEqual:"))
        {
          v20 = (void *)v19;
          v16 = 0;
          goto LABEL_22;
        }
      }
      v33 = (void *)v19;
      if (!v10
        || (objc_msgSend(v11, "when"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "compare:", v5) == -1))
      {
        objc_msgSend(v9, "peerDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uniqueID");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v28 = (void *)v22;
          objc_msgSend(v9, "peerDevice");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "uniqueID");
          v30 = v6;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "originatingDeviceIdentifier");
          v29 = v5;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v21;
          v16 = objc_msgSend(v23, "isEqual:", v24);

          v5 = v29;
          v6 = v30;

          if (!v10)
            goto LABEL_21;
        }
        else
        {

          v16 = 1;
          if (!v10)
          {
LABEL_21:
            v20 = v33;
            if (!v33)
            {
              if (!v17)
              {
LABEL_26:

                goto LABEL_27;
              }
LABEL_25:

              goto LABEL_26;
            }
LABEL_22:

            if (!v17)
            {
LABEL_27:
              if (!v15)
              {
LABEL_29:

                goto LABEL_30;
              }
LABEL_28:

              goto LABEL_29;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
        v16 = 0;
      }

      goto LABEL_21;
    }
  }
  v16 = 0;
LABEL_31:

  return v16;
}

- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  BOOL v18;
  id v19;
  id v20;
  char v21;
  int v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  UABestAppSuggestionManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  int bestAppNotificationCount;
  id v35;
  dispatch_time_t v36;
  UABestAppSuggestionManager *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  BOOL v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD block[5];
  id v58;
  int v59;
  char v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  double v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v54 = a4;
  v55 = v8;
  objc_msgSend(v8, "firstObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _uaGetLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v56, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    suggestedActionTypeString(objc_msgSend(v56, "type"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "activityType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    stringRemovingNewlines(v12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "peerDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "peerDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545667;
    v62 = v53;
    v63 = 2114;
    v64 = v50;
    v65 = 2113;
    v66 = v52;
    v67 = 2113;
    v68 = v51;
    v69 = 2114;
    v70 = v49;
    v71 = 2114;
    v72 = v54;
    v73 = 2048;
    v74 = a5;
    v75 = 2113;
    v76 = v14;
    v77 = 2113;
    v78 = v16;
    v79 = 2048;
    v80 = objc_msgSend(v55, "count") - 1;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEFAULT, "notifyBestAppsChanged:%{public}@ %{public}@ %{private}@/%{private}@ opts=%{public}@ when=%{public}@ confidence=%g from=%{private}@/%{private}@  (and %lu more best app suggestions)", buf, 0x66u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = WeakRetained == 0;

  if (!v18)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v19)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        v22 = 1;
        goto LABEL_10;
      }
    }
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v23
      || (v24 = objc_loadWeakRetained((id *)&self->_delegate),
          v25 = objc_opt_respondsToSelector(),
          v24,
          v23,
          (v25 & 1) != 0))
    {
      v22 = 0;
LABEL_10:
      objc_msgSend(v56, "activityType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v56, "activityType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "length"))
        {
          v28 = objc_msgSend(v56, "active");

          if (v28)
          {
            v29 = self;
            objc_sync_enter(v29);
            ++v29->_bestAppNotificationCount;
            if ((v22 & 1) != 0
              || !-[UABestAppSuggestionManager isActivityInfo:atTime:similarToAppSuggestion:](v29, "isActivityInfo:atTime:similarToAppSuggestion:", v56, v54, v29->_lastBestAppSuggestion))
            {
              -[UABestAppSuggestionManager createAppSuggestionFromActivityInfo:atTime:](v29, "createAppSuggestionFromActivityInfo:atTime:", v56, v54);
              v37 = (UABestAppSuggestionManager *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)&v29->_lastBestAppSuggestion, v37);
              objc_sync_exit(v29);

              if (v22)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v38;
                if (v37)
                  objc_msgSend(v38, "addObject:", v37);
                if ((unint64_t)objc_msgSend(v55, "count") >= 2)
                {
                  v40 = 1;
                  do
                  {
                    objc_msgSend(v55, "objectAtIndex:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "when");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "timeIntervalSinceDate:", v43);
                    v45 = v44 > 600.0;

                    if (!v45)
                    {
                      -[UABestAppSuggestionManager createAppSuggestionFromActivityInfo:atTime:](v29, "createAppSuggestionFromActivityInfo:atTime:", v41, v54);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v46)
                        objc_msgSend(v39, "addObject:", v46);

                    }
                    ++v40;
                  }
                  while (v40 < objc_msgSend(v55, "count"));
                }
                v47 = objc_loadWeakRetained((id *)&self->_delegate);
                objc_msgSend(v47, "bestAppSuggestionChanged:withAdditionalSuggestions:", v37, v39);

              }
              else
              {
                if (!v37)
                  goto LABEL_21;
                v48 = objc_loadWeakRetained((id *)&self->_delegate);
                objc_msgSend(v48, "bestAppSuggestionChanged:", v37);

              }
              v29 = v37;
            }
            else
            {
              _uaGetLogForCategory(0);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v56, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "UUIDString");
                v32 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "bundleIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543619;
                v62 = v32;
                v63 = 2113;
                v64 = v33;
                _os_log_impl(&dword_1AF7EB000, v30, OS_LOG_TYPE_DEBUG, " -- ignoring delivery of %{public}@ %{private}@ because it matches the last bestApp we got told about.", buf, 0x16u);

              }
              objc_sync_exit(v29);
            }
            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      bestAppNotificationCount = self->_bestAppNotificationCount;
      v35 = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = dispatch_time(0, 750000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__UABestAppSuggestionManager_notifyBestAppsChanged_when_confidence___block_invoke;
      block[3] = &unk_1E6008100;
      v59 = bestAppNotificationCount;
      v60 = v22;
      block[4] = self;
      v58 = v35;
      v29 = (UABestAppSuggestionManager *)v35;
      dispatch_after(v36, MEMORY[0x1E0C80D38], block);

LABEL_20:
    }
  }
LABEL_21:

}

void __68__UABestAppSuggestionManager_notifyBestAppsChanged_when_confidence___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 20) == *(_DWORD *)(a1 + 48))
  {
    v3 = *(void **)(v2 + 24);
    if (v3)
    {
      *(_QWORD *)(v2 + 24) = 0;

    }
    v4 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 52))
      objc_msgSend(v4, "bestAppSuggestionChanged:withAdditionalSuggestions:", 0, 0);
    else
      objc_msgSend(v4, "bestAppSuggestionChanged:", 0);
  }
  objc_sync_exit(obj);

}

- (void)launchAppWithBundleIdentifier:(id)a3 taskContinuationIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543619;
    v10 = v7;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ %{private}@", (uint8_t *)&v9, 0x16u);
  }

  -[UABestAppSuggestionManager launchAppWithBundleIdentifier:userActivityUniqueIdentifier:userActivityTypeIdentifier:](self, "launchAppWithBundleIdentifier:userActivityUniqueIdentifier:userActivityTypeIdentifier:", v6, v7, 0);
}

- (void)launchAppWithBundleIdentifier:(id)a3 userActivityUniqueIdentifier:(id)a4 userActivityTypeIdentifier:(id)a5
{
  -[UABestAppSuggestionManager launchAppWithBundleIdentifier:userActivityUniqueIdentifier:userActivityTypeIdentifier:deviceName:deviceIdentifier:deviceType:](self, "launchAppWithBundleIdentifier:userActivityUniqueIdentifier:userActivityTypeIdentifier:deviceName:deviceIdentifier:deviceType:", a3, a4, a5, 0, 0, 0);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UABestAppSuggestionManagerDelegate)delegate
{
  return (UABestAppSuggestionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setProxyManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
