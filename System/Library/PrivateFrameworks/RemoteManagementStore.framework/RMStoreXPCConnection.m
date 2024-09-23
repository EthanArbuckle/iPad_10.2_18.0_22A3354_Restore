@implementation RMStoreXPCConnection

+ (id)storeXPCConnection:(id)a3
{
  id v3;
  RMStoreXPCConnection *v4;

  v3 = a3;
  v4 = -[RMStoreXPCConnection initWithXPCConnection:]([RMStoreXPCConnection alloc], "initWithXPCConnection:", v3);

  return v4;
}

- (RMStoreXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  RMStoreXPCConnection *v6;
  RMStoreXPCConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMStoreXPCConnection;
  v6 = -[RMStoreXPCConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSXPCConnection *connection;
  objc_super v6;

  -[RMStoreXPCConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RMStoreXPCConnection connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    connection = self->_connection;
    self->_connection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)RMStoreXPCConnection;
  -[RMStoreXPCConnection dealloc](&v6, sel_dealloc);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
