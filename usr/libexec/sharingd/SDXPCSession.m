@implementation SDXPCSession

+ (id)sharedSession
{
  if (qword_1007C6908 != -1)
    dispatch_once(&qword_1007C6908, &stru_100717548);
  return (id)qword_1007C6900;
}

- (SDXPCSession)init
{
  SDXPCSession *v2;
  SDXPCSession *v3;
  NSXPCListener *xpcManagerListener;
  NSMutableArray *v5;
  NSMutableArray *connections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDXPCSession;
  v2 = -[SDXPCSession init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    xpcManagerListener = v2->_xpcManagerListener;
    v2->_xpcManagerListener = 0;

    v5 = objc_opt_new(NSMutableArray);
    connections = v3->_connections;
    v3->_connections = v5;

  }
  return v3;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  NSXPCListener *v5;
  NSXPCListener *xpcManagerListener;

  v3 = daemon_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000EE224(v4);

  if (!self->_xpcManagerListener)
  {
    v5 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.sharingd.nsxpc"));
    xpcManagerListener = self->_xpcManagerListener;
    self->_xpcManagerListener = v5;

    -[NSXPCListener _setQueue:](self->_xpcManagerListener, "_setQueue:", &_dispatch_main_q);
    -[NSXPCListener setDelegate:](self->_xpcManagerListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcManagerListener, "resume");
  }
}

- (void)stop
{
  NSXPCListener *xpcManagerListener;
  NSXPCListener *v4;

  xpcManagerListener = self->_xpcManagerListener;
  if (xpcManagerListener)
  {
    -[NSXPCListener invalidate](xpcManagerListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_xpcManagerListener, "setDelegate:", 0);
    v4 = self->_xpcManagerListener;
    self->_xpcManagerListener = 0;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  SDConnectionManager *v6;

  v5 = a4;
  v6 = -[SDConnectionManager initWithXPCConnection:]([SDConnectionManager alloc], "initWithXPCConnection:", v5);

  -[NSMutableArray addObject:](self->_connections, "addObject:", v6);
  -[SDConnectionManager setDelegate:](v6, "setDelegate:", self);
  -[SDConnectionManager start](v6, "start");

  return 1;
}

- (void)connectionManagerDidInvalidate:(id)a3
{
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", a3);
}

- (NSXPCListener)xpcManagerListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcManagerListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_xpcManagerListener, 0);
}

@end
