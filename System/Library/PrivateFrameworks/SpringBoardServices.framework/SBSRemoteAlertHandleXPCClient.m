@implementation SBSRemoteAlertHandleXPCClient

- (SBSRemoteAlertHandleXPCClient)init
{
  SBSRemoteAlertHandleXPCClient *v2;
  uint64_t v3;
  OS_dispatch_queue *calloutQueue;
  uint64_t v5;
  OS_dispatch_queue *connectionAccessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSRemoteAlertHandleXPCClient;
  v2 = -[SBSRemoteAlertHandleXPCClient init](&v8, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = BSDispatchQueueCreateWithQualityOfService();
    connectionAccessQueue = v2->_connectionAccessQueue;
    v2->_connectionAccessQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)remoteAlertHandleWithIDDidActivate:(id)a3
{
  id v3;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_didActivate");

  }
}

- (void)remoteAlertHandleWithIDDidDeactivate:(id)a3
{
  id v3;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_didDeactivate");

  }
}

- (void)remoteAlertHandleWithID:(id)a3 didInvalidateWithError:(id)a4
{
  if (a3)
    -[SBSRemoteAlertHandleXPCClient _invalidateHandleForHandleID:withError:](self, "_invalidateHandleForHandleID:withError:", a3, a4);
}

- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSMutableDictionary *handleIDToHandle;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  uint64_t v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SBSRemoteAlertHandleXPCClient _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  objc_msgSend(v11, "remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:", v8, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v15)
  {
    v17 = 0;
    goto LABEL_21;
  }
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v30;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v30 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
      objc_msgSend(v20, "handleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:", v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if (v17)
          {
LABEL_9:
            objc_msgSend(v17, "addObject:", v22);

            goto LABEL_10;
          }
        }
        else
        {
          v22 = -[SBSRemoteAlertHandle _initWithHandleID:handleClient:]([SBSRemoteAlertHandle alloc], "_initWithHandleID:handleClient:", v21, self);
          if (objc_msgSend(v20, "isActive"))
            objc_msgSend(v22, "_didActivate");
          handleIDToHandle = self->_handleIDToHandle;
          if (!handleIDToHandle)
          {
            v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v25 = self->_handleIDToHandle;
            self->_handleIDToHandle = v24;

            handleIDToHandle = self->_handleIDToHandle;
          }
          -[NSMutableDictionary setObject:forKey:](handleIDToHandle, "setObject:forKey:", v22, v21);
          if (v17)
            goto LABEL_9;
        }
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
        goto LABEL_9;
      }
LABEL_10:

      ++v19;
    }
    while (v16 != v19);
    v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v16 = v26;
  }
  while (v26);
LABEL_21:

  return v17;
}

- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSMutableDictionary *handleIDToHandle;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;

  v6 = a4;
  v7 = a3;
  -[SBSRemoteAlertHandleXPCClient _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createRemoteAlertHandleContextWithDefinition:configurationContext:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "handleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = -[SBSRemoteAlertHandle _initWithHandleID:handleClient:]([SBSRemoteAlertHandle alloc], "_initWithHandleID:handleClient:", v11, self);
      if (objc_msgSend(v10, "isActive"))
        objc_msgSend(v12, "_didActivate");
      handleIDToHandle = self->_handleIDToHandle;
      if (!handleIDToHandle)
      {
        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = self->_handleIDToHandle;
        self->_handleIDToHandle = v14;

        handleIDToHandle = self->_handleIDToHandle;
      }
      -[NSMutableDictionary setObject:forKey:](handleIDToHandle, "setObject:forKey:", v12, v11);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "handleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBSRemoteAlertHandleXPCClient _connection](self, "_connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateRemoteAlertHandleWithID:activationContext:", v6, v9);

  }
}

- (void)invalidateRemoteAlertHandle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "handleID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBSRemoteAlertHandleXPCClient _connection](self, "_connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateRemoteAlertHandleWithID:", v6);

  }
}

- (id)_connection
{
  NSObject *connectionAccessQueue;
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke;
  v5[3] = &unk_1E288FD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    if (!*(_QWORD *)(v1 + 24))
    {
      v3 = (void *)MEMORY[0x1E0D03458];
      v4 = (void *)MEMORY[0x1E0D01888];
      objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolveServiceName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSRemoteAlertHandleServiceSpecification identifier](SBSRemoteAlertHandleServiceSpecification, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endpointForMachName:service:instance:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 24);
      *(_QWORD *)(v10 + 24) = v9;

      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 24);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_2;
      v14[3] = &unk_1E288CF30;
      v14[4] = v12;
      objc_msgSend(v13, "configureConnection:", v14);

      v1 = *(_QWORD *)(a1 + 32);
    }
    if (!*(_BYTE *)(v1 + 32))
    {
      *(_BYTE *)(v1 + 32) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activate");
      v1 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v1 + 24));
  }
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[SBSRemoteAlertHandleServiceSpecification interface](SBSRemoteAlertHandleServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_3;
  v9[3] = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_5;
  v7[3] = &unk_1E288CF08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_4;
    block[3] = &unk_1E288DFC0;
    v4 = WeakRetained;
    v6 = v4;
    dispatch_barrier_async(v3, block);
    objc_msgSend(v4, "_handleError:", 0);

  }
}

uint64_t __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_5(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_6;
    block[3] = &unk_1E288DFC0;
    v4 = WeakRetained;
    v6 = v4;
    dispatch_barrier_async(v3, block);
    objc_msgSend(v4, "_handleError:", 0);

  }
}

uint64_t __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 1;
  return result;
}

- (void)_handleError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSRemoteAlertHandleInvalidationErrorDescription(2uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0CB2D50]);

  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSRemoteAlertHandleInvalidationErrorDomain"), 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)-[NSMutableDictionary copy](self->_handleIDToHandle, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBSRemoteAlertHandleXPCClient _invalidateHandleForHandleID:withError:](self, "_invalidateHandleForHandleID:withError:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_invalidateHandleForHandleID:(id)a3 withError:(id)a4
{
  NSObject *calloutQueue;
  id v7;
  id v8;
  NSMutableDictionary *handleIDToHandle;
  id v10;

  calloutQueue = self->_calloutQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(calloutQueue);
  -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_receivedInvalidationWithError:", v7);

  -[NSMutableDictionary removeObjectForKey:](self->_handleIDToHandle, "removeObjectForKey:", v8);
  if (!-[NSMutableDictionary count](self->_handleIDToHandle, "count"))
  {
    handleIDToHandle = self->_handleIDToHandle;
    self->_handleIDToHandle = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleIDToHandle, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end
