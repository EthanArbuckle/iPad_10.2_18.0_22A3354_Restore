@implementation MMTConnectionManager

+ (id)sharedInstance
{
  if (qword_100014BB8 != -1)
    dispatch_once(&qword_100014BB8, &stru_100010700);
  return (id)qword_100014BB0;
}

- (MMTConnectionManager)init
{
  MMTConnectionManager *v2;
  uint64_t v3;
  NSMutableSet *activeConnections;
  dispatch_queue_t v5;
  OS_dispatch_queue *connectionQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MMTConnectionManager;
  v2 = -[MMTConnectionManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableSet *)v3;

    v5 = dispatch_queue_create("Connection Manager Queue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)createConnectionForLockdownConnection:(_lockdown_connection *)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  _lockdown_connection *v9;

  v5 = *(NSObject **)DMCLogObjects(self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connecting lockdown connection: %p", buf, 0xCu);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MMTConnectionManager connectionQueue](self, "connectionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004F34;
  v7[3] = &unk_100010728;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);

}

- (void)removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MMTConnectionManager *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v4, "lockdownConnection");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting lockdown connection: %p", buf, 0xCu);

  }
  v7 = objc_claimAutoreleasedReturnValue(-[MMTConnectionManager connectionQueue](self, "connectionQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000050BC;
  v9[3] = &unk_100010750;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnections, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
}

@end
