@implementation RSDRemoteCoreDeviceDevice

- (unint64_t)tlsRequirement
{
  return 1;
}

- (RSDRemoteCoreDeviceDevice)initWithGeneratedName
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
  v4 = dword_1000575D0++;
  snprintf(__str, 0x20uLL, "coredevice-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteCoreDeviceDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteCoreDeviceDevice)initWithClientEndpoint:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 connectTimeout:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  RSDRemoteCoreDeviceDevice *v12;
  RSDRemoteCoreDeviceDevice *v13;
  RSDRemoteCoreDeviceDevice *v14;
  uint64_t v15;
  void *v16;
  char *v17;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = -[RSDRemoteCoreDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  v13 = v12;
  if (!v12)
    goto LABEL_7;
  -[RSDRemoteCoreDeviceDevice setControl_peer:](v12, "setControl_peer:", v11);
  -[RSDRemoteCoreDeviceDevice setClient_endpoint:](v13, "setClient_endpoint:", v10);
  -[RSDRemoteCoreDeviceDevice setIf_name:](v13, "setIf_name:", strdup(a5));
  -[RSDRemoteCoreDeviceDevice setConnect_timeout:](v13, "setConnect_timeout:", v6);
  v14 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](v13, "client_endpoint"));
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice control_peer](v13, "control_peer"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[RSDRemoteCoreDeviceDevice if_name](v13, "if_name");

      if (v17)
      {
        v14 = v13;
        goto LABEL_8;
      }
    }
    else
    {

    }
LABEL_7:
    v14 = 0;
  }
LABEL_8:

  return v14;
}

- (RSDRemoteCoreDeviceDevice)initWithServerListener:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 interfaceIndex:(unsigned int)a6 connectTimeout:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  RSDRemoteCoreDeviceDevice *v14;
  RSDRemoteCoreDeviceDevice *v15;
  RSDRemoteCoreDeviceDevice *v16;
  void *v17;
  unsigned int v18;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = -[RSDRemoteCoreDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  v15 = v14;
  if (!v14)
    goto LABEL_8;
  -[RSDRemoteCoreDeviceDevice setControl_peer:](v14, "setControl_peer:", v13);
  -[RSDRemoteCoreDeviceDevice setServer_listener:](v15, "setServer_listener:", v12);
  -[RSDRemoteCoreDeviceDevice setIf_name:](v15, "setIf_name:", strdup(a5));
  -[RSDRemoteCoreDeviceDevice setIf_index:](v15, "setIf_index:", v8);
  -[RSDRemoteCoreDeviceDevice setConnect_timeout:](v15, "setConnect_timeout:", v7);
  v16 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](v15, "server_listener"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice control_peer](v15, "control_peer"));
    if (v17 && -[RSDRemoteCoreDeviceDevice if_name](v15, "if_name"))
    {
      v18 = -[RSDRemoteCoreDeviceDevice if_index](v15, "if_index");

      if (v18)
      {
        v16 = v15;
        goto LABEL_9;
      }
    }
    else
    {

    }
LABEL_8:
    v16 = 0;
  }
LABEL_9:

  return v16;
}

- (void)attach
{
  objc_super v3;

  -[RSDRemoteDevice setBackendProperty:withString:](self, "setBackendProperty:withString:", "InterfaceName", -[RSDRemoteCoreDeviceDevice if_name](self, "if_name"));
  if (-[RSDRemoteCoreDeviceDevice if_index](self, "if_index"))
    -[RSDRemoteDevice setBackendProperty:withUint:](self, "setBackendProperty:withUint:", "InterfaceIndex", -[RSDRemoteCoreDeviceDevice if_index](self, "if_index"));
  objc_msgSend((id)qword_100057C80, "addObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice disconnect](&v5, "disconnect");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));
    nw_connection_cancel(v4);

    -[RSDRemoteCoreDeviceDevice setClient_connection:](self, "setClient_connection:", 0);
  }
  objc_msgSend((id)qword_100057C80, "removeObject:", self);
}

- (void)cancelListener
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
    nw_listener_cancel(v4);

    -[RSDRemoteCoreDeviceDevice setServer_listener:](self, "setServer_listener:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
    nw_listener_cancel(v4);

  }
  free(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"));
  -[RSDRemoteCoreDeviceDevice setIf_name:](self, "setIf_name:", 0);
  -[RSDRemoteCoreDeviceDevice setControl_peer:](self, "setControl_peer:", 0);
  -[RSDRemoteCoreDeviceDevice setClient_endpoint:](self, "setClient_endpoint:", 0);
  -[RSDRemoteCoreDeviceDevice setServer_listener:](self, "setServer_listener:", 0);
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice dealloc](&v5, "dealloc");
}

- (void)connected
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  v4 = (void *)xpc_remote_connection_copy_remote_endpoint();
  -[RSDRemoteCoreDeviceDevice setAddress_endpoint:](self, "setAddress_endpoint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice address_endpoint](self, "address_endpoint"));
  if (!v5)
  {
    v6 = sub_10000326C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100030A70();

  }
}

- (void)needsConnect
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  nw_connection_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t failsafe_version_flags;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  int v23;
  RSDRemoteCoreDeviceDevice *v24;

  v3 = sub_10000326C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v23, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));

    v7 = sub_10000326C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        v23 = 138543362;
        v24 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> server using established client connection", (uint8_t *)&v23, 0xCu);
      }

      v10 = (nw_connection_t)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));
      v11 = -[RSDRemoteCoreDeviceDevice setClient_connection:](self, "setClient_connection:", 0);
      v12 = 1;
      if (v10)
      {
LABEL_8:
        v13 = qword_100057C88;
        failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v11);
        v15 = xpc_remote_connection_create_with_nw_connection(v10, v13, failsafe_version_flags, v12);
LABEL_16:
        -[RSDRemoteDevice connect:](self, "connect:", v15);

LABEL_17:
        return;
      }
LABEL_15:
      v15 = 0;
      goto LABEL_16;
    }
    if (v9)
    {
      v23 = 138543362;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> server waiting for connection from client", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));

    v17 = sub_10000326C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v8 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138543362;
        v24 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> client connecting to remote remoted", (uint8_t *)&v23, 0xCu);
      }

      v23 = 0;
      v19 = sub_100003584(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"), 2, &v23);
      v15 = objc_claimAutoreleasedReturnValue(v19);
      if (!v15 || !v23)
      {
        v21 = sub_10000326C();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_100030AC8();

        goto LABEL_17;
      }
      -[RSDRemoteCoreDeviceDevice setIf_index:](self, "setIf_index:");
      v20 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));
      v10 = nw_connection_create(v20, v15);

      v12 = 2;
      if (v10)
        goto LABEL_8;
      goto LABEL_15;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_100030A9C();
  }

}

- (unsigned)type
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));

  if (v2)
    return 10;
  else
    return 13;
}

- (const)local_address
{
  in6_addr *p_local_address_storage;
  id v3;
  NSObject *v4;

  p_local_address_storage = &self->local_address_storage;
  if (!self->local_address_storage.__u6_addr32[0]
    && !self->local_address_storage.__u6_addr32[1]
    && !self->local_address_storage.__u6_addr32[2]
    && !self->local_address_storage.__u6_addr32[3]
    && sub_10001DF14(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"), p_local_address_storage, 0))
  {
    v3 = sub_10000326C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100030BD0();

  }
  return p_local_address_storage;
}

- (const)remote_address
{
  NSObject *v2;
  const sockaddr *address;

  v2 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice address_endpoint](self, "address_endpoint"));
  address = nw_endpoint_get_address(v2);

  return (const in6_addr *)&address->sa_data[6];
}

- (OS_xpc_object)control_peer
{
  return self->_control_peer;
}

- (void)setControl_peer:(id)a3
{
  objc_storeStrong((id *)&self->_control_peer, a3);
}

- (OS_nw_endpoint)address_endpoint
{
  return self->_address_endpoint;
}

- (void)setAddress_endpoint:(id)a3
{
  objc_storeStrong((id *)&self->_address_endpoint, a3);
}

- (OS_nw_endpoint)client_endpoint
{
  return self->_client_endpoint;
}

- (void)setClient_endpoint:(id)a3
{
  objc_storeStrong((id *)&self->_client_endpoint, a3);
}

- (OS_nw_listener)server_listener
{
  return self->_server_listener;
}

- (void)setServer_listener:(id)a3
{
  objc_storeStrong((id *)&self->_server_listener, a3);
}

- (unsigned)connect_timeout
{
  return self->_connect_timeout;
}

- (void)setConnect_timeout:(unsigned int)a3
{
  self->_connect_timeout = a3;
}

- (char)if_name
{
  return self->_if_name;
}

- (void)setIf_name:(char *)a3
{
  self->_if_name = a3;
}

- (unsigned)if_index
{
  return self->_if_index;
}

- (void)setIf_index:(unsigned int)a3
{
  self->_if_index = a3;
}

- (OS_nw_connection)client_connection
{
  return self->_client_connection;
}

- (void)setClient_connection:(id)a3
{
  objc_storeStrong((id *)&self->_client_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client_connection, 0);
  objc_storeStrong((id *)&self->_server_listener, 0);
  objc_storeStrong((id *)&self->_client_endpoint, 0);
  objc_storeStrong((id *)&self->_address_endpoint, 0);
  objc_storeStrong((id *)&self->_control_peer, 0);
}

@end
