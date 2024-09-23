@implementation VCSyncDataHandler

- (VCSyncDataHandler)init
{
  VCSyncDataHandler *v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSHashTable *servicesTable;
  VCSyncDataHandler *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCSyncDataHandler;
  v2 = -[VCSyncDataHandler init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    servicesTable = v2->_servicesTable;
    v2->_servicesTable = (NSHashTable *)v9;

    v11 = v2;
  }

  return v2;
}

- (NSArray)services
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[VCSyncDataHandler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__VCSyncDataHandler_services__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)requestSync
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VCSyncDataHandler services](self, "services", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "requestSync");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)requestFullResync
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VCSyncDataHandler services](self, "services", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "requestFullResync");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5
{
  id v5;
  id result;

  v5 = a3;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCSyncDataHandler unsyncedChangesForSyncService:metadata:error:] must be overridden"));
  __break(1u);
  return result;
}

- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  BOOL result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:] must be overridden"));
  __break(1u);
  return result;
}

- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4
{
  id v4;
  BOOL result;

  v4 = a3;
  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCSyncDataHandler resetSyncStateForService:error:] must be overridden"));
  __break(1u);
  return result;
}

- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  BOOL result;

  v6 = a3;
  v7 = a4;
  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCSyncDataHandler applyChanges:fromSyncService:error:] must be overridden"));
  __break(1u);
  return result;
}

- (BOOL)deleteSyncedData:(id *)a3
{
  BOOL result;

  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCSyncDataHandler deleteSyncedData:] must be overridden"));
  __break(1u);
  return result;
}

- (void)registerSyncService:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSyncDataHandler.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  }
  -[VCSyncDataHandler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCSyncDataHandler_registerSyncService___block_invoke;
  block[3] = &unk_1E7AA8138;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(v6, block);

}

- (void)deregisterSyncService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VCSyncDataHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCSyncDataHandler_deregisterSyncService___block_invoke;
  block[3] = &unk_1E7AA8138;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSHashTable)servicesTable
{
  return self->_servicesTable;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_servicesTable, 0);
}

void __43__VCSyncDataHandler_deregisterSyncService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "servicesTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __41__VCSyncDataHandler_registerSyncService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "servicesTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __29__VCSyncDataHandler_services__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "servicesTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (int)messageType
{
  int result;

  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[VCSyncDataHandler messageType] must be overridden"));
  __break(1u);
  return result;
}

+ (Class)changeClass
{
  return (Class)VCSYChangeClassFromMessageType(objc_msgSend(a1, "messageType"));
}

@end
