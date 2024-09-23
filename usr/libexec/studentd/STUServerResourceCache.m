@implementation STUServerResourceCache

+ (id)makeStoreWithDirectoryURL:(id)a3
{
  id v3;
  STUSpringBoardFileCacheBackedKeyedDataStore *v4;

  v3 = a3;
  v4 = -[STUSpringBoardFileCacheBackedKeyedDataStore initWithDirectoryURL:maximumTotalFileSize:maximumTotalFileCount:]([STUSpringBoardFileCacheBackedKeyedDataStore alloc], "initWithDirectoryURL:maximumTotalFileSize:maximumTotalFileCount:", v3, 104857600, 200);

  return v4;
}

- (STUServerResourceCache)initWithConfigurationManager:(id)a3
{
  id v5;
  STUServerResourceCache *v6;
  STUServerResourceCache *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURLSession *session;
  void *v12;
  id v13;
  uint64_t v14;
  CRKKeyedDataStoreProtocol *store;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STUServerResourceCache;
  v6 = -[STUServerResourceCache init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationManager, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    objc_msgSend(v8, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(v8, "setTimeoutIntervalForRequest:", 300.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v8, v7, v9));
    session = v7->_session;
    v7->_session = (NSURLSession *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager resourceCacheDirectoryURL](NSFileManager, "resourceCacheDirectoryURL"));
    v13 = objc_msgSend((id)objc_opt_class(v7), "makeStoreWithDirectoryURL:", v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    store = v7->_store;
    v7->_store = (CRKKeyedDataStoreProtocol *)v14;

  }
  return v7;
}

- (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(id, void *, _QWORD);

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v22 = NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUServerResourceCache.m"), 76, CFSTR("%@ must be called from the main thread"), v23);

    if (v8)
      goto LABEL_3;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUServerResourceCache.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  -[STUServerResourceCache updateCredential](self, "updateCredential");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache credential](self, "credential"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache cachedImageDataForURL:](self, "cachedImageDataForURL:", v7));
    if (v10)
    {
      v8[2](v8, v10, 0);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v7));
      objc_msgSend(v13, "setAttribution:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache session](self, "session"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10005D840;
      v25[3] = &unk_1000CB7D0;
      v25[4] = self;
      v15 = v7;
      v26 = v15;
      v27 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "downloadTaskWithRequest:completionHandler:", v13, v25));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
      objc_msgSend(v16, "setTaskDescription:", v17);

      objc_msgSend(v16, "resume");
      v18 = sub_10005D85C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10007D24C((uint64_t)v15, v19, v20);

    }
  }
  else
  {
    v11 = CRKErrorWithCodeAndUserInfo(8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v12);

  }
}

- (void)removeAllCachedResources
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUServerResourceCache.m"), 113, CFSTR("%@ must be called from the main thread"), v13);

  }
  v4 = sub_10005D85C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10007D344(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache store](self, "store"));
  v14 = 0;
  v7 = objc_msgSend(v6, "removeAllDataWithError:", &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    v9 = sub_10005D85C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10007D2B8(v8, v10);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache credential](self, "credential"));
  (*((void (**)(id, _QWORD, id))a6 + 2))(v8, 0, v9);

}

- (void)downloadTaskForURL:(id)a3 didFinishWithLocation:(id)a4 response:(id)a5 error:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, id);
  void *v18;
  NSString *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD, id))a7;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v16)
    {
LABEL_3:
      v17[2](v17, 0, v16);

      goto LABEL_11;
    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUServerResourceCache.m"), 137, CFSTR("%@ must be called from the main thread"), v20);

    if (v16)
      goto LABEL_3;
  }
  v21 = objc_msgSend(v15, "statusCode");
  if (v21 == (id)200)
  {
    v25 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v14, 0, &v25));
    v23 = v25;
    if (v22)
    {
      -[STUServerResourceCache setCachedImageData:forURL:](self, "setCachedImageData:forURL:", v22, v13);
      ((void (**)(id, void *, id))v17)[2](v17, v22, 0);
    }
    else
    {
      v17[2](v17, 0, v23);
    }

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HTTP"), v21, 0));
    v17[2](v17, 0, v24);

  }
LABEL_11:

}

- (id)cachedImageDataForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache keyForURL:](self, "keyForURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache store](self, "store"));
  v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataForKey:error:", v5, &v15));
  v8 = v15;

  if (v7)
  {
    v9 = sub_10005D85C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Resource cache hit %{public}@", buf, 0xCu);
    }

    v11 = v7;
  }
  else if (v8)
  {
    v12 = sub_10005D85C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007D384((uint64_t)v4, v8);

  }
  return v7;
}

- (void)setCachedImageData:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache keyForURL:](self, "keyForURL:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache store](self, "store"));
  v14 = 0;
  v10 = objc_msgSend(v9, "setData:forKey:error:", v7, v8, &v14);

  v11 = v14;
  if ((v10 & 1) == 0)
  {
    v12 = sub_10005D85C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007D408((uint64_t)v6, v11);

  }
}

- (id)keyForURL:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_sha1Hash"));

  return v4;
}

- (void)updateCredential
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache configurationManager](self, "configurationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resourceIdentity"));

  v5 = objc_claimAutoreleasedReturnValue(-[STUServerResourceCache credential](self, "credential"));
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUServerResourceCache resourceIdentity](self, "resourceIdentity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fingerprint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "certificate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fingerprint"));
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_11:
    -[STUServerResourceCache setCredential:](self, "setCredential:", 0);
    -[STUServerResourceCache setResourceIdentity:](self, "setResourceIdentity:", v4);
    if (v4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "certificate"));
      v14 = v13;
      if (v13)
      {
        v18 = objc_msgSend(objc_retainAutorelease(v13), "underlyingCertificate");
        v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithIdentity:certificates:persistence:](NSURLCredential, "credentialWithIdentity:certificates:persistence:", objc_msgSend(objc_retainAutorelease(v4), "underlyingIdentity"), v15, 0));
          -[STUServerResourceCache setCredential:](self, "setCredential:", v17);

        }
      }

    }
  }

}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NSURLSession)session
{
  return self->_session;
}

- (CRKKeyedDataStoreProtocol)store
{
  return self->_store;
}

- (CRKIdentity)resourceIdentity
{
  return self->_resourceIdentity;
}

- (void)setResourceIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_resourceIdentity, a3);
}

- (NSURLCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_resourceIdentity, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
