@implementation ClientSession

- (ClientSession)initWithConnection:(id)a3
{
  id v4;
  ClientSession *v5;
  ClientSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ClientSession;
  v5 = -[ClientSession init](&v8, "init");
  v6 = v5;
  if (v5)
    -[ClientSession setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (NSXPCProxyCreating)clientProxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientSession connection](self, "connection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C778;
  v6[3] = &unk_1000995E8;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6));

  return (NSXPCProxyCreating *)v4;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  objc_msgSend(v3, "removeClientSession:", self);

  v4.receiver = self;
  v4.super_class = (Class)ClientSession;
  -[ClientSession dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ClientSession connection](self, "connection"));
  objc_msgSend(v3, "invalidate");
  -[ClientSession setConnection:](self, "setConnection:", 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
