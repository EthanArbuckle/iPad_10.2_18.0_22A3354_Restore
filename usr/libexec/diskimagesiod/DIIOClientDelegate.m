@implementation DIIOClientDelegate

- (DIIOClientDelegate)initWithIODaemon:(id)a3
{
  id v4;
  DIIOClientDelegate *v5;
  DIIOClientDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIOClientDelegate;
  v5 = -[DIBaseServiceDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakDaemon, v4);

  return v6;
}

- (void)addToRefCountWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = *__error();
  if (sub_1000BF0BC())
  {
    v12 = 0;
    v5 = sub_1000BF044();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v7 = 3;
    else
      v7 = 2;
    *(_DWORD *)buf = 68157954;
    v14 = 45;
    v15 = 2080;
    v16 = "-[DIIOClientDelegate addToRefCountWithReply:]";
    LODWORD(v11) = 18;
    v8 = (char *)_os_log_send_and_compose_impl(v7, &v12, 0, 0, &_mh_execute_header, v6, 0, "%.*s: Reached, keeping connection alive", (int)buf, v11);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = sub_1000BF044();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v14 = 45;
      v15 = 2080;
      v16 = "-[DIIOClientDelegate addToRefCountWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Reached, keeping connection alive", buf, 0x12u);
    }

  }
  *__error() = v4;
  v3[2](v3, 0);

}

- (BOOL)setupNewConnection:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id from;
  id location;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;

  v4 = a3;
  v5 = *__error();
  if (sub_1000BF0BC())
  {
    location = 0;
    v6 = sub_1000BF044();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v8 = 3;
    else
      v8 = 2;
    *(_DWORD *)buf = 68157954;
    v40 = 41;
    v41 = 2080;
    v42 = "-[DIIOClientDelegate setupNewConnection:]";
    LODWORD(v28) = 18;
    v9 = (char *)_os_log_send_and_compose_impl(v8, &location, 0, 0, &_mh_execute_header, v7, 0, "%.*s: A new client has connected to the clients listener", (int)buf, v28);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v10 = sub_1000BF044();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v40 = 41;
      v41 = 2080;
      v42 = "-[DIIOClientDelegate setupNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: A new client has connected to the clients listener", buf, 0x12u);
    }

  }
  *__error() = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DIIOClientProtocol));
  objc_msgSend(v4, "setExportedInterface:", v12);

  objc_msgSend(v4, "setExportedObject:", self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100009C18;
  v34[3] = &unk_10016D5D8;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  objc_msgSend(v4, "setInvalidationHandler:", v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100009DE4;
  v31[3] = &unk_10016D5D8;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, &from);
  objc_msgSend(v4, "setInterruptionHandler:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOClientDelegate weakDaemon](self, "weakDaemon"));
  v14 = v13;
  if (v13)
  {
    v15 = v13;
    objc_sync_enter(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeConnections"));
    objc_msgSend(v16, "addObject:", v4);

    HIDWORD(v29) = *__error();
    if (sub_1000BF0BC())
    {
      v30 = 0;
      v17 = sub_1000BF044();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        v19 = 3;
      else
        v19 = 2;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeConnections"));
      v21 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 68158210;
      v40 = 41;
      v41 = 2080;
      v42 = "-[DIIOClientDelegate setupNewConnection:]";
      v43 = 2048;
      v44 = v21;
      LODWORD(v28) = 28;
      v22 = (char *)_os_log_send_and_compose_impl(v19, &v30, 0, 0, &_mh_execute_header, v18, 0, "%.*s: # of active connections: %lu", (int)buf, v28, v29);

      if (v22)
      {
        fprintf(__stderrp, "%s\n", v22);
        free(v22);
      }
    }
    else
    {
      v23 = sub_1000BF044();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeConnections"));
        v26 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 68158210;
        v40 = 41;
        v41 = 2080;
        v42 = "-[DIIOClientDelegate setupNewConnection:]";
        v43 = 2048;
        v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: # of active connections: %lu", buf, 0x1Cu);

      }
    }
    *__error() = HIDWORD(v29);
    objc_sync_exit(v15);

  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)createListener
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);

}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "endpoint"));

  return (NSXPCListenerEndpoint *)v3;
}

- (DIIODaemonDelegate)weakDaemon
{
  return (DIIODaemonDelegate *)objc_loadWeakRetained((id *)&self->_weakDaemon);
}

- (void)setWeakDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_weakDaemon, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakDaemon);
}

@end
