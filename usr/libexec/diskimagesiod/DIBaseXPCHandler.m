@implementation DIBaseXPCHandler

- (DIBaseXPCHandler)init
{
  DIBaseXPCHandler *v2;
  dispatch_semaphore_t v3;
  void *v4;
  DIBaseXPCHandler *v5;
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
  v16.super_class = (Class)DIBaseXPCHandler;
  v2 = -[DIBaseXPCHandler init](&v16, "init");
  if (v2
    && (v3 = dispatch_semaphore_create(0),
        -[DIBaseXPCHandler setSemaphore:](v2, "setSemaphore:", v3),
        v3,
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](v2, "semaphore")),
        v4,
        !v4))
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
      v18 = 24;
      v19 = 2080;
      v20 = "-[DIBaseXPCHandler init]";
      LODWORD(v14) = 18;
      v10 = (char *)_os_log_send_and_compose_impl(v9, &v15, 0, 0, &_mh_execute_header, v8, 16, "%.*s: Failed creating semaphore", (int)buf, v14);

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
        v18 = 24;
        v19 = 2080;
        v20 = "-[DIBaseXPCHandler init]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed creating semaphore", buf, 0x12u);
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

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)DIBaseXPCHandler;
  -[DIBaseXPCHandler dealloc](&v4, "dealloc");
}

- (id)serviceName
{
  return 0;
}

- (BOOL)connectWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  -[DIBaseXPCHandler createConnection](self, "createConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
    objc_msgSend(v6, "resume");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10004848C;
    v14 = &unk_1001741D8;
    objc_copyWeak(&v15, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v11));
    -[DIBaseXPCHandler setRemoteProxy:](self, "setRemoteProxy:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    v9 = 1;
  }
  else
  {
    v9 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 151, CFSTR("Failed to create XPC connection object"), a3);
  }
  objc_destroyWeak(&location);
  return v9;
}

- (void)signalCommandCompletedWithXpcError:(id)a3
{
  NSObject *v4;

  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", a3);
  v4 = objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v4);

}

- (BOOL)completeCommandWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v5 = objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler xpcError](self, "xpcError"));
  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));

  if (v7)
  {
    if (v6)
    {
      v8 = *__error();
      if (sub_1000BF0BC())
      {
        v17 = 0;
        v9 = sub_1000BF044();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          v11 = 3;
        else
          v11 = 2;
        *(_DWORD *)buf = 68158210;
        v19 = 45;
        v20 = 2080;
        v21 = "-[DIBaseXPCHandler completeCommandWithError:]";
        v22 = 2114;
        v23 = v6;
        v12 = (char *)_os_log_send_and_compose_impl(v11, &v17, 0, 0, &_mh_execute_header, v10, 0, "%.*s: Got error from last XPC command: %{public}@", buf, 28);

        if (v12)
        {
          fprintf(__stderrp, "%s\n", v12);
          free(v12);
        }
      }
      else
      {
        v14 = sub_1000BF044();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          v19 = 45;
          v20 = 2080;
          v21 = "-[DIBaseXPCHandler completeCommandWithError:]";
          v22 = 2114;
          v23 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Got error from last XPC command: %{public}@", buf, 0x1Cu);
        }

      }
      *__error() = v8;
      LOBYTE(v13) = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      LOBYTE(v13) = 1;
    }
  }
  else
  {
    v13 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 151, CFSTR("XPC connection failed"), a3);
  }

  return v13;
}

- (void)closeConnection
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v3, "invalidate");

  -[DIBaseXPCHandler setConnection:](self, "setConnection:", 0);
}

- (BOOL)dupStderrWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  v5 = objc_alloc((Class)NSFileHandle);
  v6 = objc_msgSend(v5, "initWithFileDescriptor:", fileno(__stderrp));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1000488C8;
  v12 = &unk_1001741D8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "dupWithStderrHandle:reply:", v6, &v9);

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return (char)a3;
}

- (void)createConnection
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;

  v3 = *__error();
  if (sub_1000BF0BC())
  {
    v18 = 0;
    v4 = sub_1000BF044();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v6 = 3;
    else
      v6 = 2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
    *(_DWORD *)buf = 68158210;
    v20 = 36;
    v21 = 2080;
    v22 = "-[DIBaseXPCHandler createConnection]";
    v23 = 2114;
    v24 = v7;
    v17 = 28;
    v8 = (char *)_os_log_send_and_compose_impl(v6, &v18, 0, 0, &_mh_execute_header, v5, 0, "%.*s: Creating connection with %{public}@", buf, v17);

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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
      *(_DWORD *)buf = 68158210;
      v20 = 36;
      v21 = 2080;
      v22 = "-[DIBaseXPCHandler createConnection]";
      v23 = 2114;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection with %{public}@", buf, 0x1Cu);

    }
  }
  *__error() = v3;
  v12 = objc_alloc((Class)NSXPCConnection);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
  v14 = objc_msgSend(v12, "initWithServiceName:", v13);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v16, "setRemoteObjectInterface:", v15);

}

- (id)remoteObjectInterface
{
  return 0;
}

- (id)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
  objc_storeStrong(&self->_remoteProxy, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
  objc_storeStrong((id *)&self->_xpcError, a3);
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (void)setIsPrivileged:(BOOL)a3
{
  self->_isPrivileged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcError, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteProxy, 0);
}

@end
