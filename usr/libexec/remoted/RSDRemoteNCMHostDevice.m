@implementation RSDRemoteNCMHostDevice

- (unsigned)type
{
  return 8;
}

- (RSDRemoteNCMHostDevice)initWithGeneratedName
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
  v4 = dword_1000575E0++;
  snprintf(__str, 0x20uLL, "ncm-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMHostDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteNCMHostDevice)initWithUSBSerialNumber:(const __CFString *)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  RSDRemoteNCMHostDevice *v9;
  NSObject *v10;
  RSDRemoteNCMHostDevice *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;

  v4 = (id)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D08, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v8 = qword_100057CF8;
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using previously allocated name %{public}s", buf, 0xCu);
    }
    v14.receiver = self;
    v14.super_class = (Class)RSDRemoteNCMHostDevice;
    v9 = -[RSDRemoteDevice initWithName:](&v14, "initWithName:", v7);
  }
  else
  {
    v10 = qword_100057CF8;
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New device attached, allocating name", buf, 2u);
    }
    v11 = -[RSDRemoteNCMHostDevice initWithGeneratedName](self, "initWithGeneratedName");
    v9 = v11;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", -[RSDRemoteDevice device_name](v11, "device_name"), 4));
      objc_msgSend((id)qword_100057D08, "setObject:forKeyedSubscript:", v12, v4);

    }
  }

  return v9;
}

- (RSDRemoteNCMHostDevice)initWithInterface:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  RSDRemoteNCMHostDevice *v7;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v11;

  v4 = a3;
  cf = 0;
  v5 = sub_100010D70((io_registry_entry_t)objc_msgSend(v4, "service"), &cf);
  v6 = qword_100057CF8;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "USB Serial Number: %{public}@", buf, 0xCu);
    }
    v7 = -[RSDRemoteNCMHostDevice initWithUSBSerialNumber:](self, "initWithUSBSerialNumber:", cf);
    CFRelease(cf);
    if (!v7)
      goto LABEL_10;
LABEL_9:
    -[RSDRemoteNCMDevice setInterface:](v7, "setInterface:", v4);
    v7->fd = -1;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
    sub_100034418(v6);
  v7 = -[RSDRemoteNCMHostDevice initWithGeneratedName](self, "initWithGeneratedName");
  if (v7)
    goto LABEL_9;
LABEL_10:

  return v7;
}

- (void)attach
{
  void *v3;
  unsigned __int8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteNCMHostDevice;
  -[RSDRemoteDevice attach](&v5, "attach");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v4 = objc_msgSend(v3, "is_private");

  if ((v4 & 1) == 0)
    -[RSDRemoteNCMHostDevice setupConnectionTimer](self, "setupConnectionTimer");
}

- (void)setupConnectionTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *connection_timer;
  NSObject *v5;
  _QWORD handler[5];
  uint64_t v7;
  _OWORD v8[5];

  if (self->connection_timer)
    sub_100034458(&v7, v8);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100057CF0);
  connection_timer = self->connection_timer;
  self->connection_timer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  v5 = self->connection_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000FD34;
  handler[3] = &unk_1000510D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->connection_timer);
}

- (void)needsConnect
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  nw_endpoint_t bonjour_service;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *name;
  void *v18;
  int v19;
  NSObject *v20;
  nw_connection_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t failsafe_version_flags;
  id v27;
  void *v28;
  NSObject *connection_timer;
  dispatch_time_t v30;
  in6_addr *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t fd;
  NSObject *v37;
  dispatch_time_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[5];
  uint64_t v43;
  _QWORD block[5];
  int v45;
  const char *v46;
  __int16 v47;
  id v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v3 = qword_100057CF8;
  if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v4)
  {
    v5 = qword_100057CF8;
    if (!os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v6 = "%{public}@> already have a connection, skip";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v8 = objc_msgSend(v7, "state");

  if (v8 != (id)2)
  {
    v5 = qword_100057CF8;
    if (!os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v6 = "%{public}@> NCM interface not ready";
    goto LABEL_17;
  }
  if (*(_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address")
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 1)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 2)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 3))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    v10 = objc_msgSend(v9, "is_private");

    if ((v10 & 1) == 0)
    {
      bonjour_service = nw_endpoint_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      -[RSDRemoteNCMDevice setEndpoint:](self, "setEndpoint:", bonjour_service);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
      if (!v12)
        sub_1000345D0(&v45, buf);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
      v14 = sub_10002AD94((uint64_t)objc_msgSend(v13, "index"), 2);
      v15 = objc_claimAutoreleasedReturnValue(v14);

      if (v15)
      {
        v16 = nw_parameters_copy_required_interface(v15);
        name = nw_interface_get_name(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
        v19 = strncmp(name, (const char *)objc_msgSend(v18, "name"), 0x10uLL);

        if (v19)
        {
          v43 = 0;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          *(_OWORD *)buf = 0u;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            v39 = 3;
          else
            v39 = 2;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
          v45 = 136315394;
          v46 = name;
          v47 = 2080;
          v48 = objc_msgSend(v40, "name");
          v41 = _os_log_send_and_compose_impl(v39, &v43, buf, 80, &_mh_execute_header, &_os_log_default, 16);

          _os_crash_msg(v43, v41);
          __break(1u);
          return;
        }
        v20 = objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
        v21 = nw_connection_create(v20, v15);

        v22 = v21;
        if (!v22)
          sub_100034680(&v45, buf);
        v23 = v22;

        v24 = qword_100057CF0;
        failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v25);
        v27 = (id)xpc_remote_connection_create_with_nw_connection(v23, v24, failsafe_version_flags, 2);
        if (!v27)
          sub_1000346F0(&v45, buf);
        v28 = v27;

        -[RSDRemoteDevice connect:](self, "connect:", v28);
        connection_timer = self->connection_timer;
        v30 = dispatch_time(0, 20000000000);
        dispatch_source_set_timer(connection_timer, v30, 0xFFFFFFFFFFFFFFFFLL, 0);

      }
      else
      {
        v35 = qword_100057CF8;
        if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_FAULT))
          sub_100034640(v35);
      }

      return;
    }
    if (self->fd != -1)
    {
      v5 = qword_100057CF8;
      if (!os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      v6 = "%{public}@> already connecting, skip";
      goto LABEL_17;
    }
    v31 = -[RSDRemoteNCMDevice remote_address](self, "remote_address");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    v33 = sub_10001D5D0(&self->fd, (__n128 *)v31, 0xE59Fu, (int)objc_msgSend(v32, "index"), (uint64_t)&xmmword_1000410A8);

    v34 = qword_100057CF8;
    if ((_DWORD)v33)
    {
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
        sub_100034560((uint64_t)self, v33, v34);
      -[RSDRemoteDevice connect:](self, "connect:", 0);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      fd = self->fd;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000103F8;
      v42[3] = &unk_1000513B8;
      v42[4] = self;
      -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:](self, "pollConnect:onQueue:withLog:completion:", fd, qword_100057CF0, qword_100057CF8, v42);
    }
  }
  else
  {
    v37 = qword_100057CF8;
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", buf, 0xCu);
    }
    v38 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000103F0;
    block[3] = &unk_1000510D0;
    block[4] = self;
    dispatch_after(v38, (dispatch_queue_t)qword_100057CF0, block);
  }
}

- (void)disconnect
{
  NSObject *v3;
  NSObject *connection_timer;
  OS_dispatch_source *v5;
  objc_super v6;
  uint8_t buf[4];
  RSDRemoteNCMHostDevice *v8;

  v3 = qword_100057CF8;
  if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  connection_timer = self->connection_timer;
  if (connection_timer)
  {
    dispatch_source_cancel(connection_timer);
    v5 = self->connection_timer;
    self->connection_timer = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMHostDevice;
  -[RSDRemoteDevice disconnect](&v6, "disconnect");
}

- (void)connected
{
  NSObject *connection_timer;
  objc_super v4;

  connection_timer = self->connection_timer;
  if (connection_timer)
    dispatch_source_set_timer(connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteNCMHostDevice;
  -[RSDRemoteNCMDevice connected](&v4, "connected");
}

- (BOOL)connectable
{
  objc_super v3;

  if (self->_suspended)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNCMHostDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  RSDRemoteNCMHostDevice *v8;

  if (self->_suspended != a3)
  {
    v3 = a3;
    v5 = qword_100057CF8;
    v6 = os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_INFO);
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
  objc_storeStrong((id *)&self->connection_timer, 0);
}

- (uint64_t)tlsRequirement
{
  id v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v0 = sub_10002AEC8();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = sub_100017F38(v1, CFSTR("rsd_ncm_tls_requirement"), CFSTR("ncm-tls-requirement"));

  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;
  v4 = sub_10002AEC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_100017A60(v3);
    v7 = (const char *)&unk_10004A612;
    if (!v2)
      v7 = " by default";
    v9 = 136315394;
    v10 = v6;
    v11 = 2080;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TLS is %s for NCM peers%s", (uint8_t *)&v9, 0x16u);
  }

  return v3;
}

@end
