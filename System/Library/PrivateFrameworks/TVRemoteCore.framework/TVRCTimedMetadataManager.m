@implementation TVRCTimedMetadataManager

- (void)updateTimedMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVRCTimedMetadataManager proxy](self, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTimedMetadata:", v4);

}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.tvremotecore.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550F7700);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_10);
    objc_initWeak(&location, self);
    v7 = self->_connection;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __38__TVRCTimedMetadataManager_connection__block_invoke_46;
    v12 = &unk_24DCD71B8;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", &v9);
    -[NSXPCConnection resume](self->_connection, "resume", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  return connection;
}

void __38__TVRCTimedMetadataManager_connection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _TVRCXPCLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __38__TVRCTimedMetadataManager_connection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __38__TVRCTimedMetadataManager_connection__block_invoke_46(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __38__TVRCTimedMetadataManager_connection__block_invoke_46_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    v10 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

- (TVRCTimedMetadataUpdating)proxy
{
  void *v2;
  void *v3;

  -[TVRCTimedMetadataManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVRCTimedMetadataUpdating *)v3;
}

void __33__TVRCTimedMetadataManager_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _TVRCXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __33__TVRCTimedMetadataManager_proxy__block_invoke_cold_1((uint64_t)v2, v3);

}

- (TVRCTimedMetadata)currentTimedMetadata
{
  return self->_currentTimedMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimedMetadata, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__TVRCTimedMetadataManager_connection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, a1, a3, "TVRCTimedMetadataUpdating connection encountered an interruption.", a5, a6, a7, a8, 0);
}

void __38__TVRCTimedMetadataManager_connection__block_invoke_46_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, a1, a3, "TVRCTimedMetadataUpdating connection was invalidated.", a5, a6, a7, a8, 0);
}

void __33__TVRCTimedMetadataManager_proxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Proxy creation error (TVRCTimedMetadataUpdating): %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
