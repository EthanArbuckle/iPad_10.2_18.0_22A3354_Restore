@implementation RSDRemoteNetworkPeerDevice

- (RSDRemoteNetworkPeerDevice)initWithGeneratedName
{
  RSDRemoteNetworkPeerDevice *result;
  RSDRemoteNetworkPeerDevice *v3;
  __int128 v4;
  int v5;
  objc_super v6;
  char __str[16];
  __int128 v8;

  result = -[RSDRemoteNetworkPeerDevice init](self, "init");
  if (result)
  {
    v3 = result;
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v4;
    v8 = v4;
    v5 = dword_1000575EC++;
    snprintf(__str, 0x20uLL, "network-%d", v5);
    v6.receiver = v3;
    v6.super_class = (Class)RSDRemoteNetworkPeerDevice;
    return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
  }
  return result;
}

- (id)initClientWithRemoteAddress:(const in6_addr *)a3
{
  in6_addr *v3;

  v3 = (in6_addr *)a3;
  if (a3)
  {
    if ((a3->__u6_addr32[0] || a3->__u6_addr32[1] || a3->__u6_addr32[2] || a3->__u6_addr32[3])
      && (self = -[RSDRemoteNetworkPeerDevice initWithGeneratedName](self, "initWithGeneratedName")) != 0)
    {
      self->remote_address_storage = *v3;
      self->server_mode = 0;
      self = self;
      v3 = (in6_addr *)self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)initServerWithPeerSocket:(int)a3
{
  RSDRemoteNetworkPeerDevice *v3;
  RSDRemoteNetworkPeerDevice *v5;
  RSDRemoteNetworkPeerDevice *v6;

  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    v5 = -[RSDRemoteNetworkPeerDevice initWithGeneratedName](self, "initWithGeneratedName");
    v3 = v5;
    if (v5)
    {
      v5->peerfd = a3;
      v5->server_mode = 1;
      if (!sub_10001E1B8(a3, v5->remote_address_storage.__u6_addr8))
      {
        v3 = v3;
        v6 = v3;
        goto LABEL_7;
      }
      if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
        sub_100037A4C();
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (void)serverReplacePeerSocket:(int)a3
{
  void *v5;
  void *v6;

  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
      sub_100037AAC();
  }
  else if (sub_10001E1B8(a3, self->remote_address_storage.__u6_addr8))
  {
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
      sub_100037A4C();
  }
  else
  {
    self->peerfd = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      xpc_remote_connection_cancel(v6);

      -[RSDRemoteDevice setConnection:](self, "setConnection:", 0);
    }
    else
    {
      -[RSDRemoteNetworkPeerDevice needsConnect](self, "needsConnect");
    }
  }
}

- (void)attach
{
  objc_super v3;

  objc_msgSend((id)qword_100057DF0, "addObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNetworkPeerDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNetworkPeerDevice;
  -[RSDRemoteDevice disconnect](&v3, "disconnect");
  objc_msgSend((id)qword_100057DF0, "removeObject:", self);
}

- (void)needsConnect
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t peerfd;
  uint64_t v6;
  uint64_t failsafe_version_flags;
  void *v8;
  in6_addr *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  RSDRemoteNetworkPeerDevice *v16;

  v3 = qword_100057DE8;
  v4 = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  if (self->server_mode)
  {
    peerfd = self->peerfd;
    if ((peerfd & 0x80000000) != 0)
    {
      v13 = qword_100057DE8;
      if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for the other side to connect", buf, 0xCu);
      }
    }
    else
    {
      v6 = qword_100057DF8;
      failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v4);
      v8 = (void *)xpc_remote_connection_create_with_connected_fd(peerfd, v6, failsafe_version_flags, 1);
      self->peerfd = -1;
      -[RSDRemoteDevice connect:](self, "connect:", v8);

    }
  }
  else
  {
    HIDWORD(v14) = -1;
    v9 = -[RSDRemoteNetworkPeerDevice remote_address](self, "remote_address");
    v10 = sub_10001D5D0((int *)&v14 + 1, (__n128 *)v9, 0xE5F9u, (int)objc_msgSend((id)qword_100057E00, "index"), (uint64_t)&xmmword_1000410A8);
    v11 = qword_100057DE8;
    if ((_DWORD)v10)
    {
      v12 = v10;
      if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
        sub_100034560((uint64_t)self, v12, v11);
      -[RSDRemoteDevice connect:](self, "connect:", 0);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      LODWORD(v14) = HIDWORD(v14);
      -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:](self, "pollConnect:onQueue:withLog:completion:", _NSConcreteStackBlock, 3221225472, sub_10001C118, &unk_1000515D8, self, v14);
    }
  }
}

- (unsigned)type
{
  return 14;
}

- (unsigned)interface_index
{
  return objc_msgSend((id)qword_100057E00, "index");
}

- (const)local_address
{
  return (const in6_addr *)&qword_100057E08;
}

- (const)remote_address
{
  return &self->remote_address_storage;
}

@end
