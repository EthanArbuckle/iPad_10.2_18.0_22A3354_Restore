@implementation MNPLockdownConnection

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
}

- (void)dealloc
{
  objc_super v3;

  lockdown_disconnect(self->_conn, a2);
  v3.receiver = self;
  v3.super_class = (Class)MNPLockdownConnection;
  -[MNPLockdownConnection dealloc](&v3, "dealloc");
}

- (MNPLockdownConnection)initWithConnection:(_lockdown_connection *)a3
{
  MNPLockdownConnection *v4;
  uint64_t v5;
  OS_os_transaction *transaction;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  MNPLockdownConnection *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MNPLockdownConnection;
  v4 = -[MNPLockdownConnection init](&v13, "init");
  if (v4)
  {
    v5 = os_transaction_create("com.apple.mobile.notification_proxy");
    transaction = v4->_transaction;
    v4->_transaction = (OS_os_transaction *)v5;

    v4->_conn = a3;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.mobile.notification_proxy_io_queue", v8);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v9;

    v11 = v4;
  }

  return v4;
}

- (void)sendMessage:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003C24;
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
  }

}

- (void)shutdown
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D78;
  block[3] = &unk_100008358;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)listen
{
  id v3;
  int socket;
  int v5;
  NSObject *v6;
  OS_dispatch_source *source;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD handler[5];
  id v12;
  id location;
  uint8_t buf[4];
  int v15;

  objc_initWeak(&location, self);
  v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    socket = lockdown_get_socket(self->_conn);
    *(_DWORD *)buf = 67109120;
    v15 = socket;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Lockdown socket: %d", buf, 8u);
  }

  v5 = lockdown_get_socket(self->_conn);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v5, 0, (dispatch_queue_t)self->_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004044;
  handler[3] = &unk_100008380;
  objc_copyWeak(&v12, &location);
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000045CC;
  v9[3] = &unk_1000083A8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_cancel_handler(v6, v9);
  source = self->_source;
  self->_source = (OS_dispatch_source *)v6;
  v8 = v6;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return (NSString *)CFSTR("Lockdown");
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
  objc_storeStrong((id *)&self->_source, 0);
}

@end
