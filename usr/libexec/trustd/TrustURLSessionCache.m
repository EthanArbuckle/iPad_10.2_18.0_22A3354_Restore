@implementation TrustURLSessionCache

- (id)sessionForAuditToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    objc_msgSend(v8, "removeObject:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    objc_msgSend(v9, "insertObject:atIndex:", v4, 0);
LABEL_5:

    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache createSessionForAuditToken:](self, "createSessionForAuditToken:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  objc_msgSend(v10, "insertObject:atIndex:", v4, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
  objc_msgSend(v11, "setObject:forKey:", v7, v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  v13 = objc_msgSend(v12, "count");

  if ((unint64_t)v13 >= 0x15)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", (char *)objc_msgSend(v15, "count") - 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v9));

    objc_msgSend(v17, "finishTasksAndInvalidate");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
    objc_msgSend(v18, "removeObjectForKey:", v9);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    objc_msgSend(v19, "removeLastObject");

    goto LABEL_5;
  }
LABEL_6:
  v20 = v7;

  objc_sync_exit(v5);
  return v20;
}

- (NSMutableArray)_clientLRUList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)_clientSessionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (id)createSessionForAuditToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  const __CFString *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _sharedHSTSCache](self, "_sharedHSTSCache"));
  objc_msgSend(v5, "set_hstsStorage:", v6);

  objc_msgSend(v5, "setHTTPCookieStorage:", 0);
  objc_msgSend(v5, "setURLCache:", 0);
  v14 = CFSTR("User-Agent");
  v15 = CFSTR("com.apple.trustd/3.0");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v5, "setHTTPAdditionalHeaders:", v7);

  objc_msgSend(v5, "set_sourceApplicationAuditTokenData:", v4);
  objc_msgSend(v5, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.trustd.TrustURLSession"));
  v8 = objc_alloc_init((Class)NSOperationQueue);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
  objc_msgSend(v8, "setUnderlyingQueue:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v5, v11, v8));

  return v12;
}

- (TrustURLSessionDelegate)delegate
{
  return (TrustURLSessionDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (_NSHSTSStorage)_sharedHSTSCache
{
  return (_NSHSTSStorage *)objc_getProperty(self, a2, 32, 1);
}

- (TrustURLSessionCache)initWithDelegate:(id)a3
{
  id v4;
  TrustURLSessionCache *v5;
  TrustURLSessionCache *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TrustURLSessionCache;
  v5 = -[TrustURLSessionCache init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[TrustURLSessionCache setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 20));
    -[TrustURLSessionCache set_clientSessionMap:](v6, "set_clientSessionMap:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 21));
    -[TrustURLSessionCache set_clientLRUList:](v6, "set_clientLRUList:", v8);

    v9 = objc_msgSend(objc_alloc((Class)_NSHSTSStorage), "initInMemoryStore");
    -[TrustURLSessionCache set_sharedHSTSCache:](v6, "set_sharedHSTSCache:", v9);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)set_clientSessionMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)set_clientLRUList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)set_sharedHSTSCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sharedHSTSCache, 0);
  objc_storeStrong((id *)&self->__clientLRUList, 0);
  objc_storeStrong((id *)&self->__clientSessionMap, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
