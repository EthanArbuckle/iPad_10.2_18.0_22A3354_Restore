@implementation VTEventMonitor

- (VTEventMonitor)init
{
  VTEventMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTEventMonitor;
  v2 = -[VTEventMonitor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_create("Serial VTEventMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[VTEventMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)VTEventMonitor;
  -[VTEventMonitor dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  VTEventMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__VTEventMonitor_addObserver___block_invoke;
  block[3] = &unk_24C7F4DC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  VTEventMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__VTEventMonitor_removeObserver___block_invoke;
  block[3] = &unk_24C7F4DC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)enumerateObserversInQueue:(id)a3
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
  v7[2] = __44__VTEventMonitor_enumerateObserversInQueue___block_invoke;
  v7[3] = &unk_24C7F48B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    if (v4)
    {
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    else
    {
      do
      {
        if (*(_QWORD *)v11 != v8)
        {
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            --v7;
          }
          while (v7);
        }
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }

}

- (void)notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "VTEventMonitorDidReceiveEvent:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

uint64_t __44__VTEventMonitor_enumerateObserversInQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObservers:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__VTEventMonitor_removeObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "removeObject:");
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 8), "count");
    if (!result)
      return objc_msgSend(*(id *)(v1 + 40), "_stopMonitoring");
  }
  return result;
}

uint64_t __30__VTEventMonitor_addObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "addObject:");
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 8), "count");
    if (result == 1)
      return objc_msgSend(*(id *)(v1 + 40), "_startMonitoringWithQueue:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 16));
  }
  return result;
}

@end
