@implementation SKDaemon

+ (id)sharedDaemon
{
  if (qword_100051AD0 != -1)
    dispatch_once(&qword_100051AD0, &stru_1000450F8);
  return (id)qword_100051AD8;
}

- (void)setupSigtermHandler
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigtermHandler;

  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigtermHandler, &stru_100045118);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (SKDaemon)init
{
  SKDaemon *v2;
  NSMutableArray *v3;
  NSMutableArray *clientConnections;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKDaemon;
  v2 = -[SKDaemon init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v3;

    -[SKDaemon setupSigtermHandler](v2, "setupSigtermHandler");
  }
  return v2;
}

- (void)handleWithMatchingEvent:(id)a3
{
  const char *string;
  const char *v4;
  id v5;
  SKIOObject *v6;
  const char *v7;
  const char *v8;
  NSObject *p_super;
  uint32_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  int v19;
  _BYTE buf[12];
  __int16 v21;
  const char *v22;

  string = xpc_dictionary_get_string(a3, _xpc_event_key_name);
  v4 = string;
  if (string && !strcmp(string, "com.apple.storagekit.resize-match"))
  {
    v19 = 0;
    *(_QWORD *)buf = 4;
    if (sysctlbyname("kern.hv_vmm_present", &v19, (size_t *)buf, 0, 0) || v19 != 1)
    {
      v15 = sub_10000BA9C();
      v6 = (SKIOObject *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
      v8 = "%s: Ignoring disk resize event, not a VM";
      p_super = &v6->super;
      v10 = 12;
      goto LABEL_7;
    }
    v6 = -[SKIOObject initWithIOObject:]([SKIOObject alloc], "initWithIOObject:", IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults"));
    if (v6)
    {
      v11 = -[SKIOObject copyPropertyWithClass:key:](v6, "copyPropertyWithClass:key:", objc_opt_class(NSData), CFSTR("sk-disk-resize"));
      v12 = v11;
      if (v11 && -[NSObject length](v11, "length") == (id)8)
      {
        v13 = *(_QWORD *)-[NSObject bytes](objc_retainAutorelease(v12), "bytes");
        v14 = objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
        -[NSObject performVMDiskResizeWithSize:](v14, "performVMDiskResizeWithSize:", v13);
      }
      else
      {
        v16 = sub_10000BA9C();
        v14 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          if (v12)
            v17 = (const char *)-[NSObject length](v12, "length");
          else
            v17 = 0;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
          v21 = 2048;
          v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve size to resize (data object length %ld)", buf, 0x16u);
        }
      }

    }
    else
    {
      v18 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve device tree defaults", buf, 0xCu);
      }
    }

  }
  else
  {
    v5 = sub_10000BA9C();
    v6 = (SKIOObject *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      v7 = "empty";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
      v21 = 2080;
      v22 = v7;
      v8 = "%s: xpcEventName is %s";
      p_super = &v6->super;
      v10 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, v8, buf, v10);
    }
  }
LABEL_25:

}

- (void)startServer
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting SKDaemon...", buf, 2u);
  }

  v5 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.storagekitd"));
  -[SKDaemon setListener:](self, "setListener:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = +[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100012368;
  handler[3] = &unk_100045160;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, handler);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));
  objc_msgSend(v8, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  SKDaemonConnection *v12;
  SKDaemonConnection *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  NSObject *v28;
  SKDaemon *v29;
  uint8_t buf[4];
  SKDaemonConnection *v31;
  __int16 v32;
  unsigned int v33;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));

  v9 = v8 == v6;
  if (v9)
  {
    v12 = -[SKDaemonConnection initWithConnection:]([SKDaemonConnection alloc], "initWithConnection:", v7);
    if (!v12)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon clientConnections](self, "clientConnections"));
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon clientConnections](self, "clientConnections"));
    objc_msgSend(v15, "addObject:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon activeClientsTransaction](self, "activeClientsTransaction"));
    if (!v16)
    {
      v17 = (void *)os_transaction_create("storagekitd clients callbacks activity");
      -[SKDaemon setActiveClientsTransaction:](self, "setActiveClientsTransaction:", v17);

    }
    v18 = sub_10000BA9C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon clientConnections](self, "clientConnections"));
      *(_DWORD *)buf = 138412546;
      v31 = v13;
      v32 = 1024;
      v33 = objc_msgSend(v20, "count");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ added. There are now %d client(s) connected to storagetkid", buf, 0x12u);

    }
    objc_sync_exit(v14);

    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100012628;
    v27 = &unk_100044ED8;
    v11 = v13;
    v28 = v11;
    v29 = self;
    objc_msgSend(v7, "setInvalidationHandler:", &v24);
    v21 = objc_opt_class(SKDaemonConnection);
    if ((objc_opt_isKindOfClass(v11, v21) & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager", v24, v25, v26, v27));
      objc_msgSend(v22, "addListener:", v11);

    }
    objc_msgSend(v7, "resume", v24, v25, v26, v27);

  }
  else
  {
    v10 = sub_10000BA9C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unknown listener (!) rejecting connection", buf, 2u);
    }
  }

LABEL_13:
  return v9;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (OS_os_transaction)activeClientsTransaction
{
  return self->_activeClientsTransaction;
}

- (void)setActiveClientsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_activeClientsTransaction, a3);
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
  objc_storeStrong((id *)&self->_sigtermHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermHandler, 0);
  objc_storeStrong((id *)&self->_activeClientsTransaction, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
