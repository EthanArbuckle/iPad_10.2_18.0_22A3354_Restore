@implementation RERemoteTrainingServer

- (RERemoteTrainingServer)initWithTargetProcessName:(id)a3
{
  id v4;
  RERemoteTrainingServer *v5;
  uint64_t v6;
  NSString *processName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERemoteTrainingServer;
  v5 = -[RERemoteTrainingServer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    processName = v5->_processName;
    v5->_processName = (NSString *)v6;

  }
  return v5;
}

- (void)_queue_setupConnectionIfNeeded
{
  void *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (!self->_connection)
  {
    RERemoteTrainingMachServiceForProcessName((const __CFString *)self->_processName);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v3, 4096);
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    RERemoteTrainingServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    RERemoteTrainingClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke;
    v14 = &unk_24CF8AAC8;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", &v11);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_61, v11, v12, v13, v14);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  RELogForDomain(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke_1()
{
  NSObject *v0;
  uint8_t v1[16];

  RELogForDomain(17);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection invalidated.", v1, 2u);
  }

}

- (void)_clearConnection
{
  NSXPCConnection *connection;

  connection = self->_connection;
  self->_connection = 0;

}

- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[RERemoteTrainingServer _queue_setupConnectionIfNeeded](self, "_queue_setupConnectionIfNeeded");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3_1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateRemoteAttribute:forKey:completion:", v10, v9, v8);

}

void __66__RERemoteTrainingServer_updateRemoteAttribute_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  RELogForDomain(17);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = 136315138;
    v6 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);

  }
}

- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[RERemoteTrainingServer _queue_setupConnectionIfNeeded](self, "_queue_setupConnectionIfNeeded");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4_1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performTrainingWithElements:events:interactions:completion:", v13, v12, v11, v10);

}

void __85__RERemoteTrainingServer_performTrainingWithElements_events_interactions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  RELogForDomain(17);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = 136315138;
    v6 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
