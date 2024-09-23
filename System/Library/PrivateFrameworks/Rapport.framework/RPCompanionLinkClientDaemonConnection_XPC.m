@implementation RPCompanionLinkClientDaemonConnection_XPC

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_cnx, "remoteObjectProxyWithErrorHandler:", a3);
}

- (RPCompanionLinkClientDaemonConnection_XPC)initWithConnection:(id)a3
{
  id v5;
  RPCompanionLinkClientDaemonConnection_XPC *v6;
  RPCompanionLinkClientDaemonConnection_XPC *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPCompanionLinkClientDaemonConnection_XPC;
  v6 = -[RPCompanionLinkClientDaemonConnection_XPC init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cnx, a3);

  return v7;
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_cnx, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnx, 0);
}

- (id)remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_cnx, "remoteObjectProxy");
}

- (NSXPCConnection)cnx
{
  return self->_cnx;
}

- (void)setCnx:(id)a3
{
  objc_storeStrong((id *)&self->_cnx, a3);
}

@end
