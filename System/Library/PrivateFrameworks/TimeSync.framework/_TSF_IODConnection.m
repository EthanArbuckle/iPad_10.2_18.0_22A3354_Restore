@implementation _TSF_IODConnection

- (_TSF_IODConnection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_TSF_IODConnection init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (_TSF_IODConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  _TSF_IODConnection *v7;
  _TSF_IODConnection *v8;
  IOKNotificationPort *asyncCallbackPort;
  OS_dispatch_queue *asyncCallbackQueue;
  uint64_t v11;
  unsigned int v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TSF_IODConnection;
  v7 = -[_TSF_IODConnection init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_clientID = 0;
    asyncCallbackPort = v7->_asyncCallbackPort;
    v7->_asyncCallbackPort = 0;

    asyncCallbackQueue = v8->_asyncCallbackQueue;
    v8->_asyncCallbackQueue = 0;

    v8->_asyncCallback = 0;
    v8->_refcon = 0;
    if (initWithService_andType__onceToken != -1)
      dispatch_once(&initWithService_andType__onceToken, &__block_literal_global_4);
    v11 = objc_msgSend(v6, "entryID");
    v12 = objc_msgSend((id)gDaemonServiceClient, "openDaemonClientWithRegistryEntryID:clientType:error:", v11, v4, 0);
    v8->_clientID = v12;
    if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v11;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IODConnectionFramework failed to open registryEntryID %llu\n", buf, 0xCu);
    }
  }

  return v8;
}

- (_TSF_IODConnection)initWithService:(id)a3
{
  return -[_TSF_IODConnection initWithService:andType:](self, "initWithService:andType:", a3, 0);
}

- (void)dealloc
{
  uint64_t clientID;
  objc_super v4;

  clientID = self->_clientID;
  if ((_DWORD)clientID)
    objc_msgSend((id)gDaemonServiceClient, "closeDaemonClient:error:", clientID, 0);
  v4.receiver = self;
  v4.super_class = (Class)_TSF_IODConnection;
  -[_TSF_IODConnection dealloc](&v4, sel_dealloc);
}

+ (void)daemonClientRefresh
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  _QWORD block[7];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClientExported:daemonClientRefresh\n", buf, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
  objc_msgSend((id)gClients, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        v10 = v8[4];
        v9 = v8[5];
        v11 = v8[2];
        *(_QWORD *)buf = 0;
        v16 = buf;
        v17 = 0xA010000000;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0;
        v18 = &unk_1B572BA63;
        v19 = 1000;
        if (v11)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (!v12 && v9 != 0)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __41___TSF_IODConnection_daemonClientRefresh__block_invoke;
          block[3] = &unk_1E694B368;
          block[5] = v10;
          block[6] = v9;
          block[4] = buf;
          dispatch_async(v11, block);
        }
        _Block_object_dispose(buf, 8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

}

+ (void)dispatchNotificationForClientID:(unsigned int)a3 ioResult:(int)a4 args:(const unint64_t *)a5 numArgs:(unsigned int)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint8_t buf[8];
  __int128 v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v9 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
  v10 = (void *)gClients;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(_QWORD *)(v12 + 32);
    v14 = *(_QWORD *)(v12 + 40);
    v15 = *(id *)(v12 + 16);
    v16 = v14 != 0;
  }
  else
  {
    v15 = 0;
    v13 = 0;
    v16 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
  if (a6 <= 0x10 && v15 && v13 && v16)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v25 = buf;
    *((_QWORD *)&v25 + 1) = 0xA010000000;
    v26 = &unk_1B572BA63;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    __memmove_chk();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76___TSF_IODConnection_dispatchNotificationForClientID_ioResult_args_numArgs___block_invoke;
    v18[3] = &unk_1E694B390;
    v21 = v13;
    v19 = (id)v12;
    v20 = buf;
    v22 = a4;
    v23 = a6;
    dispatch_async(v15, v18);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 0;
    if (a5 && a6)
      v17 = *a5;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v9;
    LOWORD(v25) = 2048;
    *(_QWORD *)((char *)&v25 + 2) = v17;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IODConnection NO CONNECTION callback clientID %u arg0 %llu\n", buf, 0x12u);
  }

}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v12;
  uint64_t v14;
  uint64_t clientID;

  v12 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a3;
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)gDaemonServiceClient, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v14, a4, v12, a6, a7, a8, a9, a10);
  else
    return 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t clientID;

  v8 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)gDaemonServiceClient, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v10, a4, v8, 0, 0, a6, a7, a8);
  else
    return 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t clientID;

  v7 = *(_QWORD *)&a3;
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    return objc_msgSend((id)gDaemonServiceClient, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v7, 0, 0, a4, a5, 0, 0, a6);
  else
    return 0;
}

- (BOOL)registerAsyncNotificationsWithSelector:(unsigned int)a3 callBack:(void *)a4 refcon:(unint64_t)a5 callbackQueue:(id)a6
{
  uint64_t v9;
  id v11;
  uint64_t clientID;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;

  v9 = *(_QWORD *)&a3;
  v11 = a6;
  objc_storeStrong((id *)&self->_asyncCallbackQueue, a6);
  if (self->_asyncCallbackQueue && (clientID = self->_clientID, (_DWORD)clientID))
  {
    v13 = objc_msgSend((id)gDaemonServiceClient, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", clientID, v9, 0, 0, 0, 0, 0, 0, 0);
    v14 = 0;
    if (v13)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
      self->_asyncCallback = a4;
      self->_refcon = a5;
      v15 = (void *)gClients;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clientID);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", self, v16);

      os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)deregisterAsyncNotificationsWithSelector:(unsigned int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  IOKNotificationPort *asyncCallbackPort;
  OS_dispatch_queue *asyncCallbackQueue;

  if (self->_clientID)
  {
    v4 = *(_QWORD *)&a3;
    os_unfair_lock_lock((os_unfair_lock_t)&gClientsLock);
    v5 = (void *)gClients;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clientID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    self->_asyncCallback = 0;
    self->_refcon = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&gClientsLock);
    v7 = objc_msgSend((id)gDaemonServiceClient, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", self->_clientID, v4, 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    v7 = 0;
  }
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = 0;

  asyncCallbackQueue = self->_asyncCallbackQueue;
  self->_asyncCallbackQueue = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncCallbackPort, 0);
  objc_storeStrong((id *)&self->_asyncCallbackQueue, 0);
}

@end
