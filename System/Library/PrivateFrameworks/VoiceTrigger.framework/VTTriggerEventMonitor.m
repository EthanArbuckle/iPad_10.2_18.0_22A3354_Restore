@implementation VTTriggerEventMonitor

- (VTTriggerEventMonitor)init
{
  VTTriggerEventMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD handler[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VTTriggerEventMonitor;
  v2 = -[VTTriggerEventMonitor init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VTTriggerEventMonitor Connection Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_notifyToken = -1;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_queue;
    v8 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __29__VTTriggerEventMonitor_init__block_invoke;
    handler[3] = &unk_24C7F41F8;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.voicetrigger.XPCRestarted", &v2->_notifyToken, v7, handler);
    v2->_notifyTokenLegacyTrigger = -1;
    v9 = v2->_queue;
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __29__VTTriggerEventMonitor_init__block_invoke_2;
    v17[3] = &unk_24C7F41F8;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.coreaudio.borealisTrigger", &v2->_notifyTokenLegacyTrigger, v9, v17);
    v2->_notifyTokenLegacyEarlyDetect = -1;
    v10 = v2->_queue;
    v12 = v8;
    v13 = 3221225472;
    v14 = __29__VTTriggerEventMonitor_init__block_invoke_3;
    v15 = &unk_24C7F41F8;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.voicetrigger.EarlyDetect", &v2->_notifyTokenLegacyEarlyDetect, v10, &v12);
    -[VTTriggerEventMonitor _attemptConnectionInQueue](v2, "_attemptConnectionInQueue", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  int notifyToken;
  int notifyTokenLegacyTrigger;
  int notifyTokenLegacyEarlyDetect;
  objc_super v6;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  notifyTokenLegacyTrigger = self->_notifyTokenLegacyTrigger;
  if (notifyTokenLegacyTrigger != -1)
    notify_cancel(notifyTokenLegacyTrigger);
  notifyTokenLegacyEarlyDetect = self->_notifyTokenLegacyEarlyDetect;
  if (notifyTokenLegacyEarlyDetect != -1)
    notify_cancel(notifyTokenLegacyEarlyDetect);
  v6.receiver = self;
  v6.super_class = (Class)VTTriggerEventMonitor;
  -[VTTriggerEventMonitor dealloc](&v6, sel_dealloc);
}

- (void)_attemptConnectionInQueue
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__VTTriggerEventMonitor__attemptConnectionInQueue__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_attemptConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.voicetrigger.voicetriggerservice"), 4096);
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E0E98);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    v7 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DDFF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __43__VTTriggerEventMonitor__attemptConnection__block_invoke;
    v13 = &unk_24C7F49E0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v10);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_92, v10, v11, v12, v13);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_invalidateConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__VTTriggerEventMonitor__invalidateConnection__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_enableTriggerEventXPCNotification:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableTriggerEventXPCNotification:", v3);

}

- (void)addObserver:(id)a3
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
  v7[2] = __37__VTTriggerEventMonitor_addObserver___block_invoke;
  v7[3] = &unk_24C7F4DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
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
  v7[2] = __40__VTTriggerEventMonitor_removeObserver___block_invoke;
  v7[3] = &unk_24C7F4DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_voiceTriggered
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_observers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggered", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_earlyDetected
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_observers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "earlyDetected", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)voiceTriggered
{
  NSObject *queue;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3409;
  v17 = __Block_byref_object_dispose__3410;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__VTTriggerEventMonitor_voiceTriggered__block_invoke;
  block[3] = &unk_24C7F4D00;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)v14[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggered", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)earlyDetected
{
  NSObject *queue;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3409;
  v17 = __Block_byref_object_dispose__3410;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__VTTriggerEventMonitor_earlyDetected__block_invoke;
  block[3] = &unk_24C7F4D00;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)v14[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "earlyDetected", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __38__VTTriggerEventMonitor_earlyDetected__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__VTTriggerEventMonitor_voiceTriggered__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__VTTriggerEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_enableTriggerEventXPCNotification:", 0);
}

uint64_t __37__VTTriggerEventMonitor_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_enableTriggerEventXPCNotification:", 1);
}

void __46__VTTriggerEventMonitor__invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __43__VTTriggerEventMonitor__attemptConnection__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    v2 = objc_loadWeakRetained(&to);
    objc_msgSend(v2, "_invalidateConnection");

  }
  objc_destroyWeak(&to);
}

uint64_t __50__VTTriggerEventMonitor__attemptConnectionInQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptConnection");
}

void __29__VTTriggerEventMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_attemptConnection");
  objc_msgSend(WeakRetained, "_enableTriggerEventXPCNotification:", 1);

}

void __29__VTTriggerEventMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_voiceTriggered");

}

void __29__VTTriggerEventMonitor_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_earlyDetected");

}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_3422);
  return (id)sharedMonitor_sharedMonitor;
}

void __38__VTTriggerEventMonitor_sharedMonitor__block_invoke()
{
  VTTriggerEventMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTTriggerEventMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

}

@end
