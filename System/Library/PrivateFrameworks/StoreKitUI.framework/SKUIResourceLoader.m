@implementation SKUIResourceLoader

- (SKUIResourceLoader)initWithOperationQueue:(id)a3
{
  return -[SKUIResourceLoader initWithOperationQueue:clientContext:](self, "initWithOperationQueue:clientContext:", a3, 0);
}

- (SKUIResourceLoader)initWithClientContext:(id)a3
{
  id v4;
  void *v5;
  SKUIResourceLoader *v6;

  v4 = a3;
  objc_msgSend(v4, "resourceLoadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](self, "initWithOperationQueue:clientContext:", v5, v4);

  return v6;
}

- (SKUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIResourceLoader *v17;
  SKUIResourceLoader *v18;
  NSOperationQueue *v19;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v21;
  NSMutableDictionary *operationsByRequestID;
  uint64_t v23;
  NSMapTable *requestsByCacheKey;
  NSCache *v25;
  NSCache *resourcesByRequestID;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        -[SKUIResourceLoader initWithOperationQueue:clientContext:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIResourceLoader;
  v17 = -[SKUIResourceLoader init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientContext, a4);
    if (v7)
    {
      objc_storeStrong((id *)&v18->_operationQueue, a3);
    }
    else
    {
      v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = v18->_operationQueue;
      v18->_operationQueue = v19;

      -[NSOperationQueue setName:](v18->_operationQueue, "setName:", CFSTR("com.apple.StoreKitUI.SKUIResourceLoader.queueFor28304306Fix"));
      -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_operationQueue, "setMaxConcurrentOperationCount:", 8);
    }
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    operationsByRequestID = v18->_operationsByRequestID;
    v18->_operationsByRequestID = v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    requestsByCacheKey = v18->_requestsByCacheKey;
    v18->_requestsByCacheKey = (NSMapTable *)v23;

    v25 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    resourcesByRequestID = v18->_resourcesByRequestID;
    v18->_resourcesByRequestID = v25;

    -[NSCache setCountLimit:](v18->_resourcesByRequestID, "setCountLimit:", 750);
    -[NSCache setDelegate:](v18->_resourcesByRequestID, "setDelegate:", v18);
  }

  return v18;
}

- (SKUIResourceLoader)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKUIResourceLoader must be initialized with an operation queue"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache setDelegate:](self->_resourcesByRequestID, "setDelegate:", 0);
  -[SKUIResourceLoader cancelAllRequests](self, "cancelAllRequests");
  v3.receiver = self;
  v3.super_class = (Class)SKUIResourceLoader;
  -[SKUIResourceLoader dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 inBackground;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIResourceLoader name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIResourceLoader operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  inBackground = self->_inBackground;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIResourceLoader description].cold.1();
  }
  if (inBackground)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, 1);
  v12 = SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, 0);
  objc_msgSend(v10, "stringWithFormat:", CFSTR("{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}"), v11, v12, SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, -1));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; name = %@; operationQueue = %@; inBackground = %@; loadCounts = %@>"),
    v5,
    self,
    v6,
    v7,
    v9,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (void)addResource:(id)a3 forRequestIdentifier:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  NSCache *resourcesByRequestID;
  _SKUIResourceCacheValue *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithUnsignedInteger:", a4);
  resourcesByRequestID = self->_resourcesByRequestID;
  v9 = -[_SKUIResourceCacheValue initWithResource:requestCacheKey:]([_SKUIResourceCacheValue alloc], "initWithResource:requestCacheKey:", v7, 0);

  -[NSCache setObject:forKey:](resourcesByRequestID, "setObject:forKey:", v9, v10);
}

- (id)cachedResourceForRequestIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  -[NSCache objectForKey:](self->_resourcesByRequestID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAllCachedResources
{
  -[NSCache removeAllObjects](self->_resourcesByRequestID, "removeAllObjects");
}

- (void)cancelAllRequests
{
  void *v3;

  -[NSMutableDictionary allValues](self->_operationsByRequestID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

  -[NSMutableDictionary removeAllObjects](self->_operationsByRequestID, "removeAllObjects");
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, 1))
    -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", 1);
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, 0))
    -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", 0);
  if (SKUIResourceLoadCountMapClear((uint64_t)self->_requestCountMap, -1))
    -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", -1);
}

- (void)cancelRequestWithIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cancel");
    -[NSMutableDictionary removeObjectForKey:](self->_operationsByRequestID, "removeObjectForKey:", v7);
    v6 = objc_msgSend(v5, "_loadReason");
    if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v6))
      -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v6);
  }

}

- (void)enterBackground
{
  if (!self->_inBackground)
  {
    self->_inBackground = 1;
    -[SKUIResourceLoader _reprioritizeOperations](self, "_reprioritizeOperations");
  }
}

- (void)enterForeground
{
  if (self->_inBackground)
  {
    self->_inBackground = 0;
    -[SKUIResourceLoader _reprioritizeOperations](self, "_reprioritizeOperations");
  }
}

- (NSOperationQueue)delegateQueue
{
  NSOperationQueue *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    return delegateQueue;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  return (NSOperationQueue *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isIdle
{
  return -[NSMutableDictionary count](self->_operationsByRequestID, "count") == 0;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return SKUIResourceLoadCountMapGet((uint64_t)self->_requestCountMap, a3) == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v6, "requestIdentifier"));
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SKUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4);
    if (v9 > objc_msgSend(v8, "queuePriority"))
    {
      -[SKUIResourceLoader _updateLoadReason:forOperation:](self, "_updateLoadReason:forOperation:", a4, v8);
      objc_msgSend(v8, "setQueuePriority:", v9);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(v6, "newLoadOperation");
    objc_msgSend(v10, "setClientContext:", self->_clientContext);
    objc_msgSend(v10, "_setLoadReason:", a4);
    objc_msgSend(v10, "setQualityOfService:", -[SKUIResourceLoader _qualityOfService](self, "_qualityOfService"));
    objc_msgSend(v10, "setQueuePriority:", -[SKUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4));
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v14[3] = &unk_1E73A3620;
    objc_copyWeak(&v16, &location);
    v11 = v6;
    v15 = v11;
    objc_msgSend(v10, "setOutputBlock:", v14);
    -[SKUIResourceLoader _sendDidBeginLoadingIfNecessary](self, "_sendDidBeginLoadingIfNecessary");
    objc_msgSend(v11, "cacheKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMapTable setObject:forKey:](self->_requestsByCacheKey, "setObject:forKey:", v7, v12);
    -[NSMutableDictionary setObject:forKey:](self->_operationsByRequestID, "setObject:forKey:", v10, v7);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);
    SKUIResourceLoadCountMapIncrement((uint64_t)self->_requestCountMap, a4);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v8 == 0;
}

void __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v10[3] = &unk_1E73A1D50;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = *(id *)(a1 + 32);
  v9 = v5;
  v12 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v13);
}

void __53__SKUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishLoadForRequest:withResource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)requestIdentifierForCacheKey:(id)a3
{
  return -[NSMapTable objectForKey:](self->_requestsByCacheKey, "objectForKey:", a3);
}

- (BOOL)trySetReason:(int64_t)a3 forRequestWithIdentifier:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKUIResourceLoader _updateLoadReason:forOperation:](self, "_updateLoadReason:forOperation:", a3, v7);
    objc_msgSend(v7, "setQueuePriority:", -[SKUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a3));
  }

  return v7 != 0;
}

- (int64_t)resourceCacheLimit
{
  return -[NSCache countLimit](self->_resourcesByRequestID, "countLimit");
}

- (void)setResourceCacheLimit:(int64_t)a3
{
  -[NSCache setCountLimit:](self->_resourcesByRequestID, "setCountLimit:", a3);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  void *v5;
  NSMapTable *requestsByCacheKey;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "requestCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    requestsByCacheKey = self->_requestsByCacheKey;
    objc_msgSend(v8, "requestCacheKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](requestsByCacheKey, "removeObjectForKey:", v7);

  }
}

- (int64_t)_queuePriorityForLoadReason:(int64_t)a3
{
  int64_t v3;
  int64_t v4;

  v3 = 4;
  if ((unint64_t)(a3 + 1) < 3)
    v3 = 4 * (a3 + 1);
  v4 = -8;
  if (!a3)
    v4 = -4;
  if (a3 == 1)
    v4 = 0;
  if (self->_inBackground)
    return v4;
  else
    return v3;
}

- (int64_t)_qualityOfService
{
  if (self->_inBackground)
    return 9;
  else
    return 25;
}

- (void)_updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = objc_msgSend(v8, "_loadReason");
  if (v6 != a3)
  {
    v7 = v6;
    objc_msgSend(v8, "_setLoadReason:", a3);
    SKUIResourceLoadCountMapIncrement((uint64_t)self->_requestCountMap, a3);
    if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v7))
      -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v7);
  }

}

- (void)_reprioritizeOperations
{
  NSMutableDictionary *operationsByRequestID;
  _QWORD v3[5];

  operationsByRequestID = self->_operationsByRequestID;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__SKUIResourceLoader__reprioritizeOperations__block_invoke;
  v3[3] = &unk_1E73A3648;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](operationsByRequestID, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __45__SKUIResourceLoader__reprioritizeOperations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "setQueuePriority:", objc_msgSend(v4, "_queuePriorityForLoadReason:", objc_msgSend(v5, "_loadReason")));
  objc_msgSend(v5, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "_qualityOfService"));

}

- (void)_finishLoadForRequest:(id)a3 withResource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSCache *resourcesByRequestID;
  _SKUIResourceCacheValue *v11;
  void *v12;
  _SKUIResourceCacheValue *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_loadReason");
  -[NSMutableDictionary removeObjectForKey:](self->_operationsByRequestID, "removeObjectForKey:", v7);
  if (v6)
  {
    if (objc_msgSend(v15, "cachesInMemory"))
    {
      resourcesByRequestID = self->_resourcesByRequestID;
      v11 = [_SKUIResourceCacheValue alloc];
      objc_msgSend(v15, "cacheKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SKUIResourceCacheValue initWithResource:requestCacheKey:](v11, "initWithResource:requestCacheKey:", v6, v12);
      -[NSCache setObject:forKey:](resourcesByRequestID, "setObject:forKey:", v13, v7);

    }
    objc_msgSend(v15, "finishWithResource:", v6);
  }
  else
  {
    objc_msgSend(v15, "cacheKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[NSMapTable removeObjectForKey:](self->_requestsByCacheKey, "removeObjectForKey:", v14);

  }
  if (!SKUIResourceLoadCountMapDecrement((uint64_t)self->_requestCountMap, v9))
    -[SKUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v9);
  -[SKUIResourceLoader _sendDidIdleIfNecessary](self, "_sendDidIdleIfNecessary");

}

- (void)_sendDidBeginLoadingIfNecessary
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  if (-[SKUIResourceLoader isIdle](self, "isIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKUIResourceLoaderDidBeginLoadingNotification"), self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "resourceLoaderDidBeginLoading:", self);

    }
  }
}

- (void)_sendDidIdleIfNecessary
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  if (-[SKUIResourceLoader isIdle](self, "isIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKUIResourceLoaderDidIdleNotification"), self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "resourceLoaderDidIdle:", self);

    }
  }
}

- (void)_sendDidLoadAllForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("SKUIResourceLoaderLoadReasonUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SKUIResourceLoaderDidLoadAllForReasonNotification"), self, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "resourceLoader:didLoadAllForReason:", self, a3);

  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SKUIResourceLoaderDelegate)delegate
{
  return (SKUIResourceLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_resourcesByRequestID, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_operationsByRequestID, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithOperationQueue:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)description
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIResourceLoadCountMapGetDescription";
  OUTLINED_FUNCTION_1();
}

@end
