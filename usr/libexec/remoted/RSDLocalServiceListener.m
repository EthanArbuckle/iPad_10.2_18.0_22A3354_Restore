@implementation RSDLocalServiceListener

- (RSDLocalServiceListener)initWithService:(id)a3 forDevice:(id)a4 withPort:(char *)a5 onSocket:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  RSDLocalServiceListener *v12;
  RSDLocalServiceListener *v13;
  dispatch_source_t v14;
  NSObject *v15;
  RSDLocalServiceListener *v16;
  void *v17;
  RSDLocalServiceListener *v18;
  NSObject *v19;
  RSDLocalServiceListener *v20;
  _QWORD v22[4];
  RSDLocalServiceListener *v23;
  _QWORD handler[4];
  RSDLocalServiceListener *v25;
  id v26;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = -[RSDLocalServiceListener init](self, "init");
  v13 = v12;
  if (v12)
  {
    -[RSDLocalServiceListener setService:](v12, "setService:", v10);
    -[RSDLocalServiceListener setPort:](v13, "setPort:", a5);
    -[RSDLocalServiceListener setSocket:](v13, "setSocket:", v6);
    -[RSDLocalServiceListener setDevice:](v13, "setDevice:", v11);
    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)v6, 0, (dispatch_queue_t)qword_100057CB8);
    -[RSDLocalServiceListener setSocket_source:](v13, "setSocket_source:", v14);

    v15 = objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v13, "socket_source"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005E20;
    handler[3] = &unk_1000510A8;
    v16 = v13;
    v25 = v16;
    v26 = v11;
    dispatch_source_set_event_handler(v15, handler);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v16, "socket_source"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005FD4;
    v22[3] = &unk_1000510D0;
    v18 = v16;
    v23 = v18;
    dispatch_source_set_mandatory_cancel_handler(v17, v22);

    v19 = objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v18, "socket_source"));
    dispatch_activate(v19);

    v20 = v18;
  }

  return v13;
}

- (id)copyServiceDescription
{
  void *v3;
  id v4;
  uint64_t v6;
  _OWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener service](self, "service"));
  v4 = objc_msgSend(v3, "copyServiceDescription");

  if (!v4)
    sub_100031238(&v6, v7);
  xpc_dictionary_set_string(v4, "Port", -[RSDLocalServiceListener port](self, "port"));
  return v4;
}

- (void)cancel
{
  NSObject *v3;

  -[RSDLocalServiceListener setCanceled:](self, "setCanceled:", 1);
  v3 = objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](self, "socket_source"));
  dispatch_source_cancel(v3);

}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  _OWORD v5[5];

  if (!self->_canceled)
    sub_1000312A0(&v4, v5);
  free(self->_port);
  v3.receiver = self;
  v3.super_class = (Class)RSDLocalServiceListener;
  -[RSDLocalServiceListener dealloc](&v3, "dealloc");
}

- (RSDLocalService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (RSDRemoteDevice)device
{
  return (RSDRemoteDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (char)port
{
  return self->_port;
}

- (void)setPort:(char *)a3
{
  self->_port = a3;
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (OS_dispatch_source)socket_source
{
  return self->_socket_source;
}

- (void)setSocket_source:(id)a3
{
  objc_storeStrong((id *)&self->_socket_source, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socket_source, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
