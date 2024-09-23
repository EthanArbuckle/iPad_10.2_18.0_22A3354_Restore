@implementation AXPhoenixEventMonitor

- (AXPhoenixEventMonitor)init
{
  AXPhoenixEventMonitor *v3;
  AXPhoenixEventMonitor *v4;
  id v5;
  AXPhoenixEventMonitor *v6;
  dispatch_queue_t v7;
  objc_super v8;
  SEL v9;
  AXPhoenixEventMonitor *v10;

  v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)AXPhoenixEventMonitor;
  v10 = -[AXPhoenixEventMonitor init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = v10;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    -[AXPhoenixEventMonitor setObservers:](v4, "setObservers:");

    v6 = v10;
    v7 = dispatch_queue_create("AXPhoenixEventMonitor queue", 0);
    -[AXPhoenixEventMonitor setQueue:](v6, "setQueue:");

  }
  v3 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  AXPhoenixEventMonitor *v4;

  v4 = self;
  v3 = a2;
  -[AXPhoenixEventMonitor _stopMonitoring](self, "_stopMonitoring");
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixEventMonitor;
  -[AXPhoenixEventMonitor dealloc](&v2, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  AXPhoenixEventMonitor *v10;
  id location[2];
  AXPhoenixEventMonitor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = -[AXPhoenixEventMonitor queue](v12, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __37__AXPhoenixEventMonitor_addObserver___block_invoke;
  v8 = &unk_24F18F0B8;
  v9 = location[0];
  v10 = v12;
  dispatch_sync(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __37__AXPhoenixEventMonitor_addObserver___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  BOOL v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "observers");
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "observers");
    v5 = objc_msgSend(v4, "count") != 1;

    if (!v5)
    {
      v1 = *(void **)(a1 + 40);
      v2 = (id)objc_msgSend(v1, "queue");
      objc_msgSend(v1, "_startMonitoringWithQueue:");

    }
  }
}

- (void)removeObserver:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  AXPhoenixEventMonitor *v10;
  id location[2];
  AXPhoenixEventMonitor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = -[AXPhoenixEventMonitor queue](v12, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __40__AXPhoenixEventMonitor_removeObserver___block_invoke;
  v8 = &unk_24F18F0B8;
  v9 = location[0];
  v10 = v12;
  dispatch_sync(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __40__AXPhoenixEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  BOOL v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = (id)objc_msgSend(*(id *)(a1 + 40), "observers");
    objc_msgSend(v1, "removeObject:", *(_QWORD *)(a1 + 32));

    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "observers");
    v3 = objc_msgSend(v2, "count") != 0;

    if (!v3)
      objc_msgSend(*(id *)(a1 + 40), "_stopMonitoring");
  }
}

- (void)notifyObserver:(id)a3
{
  id location[2];
  AXPhoenixEventMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "phoenixEventMonitorDidReceiveEvent:", v4);
  objc_storeStrong(location, 0);
}

- (void)enumerateObserversInQueue:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  AXPhoenixEventMonitor *v9;
  id v10;
  id location[2];
  AXPhoenixEventMonitor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = -[AXPhoenixEventMonitor queue](v12, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__AXPhoenixEventMonitor_enumerateObserversInQueue___block_invoke;
  v8 = &unk_24F18F0E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__AXPhoenixEventMonitor_enumerateObserversInQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObservers:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)enumerateObservers:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSHashTable *obj;
  uint64_t v9;
  _QWORD __b[8];
  uint64_t v11;
  id location[2];
  AXPhoenixEventMonitor *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[AXPhoenixEventMonitor queue](v13, "queue");
  dispatch_assert_queue_V2(v7);

  memset(__b, 0, sizeof(__b));
  obj = -[AXPhoenixEventMonitor observers](v13, "observers");
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
  if (v9)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v9;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(__b[1] + 8 * v5);
      if (location[0])
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v11);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
