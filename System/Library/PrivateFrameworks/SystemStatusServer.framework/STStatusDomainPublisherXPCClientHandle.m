@implementation STStatusDomainPublisherXPCClientHandle

void __79__STStatusDomainPublisherXPCClientHandle_registerToPublishDomain_fallbackData___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  _QWORD *v16;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[6];
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v7 = (_QWORD *)a1[4];
    if (v7)
      v7 = (_QWORD *)v7[8];
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v16, "containsObject:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v10);

      v11 = a1[4];
      if (v11)
        v12 = *(void **)(v11 + 48);
      else
        v12 = 0;
      objc_msgSend(v12, "setObject:forKey:", a1[5], a1[6]);
      v13 = a1[4];
      if (v13)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
        v15 = a1[4];
      }
      else
      {
        v15 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "registerPublisherClient:forDomain:fallbackData:", v15, a1[6], a1[5]);

    }
  }
}

- (void)publishDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 replacingData:(BOOL)a6 discardingOnExit:(BOOL)a7 reply:(id)a8
{
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *internalQueue;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  unint64_t v22;
  BOOL v23;
  BOOL v24;

  v14 = a3;
  v15 = a5;
  v16 = (void (**)(_QWORD))a8;
  if (STIsValidDiffForStatusDomain() && (objc_msgSend(v14, "isEmpty") & 1) == 0)
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke;
    v18[3] = &unk_1E8E18958;
    v18[4] = self;
    v22 = a4;
    v23 = a7;
    v19 = v14;
    v24 = a6;
    v20 = v15;
    v21 = v16;
    dispatch_async(internalQueue, v18);

  }
  else if (v16)
  {
    v16[2](v16);
  }

}

id __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(a1 + 32));
  return *(id *)(a1 + 40);
}

void __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 64);
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (!v7)
      goto LABEL_33;
    if (*(_BYTE *)(a1 + 72))
      v8 = 40;
    else
      v8 = 32;
    v9 = *(_QWORD *)(a1 + 64);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 16));
    objc_msgSend(*(id *)(v7 + v8), "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_12;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 64);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v11 + 16));
      objc_msgSend(*(id *)(v11 + 48), "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_33:
      v13 = 0;
    }
    v28 = (id)objc_msgSend(v13, "mutableCopyWithZone:", 0);

    v10 = v28;
    if (v28)
    {
LABEL_12:
      v29 = v10;
      objc_msgSend(v10, "applyDiff:", *(_QWORD *)(a1 + 40));
      if (*(_BYTE *)(a1 + 73))
      {
        v14 = (void *)objc_msgSend(v29, "copyWithZone:", 0);
        v15 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(a1 + 72))
        {
          if (v15)
          {
            WeakRetained = objc_loadWeakRetained((id *)(v15 + 8));
            v17 = *(_QWORD *)(a1 + 32);
          }
          else
          {
            v17 = 0;
            WeakRetained = 0;
          }
          objc_msgSend(WeakRetained, "publishVolatileData:forPublisherClient:domain:withChangeContext:completion:", v14, v17, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        }
        else
        {
          if (v15)
          {
            WeakRetained = objc_loadWeakRetained((id *)(v15 + 8));
            v24 = *(_QWORD *)(a1 + 32);
          }
          else
          {
            v24 = 0;
            WeakRetained = 0;
          }
          objc_msgSend(WeakRetained, "publishData:forPublisherClient:domain:withChangeContext:completion:", v14, v24, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        }

      }
      else
      {
        v19 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(a1 + 72))
        {
          if (v19)
          {
            v20 = objc_loadWeakRetained((id *)(v19 + 8));
            v21 = *(_QWORD *)(a1 + 32);
          }
          else
          {
            v21 = 0;
            v20 = 0;
          }
          v22 = *(_QWORD *)(a1 + 64);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_2;
          v33[3] = &unk_1E8E18980;
          v34 = *(id *)(a1 + 48);
          v35 = *(id *)(a1 + 40);
          objc_msgSend(v20, "updateVolatileDataForPublisherClient:domain:usingDiffProvider:completion:", v21, v22, v33, *(_QWORD *)(a1 + 56));

          v23 = v34;
        }
        else
        {
          if (v19)
          {
            v25 = objc_loadWeakRetained((id *)(v19 + 8));
            v26 = *(_QWORD *)(a1 + 32);
          }
          else
          {
            v26 = 0;
            v25 = 0;
          }
          v27 = *(_QWORD *)(a1 + 64);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_3;
          v30[3] = &unk_1E8E18980;
          v31 = *(id *)(a1 + 48);
          v32 = *(id *)(a1 + 40);
          objc_msgSend(v25, "updateDataForPublisherClient:domain:usingDiffProvider:completion:", v26, v27, v30, *(_QWORD *)(a1 + 56));

          v23 = v31;
        }

      }
      return;
    }
  }
  v18 = *(_QWORD *)(a1 + 56);
  if (v18)
    (*(void (**)(void))(v18 + 16))();
}

- (void)registerToPublishDomain:(unint64_t)a3 fallbackData:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__STStatusDomainPublisherXPCClientHandle_registerToPublishDomain_fallbackData___block_invoke;
  block[3] = &unk_1E8E18198;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

- (STStatusDomainPublisherXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  STStatusDomainPublisherXPCClientHandle *v11;
  STStatusDomainPublisherXPCClientHandle *v12;
  void *v13;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  BSMutableIntegerMap *v16;
  BSMutableIntegerMap *dataByDomain;
  BSMutableIntegerMap *v18;
  BSMutableIntegerMap *volatileDataByDomain;
  BSMutableIntegerMap *v20;
  BSMutableIntegerMap *fallbackDataByDomain;
  uint64_t v22;
  NSSet *entitledDomains;
  uint64_t v24;
  NSMutableSet *publishingDomains;
  void *v26;
  void *v27;
  uint64_t v28;
  STStatusDomainPublisherXPCClientHandle *v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  objc_super v38;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x1E0DB0E18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  STEntitledDomainsForEntitlementValue(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v38.receiver = self;
    v38.super_class = (Class)STStatusDomainPublisherXPCClientHandle;
    v11 = -[STStatusDomainPublisherXPCClientHandle init](&v38, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_serverHandle, v8);
      v36 = 0u;
      v37 = 0u;
      if (v7)
        objc_msgSend(v7, "auditToken");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.systemstatus.publisherqueue.client-%d"), BSPIDForAuditToken());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      Serial = BSDispatchQueueCreateSerial();
      internalQueue = v12->_internalQueue;
      v12->_internalQueue = (OS_dispatch_queue *)Serial;

      v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      dataByDomain = v12->_dataByDomain;
      v12->_dataByDomain = v16;

      v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      volatileDataByDomain = v12->_volatileDataByDomain;
      v12->_volatileDataByDomain = v18;

      v20 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      fallbackDataByDomain = v12->_fallbackDataByDomain;
      v12->_fallbackDataByDomain = v20;

      v22 = objc_msgSend(v10, "copy");
      entitledDomains = v12->_entitledDomains;
      v12->_entitledDomains = (NSSet *)v22;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v24 = objc_claimAutoreleasedReturnValue();
      publishingDomains = v12->_publishingDomains;
      v12->_publishingDomains = (NSMutableSet *)v24;

      STStatusDomainPublisherXPCClientInterface();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRemoteObjectInterface:", v26);

      STStatusDomainPublisherXPCServerInterface();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v27);

      objc_msgSend(v7, "setExportedObject:", v12);
      objc_initWeak(&location, v12);
      v28 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v33[3] = &unk_1E8E18430;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v7, "setInterruptionHandler:", v33);
      v31[0] = v28;
      v31[1] = 3221225472;
      v31[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3;
      v31[3] = &unk_1E8E18430;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v7, "setInvalidationHandler:", v31);
      objc_storeStrong((id *)&v12->_clientXPCConnection, a3);
      objc_msgSend(v7, "resume");
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    self = v12;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
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
  block[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

uint64_t __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
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

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_3(uint64_t a1)
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
  block[2] = __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4;
  block[3] = &unk_1E8E18478;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

void __77__STStatusDomainPublisherXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_4(uint64_t a1)
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
    v3 = *(void **)(v2 + 64);
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
        -[STStatusDomainPublisherXPCClientHandle _internalQueue_unregisterFromPublishingDomain:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "unsignedIntegerValue", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_internalQueue_unregisterFromPublishingDomain:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;
  id v8;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v8 = *(id *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "containsObject:", v4);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v6);

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "removePublisherClient:forDomain:", a1, a2);

      objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", a2);
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", a2);
    }

  }
}

- (void)unregisterFromPublishingDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__STStatusDomainPublisherXPCClientHandle_unregisterFromPublishingDomain___block_invoke;
  v4[3] = &unk_1E8E18930;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

void __73__STStatusDomainPublisherXPCClientHandle_unregisterFromPublishingDomain___block_invoke(uint64_t a1)
{
  -[STStatusDomainPublisherXPCClientHandle _internalQueue_unregisterFromPublishingDomain:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)publishData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5 discardingOnExit:(BOOL)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  id v16;
  NSObject *internalQueue;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  unint64_t v22;
  BOOL v23;
  BOOL v24;

  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a7;
  if (v12 && !STIsValidDataForStatusDomain())
  {
    if (v14)
      v14[2](v14);
  }
  else
  {
    if (v13)
    {
      if (STIsValidDataChangeContextForStatusDomain())
        v15 = v13;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __105__STStatusDomainPublisherXPCClientHandle_publishData_forDomain_withChangeContext_discardingOnExit_reply___block_invoke;
    v18[3] = &unk_1E8E18958;
    v18[4] = self;
    v22 = a4;
    v23 = a6;
    v24 = v12 == 0;
    v19 = v12;
    v13 = v16;
    v20 = v13;
    v21 = v14;
    dispatch_async(internalQueue, v18);

  }
}

void __105__STStatusDomainPublisherXPCClientHandle_publishData_forDomain_withChangeContext_discardingOnExit_reply___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 64);
  v5 = v2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v7 = *(char **)(a1 + 32);
    if (v7)
    {
      v8 = 40;
      if (!*(_BYTE *)(a1 + 72))
        v8 = 32;
      v7 = *(char **)&v7[v8];
    }
    v9 = v7;
    v16 = v9;
    if (*(_BYTE *)(a1 + 73))
    {
      objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 64));
    }
    else
    {
      v11 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopyWithZone:", 0);
      objc_msgSend(v16, "setObject:forKey:", v11, *(_QWORD *)(a1 + 64));

    }
    v12 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      if (v12)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
        v14 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v14 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "publishVolatileData:forPublisherClient:domain:withChangeContext:completion:", *(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (v12)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
        v15 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v15 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "publishData:forPublisherClient:domain:withChangeContext:completion:", *(_QWORD *)(a1 + 40), v15, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

id __119__STStatusDomainPublisherXPCClientHandle_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply___block_invoke_3(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(a1 + 32));
  return *(id *)(a1 + 40);
}

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
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
    block[2] = __74__STStatusDomainPublisherXPCClientHandle_handleUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E8E18198;
    block[4] = self;
    v9 = v6;
    v10 = a4;
    dispatch_async(internalQueue, block);

  }
}

void __74__STStatusDomainPublisherXPCClientHandle_handleUserInteraction_forDomain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  id v4;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleUserInteraction:forDomain:", a1[5], a1[6]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingDomains, 0);
  objc_storeStrong((id *)&self->_entitledDomains, 0);
  objc_storeStrong((id *)&self->_fallbackDataByDomain, 0);
  objc_storeStrong((id *)&self->_volatileDataByDomain, 0);
  objc_storeStrong((id *)&self->_dataByDomain, 0);
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
