@implementation PRUpdatingService

- (id)_initWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PRUpdatingService *v14;
  uint64_t v15;
  BSAtomicSignal *invalidationFlag;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  uint64_t v21;
  NSMutableDictionary *activeSessions;
  uint64_t v23;
  NSHashTable *observers;
  void *v26;
  void *v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdatingService _initWithProcess:auditToken:target:].cold.1(a2);
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B32B8);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("auditToken"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdatingService _initWithProcess:auditToken:target:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B331CLL);
  }
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdatingService _initWithProcess:auditToken:target:].cold.3(a2);
    goto LABEL_15;
  }
  v28.receiver = self;
  v28.super_class = (Class)PRUpdatingService;
  v14 = -[PRUpdatingService init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_opt_new();
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicSignal *)v15;

    objc_storeStrong((id *)&v14->_process, a3);
    objc_storeStrong((id *)&v14->_auditToken, a4);
    objc_storeStrong((id *)&v14->_target, a5);
    objc_msgSend(v10, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "extensionIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v19;

    v21 = objc_opt_new();
    activeSessions = v14->_activeSessions;
    v14->_activeSessions = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v23;

  }
  return v14;
}

+ (id)updatingServiceWithProcess:(id)a3 auditToken:(id)a4 target:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PRUpdatingService _initWithProcess:auditToken:target:]([PRUpdatingService alloc], "_initWithProcess:auditToken:target:", v9, v8, v7);

  return v10;
}

+ (NSXPCInterface)interfaceToExtension
{
  if (interfaceToExtension_onceToken != -1)
    dispatch_once(&interfaceToExtension_onceToken, &__block_literal_global_31);
  return (NSXPCInterface *)(id)interfaceToExtension___interfaceToExtension;
}

void __41__PRUpdatingService_interfaceToExtension__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE028B68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceToExtension___interfaceToExtension;
  interfaceToExtension___interfaceToExtension = v0;

  v2 = (void *)interfaceToExtension___interfaceToExtension;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateDescriptors_sessionInfo_completion_, 0, 0);

}

- (void)dealloc
{
  PRUpdatingService *v2;
  objc_super v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable removeAllObjects](v2->_observers, "removeAllObjects");
  objc_sync_exit(v2);

  -[PRUpdatingService invalidate](v2, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)PRUpdatingService;
  -[PRUpdatingService dealloc](&v3, sel_dealloc);
}

- (void)addUpdatingServiceObserver:(id)a3
{
  PRUpdatingService *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeUpdatingServiceObserver:(id)a3
{
  PRUpdatingService *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)isValid
{
  return -[BSAtomicSignal hasBeenSignalled](self->_invalidationFlag, "hasBeenSignalled") ^ 1;
}

- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PRUpdatingService *v25;
  void (**v26)(id, _QWORD, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationFlag, "hasBeenSignalled"))
  {
    -[PRUpdatingService invalidationError](self, "invalidationError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);

  }
  else
  {
    v12 = (void *)objc_opt_new();
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke;
    v23[3] = &unk_1E21854D0;
    v24 = v12;
    v25 = self;
    v26 = v10;
    v14 = v12;
    v15 = (void *)MEMORY[0x18D77C604](v23);
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_2;
    v19[3] = &unk_1E2185520;
    v20 = v8;
    v21 = v9;
    v22 = v15;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_4;
    v17[3] = &unk_1E2185548;
    v18 = v22;
    v16 = v22;
    -[PRUpdatingService _accessUpdatingService:errorHandler:](self, "_accessUpdatingService:errorHandler:", v19, v17);

  }
}

void __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateActiveSessions");

}

void __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v22 = 0;
        objc_msgSend(v13, "extendContentsReadAccessToAuditToken:error:", 0, &v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v22;
        v16 = v15;
        if (!v14)
        {
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "fireError:", v16);

          goto LABEL_13;
        }
        objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = (void *)objc_msgSend(v7, "copy");
  v18 = *(_QWORD *)(a1 + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_3;
  v19[3] = &unk_1E21854F8;
  v20 = v6;
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v5, "updateDescriptors:sessionInfo:completion:", v17, v18, v19);

  v8 = v20;
LABEL_13:

}

uint64_t __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "fireError:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "noteSessionIsComplete");
}

uint64_t __62__PRUpdatingService_updateDescriptors_sessionInfo_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PRUpdatingService *v25;
  void (**v26)(id, _QWORD, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationFlag, "hasBeenSignalled"))
  {
    -[PRUpdatingService invalidationError](self, "invalidationError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);

  }
  else
  {
    v12 = (void *)objc_opt_new();
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke;
    v23[3] = &unk_1E21854D0;
    v24 = v12;
    v25 = self;
    v26 = v10;
    v14 = v12;
    v15 = (void *)MEMORY[0x18D77C604](v23);
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_2;
    v19[3] = &unk_1E2185520;
    v20 = v8;
    v21 = v9;
    v22 = v15;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_4;
    v17[3] = &unk_1E2185548;
    v18 = v22;
    v16 = v22;
    -[PRUpdatingService _accessUpdatingService:errorHandler:](self, "_accessUpdatingService:errorHandler:", v19, v17);

  }
}

void __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateActiveSessions");

}

void __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v7, "extendContentsReadAccessToAuditToken:error:", 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_3;
    v13[3] = &unk_1E2185570;
    v12 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v14 = v6;
    objc_msgSend(v5, "updateConfiguration:sessionInfo:completion:", v8, v12, v13);

    v11 = v15;
  }
  else
  {
    v11 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "fireError:", v11);
  }

}

uint64_t __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "noteSessionIsComplete");
}

uint64_t __64__PRUpdatingService_updateConfiguration_sessionInfo_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_accessUpdatingService:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, PRUpdater_toExtension *, void *);
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = (void (**)(id, PRUpdater_toExtension *, void *))a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PRUpdatingService__accessUpdatingService_errorHandler___block_invoke;
  v12[3] = &unk_1E2185548;
  v8 = v7;
  v13 = v8;
  v9 = (void *)MEMORY[0x18D77C604](v12);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUpdatingService _acquireSessionForUUID:errorHandler:](self, "_acquireSessionForUUID:errorHandler:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v6[2](v6, self->_proxy, v11);

}

uint64_t __57__PRUpdatingService__accessUpdatingService_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidate
{
  void *v3;
  PRUpdatingService *v4;
  NSXPCConnection *connection;
  _EXExtensionProcess *process;
  BSAuditToken *auditToken;
  RBSTarget *target;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicSignal signal](self->_invalidationFlag, "signal"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = self;
    objc_sync_enter(v4);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4->_activeSessions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_74);
    -[NSMutableDictionary removeAllObjects](v4->_activeSessions, "removeAllObjects");
    -[NSXPCConnection invalidate](v4->_connection, "invalidate");
    connection = v4->_connection;
    v4->_connection = 0;

    process = v4->_process;
    v4->_process = 0;

    auditToken = v4->_auditToken;
    v4->_auditToken = 0;

    target = v4->_target;
    v4->_target = 0;

    -[NSHashTable allObjects](v4->_observers, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRUpdatingService setInvalidationError:](v4, "setInvalidationError:", v3);
    objc_sync_exit(v4);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "updatingService:didInvalidateWithError:", v4, v3, (_QWORD)v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    -[PRUpdatingService _updateActiveSessions](v4, "_updateActiveSessions");
  }
}

uint64_t __31__PRUpdatingService_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (BOOL)_hasActiveSessions
{
  PRUpdatingService *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_activeSessions, "count") && v2->_connection && v2->_proxy != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)_acquireSessionForUUID:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  PRUpdatingService *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _PRUpdatingSession *v13;
  void *v14;
  id v15;
  _EXExtensionProcess *process;
  uint64_t v17;
  id v18;
  NSXPCConnection *connection;
  NSXPCConnection *v21;
  void *v22;
  NSXPCConnection *v23;
  uint64_t v24;
  PRUpdater_toExtension *proxy;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id location;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_initWeak(&location, self);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_proxy)
  {
    process = v8->_process;
    v30 = 0;
    v17 = -[_EXExtensionProcess newXPCConnectionWithError:](process, "newXPCConnectionWithError:", &v30);
    v18 = v30;
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v17;

    if (v18)
    {
      v7[2](v7, v18);

      objc_sync_exit(v8);
      v15 = 0;
      goto LABEL_5;
    }
    v21 = v8->_connection;
    +[PRUpdatingService interfaceToExtension](PRUpdatingService, "interfaceToExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v21, "setRemoteObjectInterface:", v22);

    v23 = v8->_connection;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke;
    v29[3] = &unk_1E21855B8;
    v29[4] = &v31;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v23, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
    v24 = objc_claimAutoreleasedReturnValue();
    proxy = v8->_proxy;
    v8->_proxy = (PRUpdater_toExtension *)v24;

    -[NSXPCConnection resume](v8->_connection, "resume");
  }
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(v6, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke_2;
  v26[3] = &unk_1E21855E0;
  objc_copyWeak(&v28, &location);
  v11 = v6;
  v27 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v10, CFSTR("accessUpdatingService"), v26);

  v13 = -[_PRUpdatingSession initWithConnectionAssertion:errorHandler:]([_PRUpdatingSession alloc], "initWithConnectionAssertion:errorHandler:", v12, v7);
  v14 = (void *)v32[5];
  v32[5] = (uint64_t)v13;

  -[NSMutableDictionary setObject:forKey:](v8->_activeSessions, "setObject:forKey:", v32[5], v11);
  objc_destroyWeak(&v28);
  objc_sync_exit(v8);

  v15 = (id)v32[5];
LABEL_5:
  _Block_object_dispose(&v31, 8);

  objc_destroyWeak(&location);
  return v15;
}

uint64_t __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "fireError:", a2);
}

void __57__PRUpdatingService__acquireSessionForUUID_errorHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateSession:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_invalidateSession:(id)a3
{
  PRUpdatingService *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_activeSessions, "removeObjectForKey:", v5);
  -[PRUpdatingService _updateActiveSessions](v4, "_updateActiveSessions");
  objc_sync_exit(v4);

}

- (void)_updateActiveSessions
{
  uint64_t v2;
  PRUpdatingService *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  PRUpdater_toExtension *proxy;
  PRUpdatingService *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[NSMutableDictionary count](obj->_activeSessions, "count");
  v3 = obj;
  if (!v2)
  {
    connection = obj->_connection;
    if (connection)
    {
      -[NSXPCConnection invalidate](connection, "invalidate");
      v5 = obj->_connection;
      obj->_connection = 0;

      v3 = obj;
    }
    proxy = v3->_proxy;
    if (proxy)
    {
      v3->_proxy = 0;

      v3 = obj;
    }
  }
  objc_sync_exit(v3);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (RBSTarget)target
{
  return self->_target;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithProcess:(const char *)a1 auditToken:target:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
