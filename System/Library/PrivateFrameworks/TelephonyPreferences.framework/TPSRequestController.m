@implementation TPSRequestController

- (TPSRequestController)init
{
  TPSRequestController *v2;
  uint64_t v3;
  NSMapTable *delegateToQueue;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *requests;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialDispatchQueue;
  uint64_t v15;
  CoreTelephonyClient *telephonyClient;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TPSRequestController;
  v2 = -[TPSRequestController init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v2->_delegateToQueue;
    v2->_delegateToQueue = (NSMapTable *)v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    requests = v2->_requests;
    v2->_requests = v5;

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "tps_classIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_serialDispatchQueue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
    serialDispatchQueue = v2->_serialDispatchQueue;
    v2->_serialDispatchQueue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_serialDispatchQueue);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v15;

    -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);
  }
  return v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSRequestController_addDelegate_queue___block_invoke;
  block[3] = &unk_1EA2CD990;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __42__TPSRequestController_addDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = MEMORY[0x1E0C80D38];
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TPSRequestController_removeDelegate___block_invoke;
  block[3] = &unk_1EA2CD690;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __39__TPSRequestController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)addRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TPSRequestController_addRequest___block_invoke;
  v7[3] = &unk_1EA2CD690;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __35__TPSRequestController_addRequest___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

- (void)execute
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TPSRequestController pendingRequest](self, "pendingRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[TPSRequestController requests](self, "requests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v7)
    {
      -[TPSRequestController setPendingRequest:](self, "setPendingRequest:", v7);
      -[TPSRequestController requests](self, "requests");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);

      -[TPSRequestController executeRequest:](self, "executeRequest:", v7);
      v4 = v7;
    }
  }

}

- (void)executeRequest:(id)a3
{
  id v4;
  NSObject *v5;
  TPSResponse *v6;
  void *v7;
  TPSResponse *v8;

  v4 = a3;
  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = [TPSResponse alloc];
  objc_msgSend(v4, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TPSResponse initWithSubscriptionContext:error:](v6, "initWithSubscriptionContext:error:", v7, 0);
  -[TPSRequestController postResponse:](self, "postResponse:", v8);

}

- (void)postResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id obj;
  _QWORD block[6];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSRequestController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TPSRequestController delegateToQueue](self, "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        -[TPSRequestController delegateToQueue](self, "delegateToQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __37__TPSRequestController_postResponse___block_invoke;
        block[3] = &unk_1EA2CD990;
        block[4] = v10;
        block[5] = self;
        v19 = v4;
        dispatch_async(v12, block);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[TPSRequestController pendingRequest](self, "pendingRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscriptionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
    -[TPSRequestController setPendingRequest:](self, "setPendingRequest:", 0);
    -[TPSRequestController execute](self, "execute");
  }

}

uint64_t __37__TPSRequestController_postResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "requestController:didReceiveResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (TPSRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequest, a3);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (NSMutableOrderedSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end
