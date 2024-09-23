@implementation BAAgentConnection

- (BAAgentConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4
{
  id v5;
  BAAgentConnection *v6;
  BAAgentConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAAgentConnection;
  v6 = -[BAAgentConnection init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[BAAgentConnection setConnection:](v6, "setConnection:", v5);
    -[BAAgentConnection _setupConnection](v7, "_setupConnection");
  }

  return v7;
}

- (void)resume
{
  void *v2;
  BAAgentConnection *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](obj, "connection"));
  objc_msgSend(v2, "resume");

  objc_sync_exit(obj);
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F1C0;
  v7[3] = &unk_100059800;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v7);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F1EC;
  v5[3] = &unk_100059800;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  void *v2;
  void *v3;
  void *v4;
  BAAgentConnection *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](obj, "connection"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    objc_msgSend(v3, "connectionDisconnected:", obj);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](obj, "connection"));
    objc_msgSend(v4, "invalidate");

    -[BAAgentConnection setConnection:](obj, "setConnection:", 0);
  }
  objc_sync_exit(obj);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
