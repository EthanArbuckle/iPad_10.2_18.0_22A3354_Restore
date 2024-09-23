@implementation RSDRemoteComputeControllerDevice

- (RSDRemoteComputeControllerDevice)initWithGeneratedName:(const char *)a3
{
  RSDRemoteComputeControllerDevice *result;
  RSDRemoteComputeControllerDevice *v5;
  __int128 v6;
  int v7;
  objc_super v8;
  char __str[16];
  __int128 v10;

  result = -[RSDRemoteComputeControllerDevice init](self, "init");
  if (result)
  {
    v5 = result;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v6;
    v10 = v6;
    v7 = dword_1000575E8++;
    snprintf(__str, 0x20uLL, "%s-%d", a3, v7);
    v8.receiver = v5;
    v8.super_class = (Class)RSDRemoteComputeControllerDevice;
    return -[RSDRemoteDevice initWithName:](&v8, "initWithName:", __str);
  }
  return result;
}

- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 address:(const in6_addr *)a4
{
  id v7;
  RSDRemoteComputeControllerDevice *v8;
  RSDRemoteComputeControllerDevice *v9;

  v7 = a3;
  v8 = 0;
  if (v7 && a4)
  {
    if ((a4->__u6_addr32[0] || a4->__u6_addr32[1] || a4->__u6_addr32[2] || a4->__u6_addr32[3])
      && (v9 = -[RSDRemoteComputeControllerDevice initWithGeneratedName:](self, "initWithGeneratedName:", "cnode"),
          (self = v9) != 0))
    {
      objc_storeStrong((id *)&v9->_interface, a3);
      self->remote_address_storage = *a4;
      self = self;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (RSDRemoteComputeControllerDevice)initWithInterface:(id)a3 endpoint:(id)a4 bonjourUUID:(unsigned __int8)a5[16]
{
  id v9;
  id v10;
  RSDRemoteComputeControllerDevice *v11;
  RSDRemoteComputeControllerDevice *v13;
  uint64_t v14;
  _OWORD v15[5];

  v9 = a3;
  v10 = a4;
  if (v9
    && !uuid_is_null(a5)
    && (v13 = -[RSDRemoteComputeControllerDevice initWithGeneratedName:](self, "initWithGeneratedName:", "cnode"),
        (self = v13) != 0))
  {
    objc_storeStrong((id *)&v13->_interface, a3);
    uuid_copy(self->bonjour_uuid, a5);
    if (uuid_is_null(self->bonjour_uuid))
      sub_100035970(&v14, v15);
    objc_storeStrong((id *)&self->bonjour_endpoint, a4);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)type
{
  return 16;
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

- (unsigned)bonjourUUID
}

- (void)attach
{
  objc_super v3;

  objc_msgSend((id)qword_100057D78, "addObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteComputeControllerDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteComputeControllerDevice;
  -[RSDRemoteDevice disconnect](&v3, "disconnect");
  objc_msgSend((id)qword_100057D78, "removeObject:", self);
}

- (void)connected
{
  void *v3;
  OS_nw_endpoint *v4;
  OS_nw_endpoint *address_endpoint;
  OS_nw_endpoint *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  v4 = (OS_nw_endpoint *)xpc_remote_connection_copy_remote_endpoint();
  address_endpoint = self->address_endpoint;
  self->address_endpoint = v4;

  v6 = self->address_endpoint;
  if (v6)
  {
    self->remote_address_storage = *(in6_addr *)&nw_endpoint_get_address((nw_endpoint_t)v6)->sa_data[6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_1000359D8();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v7);

  }
}

+ (id)tlsOidsRequiredOfPeer
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100052F08);
}

- (void)needsConnect
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  RSDRemoteComputeControllerDevice *v6;

  v3 = qword_100057D60;
  if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014D2C;
  v4[3] = &unk_1000510D0;
  v4[4] = self;
  sub_1000146C8(v4);
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->address_endpoint, 0);
  objc_storeStrong((id *)&self->bonjour_endpoint, 0);
}

- (uint64_t)tlsRequirement
{
  id v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  id v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;

  v0 = sub_100027130();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = sub_100017F38(v1, CFSTR("rsd_compute_platform_tls_requirement"), CFSTR("compute-platform-tls-requirement"));

  if (v2)
  {
    v3 = (const char *)&unk_10004A612;
  }
  else
  {
    if (sub_10000E1D4())
      v3 = " by default on hactivated devices";
    else
      v3 = " by default";
    v2 = 1;
  }
  v4 = sub_100027130();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = sub_100017A60(v2);
    v9 = 2080;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TLS is %s for compute peers%s", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

@end
