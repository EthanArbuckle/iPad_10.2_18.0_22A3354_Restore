@implementation SDXPCDaemon

- (SDXPCDaemon)init
{
  SDXPCDaemon *v2;
  uint64_t v3;
  SDXPCDaemon *v4;
  uint64_t v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDXPCDaemon;
  v2 = -[SDXPCDaemon init](&v9, "init");
  v4 = v2;
  if (v2)
  {
    v5 = SFMainQueue(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

  }
  return v4;
}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  SDXPCDaemon *v4;
  SEL v5;
  id v6;
  objc_super v7;

  if (-[NSSet count](self->_activeConnections, "count"))
  {
    v4 = (SDXPCDaemon *)FatalErrorF("Connections still active during dealloc");
    -[SDXPCDaemon setDispatchQueue:](v4, v5, v6);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    v7.receiver = self;
    v7.super_class = (Class)SDXPCDaemon;
    -[SDXPCDaemon dealloc](&v7, "dealloc");
  }
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  SDXPCDaemon *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF("Attempt to set dispatch queue after activate has been called", v5);
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021C9EC;
  v7[3] = &unk_100714F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)onqueue_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;
  _QWORD v13[4];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = (void (**)(id, void *, _BYTE *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activateCalled)
    FatalErrorF("Attempt to enqueue XPC block before activate has been called");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      location = 0;
      objc_initWeak(&location, v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10021CBEC;
      v13[3] = &unk_100718A78;
      objc_copyWeak(&v14, &location);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13));
      v12 = 0;
      v4[2](v4, v10, &v12);
      v11 = v12 == 0;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      if (!v11)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (void)remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021CCF4;
  block[3] = &unk_100714F68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)onqueue_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  location = 0;
  objc_initWeak(&location, v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10021CDFC;
  v9[3] = &unk_100718A78;
  objc_copyWeak(&v10, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9));
  v7[2](v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)dispatch_queue_get_specific((dispatch_queue_t)self->_dispatchQueue, "SDXPCDaemonConnection");
}

- (void)_activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021CEC4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_activate
{
  _BOOL4 activateCalled;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSXPCListener *v11;
  NSXPCListener *xpcListener;
  int v13;
  void *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  activateCalled = self->_activateCalled;
  v5 = daemon_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (activateCalled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10021DCD8(v7);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon machServiceName](self, "machServiceName"));
      v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v13, 0xCu);

    }
    self->_activateCalled = 1;
    v9 = objc_alloc((Class)NSXPCListener);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon machServiceName](self, "machServiceName"));
    v11 = (NSXPCListener *)objc_msgSend(v9, "initWithMachServiceName:", v10);
    xpcListener = self->_xpcListener;
    self->_xpcListener = v11;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
}

- (void)_invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D074;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_invalidate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "invalidate");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    self->_invalidateDone = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _BYTE buf[12];
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = -[SDXPCDaemon shouldAcceptNewConnection:](self, "shouldAcceptNewConnection:", v7);
  v9 = daemon_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sd_description"));
    v12 = (void *)v11;
    v13 = "no";
    if (v8)
      v13 = "yes";
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    v24 = 2080;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection from %@ accepted %s", buf, 0x16u);

  }
  if (v8)
  {
    objc_msgSend(v7, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setExportedObject:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon exportedInterface](self, "exportedInterface"));
    objc_msgSend(v7, "setExportedInterface:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon remoteObjectInterface](self, "remoteObjectInterface"));
    objc_msgSend(v7, "setRemoteObjectInterface:", v15);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    location = 0;
    objc_initWeak(&location, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10021D454;
    v19[3] = &unk_100718ED8;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v19);
    objc_msgSend(v7, "resume");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v16));

    objc_msgSend(v17, "addObject:", v7);
    -[SDXPCDaemon setActiveConnections:](self, "setActiveConnections:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)onqueue_connectionInvalidated:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = daemon_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated", (uint8_t *)&v11, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v4);
  -[SDXPCDaemon setActiveConnections:](self, "setActiveConnections:", v10);
  -[SDXPCDaemon connectionInvalidated:](self, "connectionInvalidated:", v4);

}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SDXPCDaemon *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "retainArguments");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D668;
  block[3] = &unk_100715138;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  NSObject *dispatchQueue;
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  dispatchQueue = self->_dispatchQueue;
  v5 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v5[2](v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon currentConnection](self, "currentConnection"));
  v7 = daemon_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sd_description"));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "New connection established to %@", (uint8_t *)&v10, 0xCu);

  }
  -[SDXPCDaemon connectionEstablished:](self, "connectionEstablished:", v6);

}

- (NSString)machServiceName
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v5, v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (NSXPCInterface)exportedInterface
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v5, v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (NSXPCInterface)remoteObjectInterface
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v5, v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v8, v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (void)connectionEstablished:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v8, v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (void)connectionInvalidated:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override %@"), v8, v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (NSSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
