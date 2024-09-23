@implementation RSDEventRegistration

- (RSDEventRegistration)initWithToken:(unint64_t)a3 name:(char *)a4
{
  RSDEventRegistration *v6;
  RSDEventRegistration *v7;
  RSDEventRegistration *v8;

  v6 = -[RSDEventRegistration init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[RSDEventRegistration setToken:](v6, "setToken:", a3);
    -[RSDEventRegistration setName:](v7, "setName:", strdup(a4));
    v8 = v7;
  }

  return v7;
}

- (void)startBrowsing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void ***v7;
  void *started;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t, int);
  void *v12;
  RSDEventRegistration *v13;
  id v14;
  uint64_t v15;
  _OWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));

  if (v5)
    sub_100030650(&v15, v16);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100001CC8;
  v12 = &unk_100050E20;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = objc_retainBlock(&v9);
  started = (void *)remote_device_start_browsing_matching(v6, qword_100057C40, v7);
  -[RSDEventRegistration setBrowser:](self, "setBrowser:", started, v9, v10, v11, v12, v13);

}

- (void)cancelBrowsing
{
  void *v3;
  id v4;
  uint64_t v5;
  _OWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));

  if (!v3)
    sub_1000306D4(&v5, v6);
  -[RSDEventRegistration setDontRestartBrowse:](self, "setDontRestartBrowse:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));
  remote_device_browser_cancel();

}

- (void)fire:(id)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  __int128 v6;
  void *v7;
  NSObject *v8;
  int v9;
  char *v10;
  __int16 v11;
  char *v12;
  uuid_string_t out;
  unsigned __int8 uuid[16];

  memset(uuid, 170, sizeof(uuid));
  remote_device_copy_uuid(a3, uuid);
  v4 = xpc_uuid_create(uuid);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v5, "UUID", v4);
  if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)out = v6;
    *(_OWORD *)&out[16] = v6;
    uuid_unparse(uuid, out);
    v7 = (void *)qword_100057C48;
    if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = 136446466;
      v10 = -[RSDEventRegistration name](self, "name");
      v11 = 2082;
      v12 = out;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delivering RSD event to %{public}s for device %{public}s", (uint8_t *)&v9, 0x16u);

    }
  }
  xpc_event_publisher_fire(qword_100057C50, -[RSDEventRegistration token](self, "token"), v5);

}

- (void)dealloc
{
  objc_super v3;

  free(self->_name);
  v3.receiver = self;
  v3.super_class = (Class)RSDEventRegistration;
  -[RSDEventRegistration dealloc](&v3, "dealloc");
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (BOOL)dontRestartBrowse
{
  return self->_dontRestartBrowse;
}

- (void)setDontRestartBrowse:(BOOL)a3
{
  self->_dontRestartBrowse = a3;
}

- (OS_remote_device_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
