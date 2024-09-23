@implementation HKSPXPCConnectionProvider

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 doSynchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  HKSPXPCMessage *v10;
  id v11;
  HKSPXPCMessage *v12;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = [HKSPXPCMessage alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__HKSPXPCConnectionProvider_performRemoteBlock_withErrorHandler_doSynchronously___block_invoke;
  v13[3] = &unk_1E4E3CEB8;
  v14 = v8;
  v11 = v8;
  v12 = -[HKSPXPCMessage initWithIdentifier:block:options:errorHandler:](v10, "initWithIdentifier:block:options:errorHandler:", 0, v13, v5, v9);

  -[HKSPXPCConnectionProvider sendMessage:](self, "sendMessage:", v12);
}

- (void)sendMessage:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  HKSPXPCConnectionProvider *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "options");
  -[HKSPXPCConnectionProvider connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  else
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v4, "options") & 2) != 0)
      -[HKSPXPCConnectionProvider _addPendingMessage:](self, "_addPendingMessage:", v4);
    objc_msgSend(v4, "block");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__HKSPXPCConnectionProvider_sendMessage___block_invoke;
    v12[3] = &unk_1E4E3C208;
    v12[4] = self;
    v13 = v4;
    ((void (**)(_QWORD, void *, _QWORD *))v9)[2](v9, v8, v12);

  }
  else
  {
    HKSPLogForCategory(4uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2048;
      v17 = self;
      v11 = v15;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "[%{public}@.%p] remote object is nil", buf, 0x16u);

    }
  }

}

- (NSXPCConnection)connection
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HKSPXPCConnectionProvider_connection__block_invoke;
  v4[3] = &unk_1E4E3B8A0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPXPCConnectionProvider _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_connectionLock;
  void (**v4)(_QWORD);

  p_connectionLock = &self->_connectionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_connectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_connectionLock);
}

uint64_t __81__HKSPXPCConnectionProvider_performRemoteBlock_withErrorHandler_doSynchronously___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addPendingMessage:(id)a3
{
  id v5;
  void *v6;
  os_unfair_lock_s *p_pendingMessagesLock;
  NSMutableDictionary *pendingMessages;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPXPCConnectionProvider.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message.identifier != nil"));

  }
  p_pendingMessagesLock = &self->_pendingMessagesLock;
  os_unfair_lock_lock(&self->_pendingMessagesLock);
  pendingMessages = self->_pendingMessages;
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingMessages, "setObject:forKeyedSubscript:", v5, v9);

  os_unfair_lock_unlock(p_pendingMessagesLock);
}

- (void)_removePendingMessage:(id)a3
{
  id v5;
  void *v6;
  os_unfair_lock_s *p_pendingMessagesLock;
  NSMutableDictionary *pendingMessages;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPXPCConnectionProvider.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message.identifier != nil"));

  }
  p_pendingMessagesLock = &self->_pendingMessagesLock;
  os_unfair_lock_lock(&self->_pendingMessagesLock);
  pendingMessages = self->_pendingMessages;
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](pendingMessages, "removeObjectForKey:", v9);
  os_unfair_lock_unlock(p_pendingMessagesLock);
}

id __52__HKSPXPCConnectionProvider_initWithConnectionInfo___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB3B38];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "machServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "options");

  v7 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, v6);
  return v7;
}

void __39__HKSPXPCConnectionProvider_connection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    HKSPLogForCategory(4uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v22 = v4;
      v23 = 2048;
      v24 = v5;
      v6 = v4;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] rebuilding connection", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v7;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__HKSPXPCConnectionProvider_connection__block_invoke_194;
    v19[3] = &unk_1E4E3BC80;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", v19);
    v14 = v9;
    v15 = 3221225472;
    v16 = __39__HKSPXPCConnectionProvider_connection__block_invoke_2;
    v17 = &unk_1E4E3BC80;
    objc_copyWeak(&v18, (id *)buf);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", &v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectInterface", v14, v15, v16, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRemoteObjectInterface:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "exportedObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = v11 == 0;

    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "exportedObjectInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedInterface:", v12);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "exportedObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:", v13);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __39__HKSPXPCConnectionProvider_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void __41__HKSPXPCConnectionProvider_sendMessage___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removePendingMessage:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    HKSPLogForCategory(4uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      v18 = 2114;
      v19 = v5;
      v10 = v8;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@.%p] message failed with error %{public}@", (uint8_t *)&v14, 0x20u);

    }
    if (objc_msgSend(v5, "hksp_shouldRetryMessage"))
    {
      HKSPLogForCategory(4uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_opt_class();
        v12 = *(_QWORD *)(a1 + 32);
        v14 = 138543618;
        v15 = v11;
        v16 = 2048;
        v17 = v12;
        v13 = v11;
        _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@.%p] message should be retried...", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (HKSPXPCConnectionProvider)providerWithConnectionInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnectionInfo:", v3);

  return (HKSPXPCConnectionProvider *)v4;
}

- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3
{
  id v4;
  void *v5;
  HKSPXPCConnectionProvider *v6;

  v4 = a3;
  HKSPStandardHeartbeatListener(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKSPXPCConnectionProvider initWithConnectionInfo:connectionProvider:heartbeatListener:](self, "initWithConnectionInfo:connectionProvider:heartbeatListener:", v4, &__block_literal_global_19, v5);

  return v6;
}

- (void)invalidate
{
  NSObject *v3;
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  HKSPXPCConnectionProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2048;
    v11 = self;
    v4 = v9;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] invalidating...", buf, 0x16u);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[HKSPXPCConnectionInfo lifecycleNotification](self->_connectionInfo, "lifecycleNotification");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, self);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HKSPXPCConnectionProvider_invalidate__block_invoke;
  v7[3] = &unk_1E4E3AF48;
  v7[4] = self;
  -[HKSPXPCConnectionProvider _withLock:](self, "_withLock:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong(&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_heartbeatListener, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  HKSPXPCConnectionProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v4 = v7;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] deallocing...", buf, 0x16u);

  }
  -[HKSPXPCConnectionProvider invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)HKSPXPCConnectionProvider;
  -[HKSPXPCConnectionProvider dealloc](&v5, sel_dealloc);
}

- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3 connectionProvider:(id)a4 heartbeatListener:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSPXPCConnectionProvider *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id connectionProvider;
  NSMutableDictionary *v18;
  NSMutableDictionary *pendingMessages;
  HKSPXPCConnectionProvider *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  HKSPXPCConnectionProvider *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HKSPXPCConnectionProvider;
  v12 = -[HKSPXPCConnectionProvider init](&v22, sel_init);
  if (v12)
  {
    HKSPLogForCategory(4uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v14;
      v25 = 2048;
      v26 = v12;
      v27 = 2114;
      v28 = v9;
      v15 = v14;
      _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing with %{public}@", buf, 0x20u);

    }
    v12->_connectionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_connectionInfo, a3);
    v16 = objc_msgSend(v10, "copy");
    connectionProvider = v12->_connectionProvider;
    v12->_connectionProvider = (id)v16;

    objc_storeStrong((id *)&v12->_heartbeatListener, a5);
    v12->_pendingMessagesLock._os_unfair_lock_opaque = 0;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingMessages = v12->_pendingMessages;
    v12->_pendingMessages = v18;

    -[HKSPXPCHeartbeatListener setHeartbeatDelegate:](v12->_heartbeatListener, "setHeartbeatDelegate:", v12);
    v20 = v12;
  }

  return v12;
}

- (void)_retryPendingMessages
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  HKSPXPCConnectionProvider *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[HKSPXPCConnectionProvider isInvalidated](self, "isInvalidated"))
  {
    os_unfair_lock_lock(&self->_pendingMessagesLock);
    -[NSMutableDictionary allValues](self->_pendingMessages, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](self->_pendingMessages, "removeAllObjects");
    os_unfair_lock_unlock(&self->_pendingMessagesLock);
    if (objc_msgSend(v3, "count"))
    {
      HKSPLogForCategory(4uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (void *)objc_opt_class();
        v6 = v5;
        *(_DWORD *)buf = 138543874;
        v23 = v5;
        v24 = 2048;
        v25 = self;
        v26 = 2048;
        v27 = objc_msgSend(v3, "count");
        _os_log_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] %ld pending messages to retry", buf, 0x20u);

      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v16 = v3;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            HKSPLogForCategory(4uLL);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v23 = v14;
              v24 = 2048;
              v25 = self;
              v26 = 2114;
              v27 = v12;
              v15 = v14;
              _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] retrying message %{public}@", buf, 0x20u);

            }
            -[HKSPXPCConnectionProvider sendMessage:](self, "sendMessage:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      v3 = v16;
    }

  }
}

void __39__HKSPXPCConnectionProvider_connection__block_invoke_194(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didInterruptConnection");

}

void __39__HKSPXPCConnectionProvider_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didInvalidateConnection");

}

- (BOOL)isInvalidated
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__HKSPXPCConnectionProvider_isInvalidated__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPXPCConnectionProvider _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__HKSPXPCConnectionProvider_isInvalidated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)_didInterruptConnection
{
  NSObject *v3;
  id v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  __int16 v8;
  HKSPXPCConnectionProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[HKSPXPCConnectionProvider isInvalidated](self, "isInvalidated"))
  {
    HKSPLogForCategory(4uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v7 = (id)objc_opt_class();
      v8 = 2048;
      v9 = self;
      v4 = v7;
      _os_log_error_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_ERROR, "[%{public}@.%p] connection interrupted", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HKSPXPCConnectionProvider__didInterruptConnection__block_invoke;
    block[3] = &unk_1E4E3AF48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__HKSPXPCConnectionProvider__didInterruptConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryPendingMessages");
}

- (void)_didInvalidateConnection
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  HKSPXPCConnectionProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[HKSPXPCConnectionProvider isInvalidated](self, "isInvalidated"))
  {
    HKSPLogForCategory(4uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = self;
      v5 = v9;
      _os_log_error_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_ERROR, "[%{public}@.%p] connection invalidated", buf, 0x16u);

    }
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke;
    v7[3] = &unk_1E4E3AF48;
    v7[4] = self;
    -[HKSPXPCConnectionProvider _withLock:](self, "_withLock:", v7);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke_2;
    v6[3] = &unk_1E4E3AF48;
    v6[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

void __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

uint64_t __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryPendingMessages");
}

- (void)listenerDidReceiveHeartbeat:(id)a3
{
  NSObject *v4;
  id v5;
  id WeakRetained;
  int v7;
  id v8;
  __int16 v9;
  HKSPXPCConnectionProvider *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[HKSPXPCConnectionProvider isInvalidated](self, "isInvalidated", a3))
  {
    HKSPLogForCategory(4uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = self;
      v5 = v8;
      _os_log_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] received heartbeat, reconnecting", (uint8_t *)&v7, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reconnect");

  }
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4
{
  -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](self, "performRemoteBlock:withErrorHandler:doSynchronously:", a3, a4, 0);
}

- (NSString)description
{
  return (NSString *)-[HKSPXPCConnectionProvider descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCConnectionProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCConnectionProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCConnectionProvider connectionInfo](self, "connectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("connectionInfo"));

  return v4;
}

- (HKSPXPCConnectionProviderDelegate)delegate
{
  return (HKSPXPCConnectionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (HKSPXPCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (HKSPXPCHeartbeatListener)heartbeatListener
{
  return self->_heartbeatListener;
}

- (id)connectionProvider
{
  return self->_connectionProvider;
}

- (os_unfair_lock_s)pendingMessagesLock
{
  return self->_pendingMessagesLock;
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

@end
