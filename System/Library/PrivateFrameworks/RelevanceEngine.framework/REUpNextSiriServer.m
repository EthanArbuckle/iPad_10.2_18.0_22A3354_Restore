@implementation REUpNextSiriServer

- (REUpNextSiriServer)init
{
  REUpNextSiriServer *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  uint64_t v7;
  NSMutableSet *connections;
  uint64_t v9;
  NSXPCListener *listener;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REUpNextSiriServer;
  v2 = -[REUpNextSiriServer init](&v12, sel_init);
  if (v2)
  {
    RECreateSharedQueueWithQOS(CFSTR("upnext.siriserver"), QOS_CLASS_UTILITY);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.NanoTimeKit.Siri"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v9;

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
  v4.super_class = (Class)REUpNextSiriServer;
  -[REUpNextSiriServer dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__REUpNextSiriServer_addObserver___block_invoke;
  v6[3] = &unk_24CF8AB18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v6);

}

uint64_t __34__REUpNextSiriServer_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__REUpNextSiriServer_removeObserver___block_invoke;
  v6[3] = &unk_24CF8AB18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v6);

}

uint64_t __37__REUpNextSiriServer_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)completedRequestWithDomain:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REUpNextSiriServer_completedRequestWithDomain___block_invoke;
  v6[3] = &unk_24CF8B9A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriServer _accessObservers:](self, "_accessObservers:", v6);

}

uint64_t __49__REUpNextSiriServer_completedRequestWithDomain___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriServer:receivedCompletedRequestDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_accessObservers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__REUpNextSiriServer__accessObservers___block_invoke;
  v6[3] = &unk_24CF8AA78;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v6);

}

void __39__REUpNextSiriServer__accessObservers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  REUpNextSiriClientInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  REUpNextSiriServerInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, v7);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24CF8B470;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_24CF8AB18;
  v13[4] = self;
  v11 = v7;
  v14 = v11;
  -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v13);
  objc_msgSend(v11, "resume");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return 1;
}

void __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "_removeConnection:", WeakRetained);

}

uint64_t __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__REUpNextSiriServer__removeConnection___block_invoke;
    v6[3] = &unk_24CF8AB18;
    v6[4] = self;
    v7 = v4;
    -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v6);

  }
}

uint64_t __40__REUpNextSiriServer__removeConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_accessRemoteClients:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__REUpNextSiriServer__accessRemoteClients___block_invoke;
  v6[3] = &unk_24CF8AA78;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REUpNextSiriServer _onqueue_async:](self, "_onqueue_async:", v6);

}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  RELogForDomain(9);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (void)_onqueue_async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "XPC Siri Server connection error: %@", (uint8_t *)&v2, 0xCu);
}

@end
