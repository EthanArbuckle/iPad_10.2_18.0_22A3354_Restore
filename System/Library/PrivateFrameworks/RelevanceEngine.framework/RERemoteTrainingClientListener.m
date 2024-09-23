@implementation RERemoteTrainingClientListener

+ (id)sharedTrainingClientListener
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RERemoteTrainingClientListener_sharedTrainingClientListener__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTrainingClientListener_onceToken != -1)
    dispatch_once(&sharedTrainingClientListener_onceToken, block);
  return (id)sharedTrainingClientListener_listener;
}

void __62__RERemoteTrainingClientListener_sharedTrainingClientListener__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTrainingClientListener_listener;
  sharedTrainingClientListener_listener = (uint64_t)v1;

}

- (RERemoteTrainingClientListener)init
{
  RERemoteTrainingClientListener *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  NSMutableSet *v5;
  NSMutableSet *clients;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  NSXPCListener *listener;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RERemoteTrainingClientListener;
  v2 = -[RERemoteTrainingClientListener init](&v15, sel_init);
  if (v2)
  {
    RECreateSharedQueueWithQOS(CFSTR("RERemoteTrainingClientListener"), QOS_CLASS_UTILITY);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clients = v2->_clients;
    v2->_clients = v5;

    RELogForDomain(17);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2132F7000, v7, OS_LOG_TYPE_INFO, "Starting remote training listener", v14, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    RERemoteTrainingMachServiceForProcessName(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v10);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v11;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");

  }
  return v2;
}

- (void)dealloc
{
  NSXPCListener *listener;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)RERemoteTrainingClientListener;
  -[RERemoteTrainingClientListener dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  RERemoteTrainingClientListener *v15;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_24CF8C580;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

  return 1;
}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _RELocalTrainingContext *v4;
  id WeakRetained;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "New connection: %s", buf, 0xCu);

  }
  v4 = -[_RELocalTrainingContext initWithConnection:]([_RELocalTrainingContext alloc], "initWithConnection:", *(_QWORD *)(a1 + 40));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_7;
  v6[3] = &unk_24CF8C558;
  v6[4] = *(_QWORD *)(a1 + 48);
  -[_RELocalTrainingContext setInvalidationHandler:](v4, "setInvalidationHandler:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
  objc_msgSend(WeakRetained, "remoteTrainingClientListenerDidConnectContext:", v4);

}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v7[3] = &unk_24CF8AB18;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __69__RERemoteTrainingClientListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "remoteTrainingClientListenerDidDisconnectContext:", *(_QWORD *)(a1 + 40));

}

- (RERemoteTrainingClientListenerDelegate)delegate
{
  return (RERemoteTrainingClientListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
