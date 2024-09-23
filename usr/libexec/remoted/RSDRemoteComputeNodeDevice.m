@implementation RSDRemoteComputeNodeDevice

- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerSocket:(int)a4
{
  id v7;
  RSDRemoteComputeNodeDevice *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  RSDRemoteComputeNodeDevice *v18;

  v7 = a3;
  if ((a4 & 0x80000000) == 0)
  {
    v8 = -[RSDRemoteDevice initWithName:](self, "initWithName:", "cctrl");
    self = v8;
    if (v8)
    {
      v9 = sub_10001E1B8(a4, v8->remote_address_storage.__u6_addr8);
      if (!(_DWORD)v9)
      {
        objc_storeStrong((id *)&self->_interface, a3);
        self->peerfd = a4;
        self = self;
        v18 = self;
        goto LABEL_7;
      }
      v10 = v9;
      v11 = qword_100057D88;
      if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
        sub_1000364C8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (RSDRemoteComputeNodeDevice)initWithInterface:(id)a3 peerConnection:(id)a4 endpoint:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  RSDRemoteComputeNodeDevice *v12;
  RSDRemoteComputeNodeDevice *v13;
  RSDRemoteComputeNodeDevice *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[RSDRemoteDevice initWithName:](self, "initWithName:", "cctrl");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->peer_connection, a4);
    v13->peerfd = -1;
    v13->remote_address_storage = *(in6_addr *)&nw_endpoint_get_address(v11)->sa_data[6];
    v14 = v13;
  }

  return v13;
}

- (void)replacePeerSocket:(int)a3
{
  void *v4;
  void *v5;

  if ((a3 & 0x80000000) == 0)
  {
    self->peerfd = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      xpc_remote_connection_cancel(v5);

      -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
    }
    else
    {
      -[RSDRemoteComputeNodeDevice needsConnect](self, "needsConnect");
    }
  }
}

- (void)replacePeerConnection:(id)a3
{
  void *v4;
  void *v5;

  objc_storeStrong((id *)&self->peer_connection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v5);

    -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
  }
  else
  {
    -[RSDRemoteComputeNodeDevice needsConnect](self, "needsConnect");
  }
}

- (unsigned)type
{
  return 15;
}

- (unsigned)interface_index
{
  return -[RSDNetworkInterface index](self->_interface, "index");
}

- (const)local_address
{
  return -[RSDNetworkInterface local_address](self->_interface, "local_address");
}

- (const)remote_address
{
  return &self->remote_address_storage;
}

- (void)attach
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RSDRemoteComputeNodeDevice;
  -[RSDRemoteDevice attach](&v2, "attach");
}

- (void)disconnect
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RSDRemoteComputeNodeDevice;
  -[RSDRemoteDevice disconnect](&v2, "disconnect");
}

+ (id)tlsOidsRequiredOfPeer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", &off_100052F38));
  if (sub_100015BA4())
    objc_msgSend(v2, "addObject:", CFSTR("1.2.840.113635.100.6.85"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (void)needsConnect
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  RSDRemoteComputeNodeDevice *v6;

  v3 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016998;
  v4[3] = &unk_1000510D0;
  v4[4] = self;
  sub_100019018(&off_100052F50, v4);
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->peer_connection, 0);
  objc_storeStrong((id *)&self->address_endpoint, 0);
}

@end
