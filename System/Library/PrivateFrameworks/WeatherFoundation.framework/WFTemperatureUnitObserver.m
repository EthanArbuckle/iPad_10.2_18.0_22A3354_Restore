@implementation WFTemperatureUnitObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_2);
  return (id)sharedObserver_defaultObserver;
}

void __43__WFTemperatureUnitObserver_sharedObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WFTemperatureUnitObserver _init]([WFTemperatureUnitObserver alloc], "_init");
  v1 = (void *)sharedObserver_defaultObserver;
  sharedObserver_defaultObserver = (uint64_t)v0;

}

- (WFTemperatureUnitObserver)init
{

  return 0;
}

- (id)_init
{
  WFTemperatureUnitObserver *v2;
  WFTemperatureUnitObserver *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTemperatureUnitObserver;
  v2 = -[WFTemperatureUnitObserver init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFTemperatureUnitObserver setDataSynchronizationLock:](v2, "setDataSynchronizationLock:", 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.WeatherFoundation.temperatureUnitUpdateQueue", v4);
    -[WFTemperatureUnitObserver setTemperatureUnitUpdateQueue:](v3, "setTemperatureUnitUpdateQueue:", v5);

    v6 = (void *)objc_opt_new();
    -[WFTemperatureUnitObserver setBlockObserversForUUID:](v3, "setBlockObserversForUUID:", v6);

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTemperatureUnitObserver setObserverObjects:](v3, "setObserverObjects:", v7);

    -[WFTemperatureUnitObserver setUserTemperatureUnit:](v3, "setUserTemperatureUnit:", 0);
    -[WFTemperatureUnitObserver _updateTemperatureUnit](v3, "_updateTemperatureUnit");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__WFTemperatureUnitObserverTrampoline, CFSTR("com.apple.weather.temperatureUnitsChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__updateTemperatureUnit, *MEMORY[0x24BDBCA70], 0);

  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[WFTemperatureUnitObserver removeAllObservers](self, "removeAllObservers");
  v4.receiver = self;
  v4.super_class = (Class)WFTemperatureUnitObserver;
  -[WFTemperatureUnitObserver dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)callbackQueue
{
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue **p_callbackQueue;

  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x24BDAC9B8]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

- (int)temperatureUnit
{
  WFTemperatureUnitObserver *v2;
  os_unfair_lock_s *p_dataSynchronizationLock;

  v2 = self;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = -[WFTemperatureUnitObserver userTemperatureUnit](v2, "userTemperatureUnit");
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  return (int)v2;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    v5 = a3;
    os_unfair_lock_lock_with_options();
    -[WFTemperatureUnitObserver observerObjects](self, "observerObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
}

- (BOOL)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFTemperatureUnitObserver observerObjects](self, "observerObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      -[WFTemperatureUnitObserver observerObjects](self, "observerObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v4);

    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)addBlockObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD1880];
    v5 = a3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFTemperatureUnitObserver blockObserversForUUID](self, "blockObserversForUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "copy");

    v10 = (void *)MEMORY[0x212BE2990](v9);
    objc_msgSend(v8, "setObject:forKey:", v10, v6);

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)removeBlockObserverWithHandle:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  const __CFDictionary *v6;
  int v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFTemperatureUnitObserver blockObserversForUUID](self, "blockObserversForUUID");
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CFDictionaryContainsKey(v6, v4);
    v8 = v7 != 0;

    if (v7)
    {
      -[WFTemperatureUnitObserver blockObserversForUUID](self, "blockObserversForUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v4);

    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateTemperatureUnit
{
  NSObject *v3;
  _QWORD block[5];

  -[WFTemperatureUnitObserver temperatureUnitUpdateQueue](self, "temperatureUnitUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WFTemperatureUnitObserver__updateTemperatureUnit__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__WFTemperatureUnitObserver__updateTemperatureUnit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_updateTemperatureUnit");
}

- (void)q_updateTemperatureUnit
{
  NSObject *v3;
  WFTemperatureUnitRequest *v4;
  WFTemperatureUnitRequest *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  id v10;
  id location;

  -[WFTemperatureUnitObserver temperatureUnitUpdateQueue](self, "temperatureUnitUpdateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = [WFTemperatureUnitRequest alloc];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke;
  v9 = &unk_24CCA0DE0;
  objc_copyWeak(&v10, &location);
  v5 = -[WFTemperatureUnitRequest initWithResultHandler:](v4, "initWithResultHandler:", &v6);
  -[WFTask executeSynchronously](v5, "executeSynchronously", v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[5];
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "temperatureUnitUpdateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke_2;
  v5[3] = &unk_24CCA0DB8;
  v5[4] = WeakRetained;
  v6 = a2;
  dispatch_async(v4, v5);

}

void __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  os_unfair_lock_s *v4;
  BOOL v5;

  os_unfair_lock_lock_with_options();
  v2 = objc_msgSend(*(id *)(a1 + 32), "userTemperatureUnit");
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3)
    v5 = v3 == v2;
  else
    v5 = 1;
  if (v5)
  {
    os_unfair_lock_unlock(v4 + 2);
  }
  else
  {
    -[os_unfair_lock_s setUserTemperatureUnit:](v4, "setUserTemperatureUnit:");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "q_notifyObserversOfUpdatedTemperatureUnit:", *(unsigned int *)(a1 + 40));
  }
}

- (void)q_notifyObserversOfUpdatedTemperatureUnit:(int)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  size_t v11;
  NSObject *v12;
  uint64_t v13;
  size_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  WFTemperatureUnitObserver *v20;
  int v21;
  _QWORD block[4];
  id v23;
  int v24;

  -[WFTemperatureUnitObserver temperatureUnitUpdateQueue](self, "temperatureUnitUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  -[WFTemperatureUnitObserver observerObjects](self, "observerObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTemperatureUnitObserver blockObserversForUUID](self, "blockObserversForUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  v11 = objc_msgSend(v10, "count");
  -[WFTemperatureUnitObserver callbackQueue](self, "callbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke;
  block[3] = &unk_24CCA0E08;
  v23 = v10;
  v24 = a3;
  v17 = v10;
  dispatch_apply(v11, v12, block);

  v14 = objc_msgSend(v8, "count");
  -[WFTemperatureUnitObserver callbackQueue](self, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke_2;
  v18[3] = &unk_24CCA0E30;
  v19 = v8;
  v20 = self;
  v21 = a3;
  v16 = v8;
  dispatch_apply(v14, v15, v18);

}

void __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(unsigned int *)(a1 + 40));

}

void __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temperatureUnitObserver:didChangeTemperatureUnitTo:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

- (void)removeAllObservers
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v4;
  void *v5;

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WFTemperatureUnitObserver blockObserversForUUID](self, "blockObserversForUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[WFTemperatureUnitObserver observerObjects](self, "observerObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (OS_dispatch_queue)temperatureUnitUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTemperatureUnitUpdateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSMutableDictionary)blockObserversForUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockObserversForUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSHashTable)observerObjects
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)userTemperatureUnit
{
  return self->_userTemperatureUnit;
}

- (void)setUserTemperatureUnit:(int)a3
{
  self->_userTemperatureUnit = a3;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerObjects, 0);
  objc_storeStrong((id *)&self->_blockObserversForUUID, 0);
  objc_storeStrong((id *)&self->_temperatureUnitUpdateQueue, 0);
}

@end
