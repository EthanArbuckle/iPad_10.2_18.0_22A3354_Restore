@implementation RSDRemoteNCMDeviceDevice

- (unsigned)type
{
  return 9;
}

- (RSDRemoteNCMDeviceDevice)initWithGeneratedName
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
  v4 = dword_1000575E4++;
  snprintf(__str, 0x20uLL, "ncmhost-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMDeviceDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteNCMDeviceDevice)initWithInterface:(id)a3
{
  id v4;
  RSDRemoteNCMDeviceDevice *v5;
  RSDRemoteNCMDeviceDevice *v6;
  RSDRemoteNCMDeviceDevice *v7;

  v4 = a3;
  v5 = -[RSDRemoteNCMDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
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
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteNCMDeviceDevice;
  -[RSDRemoteDevice attach](&v5, "attach");
  if (sub_10002AF88())
    -[RSDRemoteNCMDeviceDevice createBonjourListener](self, "createBonjourListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  v4 = objc_msgSend(v3, "is_private");

  if (v4)
    -[RSDRemoteNCMDeviceDevice createPortListener](self, "createPortListener");
}

- (void)disconnect
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  RSDRemoteNCMDeviceDevice *v8;

  v3 = qword_100057D30;
  if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  if (self->bonjour_listener)
  {
    v4 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling bonjour listener", buf, 0xCu);
    }
    nw_listener_cancel((nw_listener_t)self->bonjour_listener);
  }
  if (self->listener_source)
  {
    v5 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling port listener", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->listener_source);
  }
  if (self->reestablished_connection)
    xpc_remote_connection_cancel();
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMDeviceDevice;
  -[RSDRemoteDevice disconnect](&v6, "disconnect");
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
  RSDRemoteNCMDeviceDevice *v10;

  v3 = qword_100057D30;
  if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v9, 0xCu);
  }
  if (self->reestablished_connection)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    v5 = qword_100057D30;
    v6 = os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT);
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

- (void)createBonjourListener
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *name;
  void *v9;
  int v10;
  OS_nw_listener *v11;
  OS_nw_listener *bonjour_listener;
  OS_nw_listener *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD handler[5];
  uint64_t v29;
  _QWORD block[5];
  int v31;
  const char *v32;
  __int16 v33;
  id v34;
  _OWORD buf[5];

  v3 = qword_100057D30;
  if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138543362;
    *(_QWORD *)((char *)buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> create bonjour listener start", (uint8_t *)buf, 0xCu);
  }
  if (*(_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address")
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 1)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 2)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    v5 = sub_10002AD94((uint64_t)objc_msgSend(v4, "index"), 1);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    if (!v6)
    {
      v20 = qword_100057D30;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_FAULT))
        sub_100034640(v20);
      goto LABEL_16;
    }
    v7 = nw_parameters_copy_required_interface(v6);
    name = nw_interface_get_name(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    v10 = strncmp(name, (const char *)objc_msgSend(v9, "name"), 0x10uLL);

    if (!v10)
    {
      v11 = (OS_nw_listener *)nw_listener_create(v6);
      bonjour_listener = self->bonjour_listener;
      self->bonjour_listener = v11;

      v13 = self->bonjour_listener;
      if (!v13)
        sub_100035118(&v31, buf);

      v14 = nw_advertise_descriptor_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      if (!v14)
        sub_100035188(&v31, buf);
      v15 = v14;

      nw_advertise_descriptor_set_no_auto_rename(v15, 1);
      nw_listener_set_advertise_descriptor((nw_listener_t)self->bonjour_listener, v15);
      v16 = self->bonjour_listener;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000129CC;
      handler[3] = &unk_100051030;
      handler[4] = self;
      nw_listener_set_new_connection_handler(v16, handler);
      v17 = self->bonjour_listener;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100012B70;
      v27[3] = &unk_100051480;
      v27[4] = self;
      nw_listener_set_state_changed_handler(v17, v27);
      v18 = self->bonjour_listener;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100012ECC;
      v26[3] = &unk_1000514A8;
      v26[4] = self;
      nw_listener_set_advertised_endpoint_changed_handler(v18, v26);
      nw_listener_set_queue((nw_listener_t)self->bonjour_listener, (dispatch_queue_t)qword_100057D28);
      nw_listener_start((nw_listener_t)self->bonjour_listener);
      v19 = qword_100057D30;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 138543362;
        *(_QWORD *)((char *)buf + 4) = self;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@> create bonjour listener done", (uint8_t *)buf, 0xCu);
      }

LABEL_16:
      return;
    }
    v29 = 0;
    memset(buf, 0, sizeof(buf));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v23 = 3;
    else
      v23 = 2;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    v31 = 136315394;
    v32 = name;
    v33 = 2080;
    v34 = objc_msgSend(v24, "name");
    v25 = _os_log_send_and_compose_impl(v23, &v29, buf, 80, &_mh_execute_header, &_os_log_default, 16);

    _os_crash_msg(v29, v25);
    __break(1u);
  }
  else
  {
    v21 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", (uint8_t *)buf, 0xCu);
    }
    v22 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012990;
    block[3] = &unk_1000510D0;
    block[4] = self;
    dispatch_after(v22, (dispatch_queue_t)qword_100057D28, block);
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
  RSDRemoteNCMDeviceDevice *v22;

  v3 = qword_100057D30;
  if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
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
    v7 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_ERROR))
      sub_1000352E0((uint64_t)self, v6, v7);
    v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013234;
    block[3] = &unk_1000510D0;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)qword_100057D28, block);
  }
  else
  {
    v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v19, 0, (dispatch_queue_t)qword_100057D28);
    listener_source = self->listener_source;
    self->listener_source = v9;

    v11 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100013270;
    handler[3] = &unk_1000514D0;
    v17 = v19;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    v12 = self->listener_source;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013468;
    v14[3] = &unk_1000514F0;
    v15 = v19;
    dispatch_source_set_mandatory_cancel_handler(v12, v14);
    dispatch_activate((dispatch_object_t)self->listener_source);
    v13 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener done", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener_source, 0);
  objc_storeStrong((id *)&self->bonjour_listener, 0);
  objc_storeStrong((id *)&self->reestablished_connection, 0);
}

@end
