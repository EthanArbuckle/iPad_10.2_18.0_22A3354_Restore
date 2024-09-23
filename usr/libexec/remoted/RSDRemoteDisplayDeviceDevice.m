@implementation RSDRemoteDisplayDeviceDevice

- (unsigned)type
{
  return 12;
}

- (RSDRemoteDisplayDeviceDevice)initWithGeneratedName
{
  __int128 v3;
  int v4;
  objc_super v6;
  char __str[16];
  __int128 v8;

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  v8 = v3;
  v4 = dword_1000575F0++;
  snprintf(__str, 0x20uLL, "displayhost-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteDisplayDeviceDevice)initWithInterface:(id)a3
{
  id v4;
  RSDRemoteDisplayDeviceDevice *v5;
  RSDRemoteDisplayDeviceDevice *v6;
  RSDRemoteDisplayDeviceDevice *v7;

  v4 = a3;
  v5 = -[RSDRemoteDisplayDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  v6 = v5;
  if (v5)
  {
    -[RSDRemoteNCMDevice setInterface:](v5, "setInterface:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)attach
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
  -[RSDRemoteDisplayDeviceDevice createPortListener](self, "createPortListener");
}

- (void)disconnect
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  RSDRemoteDisplayDeviceDevice *v7;

  v3 = qword_100057EC8;
  if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  if (self->listener_source)
  {
    v4 = qword_100057EC8;
    if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling port listener", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->listener_source);
  }
  if (self->reestablished_connection)
    xpc_remote_connection_cancel();
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  -[RSDRemoteDevice disconnect](&v5, "disconnect");
}

- (void)needsConnect
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  OS_xpc_remote_connection *reestablished_connection;
  OS_xpc_remote_connection *v8;
  int v9;
  RSDRemoteDisplayDeviceDevice *v10;

  v3 = qword_100057EC8;
  if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v9, 0xCu);
  }
  if (self->reestablished_connection)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    v5 = qword_100057EC8;
    v6 = os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for current connection to invalidate before applying reestablished connection", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Applying re-established connection", (uint8_t *)&v9, 0xCu);
      }
      reestablished_connection = self->reestablished_connection;
      self->reestablished_connection = 0;
      v8 = reestablished_connection;

      -[RSDRemoteDevice connect:](self, "connect:", v8);
    }
  }
}

- (void)createPortListener
{
  NSObject *v3;
  in6_addr *v4;
  void *v5;
  int v6;
  NSObject *v7;
  dispatch_time_t v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *listener_source;
  NSObject *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  _QWORD v14[4];
  int v15;
  _QWORD handler[5];
  int v17;
  _QWORD block[5];
  int v19;
  __int16 v20;
  uint8_t buf[4];
  RSDRemoteDisplayDeviceDevice *v22;

  v3 = qword_100057EC8;
  if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener start", buf, 0xCu);
  }
  v20 = -6753;
  v19 = -1;
  v4 = -[RSDRemoteNCMDevice local_address](self, "local_address");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v6 = sub_10001DB04(&v19, (__n128 *)v4, &v20, (int)objc_msgSend(v5, "index"), (uint64_t)&unk_1000410BC);

  if (v6)
  {
    v7 = qword_100057EC8;
    if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_ERROR))
      sub_10003A1C0((uint64_t)self, v6, v7);
    v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025284;
    block[3] = &unk_1000510D0;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)qword_100057ED0, block);
  }
  else
  {
    v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v19, 0, (dispatch_queue_t)qword_100057ED0);
    listener_source = self->listener_source;
    self->listener_source = v9;

    v11 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000252C0;
    handler[3] = &unk_1000514D0;
    v17 = v19;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    v12 = self->listener_source;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000254B8;
    v14[3] = &unk_1000514F0;
    v15 = v19;
    dispatch_source_set_mandatory_cancel_handler(v12, v14);
    dispatch_activate((dispatch_object_t)self->listener_source);
    v13 = qword_100057EC8;
    if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener done", buf, 0xCu);
    }
  }
}

- (BOOL)connectable
{
  objc_super v3;

  if (self->_suspended)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  RSDRemoteDisplayDeviceDevice *v8;

  if (self->_suspended != a3)
  {
    v3 = a3;
    v5 = qword_100057EC8;
    v6 = os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        v7 = 138543362;
        v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Suspending", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        v7 = 138543362;
        v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Resuming", (uint8_t *)&v7, 0xCu);
      }
      -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
    }
    self->_suspended = v3;
  }
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener_source, 0);
  objc_storeStrong((id *)&self->bonjour_listener, 0);
  objc_storeStrong((id *)&self->reestablished_connection, 0);
}

@end
