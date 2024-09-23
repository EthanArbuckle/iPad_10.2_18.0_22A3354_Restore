@implementation STStatusDomainXPCClientHandle

- (STStatusDomainXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  STStatusDomainXPCClientHandle *v11;
  STStatusDomainXPCClientHandle *v12;
  void *v13;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  BSMutableIntegerMap *v16;
  BSMutableIntegerMap *dataByDomain;
  BSMutableIntegerMap *v18;
  BSMutableIntegerMap *clientHandleWrappersByDomain;
  uint64_t v20;
  NSSet *entitledDomains;
  uint64_t v22;
  NSMutableSet *observingDomains;
  void *v24;
  void *v25;
  uint64_t v26;
  STStatusDomainXPCClientHandle *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x1E0DB0D98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  STEntitledDomainsForEntitlementValue(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v36.receiver = self;
    v36.super_class = (Class)STStatusDomainXPCClientHandle;
    v11 = -[STStatusDomainXPCClientHandle init](&v36, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_serverHandle, v8);
      v34 = 0u;
      v35 = 0u;
      if (v7)
        objc_msgSend(v7, "auditToken");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.systemstatus.observerqueue.client-%d"), BSPIDForAuditToken());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      Serial = BSDispatchQueueCreateSerial();
      internalQueue = v12->_internalQueue;
      v12->_internalQueue = (OS_dispatch_queue *)Serial;

      v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      dataByDomain = v12->_dataByDomain;
      v12->_dataByDomain = v16;

      v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      clientHandleWrappersByDomain = v12->_clientHandleWrappersByDomain;
      v12->_clientHandleWrappersByDomain = v18;

      v20 = objc_msgSend(v10, "copy");
      entitledDomains = v12->_entitledDomains;
      v12->_entitledDomains = (NSSet *)v20;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v22 = objc_claimAutoreleasedReturnValue();
      observingDomains = v12->_observingDomains;
      v12->_observingDomains = (NSMutableSet *)v22;

      STStatusDomainXPCClientInterface();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRemoteObjectInterface:", v24);

      STStatusDomainXPCServerInterface();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v25);

      objc_msgSend(v7, "setExportedObject:", v12);
      objc_initWeak(&location, v12);
      v26 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v31[3] = &unk_1E8E18430;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v7, "setInterruptionHandler:", v31);
      v29[0] = v26;
      v29[1] = 3221225472;
      v29[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3;
      v29[3] = &unk_1E8E18430;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v7, "setInvalidationHandler:", v29);
      objc_storeStrong((id *)&v12->_clientXPCConnection, a3);
      objc_msgSend(v7, "resume");
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    self = v12;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[2];
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

uint64_t __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 24);
  else
    v2 = 0;
  return objc_msgSend(v2, "invalidate");
}

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[2];
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

void __68__STStatusDomainXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[STStatusDomainXPCClientHandle _internalQueue_stopObservingDomain:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_internalQueue_stopObservingDomain:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  int v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 16);
    v4 = a2;
    dispatch_assert_queue_V2(v3);
    v10 = *(id *)(a1 + 56);
    v5 = objc_msgSend(v10, "containsObject:", v4);
    objc_msgSend(v10, "removeObject:", v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v7 = objc_msgSend(v4, "unsignedIntegerValue");

    v8 = *(id *)(a1 + 40);
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v7);

    if (v5)
    {
      if (v9)
        objc_msgSend(WeakRetained, "removeClient:forDomain:", v9, v7);
    }

  }
}

- (void)observeDomain:(id)a3 withPreferredLocalizations:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainXPCClientHandle_observeDomain_withPreferredLocalizations___block_invoke;
  block[3] = &unk_1E8E18260;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __74__STStatusDomainXPCClientHandle_observeDomain_withPreferredLocalizations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  STStatusDomainClientHandleWrapper *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[7];
    v12 = v4;
    v5 = objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
      if ((v5 & 1) == 0)
      {
LABEL_8:
        v8 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue");
        v9 = -[STStatusDomainClientHandleWrapper initWithWrappedClientHandle:preferredLocalizations:]([STStatusDomainClientHandleWrapper alloc], "initWithWrappedClientHandle:preferredLocalizations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(void **)(v10 + 40);
        else
          v11 = 0;
        objc_msgSend(v11, "setObject:forKey:", v9, v8);
        objc_msgSend(WeakRetained, "registerClient:forDomain:", v9, v8);

      }
    }
    else
    {
      WeakRetained = 0;
      if ((v5 & 1) == 0)
        goto LABEL_8;
    }

  }
}

- (void)stopObservingDomain:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STStatusDomainXPCClientHandle_stopObservingDomain___block_invoke;
  block[3] = &unk_1E8E17F10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __53__STStatusDomainXPCClientHandle_stopObservingDomain___block_invoke(uint64_t a1)
{
  -[STStatusDomainXPCClientHandle _internalQueue_stopObservingDomain:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)reportUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  if (STIsValidUserInteractionForStatusDomain())
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__STStatusDomainXPCClientHandle_reportUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E8E18198;
    block[4] = self;
    v10 = a4;
    v9 = v6;
    dispatch_async(internalQueue, block);

  }
}

void __65__STStatusDomainXPCClientHandle_reportUserInteraction_forDomain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[6];
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v7 = a1[4];
    if (v7)
      v8 = *(void **)(v7 + 40);
    else
      v8 = 0;
    objc_msgSend(v8, "objectForKey:", a1[6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v12 = v9;
      v10 = a1[4];
      if (v10)
        WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
      else
        WeakRetained = 0;
      objc_msgSend(WeakRetained, "reportUserInteraction:forClient:domain:", a1[5], v12, a1[6]);

      v9 = v12;
    }

  }
}

- (void)serverDataForDomains:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  STStatusDomainXPCClientHandle *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__STStatusDomainXPCClientHandle_serverDataForDomains_reply___block_invoke;
  block[3] = &unk_1E8E188B8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __60__STStatusDomainXPCClientHandle_serverDataForDomains_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      v4 = *(_QWORD *)(v3 + 48);
    else
      v4 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", v4))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
      else
        WeakRetained = 0;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(WeakRetained, "dataForDomain:", objc_msgSend(v12, "unsignedIntegerValue", (_QWORD)v14));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v2, "setObject:forKey:", v13, v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
    else
    {
      v2 = 0;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (NSArray)preferredLocalizations
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *internalQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (!v8 || STIsValidDataForStatusDomain())
  {
    if (v9)
    {
      if (STIsValidDataChangeContextForStatusDomain())
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke;
    v13[3] = &unk_1E8E18170;
    v13[4] = self;
    v16 = a4;
    v14 = v8;
    v9 = v11;
    v15 = v9;
    dispatch_async(internalQueue, v13);

  }
}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t *, void *);
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(_QWORD *, void *);
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[7];
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v8 = a1[4];
    v7 = (void *)a1[5];
    v9 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v28 = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_2;
    v29 = &unk_1E8E188E0;
    v10 = (void *)a1[6];
    v11 = a1[7];
    v30 = v8;
    v32 = v11;
    v31 = v10;
    v20 = v9;
    v21 = 3221225472;
    v22 = __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_3;
    v23 = &unk_1E8E18908;
    v13 = (void *)a1[6];
    v12 = a1[7];
    v24 = a1[4];
    v26 = v12;
    v25 = v13;
    v14 = v7;
    v15 = v27;
    v16 = &v20;
    if (!v8)
    {
LABEL_13:

      return;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 16));
    v17 = *(id *)(v8 + 32);
    objc_msgSend(v17, "objectForKey:", v11, v20, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v17, "setObject:forKey:", v14, v11);

      if (v18)
      {
        objc_msgSend(v14, "diffFromData:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
          v22(v16, v19);

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v17, "removeObjectForKey:", v11);

    }
    v28(v15, v14);
LABEL_12:

    goto LABEL_13;
  }
}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_2(_QWORD *a1, void *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  id v7;

  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  v6 = a2;
  objc_msgSend(v5, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observeData:forDomain:withChangeContext:", v6, a1[6], a1[5]);

}

void __73__STStatusDomainXPCClientHandle_observeData_forDomain_withChangeContext___block_invoke_3(_QWORD *a1, void *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  id v7;

  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  v6 = a2;
  objc_msgSend(v5, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observeDiff:forDomain:withChangeContext:", v6, a1[6], a1[5]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingDomains, 0);
  objc_storeStrong((id *)&self->_entitledDomains, 0);
  objc_storeStrong((id *)&self->_clientHandleWrappersByDomain, 0);
  objc_storeStrong((id *)&self->_dataByDomain, 0);
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
