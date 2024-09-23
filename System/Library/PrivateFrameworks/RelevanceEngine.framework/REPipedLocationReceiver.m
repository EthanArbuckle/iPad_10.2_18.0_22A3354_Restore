@implementation REPipedLocationReceiver

- (id)_init
{
  _QWORD *v2;
  dispatch_queue_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REPipedLocationReceiver;
  v2 = -[RESingleton _init](&v6, sel__init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.relevanceengine.REPipedLocationReceiver", 0);
    v4 = (void *)v2[4];
    v2[4] = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)REPipedLocationReceiver;
  -[REPipedLocationReceiver dealloc](&v3, sel_dealloc);
}

- (void)setLocation:(id)a3
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
  v7[2] = __39__REPipedLocationReceiver_setLocation___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __39__REPipedLocationReceiver_setLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setLocation:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_setLocation:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  dispatch_time_t v14;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  RELogForDomain(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "REPipedLocationReceiver preparing to set location to %s", buf, 0xCu);

  }
  objc_storeStrong((id *)&self->_location, a3);
  connection = self->_connection;
  if (!connection)
  {
    -[REPipedLocationReceiver _queue_setupConnection](self, "_queue_setupConnection");
    connection = self->_connection;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "updateLocation:", self->_location);
    RELogForDomain(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "description");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v18 = v13;
      _os_log_impl(&dword_2132F7000, v11, OS_LOG_TYPE_INFO, "REPipedLocationReceiver sent location to %s", buf, 0xCu);

    }
    ++self->_connectionWindowRetainCount;
    v14 = dispatch_time(0, 60000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__REPipedLocationReceiver__queue_setLocation___block_invoke_5;
    block[3] = &unk_24CF8AAF0;
    block[4] = self;
    dispatch_after(v14, queue, block);
  }

}

void __46__REPipedLocationReceiver__queue_setLocation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  RELogForDomain(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__REPipedLocationReceiver__queue_setLocation___block_invoke_cold_1(v2, v3);

}

uint64_t __46__REPipedLocationReceiver__queue_setLocation___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  --*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  v1 = *(_QWORD *)(result + 32);
  if (*(uint64_t *)(v1 + 24) <= 0 && *(_QWORD *)(v1 + 8))
  {
    v2 = result;
    RELogForDomain(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_INFO, "Closing out REPipedLocationReceiver connection", v4, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 8), "invalidate");
  }
  return result;
}

- (CLLocation)location
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__REPipedLocationReceiver_location__block_invoke;
  v5[3] = &unk_24CF8C1C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

void __35__REPipedLocationReceiver_location__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_queue_setupConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.relevanceengine.pipedlocation"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  REPipedLocationReceiverInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

  v7 = self->_connection;
  REPipedLocationDonorInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v9 = self->_connection;
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke;
  v14[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v14);
  v11 = self->_connection;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_2;
  v12[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v12);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__REPipedLocationReceiver__queue_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "REPipedLocationReceiver XPC connection interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_6;
    block[3] = &unk_24CF8AAF0;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearConnection");
}

void __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "REPipedLocationReceiver XPC connection invalidated.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_7;
    block[3] = &unk_24CF8AAF0;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __49__REPipedLocationReceiver__queue_setupConnection__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearConnection");
}

- (void)_queue_clearConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  connection = self->_connection;
  self->_connection = 0;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__REPipedLocationReceiver__queue_setLocation___block_invoke_cold_1(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = 136315138;
  v5 = objc_msgSend(v3, "UTF8String");
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Failed to get REPipedLocationReceiver proxy: %s", (uint8_t *)&v4, 0xCu);

}

@end
