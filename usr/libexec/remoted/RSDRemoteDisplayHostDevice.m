@implementation RSDRemoteDisplayHostDevice

- (unsigned)type
{
  return 11;
}

- (RSDRemoteDisplayHostDevice)initWithGeneratedName
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
  v4 = dword_1000575F4++;
  snprintf(__str, 0x20uLL, "display-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteDisplayHostDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteDisplayHostDevice)initWithUSBSerialNumber:(const __CFString *)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  RSDRemoteDisplayHostDevice *v9;
  NSObject *v10;
  RSDRemoteDisplayHostDevice *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;

  v4 = (id)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057F08, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v8 = qword_100057EF0;
    if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using previously allocated name %{public}s", buf, 0xCu);
    }
    v14.receiver = self;
    v14.super_class = (Class)RSDRemoteDisplayHostDevice;
    v9 = -[RSDRemoteDevice initWithName:](&v14, "initWithName:", v7);
  }
  else
  {
    v10 = qword_100057EF0;
    if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New device attached, allocating name", buf, 2u);
    }
    v11 = -[RSDRemoteDisplayHostDevice initWithGeneratedName](self, "initWithGeneratedName");
    v9 = v11;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", -[RSDRemoteDevice device_name](v11, "device_name"), 4));
      objc_msgSend((id)qword_100057F08, "setObject:forKeyedSubscript:", v12, v4);

    }
  }

  return v9;
}

- (RSDRemoteDisplayHostDevice)initWithInterface:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  RSDRemoteDisplayHostDevice *v7;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v11;

  v4 = a3;
  cf = 0;
  v5 = sub_100010D70((io_registry_entry_t)objc_msgSend(v4, "service"), &cf);
  v6 = qword_100057EF0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "USB Serial Number: %{public}@", buf, 0xCu);
    }
    v7 = -[RSDRemoteDisplayHostDevice initWithUSBSerialNumber:](self, "initWithUSBSerialNumber:", cf);
    CFRelease(cf);
    if (!v7)
      goto LABEL_10;
LABEL_9:
    -[RSDRemoteNCMDevice setInterface:](v7, "setInterface:", v4);
    v7->fd = -1;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_ERROR))
    sub_100034418(v6);
  v7 = -[RSDRemoteDisplayHostDevice initWithGeneratedName](self, "initWithGeneratedName");
  if (v7)
    goto LABEL_9;
LABEL_10:

  return v7;
}

- (void)needsConnect
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  in6_addr *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t fd;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  RSDRemoteDisplayHostDevice *v18;

  v3 = qword_100057EF0;
  if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v5 = objc_msgSend(v4, "state");

  if (v5 == (id)2)
  {
    if (*(_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address")
      || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 1)
      || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 2)
      || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 3))
    {
      if (self->fd == -1)
      {
        v8 = -[RSDRemoteNCMDevice remote_address](self, "remote_address");
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
        v10 = sub_10001D5D0(&self->fd, (__n128 *)v8, 0xE59Fu, (int)objc_msgSend(v9, "index"), (uint64_t)&xmmword_1000410A8);

        v11 = qword_100057EF0;
        if ((_DWORD)v10)
        {
          if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_ERROR))
            sub_10003A640((uint64_t)self, v10, v11);
          -[RSDRemoteDevice connect:](self, "connect:", 0);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v18 = self;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
          }
          fd = self->fd;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_100026AAC;
          v15[3] = &unk_1000513B8;
          v15[4] = self;
          -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:](self, "pollConnect:onQueue:withLog:completion:", fd, qword_100057EF8, qword_100057EF0, v15);
        }
      }
      else
      {
        v6 = qword_100057EF0;
        if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v18 = self;
          v7 = "%{public}@> already connecting, skip";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
        }
      }
    }
    else
    {
      v13 = qword_100057EF0;
      if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", buf, 0xCu);
      }
      v14 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100026AA4;
      block[3] = &unk_1000510D0;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)qword_100057EF8, block);
    }
  }
  else
  {
    v6 = qword_100057EF0;
    if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      v7 = "%{public}@> NCM interface not ready";
      goto LABEL_13;
    }
  }
}

- (void)disconnect
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  RSDRemoteDisplayHostDevice *v6;

  v3 = qword_100057EF0;
  if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteDisplayHostDevice;
  -[RSDRemoteDevice disconnect](&v4, "disconnect");
}

- (BOOL)connectable
{
  objc_super v3;

  if (self->_suspended)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayHostDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  RSDRemoteDisplayHostDevice *v8;

  if (self->_suspended != a3)
  {
    v3 = a3;
    v5 = qword_100057EF0;
    v6 = os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_INFO);
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

@end
