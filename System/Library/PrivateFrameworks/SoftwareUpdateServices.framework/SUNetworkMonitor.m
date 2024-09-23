@implementation SUNetworkMonitor

- (SUNetworkMonitor)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  uint64_t default_evaluator;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id location;
  objc_super v34;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("initiating SUNetworkMonitor [%p]"), self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUNetworkMonitor init]");

  v34.receiver = self;
  v34.super_class = (Class)SUNetworkMonitor;
  v10 = -[SUNetworkMonitor init](&v34, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    *((_QWORD *)v10 + 2) = 0;
    *((_QWORD *)v10 + 3) = 0;
    *((_WORD *)v10 + 16) = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.softwareupdateservices.SUNetworkMonitor.coreTelephonyQueue", v13);
    v15 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.softwareupdateservices.SUNetworkMonitor.callbackQueue", v16);
    v18 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = v17;

    v19 = (void *)*((_QWORD *)v10 + 7);
    *((_QWORD *)v10 + 7) = 0;

    default_evaluator = nw_path_create_default_evaluator();
    v21 = (void *)*((_QWORD *)v10 + 8);
    *((_QWORD *)v10 + 8) = default_evaluator;

    objc_initWeak(&location, v10);
    v22 = MEMORY[0x24BDAC760];
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __24__SUNetworkMonitor_init__block_invoke;
    v31 = &unk_24CE3DE68;
    objc_copyWeak(&v32, &location);
    nw_path_evaluator_set_update_handler();
    v23 = *((_QWORD *)v10 + 5);
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __24__SUNetworkMonitor_init__block_invoke_2;
    block[3] = &unk_24CE3B5C0;
    v27 = v10;
    dispatch_sync(v23, block);
    nw_path_evaluator_start();

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return (SUNetworkMonitor *)v10;
}

void __24__SUNetworkMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleNWPath:", v5);

}

uint64_t __24__SUNetworkMonitor_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetCtClient");
  return objc_msgSend(*(id *)(a1 + 32), "_initNetworkObservation");
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deallocating SUNetworkMonitor [%p]"), self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUNetworkMonitor dealloc]");

  if (self->_pathEvaluator)
    nw_path_evaluator_cancel();
  v11.receiver = self;
  v11.super_class = (Class)SUNetworkMonitor;
  -[SUNetworkMonitor dealloc](&v11, sel_dealloc);
}

+ (SUNetworkMonitor)sharedInstance
{
  if (sharedInstance_singletonPredicate != -1)
    dispatch_once(&sharedInstance_singletonPredicate, &__block_literal_global_19);
  return (SUNetworkMonitor *)(id)sharedInstance___instance_9;
}

void __34__SUNetworkMonitor_sharedInstance__block_invoke()
{
  SUNetworkMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SUNetworkMonitor);
  v1 = (void *)sharedInstance___instance_9;
  sharedInstance___instance_9 = (uint64_t)v0;

}

- (int)currentNetworkType
{
  int overriddenCurrentNetworkType;
  NSObject *ctQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
  {
    overriddenCurrentNetworkType = self->_overriddenCurrentNetworkType;
    *((_DWORD *)v8 + 6) = overriddenCurrentNetworkType;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__SUNetworkMonitor_currentNetworkType__block_invoke;
    v6[3] = &unk_24CE3B5E8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(ctQueue, v6);
    overriddenCurrentNetworkType = *((_DWORD *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return overriddenCurrentNetworkType;
}

uint64_t __38__SUNetworkMonitor_currentNetworkType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

- (int)currentCellularType
{
  int overriddenCurrentCellularType;
  NSObject *ctQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
  {
    overriddenCurrentCellularType = self->_overriddenCurrentCellularType;
    *((_DWORD *)v8 + 6) = overriddenCurrentCellularType;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__SUNetworkMonitor_currentCellularType__block_invoke;
    v6[3] = &unk_24CE3B5E8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(ctQueue, v6);
    overriddenCurrentCellularType = *((_DWORD *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return overriddenCurrentCellularType;
}

uint64_t __39__SUNetworkMonitor_currentCellularType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (BOOL)isCurrentNetworkTypeCellular
{
  return -[SUNetworkMonitor isNetworkTypeCellular:](self, "isNetworkTypeCellular:", -[SUNetworkMonitor currentNetworkType](self, "currentNetworkType"));
}

- (BOOL)isCurrentNetworkTypeExpensive
{
  _BOOL4 overriddenExpensive;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *ctQueue;
  void *v18;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__SUNetworkMonitor_isCurrentNetworkTypeExpensive__block_invoke;
    block[3] = &unk_24CE3DEB0;
    block[4] = self;
    block[5] = &v24;
    block[6] = &v20;
    dispatch_sync(ctQueue, block);
    if (*((_BYTE *)v25 + 24))
      goto LABEL_3;
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  overriddenExpensive = self->_overriddenExpensive;
  *((_BYTE *)v25 + 24) = overriddenExpensive;
  if (!overriddenExpensive)
    goto LABEL_8;
LABEL_3:
  v4 = (void *)MEMORY[0x24BDD17C8];
  SUStringFromNetworkType(*((_DWORD *)v21 + 6));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*((_BYTE *)v25 + 24))
    v7 = &stru_24CE3EA48;
  else
    v7 = CFSTR("n't");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Current network %@ is%@ considered expensive"), v5, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor isCurrentNetworkTypeExpensive]");

  v15 = *((_BYTE *)v25 + 24) != 0;
LABEL_9:
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v15;
}

_QWORD *__49__SUNetworkMonitor_isCurrentNetworkTypeExpensive__block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[4] + 30);
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 20);
  return result;
}

- (BOOL)isNetworkTypeCellular:(int)a3
{
  return (a3 - 2) < 8;
}

- (BOOL)isCellularRoaming
{
  int overriddenRoaming;
  NSObject *ctQueue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
  {
    overriddenRoaming = self->_overriddenRoaming;
    *((_BYTE *)v9 + 24) = overriddenRoaming;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__SUNetworkMonitor_isCellularRoaming__block_invoke;
    v7[3] = &unk_24CE3B5E8;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(ctQueue, v7);
    overriddenRoaming = *((unsigned __int8 *)v9 + 24);
  }
  v5 = overriddenRoaming != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __37__SUNetworkMonitor_isCellularRoaming__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 28);
  return result;
}

- (BOOL)isCellularDataRoamingEnabled
{
  int overriddenRoaming;
  NSObject *ctQueue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
  {
    overriddenRoaming = self->_overriddenRoaming;
    *((_BYTE *)v9 + 24) = overriddenRoaming;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__SUNetworkMonitor_isCellularDataRoamingEnabled__block_invoke;
    v7[3] = &unk_24CE3B5E8;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(ctQueue, v7);
    overriddenRoaming = *((unsigned __int8 *)v9 + 24);
  }
  v5 = overriddenRoaming != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__SUNetworkMonitor_isCellularDataRoamingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 29);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUNetworkMonitor.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[SUNetworkMonitor _addObserver:](self, "_addObserver:", v5);

}

- (void)removeObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUNetworkMonitor.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[SUNetworkMonitor _removeObserver:](self, "_removeObserver:", v5);

}

- (BOOL)isPathSatisfied
{
  SUNetworkMonitor *v2;
  NSObject *ctQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = v2->_ctQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SUNetworkMonitor_isPathSatisfied__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(ctQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__SUNetworkMonitor_isPathSatisfied__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 31);
  return result;
}

- (BOOL)isBootstrap
{
  NSObject *ctQueue;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SUNetworkMonitor_isBootstrap__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(ctQueue, block);
  if (*((_BYTE *)v17 + 24))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bootstrap = %@"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor isBootstrap]");

  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __31__SUNetworkMonitor_isBootstrap__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v13 = 0;
  objc_msgSend(v2, "usingBootstrapDataService:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to get result from usingBootstrapDataService: %@"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor isBootstrap]_block_invoke");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
  }

}

- (BOOL)isCellularPossible
{
  SUNetworkMonitor *v2;
  NSObject *ctQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = v2->_ctQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SUNetworkMonitor_isCellularPossible__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(ctQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__SUNetworkMonitor_isCellularPossible__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)_addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_runOnAllObservers:(id)a3
{
  id v4;
  void *v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_observersLock);
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__SUNetworkMonitor__runOnAllObservers___block_invoke;
    v8[3] = &unk_24CE3B688;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(callbackQueue, v8);

  }
}

void __39__SUNetworkMonitor__runOnAllObservers___block_invoke(uint64_t a1)
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
  v2 = *(id *)(a1 + 32);
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

- (NSHashTable)_allObservers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observersLock);
  return (NSHashTable *)v4;
}

- (void)_handleNWPath:(id)a3
{
  _BOOL8 is_expensive;
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 is_constrained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t currentCellularType;
  SUNetworkMonitor *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *path;

  path = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (path)
  {
    is_expensive = nw_path_is_expensive(path);
    v5 = nw_path_get_status(path) == nw_path_status_satisfied;
    v6 = nw_path_uses_interface_type(path, nw_interface_type_wifi);
    v7 = nw_path_uses_interface_type(path, nw_interface_type_wired);
    v8 = nw_path_uses_interface_type(path, nw_interface_type_cellular);
    is_constrained = nw_path_is_constrained(path);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("from nwpath, expensive = %d, satisfied = %d, wifi = %d, cellular = %d, wired = %d, constrained = %d"), is_expensive, v5, v6, v8, v7, is_constrained);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _handleNWPath:]");

    -[SUNetworkMonitor setExpensive:](self, "setExpensive:", is_expensive);
    -[SUNetworkMonitor setPathSatisfied:](self, "setPathSatisfied:", v5);
    -[SUNetworkMonitor setPathConstrained:](self, "setPathConstrained:", is_constrained);
    if (v6 || v7)
    {
      v18 = self;
      currentCellularType = 1;
    }
    else if (v8)
    {
      currentCellularType = self->_currentCellularType;
      v18 = self;
    }
    else
    {
      v18 = self;
      currentCellularType = 0;
    }
    -[SUNetworkMonitor setCurrentNetworkType:](v18, "setCurrentNetworkType:", currentCellularType);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("path is nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[SUNetworkMonitor] %s: %@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUNetworkMonitor _handleNWPath:]");

  }
}

- (BOOL)_overriddenByPreferences
{
  void *v3;
  void *v4;
  BOOL v5;
  unint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkMonitorOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "intValue") & 0x80000000) == 0 && (int)objc_msgSend(v4, "intValue") <= 9999)
  {
    self->_overriddenCurrentNetworkType = (int)objc_msgSend(v4, "intValue") / 1000 % 10;
    self->_overriddenCurrentCellularType = (int)objc_msgSend(v4, "intValue") / 100 % 10;
    HIDWORD(v6) = -858993459 * ((int)objc_msgSend(v4, "intValue") / 10) + 429496728;
    LODWORD(v6) = HIDWORD(v6);
    self->_overriddenRoaming = (v6 >> 1) > 0x19999998;
    HIDWORD(v6) = 429496728 - 858993459 * objc_msgSend(v4, "intValue");
    LODWORD(v6) = HIDWORD(v6);
    v7 = (v6 >> 1) > 0x19999998;
    self->_overriddenExpensive = v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Overrides detected: network = %d, cellular = %d, roaming = %d, expensive = %d"), self->_overriddenCurrentNetworkType, self->_overriddenCurrentCellularType, self->_overriddenRoaming, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor _overriddenByPreferences]");

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_initNetworkObservation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUNetworkMonitor__initNetworkObservation__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  if (_initNetworkObservation_onceToken != -1)
    dispatch_once(&_initNetworkObservation_onceToken, block);
  v3 = (void *)MEMORY[0x24BDD17C8];
  SUStringFromNetworkType(self->_currentCellularType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromNetworkType(self->_currentNetworkType);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_isExpensive)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_dataRoamingEnabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_roaming)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_pathSatisfied)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_pathConstrained)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (!self->_cellularDataPossible)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("currentCellularType: %@, currentNetworkType: %@, isExpensive: %@, dataRoamingEnabled: %@, isRoaming: %@, pathSatisfied: %@, pathConstrained: %@, cellularDataPossible: %@"), v4, v5, v8, v9, v10, v11, v12, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUNetworkMonitor _initNetworkObservation]");

}

void __43__SUNetworkMonitor__initNetworkObservation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_init_internetDataStatus");
  v2 = (id)nw_path_evaluator_copy_path();
  objc_msgSend(*(id *)(a1 + 32), "_handleNWPath:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_init_dataRoamingEnabled");
  objc_msgSend(*(id *)(a1 + 32), "_init_currentlyRoaming");

}

- (void)_init_dataRoamingEnabled
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "getCurrentDataServiceDescriptorSync:", &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;

  if (!v4 || v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error getting current data service descriptor: %@"), v5);
  }
  else
  {
    -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = objc_msgSend(v6, "getInternationalDataAccessSync:error:", v4, &v16);
    v5 = v16;

    if (!v5)
    {
      -[SUNetworkMonitor setDataRoamingEnabled:](self, "setDataRoamingEnabled:", v7);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get international data status: %@"), v5);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor _init_dataRoamingEnabled]");

LABEL_7:
}

- (void)_init_currentlyRoaming
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v3, "getCurrentDataSubscriptionContextSync:", &v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;

  if (!v4 || v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error copying data subscription context: %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");
  }
  else
  {
    -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v7 = (void *)objc_msgSend(v6, "copyRegistrationDisplayStatus:error:", v4, &v33);
    v5 = v33;

    if (!v7 || v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error copying registration display status: %@"), v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");

    }
    else
    {
      objc_msgSend(v7, "registrationDisplayStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC2C68]);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isRoaming = %d"), v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");

      -[SUNetworkMonitor setCellularRoaming:](self, "setCellularRoaming:", v9);
    }
  }

}

- (void)_init_internetDataStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "getInternetDataStatusSync:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  if ((!v4 || v5) && (objc_msgSend(v5, "code") == 4097 || objc_msgSend(v5, "code") == 4099))
  {
    -[SUNetworkMonitor _resetCtClient](self, "_resetCtClient");

    -[SUNetworkMonitor telephonyClient](self, "telephonyClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "getInternetDataStatusSync:", &v18);
    v7 = objc_claimAutoreleasedReturnValue();
    v5 = v18;

    v4 = (void *)v7;
  }
  if (!v4 || v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to get status from CoreTelephony with error %@"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _init_internetDataStatus]");

  }
  else
  {
    v8 = -[SUNetworkMonitor _networkTypeFromIndicator:](self, "_networkTypeFromIndicator:", objc_msgSend(v4, "indicator"));
    v9 = objc_msgSend(v4, "cellularDataPossible");
    -[SUNetworkMonitor setCurrentCellularType:](self, "setCurrentCellularType:", v8);
    -[SUNetworkMonitor setCellularDataPossible:](self, "setCellularDataPossible:", v9);
  }

}

- (id)telephonyClient
{
  CoreTelephonyClient *ctClient;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  ctClient = self->_ctClient;
  if (!ctClient)
  {
    -[SUNetworkMonitor _resetCtClient](self, "_resetCtClient");
    ctClient = self->_ctClient;
  }
  return ctClient;
}

- (void)_resetCtClient
{
  CoreTelephonyClient *ctClient;
  CoreTelephonyClient *v4;
  CoreTelephonyClient *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  ctClient = self->_ctClient;
  if (ctClient)
  {
    self->_ctClient = 0;

  }
  v4 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", self->_ctQueue);
  v5 = self->_ctClient;
  self->_ctClient = v4;

  -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self);
}

- (int)_networkTypeFromIndicator:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Determining network type from cellular data indicator: %d"), *(_QWORD *)&a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUNetworkMonitor _networkTypeFromIndicator:]");

  if ((a3 - 1) > 0xB)
    return 0;
  else
    return dword_21297FDB4[a3 - 1];
}

- (void)setCellularRoaming:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_roaming != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isRoaming changed from %d to %d"), self->_roaming, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setCellularRoaming:]");

    self->_roaming = v3;
    if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __39__SUNetworkMonitor_setCellularRoaming___block_invoke;
      v13[3] = &unk_24CE3DED8;
      v13[4] = self;
      -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", v13);
    }
  }
}

void __39__SUNetworkMonitor_setCellularRoaming___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "cellularRoamingStatusChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
      v4 = v6;
    }
  }

}

- (void)setDataRoamingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_dataRoamingEnabled != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The 'Data Roaming' setting changed from %d to %d"), self->_dataRoamingEnabled, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setDataRoamingEnabled:]");

    self->_dataRoamingEnabled = v3;
  }
}

- (void)setCellularDataPossible:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_cellularDataPossible != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cellularDataPossible changed from %d to %d"), self->_cellularDataPossible, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setCellularDataPossible:]");

    self->_cellularDataPossible = v3;
  }
}

- (void)setExpensive:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_isExpensive != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isExpensive changed from %d to %d"), self->_isExpensive, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setExpensive:]");

    self->_isExpensive = v3;
  }
}

- (void)setPathSatisfied:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_pathSatisfied != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pathSatisfied changed from %d to %d"), self->_pathSatisfied, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setPathSatisfied:]");

    v12 = MEMORY[0x24BDAC760];
    self->_pathSatisfied = v3;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __37__SUNetworkMonitor_setPathSatisfied___block_invoke;
    v14[3] = &unk_24CE3DED8;
    v14[4] = self;
    -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", v14);
  }
}

void __37__SUNetworkMonitor_setPathSatisfied___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "pathSatisficationStatusChangedTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 31));
      v4 = v6;
    }
  }

}

- (void)setPathConstrained:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_pathConstrained != v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pathConstrained changed from %d to %d"), self->_pathConstrained, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setPathConstrained:]");

    self->_pathConstrained = v3;
  }
}

- (void)setCurrentNetworkType:(int)a3
{
  unsigned int currentNetworkType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  _QWORD v18[5];
  int v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  currentNetworkType = self->_currentNetworkType;
  if (currentNetworkType != a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    SUStringFromNetworkType(currentNetworkType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SUStringFromNetworkType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Network type changed from %@ to %@"), v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUNetworkMonitor setCurrentNetworkType:]");

    v16 = self->_currentNetworkType;
    self->_currentNetworkType = a3;
    if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __42__SUNetworkMonitor_setCurrentNetworkType___block_invoke;
      v18[3] = &unk_24CE3DF00;
      v19 = v16;
      v18[4] = self;
      -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", v18);
    }
  }
}

void __42__SUNetworkMonitor_setCurrentNetworkType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "networkChangedFromNetworkType:toNetworkType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 20));
      v4 = v6;
    }
  }

}

- (void)setCurrentCellularType:(int)a3
{
  unsigned int currentCellularType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  _QWORD v18[5];
  int v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  currentCellularType = self->_currentCellularType;
  if (currentCellularType != a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    SUStringFromNetworkType(currentCellularType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SUStringFromNetworkType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Cellular type changed from %@ to %@"), v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[SUNetworkMonitor] %s: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUNetworkMonitor setCurrentCellularType:]");

    v16 = self->_currentCellularType;
    self->_currentCellularType = a3;
    if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __43__SUNetworkMonitor_setCurrentCellularType___block_invoke;
      v18[3] = &unk_24CE3DF00;
      v19 = v16;
      v18[4] = self;
      -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", v18);
    }
  }
}

void __43__SUNetworkMonitor_setCurrentCellularType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "cellularChangedFromCellularType:toCellularType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
      v4 = v6;
    }
  }

}

- (void)_carrierBundleChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
    -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", &__block_literal_global_83);
}

void __41__SUNetworkMonitor__carrierBundleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "carrierBundleChanged");
      v3 = v5;
    }
  }

}

- (void)_operatorBundleChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (!-[SUNetworkMonitor _overriddenByPreferences](self, "_overriddenByPreferences"))
    -[SUNetworkMonitor _runOnAllObservers:](self, "_runOnAllObservers:", &__block_literal_global_86);
}

void __42__SUNetworkMonitor__operatorBundleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "operatorBundleChanged");
      v3 = v5;
    }
  }

}

+ (BOOL)holdsWiFiAssertion
{
  return __assertionCount != 0;
}

+ (void)setHoldsWiFiAssertion:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;

  if (+[SUUtility isWiFiCapable](SUUtility, "isWiFiCapable"))
  {
    v4 = __assertionCount;
    if (a3)
    {
      v5 = 1;
    }
    else
    {
      if (!__assertionCount)
        goto LABEL_7;
      v5 = -1;
    }
    v4 = __assertionCount + v5;
    __assertionCount += v5;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WiFi background assertion count changed: %lu"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("[SUNetworkMonitor] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"+[SUNetworkMonitor setHoldsWiFiAssertion:]");

    if (__wifiManager)
    {
      v13 = __assertionCount != 0;
      if (WiFiManagerClientGetType() != v13)
        WiFiManagerClientSetType();
    }
    else
    {
      __wifiManager = WiFiManagerClientCreate();
    }
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5;
  NSObject *ctQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUNetworkMonitor *v10;

  v5 = a4;
  ctQueue = self->_ctQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SUNetworkMonitor_displayStatusChanged_status___block_invoke;
  v8[3] = &unk_24CE3B610;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(ctQueue, v8);

}

uint64_t __48__SUNetworkMonitor_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "registrationDisplayStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C68]);

  return objc_msgSend(*(id *)(a1 + 40), "setCellularRoaming:", v3);
}

- (void)operatorBundleChange:(id)a3
{
  NSObject *ctQueue;
  _QWORD block[5];

  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUNetworkMonitor_operatorBundleChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(ctQueue, block);
}

uint64_t __41__SUNetworkMonitor_operatorBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_operatorBundleChanged");
}

- (void)carrierBundleChange:(id)a3
{
  NSObject *ctQueue;
  _QWORD block[5];

  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUNetworkMonitor_carrierBundleChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(ctQueue, block);
}

uint64_t __40__SUNetworkMonitor_carrierBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_carrierBundleChanged");
}

- (void)internetDataStatus:(id)a3
{
  id v4;
  NSObject *ctQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ctQueue = self->_ctQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUNetworkMonitor_internetDataStatus___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ctQueue, v7);

}

uint64_t __39__SUNetworkMonitor_internetDataStatus___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentCellularType:", objc_msgSend(*(id *)(a1 + 32), "_networkTypeFromIndicator:", objc_msgSend(*(id *)(a1 + 40), "indicator")));
  return objc_msgSend(*(id *)(a1 + 32), "setCellularDataPossible:", objc_msgSend(*(id *)(a1 + 40), "cellularDataPossible"));
}

- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4
{
  NSObject *ctQueue;
  _QWORD v5[5];
  BOOL v6;

  ctQueue = self->_ctQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SUNetworkMonitor_dataRoamingSettingsChanged_status___block_invoke;
  v5[3] = &unk_24CE3BB60;
  v5[4] = self;
  v6 = a4;
  dispatch_async(ctQueue, v5);
}

uint64_t __54__SUNetworkMonitor_dataRoamingSettingsChanged_status___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDataRoamingEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)detectOverriddenNetwork
{
  NSObject *ctQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(ctQueue, block);
}

uint64_t __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  int v12;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v2 + 72);
  v3 = *(_DWORD *)(v2 + 76);
  v5 = *(unsigned __int8 *)(v2 + 80);
  result = objc_msgSend((id)v2, "_overriddenByPreferences");
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(a1 + 32);
    v7 = MEMORY[0x24BDAC760];
    if (v4 != *(_DWORD *)(result + 72))
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_2;
      v11[3] = &unk_24CE3DF00;
      v12 = v4;
      v11[4] = result;
      objc_msgSend((id)result, "_runOnAllObservers:", v11);
      result = *(_QWORD *)(a1 + 32);
    }
    if (v3 != *(_DWORD *)(result + 76))
    {
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_3;
      v9[3] = &unk_24CE3DF00;
      v10 = v3;
      v9[4] = result;
      objc_msgSend((id)result, "_runOnAllObservers:", v9);
      result = *(_QWORD *)(a1 + 32);
    }
    if (v5 != *(unsigned __int8 *)(result + 80))
    {
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_4;
      v8[3] = &unk_24CE3DED8;
      v8[4] = result;
      return objc_msgSend((id)result, "_runOnAllObservers:", v8);
    }
  }
  return result;
}

void __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "networkChangedFromNetworkType:toNetworkType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 72));
      v4 = v6;
    }
  }

}

void __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "cellularChangedFromCellularType:toCellularType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 76));
      v4 = v6;
    }
  }

}

void __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "cellularRoamingStatusChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80));
      v4 = v6;
    }
  }

}

- (OS_dispatch_queue)ctQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ctQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
