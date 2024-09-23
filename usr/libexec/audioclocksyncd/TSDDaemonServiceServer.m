@implementation TSDDaemonServiceServer

- (TSDDaemonServiceServer)init
{
  TSDDaemonServiceServer *v2;
  NSXPCListener *v3;
  NSXPCListener *listener;
  dispatch_queue_t v5;
  OS_dispatch_queue *connectionsQueue;
  uint64_t v7;
  NSMutableArray *clientConnections;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDDaemonServiceServer;
  v2 = -[TSDDaemonServiceServer init](&v10, "init");
  if (v2)
  {
    if (qword_100047C88 != -1)
      dispatch_once(&qword_100047C88, &stru_10003CD20);
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.timesync.expositor"));
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v5 = dispatch_queue_create("com.apple.timesync.DaemonService.connections", 0);
    connectionsQueue = v2->_connectionsQueue;
    v2->_connectionsQueue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v7;

    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *listener;
  TSDDaemonServiceServerExported *v9;
  void *v10;
  void *v11;
  id v12;
  OS_dispatch_queue *connectionsQueue;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  listener = self->_listener;
  if (listener == v6)
  {
    objc_initWeak(&location, self);
    v9 = objc_alloc_init(TSDDaemonServiceServerExported);
    -[TSDDaemonServiceServerExported setObject:](v9, "setObject:", self);
    -[TSDDaemonServiceServerExported setProcessID:](v9, "setProcessID:", objc_msgSend(v7, "processIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___TSXDaemonServiceClientProtocol));
    objc_msgSend(v7, "setRemoteObjectInterface:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___TSXDaemonServiceServerProtocol));
    objc_msgSend(v7, "setExportedInterface:", v11);

    objc_msgSend(v7, "setExportedObject:", v9);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001D154;
    v18[3] = &unk_10003CD48;
    objc_copyWeak(&v20, &location);
    v12 = v7;
    v19 = v12;
    objc_msgSend(v12, "setInvalidationHandler:", v18);
    connectionsQueue = self->_connectionsQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D3A4;
    v15[3] = &unk_10003CD98;
    v15[4] = self;
    v16 = v12;
    objc_copyWeak(&v17, &location);
    dispatch_sync((dispatch_queue_t)connectionsQueue, v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return listener == v6;
}

- (void)dispatchDaemonServiceCallbackForProcess:(int)a3 clientID:(unsigned int)a4 ioResult:(int)a5 args:(const unint64_t *)a6 numArgs:(unsigned int)a7
{
  OS_dispatch_queue *connectionsQueue;
  _QWORD v8[6];
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  connectionsQueue = self->_connectionsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D69C;
  v8[3] = &unk_10003CDE8;
  v8[4] = self;
  v8[5] = a6;
  v9 = a3;
  v10 = a7;
  v11 = a4;
  v12 = a5;
  dispatch_sync((dispatch_queue_t)connectionsQueue, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepDaemonAlive, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_connectionsQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
