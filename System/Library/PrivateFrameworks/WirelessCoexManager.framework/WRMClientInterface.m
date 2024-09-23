@implementation WRMClientInterface

void __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_7;
  v4 = MEMORY[0x20BD2523C](v7);
  if (v4 == MEMORY[0x24BDACFA0])
  {
    v6 = *(void (**)(void))(WeakRetained[4] + 16);
LABEL_6:
    v6();
    goto LABEL_7;
  }
  if (v4 != MEMORY[0x24BDACFB8])
  {
    v5 = (void *)MEMORY[0x20BD251A0](v7);
    free(v5);
    goto LABEL_7;
  }
  NSLog(CFSTR("WRMClientInterface XPC error detected"));
  if (v7 == (id)MEMORY[0x24BDACF30])
  {
    NSLog(CFSTR("WRMClientInterface Connection interrupted: reconnecting"));
    v6 = *(void (**)(void))(WeakRetained[4] + 16);
    goto LABEL_6;
  }
  if (v7 == (id)MEMORY[0x24BDACF38])
    NSLog(CFSTR("WRMClientInterface Connection invalidated"));
LABEL_7:

}

void __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  xpc_connection_t mach_service;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  _QWORD v14[4];
  id v15;
  id location;
  xpc_object_t v17[2];
  char *v18[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), 0);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = mach_service;

    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke_2;
    v14[3] = &unk_24C30D3C0;
    objc_copyWeak(&v15, &location);
    xpc_connection_set_event_handler(v7, v14);
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
    keys[0] = "kWCMRegisterProcess_ProcessId";
    v8 = xpc_uint64_create(*(unsigned int *)(a1 + 48));
    values = v8;
    v9 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    *(_OWORD *)v18 = xmmword_24C30D3E0;
    v10 = xpc_uint64_create(1uLL);
    v17[0] = v10;
    v11 = v9;
    v17[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)v18, v17, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v12);

    for (i = 1; i != -1; --i)
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (WRMClientInterface)init
{
  WRMClientInterface *v2;
  WRMClientInterface *v3;
  OS_xpc_object *mConnection;
  OS_dispatch_queue *mQueue;
  id mNotificationBlock;
  WRMClientInterface *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WRMClientInterface;
  v2 = -[WRMClientInterface init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    mConnection = v2->mConnection;
    v2->mConnection = 0;

    mQueue = v3->mQueue;
    v3->mQueue = 0;

    v3->mProcessId = 0;
    mNotificationBlock = v3->mNotificationBlock;
    v3->mNotificationBlock = 0;

    v7 = v3;
  }

  return v3;
}

- (void)registerClient:(int)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *mQueue;
  OS_dispatch_queue *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  int v18;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (OS_dispatch_queue *)v8;
    mQueue = self->mQueue;
    self->mQueue = v10;
  }
  else
  {
    v12 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC9B8];
    mQueue = self->mQueue;
    self->mQueue = v12;
  }

  self->mProcessId = a3;
  v14 = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke;
  block[3] = &unk_24C30D130;
  block[4] = self;
  v17 = v9;
  v18 = a3;
  v15 = v9;
  dispatch_async(v14, block);

}

- (void)unregisterClient
{
  NSObject *mQueue;
  _QWORD block[5];

  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WRMClientInterface_unregisterClient__block_invoke;
  block[3] = &unk_24C30D068;
  block[4] = self;
  dispatch_async(mQueue, block);
}

void __38__WRMClientInterface_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = 0;

    v1 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v1 + 32);
  if (v4)
  {
    *(_QWORD *)(v1 + 32) = 0;

  }
}

- (void)unregisterClientWithNotificationBlockRelease
{
  NSObject *mQueue;
  _QWORD block[5];

  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WRMClientInterface_unregisterClientWithNotificationBlockRelease__block_invoke;
  block[3] = &unk_24C30D068;
  block[4] = self;
  dispatch_async(mQueue, block);
}

void __66__WRMClientInterface_unregisterClientWithNotificationBlockRelease__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = 0;

    v1 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v1 + 32);
  if (v4)
  {
    *(_QWORD *)(v1 + 32) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mNotificationBlock, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end
