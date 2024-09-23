@implementation REMXPCDaemonController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_l_performersByName, 0);
  objc_destroyWeak((id *)&self->_cloudKitNetworkActivityDelegate);
}

+ (id)userInteractiveDaemonController
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStoreContainerToken:userInteractive:", 0, 1);
}

+ (id)weakSharedInstance
{
  id WeakRetained;
  REMXPCDaemonController *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&weakSharedInstance_sLock);
  WeakRetained = objc_loadWeakRetained(&weakSharedInstance__sDaemonController);

  if (WeakRetained)
  {
    v3 = (REMXPCDaemonController *)objc_loadWeakRetained(&weakSharedInstance__sDaemonController);
  }
  else
  {
    v3 = objc_retainAutorelease(objc_alloc_init(REMXPCDaemonController));
    objc_storeWeak(&weakSharedInstance__sDaemonController, v3);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&weakSharedInstance_sLock);
  return v3;
}

- (REMXPCDaemonController)init
{
  return -[REMXPCDaemonController initWithStoreContainerToken:userInteractive:](self, "initWithStoreContainerToken:userInteractive:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[REMXPCDaemonController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)REMXPCDaemonController;
  -[REMXPCDaemonController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[REMLog xpc](REMLog, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_DEFAULT, "REMXPCDaemonController invalidate", v5, 2u);
  }

  -[REMXPCDaemonController xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  REMXPCDaemonControllerPerformerResolver_store *v8;
  void *v9;
  REMXPCDaemonControllerPerformerResolver_store *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = [REMXPCDaemonControllerPerformerResolver_store alloc];
  -[REMXPCDaemonController storeContainerToken](self, "storeContainerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMXPCDaemonControllerPerformerResolver_store initWithStoreContainerToken:](v8, "initWithStoreContainerToken:", v9);
  -[REMXPCDaemonController _syncPerformerWithResolver:reason:errorHandler:](self, "_syncPerformerWithResolver:reason:errorHandler:", v10, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

- (id)_resolvePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMLog xpc](REMLog, "xpc");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_DEFAULT, "Cache-miss getting performer. Resolving sync {name: %{public}@, reason: %{public}@}", buf, 0x16u);
  }

  -[REMXPCDaemonController _xpcConnectionReconnectingIfNecessary](self, "_xpcConnectionReconnectingIfNecessary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke;
  v26[3] = &unk_1E67F8700;
  v15 = v11;
  v27 = v15;
  v16 = v10;
  v28 = v16;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  v32 = 0;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke_21;
  v22[3] = &unk_1E67F9FE8;
  v18 = v15;
  v23 = v18;
  v25 = buf;
  v19 = v16;
  v24 = v19;
  objc_msgSend(v8, "resolveWithDaemon:reason:completion:", v17, v9, v22);
  v20 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v20;
}

- (id)_syncPerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  REMXPCDaemonController *v19;
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMXPCDaemonController _resolveAndCachePerformerWithResolver:reason:errorHandler:](self, "_resolveAndCachePerformerWithResolver:reason:errorHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke;
  v17[3] = &unk_1E67F88B8;
  v18 = v11;
  v19 = self;
  v20 = v8;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_resolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  REMXPCDaemonController *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = __Block_byref_object_copy__8;
  v30[3] = __Block_byref_object_dispose__8;
  v31 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke;
  v26[3] = &unk_1E67F9F48;
  v28 = &v29;
  v26[4] = self;
  v13 = v11;
  v27 = v13;
  __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke((uint64_t)v26);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (*(_QWORD *)(v30[0] + 40))
  {
    +[REMLog xpc](REMLog, "xpc");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[REMXPCDaemonController _resolveAndCachePerformerWithResolver:reason:errorHandler:].cold.1((uint64_t)v13, (uint64_t)v30, v14);

    v15 = *(id *)(v30[0] + 40);
  }
  else
  {
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_17;
    v22[3] = &unk_1E67F88B8;
    v16 = v13;
    v23 = v16;
    v24 = self;
    v25 = v10;
    -[REMXPCDaemonController _resolvePerformerWithResolver:reason:errorHandler:](self, "_resolvePerformerWithResolver:reason:errorHandler:", v8, v9, v22);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      os_unfair_lock_lock(&self->_ivarLock);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2;
      v19[3] = &unk_1E67F9F70;
      v19[4] = self;
      v20 = v16;
      v21 = v15;
      __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2((uint64_t)v19);
      os_unfair_lock_unlock(&self->_ivarLock);

    }
  }
  v17 = v15;
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)l_performersByName
{
  return self->_l_performersByName;
}

- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3 userInteractive:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  REMXPCDaemonController *v8;
  REMXPCDaemonController *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *l_performersByName;
  __CFString **v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  REMXPCDaemonController *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REMXPCDaemonController;
  v8 = -[REMXPCDaemonController init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storeContainerToken, a3);
    v9->_ivarLock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    l_performersByName = v9->_l_performersByName;
    v9->_l_performersByName = v10;

    v12 = REMDaemonMachServiceName;
    if (v4)
      v12 = REMDaemonMachServiceName_userInteractive;
    v13 = *v12;
    v14 = *v12;
    objc_storeStrong((id *)&v9->_serviceName, v13);
    v15 = -[REMXPCDaemonController _xpcConnectionReconnectingIfNecessary](v9, "_xpcConnectionReconnectingIfNecessary");

  }
  +[REMLog xpc](REMLog, "xpc");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_DEFAULT, "Created new REMXPCDaemonController {self: %{public}@}", buf, 0xCu);
  }

  return v9;
}

- (id)_xpcConnectionReconnectingIfNecessary
{
  os_unfair_lock_s *p_ivarLock;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke;
  v14[3] = &unk_1E67F8A58;
  v14[4] = self;
  __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke((uint64_t)v14);
  os_unfair_lock_unlock(p_ivarLock);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  os_unfair_lock_lock(p_ivarLock);
  -[REMXPCDaemonController xpcConnection](self, "xpcConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v9[5];
  v9[5] = v4;

  os_unfair_lock_unlock(p_ivarLock);
  v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  REMXPCDaemonControllerExportedObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", v4, 0);

    +[REMXPCDaemonInterface interface](REMXPCDaemonInterface, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = objc_alloc_init(REMXPCDaemonControllerExportedObject);
    objc_msgSend(*(id *)(a1 + 32), "cloudKitNetworkActivityDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMXPCDaemonControllerExportedObject setCloudKitNetworkActivityDelegate:](v7, "setCloudKitNetworkActivityDelegate:", v8);

    objc_msgSend(v5, "setExportedObject:", v7);
    +[REMXPCClientInterface interface](REMXPCClientInterface, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v9);

    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2;
    v13[3] = &unk_1E67F98C8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "setInterruptionHandler:", v13);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_27;
    v11[3] = &unk_1E67F98C8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "setInvalidationHandler:", v11);
    objc_msgSend(v5, "resume");
    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", v5);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMXPCDaemonController serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p serviceName:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate
{
  return (REMXPCDaemonControllerCloudKitNetworkActivityDelegate *)objc_loadWeakRetained((id *)&self->_cloudKitNetworkActivityDelegate);
}

- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMXPCDaemonControllerPerformerResolver_store *v11;
  REMXPCDaemonControllerPerformerResolver_store *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [REMXPCDaemonControllerPerformerResolver_store alloc];
  -[REMXPCDaemonController storeContainerToken](self, "storeContainerToken");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[REMXPCDaemonControllerPerformerResolver_store initWithStoreContainerToken:](v11, "initWithStoreContainerToken:", v13);
  -[REMXPCDaemonController _asyncPerformerWithResolver:reason:loadHandler:errorHandler:](self, "_asyncPerformerWithResolver:reason:loadHandler:errorHandler:", v12, v10, v9, v8);

}

- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMXPCDaemonControllerPerformerResolver_sync *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_sync);
  -[REMXPCDaemonController _asyncPerformerWithResolver:reason:loadHandler:errorHandler:](self, "_asyncPerformerWithResolver:reason:loadHandler:errorHandler:", v11, v10, v9, v8);

}

- (void)_asyncPerformerWithResolver:(id)a3 reason:(id)a4 loadHandler:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  REMXPCDaemonController *v20;
  id v21;
  id v22;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke;
  v18[3] = &unk_1E67F9F20;
  v19 = v14;
  v20 = self;
  v21 = v11;
  v22 = v10;
  v15 = v10;
  v16 = v11;
  v17 = v14;
  -[REMXPCDaemonController _asyncResolveAndCachePerformerWithResolver:reason:completion:](self, "_asyncResolveAndCachePerformerWithResolver:reason:completion:", v13, v12, v18);

}

- (void)_asyncResolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  v27 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke;
  v19[3] = &unk_1E67F9F48;
  v21 = &v22;
  v19[4] = self;
  v13 = v11;
  v20 = v13;
  __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke((uint64_t)v19);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (v23[5])
  {
    +[REMLog xpc](REMLog, "xpc");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = v23[5];
      *(_DWORD *)buf = 138543874;
      v29 = v13;
      v30 = 2114;
      v31 = v9;
      v32 = 2112;
      v33 = v15;
      _os_log_debug_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEBUG, "Returning existing performer {name: %{public}@, reason: %{public}@, performer: %@}", buf, 0x20u);
    }

    v10[2](v10, v23[5], 0);
  }
  else
  {
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_19;
    v16[3] = &unk_1E67F9F98;
    v16[4] = self;
    v17 = v13;
    v18 = v10;
    -[REMXPCDaemonController _asyncResolvePerformerWithResolver:reason:completion:](self, "_asyncResolvePerformerWithResolver:reason:completion:", v8, v9, v16);

  }
  _Block_object_dispose(&v22, 8);

}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_asyncResolvePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMLog xpc](REMLog, "xpc");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_DEFAULT, "Cache-miss getting performer. Resolving async {name: %{public}@, reason: %{public}@}", buf, 0x16u);
  }

  -[REMXPCDaemonController _xpcConnectionReconnectingIfNecessary](self, "_xpcConnectionReconnectingIfNecessary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke;
  v23[3] = &unk_1E67F8700;
  v15 = v11;
  v24 = v15;
  v16 = v9;
  v25 = v16;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_20;
  v20[3] = &unk_1E67F9FC0;
  v21 = v15;
  v22 = v16;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v10, "resolveWithDaemon:reason:completion:", v17, v8, v20);

}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_2;
    v8[3] = &unk_1E67F88B8;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v9 = v4;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)setCloudKitNetworkActivityDelegate:(id)a3
{
  id v4;
  _QWORD v5[6];

  v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke;
  v5[3] = &unk_1E67F9EF8;
  v5[4] = self;
  v5[5] = v4;
  __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ivarLock);

}

void __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "setCloudKitNetworkActivityDelegate:", *(_QWORD *)(a1 + 40));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));

}

- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  REMXPCDaemonControllerPerformerResolver_sync *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_sync);
  -[REMXPCDaemonController _syncPerformerWithResolver:reason:errorHandler:](self, "_syncPerformerWithResolver:reason:errorHandler:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3
{
  return -[REMXPCDaemonController initWithStoreContainerToken:userInteractive:](self, "initWithStoreContainerToken:userInteractive:", a3, 0);
}

- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  REMXPCDaemonControllerPerformerResolver_changeTracking *v8;
  void *v9;
  REMXPCDaemonControllerPerformerResolver_changeTracking *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = [REMXPCDaemonControllerPerformerResolver_changeTracking alloc];
  -[REMXPCDaemonController storeContainerToken](self, "storeContainerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMXPCDaemonControllerPerformerResolver_changeTracking initWithStoreContainerToken:](v8, "initWithStoreContainerToken:", v9);
  -[REMXPCDaemonController _syncPerformerWithResolver:reason:errorHandler:](self, "_syncPerformerWithResolver:reason:errorHandler:", v10, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMXPCDaemonControllerPerformerResolver_debug *v11;
  REMXPCDaemonControllerPerformerResolver_debug *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [REMXPCDaemonControllerPerformerResolver_debug alloc];
  -[REMXPCDaemonController storeContainerToken](self, "storeContainerToken");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[REMXPCDaemonControllerPerformerResolver_debug initWithStoreContainerToken:](v11, "initWithStoreContainerToken:", v13);
  -[REMXPCDaemonController _asyncPerformerWithResolver:reason:loadHandler:errorHandler:](self, "_asyncPerformerWithResolver:reason:loadHandler:errorHandler:", v12, v10, v9, v8);

}

- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  REMXPCDaemonControllerPerformerResolver_debug *v8;
  void *v9;
  REMXPCDaemonControllerPerformerResolver_debug *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = [REMXPCDaemonControllerPerformerResolver_debug alloc];
  -[REMXPCDaemonController storeContainerToken](self, "storeContainerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMXPCDaemonControllerPerformerResolver_debug initWithStoreContainerToken:](v8, "initWithStoreContainerToken:", v9);
  -[REMXPCDaemonController _syncPerformerWithResolver:reason:errorHandler:](self, "_syncPerformerWithResolver:reason:errorHandler:", v10, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)syncDebugPerformerWithErrorHandler:(id)a3
{
  return -[REMXPCDaemonController syncDebugPerformerWithReason:errorHandler:](self, "syncDebugPerformerWithReason:errorHandler:", CFSTR("eventKitSyncStub"), a3);
}

- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  REMXPCDaemonControllerPerformerResolver_indexing *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_indexing);
  -[REMXPCDaemonController _syncPerformerWithResolver:reason:errorHandler:](self, "_syncPerformerWithResolver:reason:errorHandler:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMXPCDaemonControllerPerformerResolver_indexing *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_indexing);
  -[REMXPCDaemonController _asyncPerformerWithResolver:reason:loadHandler:errorHandler:](self, "_asyncPerformerWithResolver:reason:loadHandler:errorHandler:", v11, v10, v9, v8);

}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  NSObject *v4;
  int8x16_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1();

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_13;
  v11[3] = &unk_1E67F9EF8;
  v5 = a1[2];
  v12 = vextq_s8(v5, v5, 8uLL);
  v6 = (id)v5.i64[0];
  __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_13((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(a1[3].i64[0] + 16))(a1[3].i64[0], v3, v7, v8, v9, v10);
}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_13(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_2(int8x16_t *a1, void *a2)
{
  id v3;
  NSObject *v4;
  int8x16_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1();

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_15;
  v11[3] = &unk_1E67F9EF8;
  v5 = a1[2];
  v12 = vextq_s8(v5, v5, 8uLL);
  v6 = (id)v5.i64[0];
  __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_15((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(a1[3].i64[0] + 16))(a1[3].i64[0], v3, v7, v8, v9, v10);
}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_17(int8x16_t *a1, void *a2)
{
  id v3;
  NSObject *v4;
  int8x16_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_17_cold_1();

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18;
  v11[3] = &unk_1E67F9EF8;
  v5 = a1[2];
  v12 = vextq_s8(v5, v5, 8uLL);
  v6 = (id)v5.i64[0];
  __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(a1[3].i64[0] + 16))(a1[3].i64[0], v3, v7, v8, v9, v10);
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_19(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v11 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  if (v11)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2;
    v13[3] = &unk_1E67F9F70;
    v6 = (void *)a1[5];
    v13[4] = a1[4];
    v13[5] = v6;
    v13[6] = v11;
    v7 = v11;
    v8 = v6;
    __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2((uint64_t)v13);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3;
    v12[3] = &unk_1E67F9EF8;
    v9 = (void *)a1[5];
    v12[4] = a1[4];
    v12[5] = v9;
    v10 = v9;
    __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3((uint64_t)v12);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLog xpc](REMLog, "xpc");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_20_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "Resolve performer {name: %{public}@, performer: %@}", (uint8_t *)&v11, 0x16u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke_21(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  +[REMLog xpc](REMLog, "xpc");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_20_cold_1();

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_DEFAULT, "Resolved performer {name: %{public}@, performer: %@}", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v11;
  void *v12;

  +[REMLog xpc](REMLog, "xpc");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    -[os_unfair_lock_s _xpcConnectionDidInterrupt](WeakRetained, "_xpcConnectionDidInterrupt");
    os_unfair_lock_lock(v11 + 2);
    -[os_unfair_lock_s l_performersByName](v11, "l_performersByName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    os_unfair_lock_unlock(v11 + 2);
  }

}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v11;
  _QWORD v12[5];

  +[REMLog xpc](REMLog, "xpc");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_27_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    -[os_unfair_lock_s _xpcConnectionDidInvalidate](WeakRetained, "_xpcConnectionDidInvalidate");
    os_unfair_lock_lock(v11 + 2);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_28;
    v12[3] = &unk_1E67F8A58;
    v12[4] = v11;
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_28((uint64_t)v12);
    os_unfair_lock_unlock(v11 + 2);
  }

}

uint64_t __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_28(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

- (void)_xpcConnectionDidInvalidate
{
  id v2;

  -[REMXPCDaemonController cloudKitNetworkActivityDelegate](self, "cloudKitNetworkActivityDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudKitNetworkActivityDidChange:", &unk_1E6836FB8);

}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (void)setL_performersByName:(id)a3
{
  objc_storeStrong((id *)&self->_l_performersByName, a3);
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void)setStoreContainerToken:(id)a3
{
  objc_storeStrong((id *)&self->_storeContainerToken, a3);
}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Clearing cached performer due to proxy xpc error {name: %{public}@, error: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)_resolveAndCachePerformerWithResolver:(uint64_t)a1 reason:(uint64_t)a2 errorHandler:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1B4A39000, log, OS_LOG_TYPE_DEBUG, "Returning existing performer {name: %{public}@, performer: %@}", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_17_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Clearing cached performer due to resolve xpc error {name: %{public}@, error: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "xpc connection error getting resolver {name: %{public}@, error: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_20_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Error resolving performer {name: %{public}@, error: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "XPC connection was interrupted", a5, a6, a7, a8, 0);
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "XPC connection was invalidated", a5, a6, a7, a8, 0);
}

@end
