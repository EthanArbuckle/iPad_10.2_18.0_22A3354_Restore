@implementation PLAssetsdClientXPCConnection

- (PLAssetsdClientXPCConnection)init
{
  PLAssetsdClientXPCConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *externalNotificationQueue;
  PLAssetsdClientService *v7;
  PLAssetsdClientService *assetsdClientService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLAssetsdClientXPCConnection;
  v2 = -[PLAssetsdClientXPCConnection init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("XPC client-side state isolation queue", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("XPC client-side XPC notification queue", 0);
    externalNotificationQueue = v2->_externalNotificationQueue;
    v2->_externalNotificationQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(PLAssetsdClientService);
    assetsdClientService = v2->_assetsdClientService;
    v2->_assetsdClientService = v7;

  }
  return v2;
}

void __59__PLAssetsdClientXPCConnection_connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    objc_msgSend(v2, "_makeNewResumedConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_makeNewResumedConnection
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PLXPCMessageLogger *v8;
  PLXPCMessageLogger *connectionLogger;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdClientXPCConnection.m"), 128, CFSTR("_connection is already set"));

  }
  if (self->_connectionLogger)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdClientXPCConnection.m"), 129, CFSTR("_connectionLogger is already set"));

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.photos.service"), 0);
  +[PLAssetsdInterface assetsdInterface](PLAssetsdInterface, "assetsdInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE37B748);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  objc_msgSend(v4, "setExportedObject:", self->_assetsdClientService);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PLAssetsdClientXPCConnection__makeNewResumedConnection__block_invoke;
  v14[3] = &unk_1E376C780;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v14);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __57__PLAssetsdClientXPCConnection__makeNewResumedConnection__block_invoke_2;
  v12[3] = &unk_1E376C780;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v12);
  if (+[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled"))
  {
    v8 = objc_alloc_init(PLXPCMessageLogger);
    connectionLogger = self->_connectionLogger;
    self->_connectionLogger = v8;

    objc_msgSend(v4, "setDelegate:", self->_connectionLogger);
  }
  objc_storeStrong((id *)&self->_connection, v4);
  objc_msgSend(v4, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)_primitiveSynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAssetsdClientXPCConnection connectionWithErrorHandler:](self, "connectionWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PLAssetsdClientXPCConnection)connectionWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *isolationQueue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10282;
  v17 = __Block_byref_object_dispose__10283;
  v18 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLAssetsdClientXPCConnection_connectionWithErrorHandler___block_invoke;
  block[3] = &unk_1E376C748;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(isolationQueue, block);
  v6 = (void *)v14[5];
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("PLAssetsdClientXPCConnection is unable to create an NSXPCConnection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41003, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v9);
    v6 = (void *)v14[5];
  }
  v10 = v6;
  _Block_object_dispose(&v13, 8);

  return (PLAssetsdClientXPCConnection *)v10;
}

- (void)invalidate
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PLAssetsdClientXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E376C6E0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)addPhotoLibraryUnavailabilityHandler:(id)a3
{
  -[PLAssetsdClientService addPhotoLibraryUnavailabilityHandler:](self->_assetsdClientService, "addPhotoLibraryUnavailabilityHandler:", a3);
}

- (void)handleInterruption
{
  _BOOL4 isShuttingDown;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  os_log_type_t v9;
  __int16 v10;
  __int16 v11;

  isShuttingDown = self->_isShuttingDown;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (isShuttingDown)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v6 = "Connection to assetsd was interrupted (shutting down)";
      v7 = (uint8_t *)&v11;
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199DF7000, v8, v9, v6, v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 0;
    v6 = "Connection to assetsd was interrupted - assetsd exited, died, or closed the photo library";
    v7 = (uint8_t *)&v10;
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  -[PLAssetsdClientXPCConnection _postInterruptedNotification](self, "_postInterruptedNotification");
}

- (void)_postInterruptedNotification
{
  void *v3;
  id v4;
  dispatch_block_t v5;
  _QWORD v6[4];
  id v7;
  PLAssetsdClientXPCConnection *v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PLAssetsdClientXPCConnectionInterruptedInternalNotificationName"), self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PLAssetsdClientXPCConnection__postInterruptedNotification__block_invoke;
  v6[3] = &unk_1E376C718;
  v7 = v3;
  v8 = self;
  v4 = v3;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v6);
  dispatch_async((dispatch_queue_t)self->_externalNotificationQueue, v5);

}

- (void)handleInvalidation
{
  _BOOL4 isShuttingDown;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  isShuttingDown = self->_isShuttingDown;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isShuttingDown)
  {
    if (!v5)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v6 = "Connection to assetsd was invalidated from client side. Setting connection object to nil.";
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v6 = "Connection to assetsd was invalidated - connection cannot be formed, or remote endpoint/listener was invalidate"
         "d. Setting connection object to nil.";
  }
  _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:

  if (!self->_isShuttingDown)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PLAssetsdClientXPCConnectionInvalidatedNotificationName"), self);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLAssetsdClientXPCConnection_handleInvalidation__block_invoke;
  block[3] = &unk_1E376C6E0;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)addBarrierBlock:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PLAssetsdClientXPCConnection_addBarrierBlock___block_invoke;
  block[3] = &unk_1E376C7A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAssetsdClientXPCConnection connectionWithErrorHandler:](self, "connectionWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_unboostingRemoteObjectProxy
{
  void *v2;
  void *v3;

  -[PLAssetsdClientXPCConnection connectionWithErrorHandler:](self, "connectionWithErrorHandler:", &__block_literal_global_10267);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unboostingRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClientService, 0);
  objc_storeStrong((id *)&self->_connectionLogger, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_externalNotificationQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __60__PLAssetsdClientXPCConnection__unboostingRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Unable to create XPC connection with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __48__PLAssetsdClientXPCConnection_addBarrierBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v4;
  uint8_t v5[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    return objc_msgSend(v2, "addBarrierBlock:", *(_QWORD *)(a1 + 40));
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Calling addBarrierBlock: when NSXPCConnection has not been created", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PLAssetsdClientXPCConnection__makeNewResumedConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInterruption");

}

void __57__PLAssetsdClientXPCConnection__makeNewResumedConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInvalidation");

}

void __50__PLAssetsdClientXPCConnection_handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(*(id *)(v1 + 24), "setDelegate:", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    v1 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

uint64_t __60__PLAssetsdClientXPCConnection__postInterruptedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("PLAssetsdClientXPCConnectionInterruptedNotificationName"), *(_QWORD *)(a1 + 40));
}

uint64_t __42__PLAssetsdClientXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
}

@end
