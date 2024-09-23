@implementation ASKResourceLoader

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingOperations;
  NSMapTable *v5;
  NSMapTable *requestsByCacheKey;

  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  pendingOperations = self->_pendingOperations;
  self->_pendingOperations = v3;

  v5 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  requestsByCacheKey = self->_requestsByCacheKey;
  self->_requestsByCacheKey = v5;

}

- (ASKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  ASKResourceLoader *v14;
  ASKResourceLoader *v15;
  NSCache *v16;
  NSCache *cachedResources;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASKResourceLoader;
  v14 = -[ASKResourceLoader init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestQueue, a3);
    objc_storeStrong((id *)&v15->_accessQueue, a4);
    objc_storeStrong((id *)&v15->_notificationQueue, a5);
    v16 = (NSCache *)objc_alloc_init((Class)NSCache);
    cachedResources = v15->_cachedResources;
    v15->_cachedResources = v16;

    -[NSCache setCountLimit:](v15->_cachedResources, "setCountLimit:", a6);
    -[ASKResourceLoader _commonInit](v15, "_commonInit");
  }

  return v15;
}

- (ASKResourceLoader)initWithParentResourceLoader:(id)a3
{
  id v4;
  ASKResourceLoader *v5;
  uint64_t v6;
  NSOperationQueue *requestQueue;
  uint64_t v8;
  NSOperationQueue *accessQueue;
  uint64_t v10;
  NSOperationQueue *notificationQueue;
  uint64_t v12;
  NSCache *cachedResources;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASKResourceLoader;
  v5 = -[ASKResourceLoader init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestQueue"));
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (NSOperationQueue *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessQueue"));
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (NSOperationQueue *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationQueue"));
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (NSOperationQueue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedResources"));
    cachedResources = v5->_cachedResources;
    v5->_cachedResources = (NSCache *)v12;

    -[ASKResourceLoader _commonInit](v5, "_commonInit");
    v5->_isInBackground = 1;
  }

  return v5;
}

- (ASKResourceLoader)init
{
  -[ASKResourceLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[ASKResourceLoader cancelAllRequests](self, "cancelAllRequests");
  v3.receiver = self;
  v3.super_class = (Class)ASKResourceLoader;
  -[ASKResourceLoader dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestQueue](self, "requestQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader accessQueue](self, "accessQueue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader notificationQueue](self, "notificationQueue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ASKResourceLoader isInBackground](self, "isInBackground")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}"), self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p requestQueue = %@, accessQueue = %@, notificationQueue = %@, isInBackground = %@, loadCounts = %@>"), v5, self, v6, v7, v8, v9, v10));

  return v11;
}

- (void)addResource:(id)a3 forCacheKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader cachedResources](self, "cachedResources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v6));

  }
  else
  {
    v12 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader cachedResources](self, "cachedResources"));
  objc_msgSend(v11, "setObject:forKey:", v10, v7);

}

- (id)cachedResourcesForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader cachedResources](self, "cachedResources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)removeAllCachedResources
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader cachedResources](self, "cachedResources"));
  objc_msgSend(v2, "removeAllObjects");

}

- (id)requestKeyForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)cancelAllRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "cancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey"));
  objc_msgSend(v6, "removeAllObjects");

  if (self->_requestCountMap[2] >= 1)
    self->_requestCountMap[2] = 0;
  if (self->_requestCountMap[1] >= 1)
    self->_requestCountMap[1] = 0;
  if (self->_requestCountMap[0] >= 1)
    self->_requestCountMap[0] = 0;
}

- (void)cancelRequestForCacheKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestKeyForCacheKey:](self, "requestKeyForCacheKey:"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

    if (v6)
    {
      objc_msgSend(v6, "cancel");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
      objc_msgSend(v7, "removeObjectForKey:", v4);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey"));
      objc_msgSend(v8, "removeObjectForKey:", v11);

      v9 = objc_msgSend(v6, "_loadReason");
      v10 = self->_requestCountMap[(_QWORD)v9];
      if (v10 >= 1)
        self->_requestCountMap[(_QWORD)v9] = --v10;
      if (!v10)
        -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v9);
    }

  }
}

- (void)enterBackground
{
  if (!self->_isInBackground)
  {
    self->_isInBackground = 1;
    -[ASKResourceLoader reprioritizeOperations](self, "reprioritizeOperations");
  }
}

- (void)enterForeground
{
  if (self->_isInBackground)
  {
    self->_isInBackground = 0;
    -[ASKResourceLoader reprioritizeOperations](self, "reprioritizeOperations");
  }
}

- (BOOL)isIdle
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return self->_requestCountMap[a3] == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    v10 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v11 = 4 * a4;
    if ((unint64_t)a4 >= 3)
      v11 = 4;
    v12 = -8;
    if (a4 == 1)
      v12 = -4;
    if (a4 == 2)
      v12 = 0;
    if (v10)
      v13 = v12;
    else
      v13 = v11;
    if (v13 > (uint64_t)objc_msgSend(v9, "queuePriority"))
    {
      -[ASKResourceLoader updateLoadReason:forOperation:](self, "updateLoadReason:forOperation:", a4, v9);
      objc_msgSend(v9, "setQueuePriority:", v13);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeLoadOperation"));
    objc_msgSend(v14, "_setLoadReason:", a4);
    objc_msgSend(v14, "setQualityOfService:", -[ASKResourceLoader currentQualityOfService](self, "currentQualityOfService"));
    v15 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v16 = 4 * a4;
    if ((unint64_t)a4 >= 3)
      v16 = 4;
    v17 = -8;
    if (a4 == 1)
      v17 = -4;
    if (a4 == 2)
      v17 = 0;
    if (v15)
      v18 = v17;
    else
      v18 = v16;
    objc_msgSend(v14, "setQueuePriority:", v18);
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v25[3] = &unk_372798;
    objc_copyWeak(&v27, &location);
    v19 = v6;
    v26 = v19;
    objc_msgSend(v14, "setOutputBlock:", v25);
    -[ASKResourceLoader postDidBeginLoadingIfIdle](self, "postDidBeginLoadingIfIdle");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v7);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cacheKey"));
    objc_msgSend(v21, "setObject:forKey:", v7, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestQueue](self, "requestQueue"));
    objc_msgSend(v23, "addOperation:", v14);

    ++self->_requestCountMap[a4];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v9 == 0;
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "accessQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v11[3] = &unk_372770;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

  objc_destroyWeak(&v15);
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "finishLoadForRequest:withResource:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    -[ASKResourceLoader updateLoadReason:forOperation:](self, "updateLoadReason:forOperation:", a3, v8);
    v9 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v10 = 4 * a3;
    if ((unint64_t)a3 >= 3)
      v10 = 4;
    v11 = -8;
    if (a3 == 1)
      v11 = -4;
    if (a3 == 2)
      v11 = 0;
    if (v9)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v8, "setQueuePriority:", v12);
  }

  return v8 != 0;
}

- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cacheKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));

  v15 = objc_msgSend(v14, "_loadReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations"));
  objc_msgSend(v16, "removeObjectForKey:", v11);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey"));
  objc_msgSend(v17, "removeObjectForKey:", v12);

  if (v9)
  {
    v18 = objc_msgSend(v8, "cacheOptions");
    if ((v18 & 2) != 0)
    {
      if ((v18 & 4) != 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader cachedResources](self, "cachedResources"));
        v22 = v9;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
        objc_msgSend(v19, "setObject:forKey:", v20, v12);

      }
      else
      {
        -[ASKResourceLoader addResource:forCacheKey:](self, "addResource:forCacheKey:", v9, v12);
      }
    }
  }
  objc_msgSend(v8, "didLoadResource:error:", v9, v10);
  v21 = self->_requestCountMap[(_QWORD)v15];
  if (v21 >= 1)
    self->_requestCountMap[(_QWORD)v15] = --v21;
  if (!v21)
    -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v15);
  -[ASKResourceLoader postDidIdleIfIdle](self, "postDidIdleIfIdle");

}

- (int64_t)currentQualityOfService
{
  if (-[ASKResourceLoader isInBackground](self, "isInBackground"))
    return 9;
  else
    return 25;
}

- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = objc_msgSend(v9, "_loadReason");
  v7 = v9;
  if (v6 != (id)a3)
  {
    objc_msgSend(v9, "_setLoadReason:", a3);
    ++self->_requestCountMap[a3];
    v8 = self->_requestCountMap[(_QWORD)v6];
    if (v8 >= 1)
      self->_requestCountMap[(_QWORD)v6] = --v8;
    v7 = v9;
    if (!v8)
    {
      -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v6);
      v7 = v9;
    }
  }

}

- (void)reprioritizeOperations
{
  int64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = -[ASKResourceLoader currentQualityOfService](self, "currentQualityOfService");
  v4 = -[ASKResourceLoader isInBackground](self, "isInBackground");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader pendingOperations](self, "pendingOperations", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (unint64_t)objc_msgSend(v11, "_loadReason");
        if (v4)
        {
          if (v12 == 1)
            v13 = -4;
          else
            v13 = -8;
          if (v12 == 2)
            v14 = 0;
          else
            v14 = v13;
        }
        else if (v12 >= 3)
        {
          v14 = 4;
        }
        else
        {
          v14 = 4 * v12;
        }
        objc_msgSend(v11, "setQueuePriority:", v14);
        objc_msgSend(v11, "setQualityOfService:", v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)postDidBeginLoadingIfIdle
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ASKResourceLoader isIdle](self, "isIdle"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader notificationQueue](self, "notificationQueue"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke;
    v4[3] = &unk_3727C0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "addOperationWithBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKResourceLoaderDidBeginLoadingNotification"), WeakRetained);

  }
}

- (void)postDidIdleIfIdle
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ASKResourceLoader isIdle](self, "isIdle"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader notificationQueue](self, "notificationQueue"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke;
    v4[3] = &unk_3727C0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "addOperationWithBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKResourceLoaderDidIdleNotification"), WeakRetained);

  }
}

- (void)postDidLoadAllForReason:(int64_t)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceLoader notificationQueue](self, "notificationQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke;
  v6[3] = &unk_3727E8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = CFSTR("ASKResourceLoaderLoadReasonUserInfoKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ASKResourceLoaderDidLoadAllForReasonNotification"), WeakRetained, v5);

  }
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMapTable)requestsByCacheKey
{
  return self->_requestsByCacheKey;
}

- (NSCache)cachedResources
{
  return self->_cachedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
