@implementation PFDUrlSchemeHandler

- (PFDUrlSchemeHandler)init
{
  PFDUrlSchemeHandler *v2;
  uint64_t v3;
  NSMapTable *urlHandlerToTaskMap;
  uint64_t v5;
  NSMapTable *taskToURLHandlerMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFDUrlSchemeHandler;
  v2 = -[PFDUrlSchemeHandler init](&v8, "init");
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

- (PFDUrlSchemeHandler)initWithRequestScope:(id)a3
{
  id v5;
  PFDUrlSchemeHandler *v6;
  PFDUrlSchemeHandler *v7;

  v5 = a3;
  v6 = -[PFDUrlSchemeHandler init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestScope, a3);

  return v7;
}

- (NSArray)supportedSchemes
{
  return +[PFDUrlHandler supportedSchemes](PFDUrlHandler, "supportedSchemes");
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PFDUrlHandler *v9;
  void *v10;
  PFDUrlHandler *v11;
  PFDUrlHandler *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  PFDUrlHandler *v17;

  v5 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDUrlSchemeHandler webView:startURLSchemeTask:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDUrlSchemeHandler.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 62, CFSTR("This operation must only be performed on the main thread."));

  }
  v9 = [PFDUrlHandler alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PFDUrlSchemeHandler requestScope](self, "requestScope"));
  v11 = -[PFDUrlHandler initWithQueueMode:requestScope:](v9, "initWithQueueMode:requestScope:", 1, v10);

  -[PFDUrlHandler setDelegate:](v11, "setDelegate:", self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1F0680;
  v15[3] = &unk_429250;
  v15[4] = self;
  v16 = v5;
  v17 = v11;
  v12 = v11;
  v13 = v5;
  -[PFDUrlSchemeHandler _executeBlockWithLock:](self, "_executeBlockWithLock:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "request"));
  -[PFDUrlHandler loadRequest:](v12, "loadRequest:", v14);

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
  v14 = sub_1F07D8;
  v15 = sub_1F07E8;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1F07F0;
  v8[3] = &unk_42C150;
  v8[4] = self;
  v10 = &v11;
  v7 = a4;
  v9 = v7;
  -[PFDUrlSchemeHandler _executeBlockWithLock:](self, "_executeBlockWithLock:", v8);
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
  block[2] = sub_1F0920;
  block[3] = &unk_429250;
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
  block[2] = sub_1F0A0C;
  block[3] = &unk_429250;
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
  v4[2] = sub_1F0ACC;
  v4[3] = &unk_426D80;
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
  block[2] = sub_1F0BBC;
  block[3] = &unk_429250;
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
  id v4;
  _QWORD v6[4];
  PFDUrlSchemeHandler *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1F07D8;
  v14 = sub_1F07E8;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1F0CF4;
  v6[3] = &unk_42C178;
  v9 = &v10;
  v7 = self;
  v3 = a3;
  v8 = v3;
  -[PFDUrlSchemeHandler _executeBlockWithLock:](v7, "_executeBlockWithLock:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)_removeTaskForHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  PFDUrlSchemeHandler *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1F0DC4;
  v4[3] = &unk_426D80;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[PFDUrlSchemeHandler _executeBlockWithLock:](v5, "_executeBlockWithLock:", v4);

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

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
  objc_storeStrong((id *)&self->_requestScope, a3);
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
  objc_storeStrong((id *)&self->_requestScope, 0);
}

@end
