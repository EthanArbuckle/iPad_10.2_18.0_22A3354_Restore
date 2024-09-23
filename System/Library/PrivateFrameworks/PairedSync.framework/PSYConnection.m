@implementation PSYConnection

- (PSYConnection)init
{
  PSYConnection *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSYConnection;
  v2 = -[PSYConnection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.pairedsyncd.connection"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    PSYConnectionXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)startSync
{
  -[PSYConnection startSyncWithOptions:](self, "startSyncWithOptions:", 0);
}

- (void)startSyncWithOptions:(id)a3
{
  PSYOptions *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  PSYOptions *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (PSYOptions *)a3;
  if (!v4)
    v4 = objc_alloc_init(PSYOptions);
  psy_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    psy_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "Starting sync with options: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[PSYConnection setOptions:](self, "setOptions:", v4);
  -[PSYConnection remoteConnection](self, "remoteConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startSyncWithOptions:", v4);

}

- (id)remoteConnection
{
  void *v2;
  void *v3;

  -[PSYConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PSYConnectionDelegate)delegate
{
  return (PSYConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (PSYOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
