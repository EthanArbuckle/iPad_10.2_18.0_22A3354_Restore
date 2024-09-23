@implementation RSDRemoteNCMDevice

- (void)connected
{
  void *v3;
  OS_nw_endpoint *v4;
  OS_nw_endpoint *endpoint;
  id v6;
  NSObject *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  v4 = (OS_nw_endpoint *)xpc_remote_connection_copy_remote_endpoint();
  endpoint = self->_endpoint;
  self->_endpoint = v4;

  if (!self->_endpoint)
  {
    v6 = sub_10002AEC8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003BBDC();

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v8);

  }
}

- (unsigned)interface_index
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v3 = objc_msgSend(v2, "index");

  return v3;
}

- (const)local_address
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  if (objc_msgSend(v3, "is_private"))
  {
    if (-[RSDRemoteDevice type](self, "type") == 9)
    {

LABEL_6:
      if (!self->local_address_storage.__u6_addr32[0]
        && !self->local_address_storage.__u6_addr32[1]
        && !self->local_address_storage.__u6_addr32[2]
        && !self->local_address_storage.__u6_addr32[3])
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
        *(_QWORD *)self->local_address_storage.__u6_addr8 = sub_10002B308((uint64_t)objc_msgSend(v5, "mac_addr"));
        *(_QWORD *)&self->local_address_storage.__u6_addr32[2] = v6;

      }
      return &self->local_address_storage;
    }
    v4 = -[RSDRemoteDevice type](self, "type");

    if (v4 == 12)
      goto LABEL_6;
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v8 = sub_10001DF14((const char *)objc_msgSend(v7, "name"), self->local_address_storage.__u6_addr8, 1);

  if (v8)
  {
    v9 = sub_10002AEC8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003AD8C();

  }
  return &self->local_address_storage;
}

- (const)remote_address
{
  NSObject *v3;
  const sockaddr *address;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (-[RSDRemoteDevice state](self, "state") == 2)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
    address = nw_endpoint_get_address(v3);

    if (address)
    {
      self->remote_address_storage = *(in6_addr *)&address->sa_data[6];
      return &self->remote_address_storage;
    }
    v10 = sub_10002AEC8();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003BCA4();
LABEL_14:

    return &self->remote_address_storage;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v6 = objc_msgSend(v5, "is_private");

  if (!v6)
  {
    v9 = sub_10002AEC8();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003BD04();
    goto LABEL_14;
  }
  if (!self->remote_address_storage.__u6_addr32[0]
    && !self->remote_address_storage.__u6_addr32[1]
    && !self->remote_address_storage.__u6_addr32[2]
    && !self->remote_address_storage.__u6_addr32[3])
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    *(_QWORD *)self->remote_address_storage.__u6_addr8 = sub_10002B308((uint64_t)-[NSObject mac_addr](v7, "mac_addr"));
    *(_QWORD *)&self->remote_address_storage.__u6_addr32[2] = v8;
    goto LABEL_14;
  }
  return &self->remote_address_storage;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (RSDNCMInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
