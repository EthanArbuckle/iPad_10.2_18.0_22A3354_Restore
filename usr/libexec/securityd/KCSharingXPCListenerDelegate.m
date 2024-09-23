@implementation KCSharingXPCListenerDelegate

- (KCSharingXPCListenerDelegate)init
{
  id v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  KCSharingXPCListenerDelegate *v11;

  v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.security.kcsharing"));
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, -1);
  v7 = objc_claimAutoreleasedReturnValue(v6);

  v8 = dispatch_queue_create("com.apple.KCSharingXPCListenerDelegate.clientConnections", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingDaemonGroupManager sharedInstance](KCSharingDaemonGroupManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingSyncController sharedInstance](KCSharingSyncController, "sharedInstance"));
  v11 = -[KCSharingXPCListenerDelegate initWithListener:queue:daemonGroupManager:syncController:entitlementBearer:](self, "initWithListener:queue:daemonGroupManager:syncController:entitlementBearer:", v3, v8, v9, v10, 0);

  return v11;
}

- (KCSharingXPCListenerDelegate)initWithListener:(id)a3 queue:(id)a4 daemonGroupManager:(id)a5 syncController:(id)a6 entitlementBearer:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  KCSharingXPCListenerDelegate *v20;
  KCSharingXPCListenerDelegate *v21;
  uint64_t v22;
  NSMutableArray *clientConnections;
  objc_super v25;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = KCSharingLogObject(CFSTR("KCSharingXPCListenerDelegate"));
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "initing KCSharingXPCListenerDelegate", buf, 2u);
  }

  v25.receiver = self;
  v25.super_class = (Class)KCSharingXPCListenerDelegate;
  v20 = -[KCSharingXPCListenerDelegate init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_listener, a3);
    objc_storeStrong((id *)&v21->_connectionQueue, a4);
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    clientConnections = v21->_clientConnections;
    v21->_clientConnections = (NSMutableArray *)v22;

    objc_storeWeak((id *)&v21->_groupManager, v15);
    objc_storeWeak((id *)&v21->_syncController, v16);
    objc_storeStrong((id *)&v21->_entitlementBearer, a7);
    -[NSXPCListener setDelegate:](v21->_listener, "setDelegate:", v21);
    -[NSXPCListener _setQueue:](v21->_listener, "_setQueue:", v21->_connectionQueue);
    -[NSXPCListener resume](v21->_listener, "resume");
  }

  return v21;
}

- (id)allowedProtocolForEntitlementBearer:(id)a3
{
  id v3;
  __objc2_prot **v4;
  __objc2_prot *v5;

  v3 = a3;
  if ((sub_1001B05AC(v3, (uint64_t)CFSTR("com.apple.private.keychain.kcsharing.client")) & 1) != 0)
  {
    v4 = &protocolRef_KCSharingXPCServerProtocol;
  }
  else
  {
    if (!sub_1001B05AC(v3, (uint64_t)CFSTR("com.apple.private.keychain.kcsharing.invitation.notifier")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = &protocolRef_KCSharingInvitationNotificationProtocol;
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  Protocol *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  KCSharingXPCServer *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  _BYTE buf[12];
  __int16 v34;
  void *v35;

  v25 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate entitlementBearer](self, "entitlementBearer"));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  v11 = (Protocol *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate allowedProtocolForEntitlementBearer:](self, "allowedProtocolForEntitlementBearer:", v10));
  v12 = KCSharingLogObject(CFSTR("KCSharingXPCListenerDelegate"));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Rejected connection %{public}@ lacks entitlement", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromProtocol(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    v34 = 2114;
    v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepted connection %{public}@, allowed protocol %{public}@", buf, 0x16u);

  }
  v17 = [KCSharingXPCServer alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate groupManager](self, "groupManager", v25));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate syncController](self, "syncController"));
  v14 = -[KCSharingXPCServer initWithConnection:allowedProtocol:groupManager:syncController:](v17, "initWithConnection:allowedProtocol:groupManager:syncController:", v6, v11, v18, v19);

  if (!v14)
  {
    v22 = KCSharingLogObject(CFSTR("KCSharingXPCListenerDelegate"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to init KCSharingXPCServer for connection %{public}@", buf, 0xCu);
    }

    v14 = 0;
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v14);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001B050C;
  v29[3] = &unk_1002EABA8;
  objc_copyWeak(&v30, (id *)buf);
  objc_copyWeak(&v31, &location);
  objc_msgSend(v6, "setInterruptionHandler:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001B055C;
  v26[3] = &unk_1002EABA8;
  objc_copyWeak(&v27, (id *)buf);
  objc_copyWeak(&v28, &location);
  objc_msgSend(v6, "setInvalidationHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate connectionQueue](self, "connectionQueue"));
  objc_msgSend(v6, "_setQueue:", v20);

  objc_msgSend(v6, "resume");
  -[NSMutableArray addObject:](self->_clientConnections, "addObject:", v14);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
  v21 = 1;
LABEL_15:

  return v21;
}

- (void)connectionWasInterrupted:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)connectionWasInvalidated:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSMutableArray *clientConnections;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "connection invalidated %@", buf, 0xCu);
  }

  clientConnections = self->_clientConnections;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B0500;
  v10[3] = &unk_1002EABD0;
  v8 = v4;
  v11 = v8;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](clientConnections, "indexOfObjectPassingTest:", v10);
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_clientConnections, "removeObjectAtIndex:", v9);

}

- (void)groupsUpdated
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B0378;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)accountChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KCSharingXPCListenerDelegate connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B01F0;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (KCSharingDaemonGroupManager)groupManager
{
  return (KCSharingDaemonGroupManager *)objc_loadWeakRetained((id *)&self->_groupManager);
}

- (void)setGroupManager:(id)a3
{
  objc_storeWeak((id *)&self->_groupManager, a3);
}

- (KCSharingSyncController)syncController
{
  return (KCSharingSyncController *)objc_loadWeakRetained((id *)&self->_syncController);
}

- (void)setSyncController:(id)a3
{
  objc_storeWeak((id *)&self->_syncController, a3);
}

- (KCSharingEntitlementBearerProtocol)entitlementBearer
{
  return self->_entitlementBearer;
}

- (void)setEntitlementBearer:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementBearer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementBearer, 0);
  objc_destroyWeak((id *)&self->_syncController);
  objc_destroyWeak((id *)&self->_groupManager);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (KCSharingXPCListenerDelegate)sharedInstance
{
  if (qword_1003414B0 != -1)
    dispatch_once(&qword_1003414B0, &stru_1002EAB80);
  return (KCSharingXPCListenerDelegate *)(id)qword_1003414B8;
}

@end
