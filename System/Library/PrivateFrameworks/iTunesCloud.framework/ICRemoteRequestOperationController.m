@implementation ICRemoteRequestOperationController

void __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_didEndExecutingRemoteRequestOperation");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)_didEndExecutingRemoteRequestOperation
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ICRemoteRequestOperationController__didEndExecutingRemoteRequestOperation__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICRemoteRequestOperationController _willBeginExecutingRemoteRequestOperation](self, "_willBeginExecutingRemoteRequestOperation");
  -[ICRemoteRequestOperationController _clientConnection](self, "_clientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke;
  v15[3] = &unk_1E43915E8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke_3;
  v13[3] = &unk_1E438A728;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "performRemoteRequestOperationWithExecutionContext:completionHandler:", v7, v13);

}

- (void)_willBeginExecutingRemoteRequestOperation
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ICRemoteRequestOperationController__willBeginExecutingRemoteRequestOperation__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (id)_clientConnection
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3881;
  v10 = __Block_byref_object_dispose__3882;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICRemoteRequestOperationController__clientConnection__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (ICRemoteRequestOperationController)sharedRemoteRequestOperationController
{
  if (sharedRemoteRequestOperationController_sOnceToken != -1)
    dispatch_once(&sharedRemoteRequestOperationController_sOnceToken, &__block_literal_global_3898);
  return (ICRemoteRequestOperationController *)(id)sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController;
}

_QWORD *__76__ICRemoteRequestOperationController__didEndExecutingRemoteRequestOperation__block_invoke(uint64_t a1)
{
  _QWORD *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_scheduleInvalidationOfClientConnection");
  return result;
}

_QWORD *__79__ICRemoteRequestOperationController__willBeginExecutingRemoteRequestOperation__block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  result = *(_QWORD **)(a1 + 32);
  if (result[2] == 1)
    return (_QWORD *)objc_msgSend(result, "_cancelClientConnectionInvalidationTimer");
  return result;
}

- (void)_cancelClientConnectionInvalidationTimer
{
  NSObject *clientConnectionInvalidationTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  clientConnectionInvalidationTimer = self->_clientConnectionInvalidationTimer;
  if (clientConnectionInvalidationTimer)
  {
    dispatch_source_cancel(clientConnectionInvalidationTimer);
    v4 = self->_clientConnectionInvalidationTimer;
    self->_clientConnectionInvalidationTimer = 0;

  }
}

void __76__ICRemoteRequestOperationController_sharedRemoteRequestOperationController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICRemoteRequestOperationController _init]([ICRemoteRequestOperationController alloc], "_init");
  v1 = (void *)sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController;
  sharedRemoteRequestOperationController_sSharedRemoteRequestOperationController = (uint64_t)v0;

}

- (id)_init
{
  ICRemoteRequestOperationController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICRemoteRequestOperationController;
  v2 = -[ICRemoteRequestOperationController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICRemoteRequestOperationController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Creating connection to remote request execution service.", v13, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    +[ICRemoteRequestOperationExecuting machServiceName](ICRemoteRequestOperationExecuting, "machServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithMachServiceName:options:", v5, 0);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setExportedObject:");
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    +[ICRemoteRequestOperationExecuting clientInterface](ICRemoteRequestOperationExecuting, "clientInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v10);

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    +[ICRemoteRequestOperationExecuting serviceInterface](ICRemoteRequestOperationExecuting, "serviceInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInterruptionHandler:", &__block_literal_global_8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInvalidationHandler:", &__block_literal_global_10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)_scheduleInvalidationOfClientConnection
{
  OS_dispatch_source *v3;
  OS_dispatch_source *clientConnectionInvalidationTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_accessQueue);
  clientConnectionInvalidationTimer = self->_clientConnectionInvalidationTimer;
  self->_clientConnectionInvalidationTimer = v3;

  v5 = self->_clientConnectionInvalidationTimer;
  v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_clientConnectionInvalidationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __77__ICRemoteRequestOperationController__scheduleInvalidationOfClientConnection__block_invoke;
  handler[3] = &unk_1E43913D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_clientConnectionInvalidationTimer);
}

- (void)_invalidateClientConnection
{
  NSXPCConnection *clientConnection;
  NSXPCConnection *v4;
  NSObject *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  clientConnection = self->_clientConnection;
  if (clientConnection)
  {
    -[NSXPCConnection invalidate](clientConnection, "invalidate");
    v4 = self->_clientConnection;
    self->_clientConnection = 0;

    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection to remote request execution service.", v6, 2u);
    }

  }
}

- (void)_clientConnectionInvalidationTimerDidExpire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[ICRemoteRequestOperationController _cancelClientConnectionInvalidationTimer](self, "_cancelClientConnectionInvalidationTimer");
  -[ICRemoteRequestOperationController _invalidateClientConnection](self, "_invalidateClientConnection");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnectionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __77__ICRemoteRequestOperationController__scheduleInvalidationOfClientConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientConnectionInvalidationTimerDidExpire");
}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke_9()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to remote request execution service invalidated.", v1, 2u);
  }

}

void __55__ICRemoteRequestOperationController__clientConnection__block_invoke_7()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to remote request execution service interrupted.", v1, 2u);
  }

}

void __106__ICRemoteRequestOperationController_performRemoteRequestOperationWithExecutionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain remote proxy to perform remote request operation. error = %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

@end
