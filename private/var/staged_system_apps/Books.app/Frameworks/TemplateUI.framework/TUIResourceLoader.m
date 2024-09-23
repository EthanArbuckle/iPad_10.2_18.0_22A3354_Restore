@implementation TUIResourceLoader

+ (void)prewarmOfflineCache
{
  id v2;

  v2 = +[_TUIResourceLoaderOfflineCache sharedOfflineCache](_TUIResourceLoaderOfflineCache, "sharedOfflineCache");
}

+ (void)incrementPostLaunchCacheCount
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_TUIResourceLoaderOfflineCache sharedOfflineCache](_TUIResourceLoaderOfflineCache, "sharedOfflineCache"));
  objc_msgSend(v2, "incrementPostLaunchCacheCount");

}

- (TUIResourceLoader)initWithProtocolClasses:(id)a3
{
  id v4;
  TUIResourceLoader *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSURLCache *v13;
  NSURLCache *urlCache;
  uint64_t v15;
  NSURLSessionConfiguration *sessionConfiguration;
  void *v17;
  id v18;
  uint64_t v19;
  NSURLSession *session;
  objc_super v22;

  v4 = a3;
  kdebug_trace(725408464, 6, 0, 0, 0);
  v22.receiver = self;
  v22.super_class = (Class)TUIResourceLoader;
  v5 = -[TUIResourceLoader init](&v22, "init");
  if (!v5)
    goto LABEL_16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIOfflineCache provider](TUIOfflineCache, "provider"));
  if (!v6)
  {
    v7 = TUIDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_17DBB4(v8);

  }
  if ((objc_msgSend(v6, "runFromCache") & 1) != 0)
  {
    v9 = 33;
LABEL_10:
    *((_BYTE *)&v5->super.isa + v9) = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "generateCache"))
  {
    v9 = 32;
    goto LABEL_10;
  }
LABEL_11:
  if (!v5->_runFromOfflineCache)
  {
    v10 = (objc_class *)objc_opt_class(v5);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (NSURLCache *)objc_msgSend(objc_alloc((Class)NSURLCache), "initWithMemoryCapacity:diskCapacity:diskPath:", 512000, 78643201, v12);
    urlCache = v5->_urlCache;
    v5->_urlCache = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    sessionConfiguration = v5->_sessionConfiguration;
    v5->_sessionConfiguration = (NSURLSessionConfiguration *)v15;

    -[NSURLSessionConfiguration setURLCache:](v5->_sessionConfiguration, "setURLCache:", v5->_urlCache);
    if (objc_msgSend(v4, "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionConfiguration protocolClasses](v5->_sessionConfiguration, "protocolClasses"));
      v18 = objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "addObjectsFromArray:", v4);
      -[NSURLSessionConfiguration setProtocolClasses:](v5->_sessionConfiguration, "setProtocolClasses:", v18);

    }
    v19 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v5->_sessionConfiguration));
    session = v5->_session;
    v5->_session = (NSURLSession *)v19;

  }
LABEL_16:
  kdebug_trace(725408464, 7, 0, 0, 0);

  return v5;
}

- (id)urlCache
{
  void *v2;
  NSURLCache *v3;

  if (self->_runFromOfflineCache)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIResourceLoaderOfflineCache sharedOfflineCache](_TUIResourceLoaderOfflineCache, "sharedOfflineCache"));
    v3 = (NSURLCache *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlCache"));

  }
  else
  {
    v3 = self->_urlCache;
  }
  return v3;
}

- (void)loadResourceWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURLSession *session;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (self->_runFromOfflineCache)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIResourceLoader urlCache](self, "urlCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cachedResponseForRequest:", v8));

    if (v10)
    {
      if (!v7)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      v7[2](v7, v11, 0);
LABEL_14:

      goto LABEL_15;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIResourceLoader _keyForSharedOfflineCacheURL:](self, "_keyForSharedOfflineCacheURL:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIResourceLoaderOfflineCache sharedOfflineCache](_TUIResourceLoaderOfflineCache, "sharedOfflineCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", v11));

    if (v10)
    {
      if (!v7)
        goto LABEL_14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      v7[2](v7, v16, 0);
    }
    else
    {
      if (!v7)
        goto LABEL_14;
      v17 = TUIInstallBundleLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_17DBF4(v6, v18);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TUIErrorDomain"), 401, 0));
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v16);
    }

    goto LABEL_14;
  }
  session = self->_session;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_8C790;
  v19[3] = &unk_240320;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithURL:completionHandler:](session, "dataTaskWithURL:completionHandler:", v20, v19));
  *(float *)&v14 = NSURLSessionTaskPriorityHigh;
  objc_msgSend(v13, "setPriority:", v14);
  objc_msgSend(v13, "resume");

LABEL_16:
}

- (id)resourceLoaderTaskWithURL:(id)a3 priority:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _TUIResourceLoaderTask *v12;
  NSURLSession *session;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIResourceLoader urlCache](self, "urlCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cachedResponseForRequest:", v9));

  if (v11 || self->_runFromOfflineCache)
  {
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    v12 = 0;
  }
  else
  {
    session = self->_session;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_8C96C;
    v16[3] = &unk_240320;
    v16[4] = self;
    v17 = v7;
    v18 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithURL:completionHandler:](session, "dataTaskWithURL:completionHandler:", v17, v16));
    v12 = -[_TUIResourceLoaderTask initWithSessionDataTask:]([_TUIResourceLoaderTask alloc], "initWithSessionDataTask:", v15);

  }
  return v12;
}

- (id)_keyForSharedOfflineCacheURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  if (objc_msgSend(v3, "isFileURL"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathComponents"));
    v7 = (char *)objc_msgSend(v6, "count");
    if ((uint64_t)v7 >= 2)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7 - 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8 - 1));
      v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v9, v10));

      v5 = (void *)v11;
    }

    v4 = v5;
  }

  return v4;
}

- (void)_addURLToOfflineCache:(id)a3 response:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIResourceLoaderOfflineCache sharedOfflineCache](_TUIResourceLoaderOfflineCache, "sharedOfflineCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIResourceLoader _keyForSharedOfflineCacheURL:](self, "_keyForSharedOfflineCacheURL:", v9));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v11));
  v13 = (id)v12;
  if (!v8 || v12)
    goto LABEL_5;
  if (v14)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSCachedURLResponse), "initWithResponse:data:", v14, v8);
    objc_msgSend(v10, "setObject:forKey:", v13, v11);
LABEL_5:

  }
}

- (void)clearCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIResourceLoader urlCache](self, "urlCache"));
  objc_msgSend(v2, "removeAllCachedResponses");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_urlCache, 0);
}

@end
