@implementation REUpNextSiriClient

- (REUpNextSiriClient)init
{
  REUpNextSiriClient *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSXPCConnection *connection;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REUpNextSiriClient;
  v2 = -[REUpNextSiriClient init](&v12, sel_init);
  if (v2)
  {
    RECreateSharedQueueWithQOS(CFSTR("upnext.siriclient"), QOS_CLASS_UTILITY);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.NanoTimeKit.Siri"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    v7 = v2->_connection;
    REUpNextSiriServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    v9 = v2->_connection;
    REUpNextSiriClientInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_8);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_3);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __26__REUpNextSiriClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  RELogForDomain(9);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__REUpNextSiriClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __26__REUpNextSiriClient_init__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  RELogForDomain(9);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__REUpNextSiriClient_init__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)REUpNextSiriClient;
  -[REUpNextSiriClient dealloc](&v3, sel_dealloc);
}

- (void)completedRequestWithDomain:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REUpNextSiriClient_completedRequestWithDomain___block_invoke;
  v6[3] = &unk_24CF8B550;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriClient _performOnRemoteObject:](self, "_performOnRemoteObject:", v6);

}

uint64_t __49__REUpNextSiriClient_completedRequestWithDomain___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completedRequestWithDomain:", *(_QWORD *)(a1 + 32));
}

- (void)_performOnRemoteObject:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__REUpNextSiriClient__performOnRemoteObject___block_invoke;
  v7[3] = &unk_24CF8AA78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  RELogForDomain(9);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __26__REUpNextSiriClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "XPC Siri connection interruped", a5, a6, a7, a8, 0);
}

void __26__REUpNextSiriClient_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "XPC Siri connection invalidated", a5, a6, a7, a8, 0);
}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "XPC Siri connection error %@", (uint8_t *)&v2, 0xCu);
}

@end
