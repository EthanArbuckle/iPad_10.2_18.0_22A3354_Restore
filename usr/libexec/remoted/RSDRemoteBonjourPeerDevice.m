@implementation RSDRemoteBonjourPeerDevice

- (RSDRemoteBonjourPeerDevice)initWithGeneratedName
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
  v4 = dword_1000575F8++;
  snprintf(__str, 0x20uLL, "peer-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteBonjourPeerDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteBonjourPeerDevice)initWithIncomingEndpoint:(id)a3
{
  id v4;
  RSDRemoteBonjourPeerDevice *v5;
  RSDRemoteBonjourPeerDevice *v6;
  RSDRemoteBonjourPeerDevice *v7;

  v4 = a3;
  v5 = -[RSDRemoteBonjourPeerDevice initWithGeneratedName](self, "initWithGeneratedName");
  v6 = v5;
  if (v5)
  {
    -[RSDRemoteBonjourPeerDevice setAddress_endpoint:](v5, "setAddress_endpoint:", v4);
    v6->saysHelloFirst = 0;
    v7 = v6;
  }

  return v6;
}

- (RSDRemoteBonjourPeerDevice)initWithBrowsedEndpointUUID:(id)a3 uuid:(unsigned __int8)a4[16]
{
  NSObject *v6;
  RSDRemoteBonjourPeerDevice *v7;
  RSDRemoteBonjourPeerDevice *v8;
  RSDRemoteBonjourPeerDevice *v9;
  uint64_t v11;
  _OWORD v12[5];

  v6 = a3;
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_bonjour_service)
    sub_10003AAC4(&v11, v12);
  v7 = -[RSDRemoteBonjourPeerDevice initWithGeneratedName](self, "initWithGeneratedName");
  v8 = v7;
  if (v7)
  {
    -[RSDRemoteBonjourPeerDevice setBonjour_endpoint:](v7, "setBonjour_endpoint:", v6);
    uuid_copy(v8->remote_device_uuid, a4);
    if (uuid_is_null(v8->remote_device_uuid))
      sub_10003AA5C(&v11, v12);
    v8->saysHelloFirst = uuid_compare((const unsigned __int8 *)&xmmword_100057FE8, v8->remote_device_uuid) > 0;
    v9 = v8;
  }

  return v8;
}

- (void)attach
{
  objc_super v3;

  objc_msgSend((id)qword_100057F40, "addObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteBonjourPeerDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  OS_nw_connection *peerconn;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteBonjourPeerDevice;
  -[RSDRemoteDevice disconnect](&v4, "disconnect");
  peerconn = self->_peerconn;
  self->_peerconn = 0;

  objc_msgSend((id)qword_100057F40, "removeObject:", self);
}

- (void)connected
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _OWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  v4 = (void *)xpc_remote_connection_copy_remote_endpoint();
  -[RSDRemoteBonjourPeerDevice setAddress_endpoint:](self, "setAddress_endpoint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteBonjourPeerDevice address_endpoint](self, "address_endpoint"));
  if (!v5)
    sub_10003AB2C(&v6, v7);

  uuid_copy(self->remote_device_uuid, (const unsigned __int8 *)-[RSDRemoteDevice uuid](self, "uuid"));
  if (uuid_is_null(self->remote_device_uuid))
    sub_10003AB94(&v6, v7);
  if (byte_100057F48)
    sub_100028044((unsigned int *)self->remote_device_uuid);
}

- (void)needsConnect
{
  id v3;
  NSObject *v4;
  id v5;
  _BOOL4 saysHelloFirst;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  OS_nw_connection *v15;
  OS_nw_connection *peerconn;
  uint64_t index;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  OS_nw_connection *v22;
  uint64_t v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  const char *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t failsafe_version_flags;
  id v37;
  uint64_t v38;
  uint8_t buf[88];

  v3 = sub_100028568();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }

  if (uuid_is_null(self->remote_device_uuid))
    v5 = 0;
  else
    v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->remote_device_uuid);
  saysHelloFirst = self->saysHelloFirst;
  v7 = sub_100028568();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!saysHelloFirst)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> local device uuid < remote device uuid: waiting for remote device to connect", buf, 0xCu);
    }

    if (self->_peerconn)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

      v25 = sub_100028568();
      peerconn = (OS_nw_connection *)objc_claimAutoreleasedReturnValue(v25);
      v26 = os_log_type_enabled((os_log_t)peerconn, OS_LOG_TYPE_DEFAULT);
      if (!v24)
      {
        if (v26)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)peerconn, OS_LOG_TYPE_DEFAULT, "%{public}@> using established peer connection", buf, 0xCu);
        }

        v22 = self->_peerconn;
        peerconn = self->_peerconn;
        self->_peerconn = 0;
        v23 = 1;
LABEL_38:

        if (v22)
        {
          v35 = qword_100057F58;
          failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v34);
          peerconn = (OS_nw_connection *)xpc_remote_connection_create_with_nw_connection(v22, v35, failsafe_version_flags, v23);
        }
        else
        {
          peerconn = 0;
        }
        -[RSDRemoteDevice connect:](self, "connect:", peerconn);

        goto LABEL_42;
      }
      if (v26)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        v27 = "%{public}@> wait for current connection to invalidate before applying reestablished connection";
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)peerconn, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
      }
    }
    else
    {
      if (v5 && (objc_msgSend((id)qword_100057F50, "containsObject:", v5) & 1) == 0)
      {
        v37 = sub_100028568();
        v29 = objc_claimAutoreleasedReturnValue(v37);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        v30 = "%{public}@> attempting to wait for connection from peer but bonjour endpoint previously gone away so discarding device";
        goto LABEL_25;
      }
      v33 = sub_100028568();
      peerconn = (OS_nw_connection *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled((os_log_t)peerconn, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        v27 = "%{public}@> waiting for connection from peer";
        goto LABEL_34;
      }
    }
LABEL_42:

    goto LABEL_43;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> local device uuid > remote device uuid: attaching and connecting to remote device", buf, 0xCu);
  }

  if (!v5 || (objc_msgSend((id)qword_100057F50, "containsObject:", v5) & 1) != 0)
  {
    v10 = sub_100028568();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> connecting to remote remoted", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteBonjourPeerDevice bonjour_endpoint](self, "bonjour_endpoint"));
    if (!v12)
      sub_10003AC64(&v38, buf);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteBonjourPeerDevice bonjour_endpoint](self, "bonjour_endpoint"));
    v14 = (void *)nw_endpoint_copy_interface();

    v15 = v14;
    if (!v15)
      sub_10003ACCC(&v38, buf);
    peerconn = v15;

    index = nw_interface_get_index((nw_interface_t)peerconn);
    v18 = sub_1000285A8(index, 2u);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!v19)
    {
      v31 = sub_100028568();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_10003AD34();

      goto LABEL_42;
    }
    v20 = v19;
    v21 = objc_claimAutoreleasedReturnValue(-[RSDRemoteBonjourPeerDevice bonjour_endpoint](self, "bonjour_endpoint"));
    v22 = (OS_nw_connection *)nw_connection_create(v21, v20);

    v23 = 2;
    goto LABEL_38;
  }
  v28 = sub_100028568();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v30 = "%{public}@> attempting hello but bonjour endpoint previously gone away so discarding device";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
  }
LABEL_26:

  -[RSDRemoteBonjourPeerDevice disconnect](self, "disconnect");
LABEL_43:

}

- (unsigned)type
{
  return 7;
}

- (unsigned)interface_index
{
  return objc_msgSend((id)qword_100057F60, "index");
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
    && sub_10001DF14((const char *)objc_msgSend((id)qword_100057F60, "name"), p_local_address_storage, 1))
  {
    v3 = sub_100028568();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003AD8C();

  }
  return p_local_address_storage;
}

- (const)remote_address
{
  NSObject *v2;
  const sockaddr *address;

  v2 = objc_claimAutoreleasedReturnValue(-[RSDRemoteBonjourPeerDevice address_endpoint](self, "address_endpoint"));
  address = nw_endpoint_get_address(v2);

  return (const in6_addr *)&address->sa_data[6];
}

- (unsigned)remoteUUID
{
  return (unsigned __int8 (*)[16])self->remote_device_uuid;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (OS_nw_endpoint)address_endpoint
{
  return self->_address_endpoint;
}

- (void)setAddress_endpoint:(id)a3
{
  objc_storeStrong((id *)&self->_address_endpoint, a3);
}

- (OS_nw_endpoint)bonjour_endpoint
{
  return self->_bonjour_endpoint;
}

- (void)setBonjour_endpoint:(id)a3
{
  objc_storeStrong((id *)&self->_bonjour_endpoint, a3);
}

- (OS_nw_connection)peerconn
{
  return self->_peerconn;
}

- (void)setPeerconn:(id)a3
{
  objc_storeStrong((id *)&self->_peerconn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerconn, 0);
  objc_storeStrong((id *)&self->_bonjour_endpoint, 0);
  objc_storeStrong((id *)&self->_address_endpoint, 0);
}

@end
