@implementation MNPRemoteServiceConnection

- (void)cancel
{
  xpc_remote_connection_cancel(self->_conn, a2);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MNPRemoteServiceConnection;
  -[MNPRemoteServiceConnection dealloc](&v2, "dealloc");
}

- (MNPRemoteServiceConnection)initWithConnection:(id)a3
{
  id v5;
  MNPRemoteServiceConnection *v6;
  uint64_t v7;
  OS_os_transaction *transaction;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  MNPRemoteServiceConnection *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNPRemoteServiceConnection;
  v6 = -[MNPRemoteServiceConnection init](&v13, "init");
  if (v6)
  {
    v7 = os_transaction_create("com.apple.mobile.notification_proxy");
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v7;

    objc_storeStrong((id *)&v6->_conn, a3);
    v9 = dispatch_queue_create("com.apple.mobile.notification_proxy_io_queue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    xpc_remote_connection_set_target_queue(v6->_conn, v6->_queue);
    v11 = v6;
  }

  return v6;
}

- (void)sendMessage:(id)a3
{
  void *v4;
  void *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3, a2);
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000048AC;
    v8[3] = &unk_100008330;
    v8[4] = self;
    v9 = v4;
    dispatch_async((dispatch_queue_t)queue, v8);

  }
  else
  {
    v7 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to convert dictionary to XPC message.", buf, 2u);
    }
  }

}

- (void)shutdown
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  -[MNPRemoteServiceConnection sendMessage:](self, "sendMessage:", &off_100008828);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004924;
  block[3] = &unk_100008358;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)listen
{
  OS_xpc_remote_connection *conn;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  conn = self->_conn;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000049F0;
  v4[3] = &unk_1000083D0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  xpc_remote_connection_set_event_handler(conn, v4);
  xpc_remote_connection_activate(self->_conn);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return (NSString *)CFSTR("RemoteXPC");
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
