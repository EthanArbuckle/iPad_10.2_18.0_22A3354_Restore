@implementation TPSServiceConnection

- (void)setRemoteInterfaceInstance:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInterfaceInstance, a3);
}

- (id)connection
{
  _TPSXPCConnection *connection;
  _TPSXPCConnection *v4;
  void *v5;
  _TPSXPCConnection *v6;
  _TPSXPCConnection *v7;

  connection = self->_connection;
  if (!connection)
  {
    v4 = [_TPSXPCConnection alloc];
    -[TPSServiceConnection serviceName](self, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_TPSXPCConnection initWithMachServiceName:options:](v4, "initWithMachServiceName:options:", v5, 4096);
    v7 = self->_connection;
    self->_connection = v6;

    -[_TPSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[_TPSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return connection;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[TPSServiceConnection remoteInterfaceInstance](self, "remoteInterfaceInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
  v5 = v4;

  return v5;
}

- (NSXPCInterface)remoteInterfaceInstance
{
  return self->_remoteInterfaceInstance;
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[TPSServiceConnection exportedInterfaceInstance](self, "exportedInterfaceInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
  v5 = v4;

  return v5;
}

- (NSXPCInterface)exportedInterfaceInstance
{
  return self->_exportedInterfaceInstance;
}

- (TPSServiceConnection)init
{
  return -[TPSServiceConnection initWithServiceName:](self, "initWithServiceName:", CFSTR("com.apple.tipsd"));
}

- (TPSServiceConnection)initWithServiceName:(id)a3
{
  id v5;
  TPSServiceConnection *v6;
  TPSServiceConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSServiceConnection;
  v6 = -[TPSServiceConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceName, a3);

  return v7;
}

- (void)invalidate
{
  _TPSXPCConnection *connection;

  -[_TPSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)setExportedInterfaceInstance:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterfaceInstance, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_exportedInterfaceInstance, 0);
  objc_storeStrong((id *)&self->_remoteInterfaceInstance, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
