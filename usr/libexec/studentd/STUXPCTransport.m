@implementation STUXPCTransport

- (STUXPCTransport)initWithXPCConnection:(id)a3
{
  id v5;
  STUXPCTransport *v6;
  STUXPCTransport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUXPCTransport;
  v6 = -[STUXPCTransport initWithXPCConnection:](&v9, "initWithXPCConnection:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_XPCConnection, a3);

  return v7;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

@end
