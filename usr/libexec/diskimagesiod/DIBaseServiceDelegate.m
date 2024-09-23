@implementation DIBaseServiceDelegate

- (DIBaseServiceDelegate)init
{
  DIBaseServiceDelegate *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  DIBaseServiceDelegate *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v14;
  uint64_t v15;
  objc_super v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;

  v16.receiver = self;
  v16.super_class = (Class)DIBaseServiceDelegate;
  v2 = -[DIBaseServiceDelegate init](&v16, "init");
  if (v2
    && (v3 = dispatch_queue_create(0, (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent),
        dispatchQueue = v2->_dispatchQueue,
        v2->_dispatchQueue = (OS_dispatch_queue *)v3,
        dispatchQueue,
        !v2->_dispatchQueue))
  {
    v6 = *__error();
    if (sub_1000BF0BC())
    {
      v15 = 0;
      v7 = sub_1000BF044();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      *(_DWORD *)buf = 68157954;
      v18 = 29;
      v19 = 2080;
      v20 = "-[DIBaseServiceDelegate init]";
      LODWORD(v14) = 18;
      v10 = (char *)_os_log_send_and_compose_impl(v9, &v15, 0, 0, &_mh_execute_header, v8, 16, "%.*s: Failed creating queue", (int)buf, v14);

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      v11 = sub_1000BF044();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v18 = 29;
        v19 = 2080;
        v20 = "-[DIBaseServiceDelegate init]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed creating queue", buf, 0x12u);
      }

    }
    v5 = 0;
    *__error() = v6;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (BOOL)setupNewConnection:(id)a3
{
  return 0;
}

- (id)serviceName
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  const char *v15;
  int v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  uid_t v27;

  v5 = a4;
  v6 = *__error();
  if (sub_1000BF0BC())
  {
    v17 = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    *(_DWORD *)buf = 68158722;
    v19 = 60;
    v20 = 2080;
    v21 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
    v22 = 1024;
    v23 = objc_msgSend(v5, "processIdentifier");
    v24 = 1024;
    v25 = objc_msgSend(v5, "effectiveUserIdentifier");
    v26 = 1024;
    v27 = geteuid();
    LODWORD(v15) = 36;
    v10 = (char *)_os_log_send_and_compose_impl(v9, &v17, 0, 0, &_mh_execute_header, v8, 0, "%.*s: Received connection from pid %d with euid %d. Our euid is %d", (int)buf, v15, v16);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158722;
      v19 = 60;
      v20 = 2080;
      v21 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
      v22 = 1024;
      v23 = objc_msgSend(v5, "processIdentifier");
      v24 = 1024;
      v25 = objc_msgSend(v5, "effectiveUserIdentifier");
      v26 = 1024;
      v27 = geteuid();
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Received connection from pid %d with euid %d. Our euid is %d", buf, 0x24u);
    }

  }
  *__error() = v6;
  v13 = -[DIBaseServiceDelegate setupNewConnection:](self, "setupNewConnection:", v5);
  objc_msgSend(v5, "resume");
  -[DIBaseServiceDelegate validateConnection](self, "validateConnection");

  return v13;
}

- (void)createListener
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](NSXPCListener, "serviceListener"));
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);

}

- (void)startXPClistener
{
  void *v3;
  id v4;

  -[DIBaseServiceDelegate createListener](self, "createListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](self, "listener"));
  objc_msgSend(v4, "resume");

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
