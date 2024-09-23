@implementation BEURLSchemeHandler

- (BEURLSchemeHandler)init
{
  BEURLSchemeHandler *v2;
  uint64_t v3;
  NSMapTable *urlHandlerToTaskMap;
  uint64_t v5;
  NSMapTable *taskToURLHandlerMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BEURLSchemeHandler;
  v2 = -[BEURLSchemeHandler init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    urlHandlerToTaskMap = v2->_urlHandlerToTaskMap;
    v2->_urlHandlerToTaskMap = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    taskToURLHandlerMap = v2->_taskToURLHandlerMap;
    v2->_taskToURLHandlerMap = (NSMapTable *)v5;

    v2->_accessLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)schemeHandlerForCacheItem:(id)a3
{
  id v3;
  BEURLSchemeHandler *v4;

  v3 = a3;
  v4 = objc_alloc_init(BEURLSchemeHandler);
  -[BEURLSchemeHandler setCacheItem:](v4, "setCacheItem:", v3);

  return v4;
}

- (NSArray)supportedSchemes
{
  return +[BEURLHandler supportedSchemes](BEURLHandler, "supportedSchemes");
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  BEURLHandler *v6;
  void *v7;
  BEURLHandler *v8;
  BEURLHandler *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BEURLHandler *v14;

  v5 = a4;
  v6 = [BEURLHandler alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEURLSchemeHandler cacheItem](self, "cacheItem"));
  v8 = -[BEURLHandler initWithQueueMode:cacheItem:](v6, "initWithQueueMode:cacheItem:", 1, v7);

  -[BEURLHandler setDelegate:](v8, "setDelegate:", self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_296CC;
  v12[3] = &unk_3777B8;
  v12[4] = self;
  v13 = v5;
  v14 = v8;
  v9 = v8;
  v10 = v5;
  -[BEURLSchemeHandler _executeBlockWithLock:](self, "_executeBlockWithLock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));
  -[BEURLHandler loadRequest:](v9, "loadRequest:", v11);

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_29824;
  v15 = sub_29834;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2983C;
  v8[3] = &unk_3784E8;
  v8[4] = self;
  v10 = &v11;
  v7 = a4;
  v9 = v7;
  -[BEURLSchemeHandler _executeBlockWithLock:](self, "_executeBlockWithLock:", v8);
  objc_msgSend((id)v12[5], "stopLoading");

  _Block_object_dispose(&v11, 8);
}

- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2996C;
  block[3] = &unk_3777B8;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)urlHandler:(id)a3 didReceiveData:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29A58;
  block[3] = &unk_3777B8;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)urlHandlerDidFinish:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_29B18;
  v4[3] = &unk_377928;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)urlHandler:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29C08;
  block[3] = &unk_3777B8;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_taskForHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  BEURLSchemeHandler *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_29824;
  v17 = sub_29834;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_29DD4;
  v9[3] = &unk_377790;
  v12 = &v13;
  v10 = self;
  v3 = a3;
  v11 = v3;
  -[BEURLSchemeHandler _executeBlockWithLock:](v10, "_executeBlockWithLock:", v9);
  v4 = (void *)v14[5];
  if (!v4)
  {
    v5 = _BookEPUBLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
    }

    v4 = (void *)v14[5];
  }
  v7 = v4;

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)_removeTaskForHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  BEURLSchemeHandler *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_29EA4;
  v4[3] = &unk_377928;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BEURLSchemeHandler _executeBlockWithLock:](v5, "_executeBlockWithLock:", v4);

}

- (void)_executeBlockWithLock:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_accessLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
  objc_storeStrong((id *)&self->_cacheItem, a3);
}

- (NSMapTable)urlHandlerToTaskMap
{
  return self->_urlHandlerToTaskMap;
}

- (void)setUrlHandlerToTaskMap:(id)a3
{
  objc_storeStrong((id *)&self->_urlHandlerToTaskMap, a3);
}

- (NSMapTable)taskToURLHandlerMap
{
  return self->_taskToURLHandlerMap;
}

- (void)setTaskToURLHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_taskToURLHandlerMap, a3);
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToURLHandlerMap, 0);
  objc_storeStrong((id *)&self->_urlHandlerToTaskMap, 0);
  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end
