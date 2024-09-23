@implementation DIClient2IODaemonXPCHandler

- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3
{
  id v5;
  DIClient2IODaemonXPCHandler *v6;
  DIClient2IODaemonXPCHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIClient2IODaemonXPCHandler;
  v6 = -[DIBaseXPCHandler init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_xpcListenerEndpoint, a3);

  return v7;
}

- (void)createConnection
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;

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
    *(_DWORD *)buf = 68157954;
    v20 = 47;
    v21 = 2080;
    v22 = "-[DIClient2IODaemonXPCHandler createConnection]";
    LODWORD(v17) = 18;
    v7 = (char *)_os_log_send_and_compose_impl(v6, &v18, 0, 0, &_mh_execute_header, v5, 0, "%.*s: Creating connection to IO daemon clients listener", (int)buf, v17);

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v20 = 47;
      v21 = 2080;
      v22 = "-[DIClient2IODaemonXPCHandler createConnection]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to IO daemon clients listener", buf, 0x12u);
    }

  }
  *__error() = v3;
  v10 = objc_alloc((Class)NSXPCConnection);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIClient2IODaemonXPCHandler xpcListenerEndpoint](self, "xpcListenerEndpoint"));
  v12 = objc_msgSend(v10, "initWithListenerEndpoint:", v11);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIClient2IODaemonXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v14, "setRemoteObjectInterface:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v15, "setInvalidationHandler:", &stru_10018B998);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v16, "setInterruptionHandler:", &stru_10018B9B8);

}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DIIOClientProtocol);
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  void *v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000ED2C0;
  v10 = &unk_1001741D8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addToRefCountWithReply:", &v7);

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
}

@end
