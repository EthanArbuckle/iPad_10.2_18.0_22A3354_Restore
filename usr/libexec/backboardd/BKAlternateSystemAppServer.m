@implementation BKAlternateSystemAppServer

- (BKAlternateSystemAppServer)init
{
  BKAlternateSystemAppServer *v2;
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSXPCConnection *clientConnection;
  void *v6;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKAlternateSystemAppServer;
  v2 = -[BKAlternateSystemAppServer init](&v10, "init");
  if (v2)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.backboard.altsysapp"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    clientConnection = v2->_clientConnection;
    v2->_clientConnection = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKAlternateSystemAppManager sharedInstance](BKAlternateSystemAppManager, "sharedInstance"));
    -[BKAlternateSystemAppServer setAlternateSystemAppManager:](v2, "setAlternateSystemAppManager:", v6);

    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboard.altsysappserver"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKAlternateSystemAppServer;
  -[BKAlternateSystemAppServer dealloc](&v3, "dealloc");
}

- (void)run
{
  -[NSXPCListener resume](self->_xpcListener, "resume");
}

- (void)_handleInterruptedOrInvalidatedConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088160;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_queue_listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  BOOL v15;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _OWORD v26[2];
  uint8_t buf[4];
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "auditToken");
  else
    memset(v26, 0, sizeof(v26));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromAuditToken:](BSAuditToken, "tokenFromAuditToken:", v26));
  v10 = BKReplaceSystemAppEntitlement;
  v11 = objc_msgSend(v9, "hasEntitlement:", BKReplaceSystemAppEntitlement);
  if ((v11 & 1) == 0)
  {
    v14 = ((uint64_t (*)(void))BKLogAlternateSystemApp)();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Server] Entitlement %{public}@ required to open alternate system app.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (self->_clientConnection)
  {
    v12 = BKLogAlternateSystemApp(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Server] Rejecting BKAlternateSystemAppServer connection because we already have one", buf, 2u);
    }
LABEL_11:

    v15 = 0;
    goto LABEL_12;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BKSAlternateSystemAppClientProtocol));
  objc_msgSend(v8, "setRemoteObjectInterface:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BKSAlternateSystemAppServerProtocol));
  objc_msgSend(v8, "setExportedInterface:", v18);

  objc_msgSend(v8, "setExportedObject:", self);
  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100088108;
  v24[3] = &unk_1000EC7B8;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v8, "setInterruptionHandler:", v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100088134;
  v22[3] = &unk_1000EC7B8;
  objc_copyWeak(&v23, (id *)buf);
  objc_msgSend(v8, "setInvalidationHandler:", v22);
  objc_msgSend(v8, "resume");
  v19 = BKLogAlternateSystemApp(-[BKAlternateSystemAppServer setClientConnection:](self, "setClientConnection:", v8));
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Server] Accepted connection request", v21, 2u);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _BYTE *v18;
  _BYTE buf[24];
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = BKLogAlternateSystemApp(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Server] Got a connection request on listener %{public}@: connection %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000880D4;
  v15[3] = &unk_1000EC7E0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = buf;
  v11 = v7;
  v12 = v6;
  dispatch_sync(queue, v15);
  v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)blockSystemAppForAlternateSystemApp
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = BKLogAlternateSystemApp(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Server] Received request to block primary system app for alternate system app", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087FFC;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)unblockSystemAppForAlternateSystemApp
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = BKLogAlternateSystemApp(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Server] Received request to unblock primary system app for alternate system app", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087F0C;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)openAlternateSystemAppWithBundleID:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = BKLogAlternateSystemApp(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Server] Received request to open alternate system app \"%{public}@\", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100087AE4;
  v9[3] = &unk_1000ECD80;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(queue, v9);

}

- (void)terminateAlternateSystemAppWithBundleID:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  BKAlternateSystemAppServer *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = BKLogAlternateSystemApp(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Server] Received request to terminate alternate system app \"%{public}@\", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100087994;
  v9[3] = &unk_1000ECD80;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(queue, v9);

}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setAlternateSystemAppManager:(id)a3
{
  objc_storeStrong((id *)&self->_alternateSystemAppManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateSystemAppManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

+ (id)sharedInstance
{
  if (qword_100117598 != -1)
    dispatch_once(&qword_100117598, &stru_1000EC790);
  return (id)qword_100117590;
}

@end
