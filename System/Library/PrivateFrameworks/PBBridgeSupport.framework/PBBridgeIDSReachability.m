@implementation PBBridgeIDSReachability

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PBBridgeIDSReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_object;
}

void __31__PBBridgeIDSReachability_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id v6;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.pbbridge.connectivity"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[2], "pb_mineTinkerDevices");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_processDevices:", v6);

}

- (void)_processDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "nrDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSReachability getDeviceStatusChangeFromIDSDevices:nrDevices:](self, "getDeviceStatusChangeFromIDSDevices:nrDevices:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    pbb_bridge_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "IDSDevice status change: %@", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)-[NSMutableOrderedSet copy](self->_observers, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "fireReachability:deviceStatus:devices:", self, v6, v5, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)getDeviceStatusChangeFromIDSDevices:(id)a3 nrDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  PBBridgeIDSReachabilityStatusObject *v11;
  id *p_activeDeviceStatus;
  PBBridgeIDSReachabilityStatusObject *activeDeviceStatus;
  BOOL v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  PBBridgeIDSReachabilityStatusObject *v19;
  void *v20;
  PBBridgeIDSReachabilityStatusObject *v21;
  PBBridgeIDSReachabilityStatusObject *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "deviceStatusFromIDSDevices:nrDevices:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  activeDeviceStatus = self->_activeDeviceStatus;
  p_activeDeviceStatus = (id *)&self->_activeDeviceStatus;
  v11 = activeDeviceStatus;
  if (activeDeviceStatus)
  {
    if (v8)
    {
      v14 = -[PBBridgeIDSReachabilityStatusObject isEqual:](v11, "isEqual:", v8);
      v15 = *p_activeDeviceStatus;
      if (v14)
      {
        v16 = objc_msgSend(*p_activeDeviceStatus, "reachability");
        if (v16 != objc_msgSend(v8, "reachability"))
        {
          objc_storeStrong(p_activeDeviceStatus, v8);
          v17 = *p_activeDeviceStatus;
          v18 = v9;
LABEL_8:
          objc_msgSend(v18, "addObject:", v17);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      v22 = v8;
      v23 = *p_activeDeviceStatus;
      *p_activeDeviceStatus = v22;
      v19 = (PBBridgeIDSReachabilityStatusObject *)v15;

      -[PBBridgeIDSReachabilityStatusObject setReachability:](v19, "setReachability:", 0);
      objc_msgSend(v9, "addObject:", v19);
      v20 = v9;
      v21 = v22;
    }
    else
    {
      *p_activeDeviceStatus = 0;
      v19 = v11;

      -[PBBridgeIDSReachabilityStatusObject setReachability:](v19, "setReachability:", 0);
      v20 = v9;
      v21 = v19;
    }
    objc_msgSend(v20, "addObject:", v21);

    goto LABEL_12;
  }
  if (v8)
  {
    objc_storeStrong(p_activeDeviceStatus, v8);
    v18 = v9;
    v17 = v8;
    goto LABEL_8;
  }
LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

+ (id)deviceStatusFromIDSDevices:(id)a3 nrDevices:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isDefaultPairedDevice", (_QWORD)v17))
        break;
      if (v8 == (void *)++v10)
      {
        v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if (!objc_msgSend(v11, "isNearby"))
      goto LABEL_17;
    objc_msgSend(v11, "nsuuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_18;
    objc_msgSend(v11, "nsuuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v11, "nsuuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIdsDeviceID:", v14);

      if (objc_msgSend(v11, "isConnected"))
        v15 = 2;
      else
        v15 = 1;
      objc_msgSend(v8, "setReachability:", v15);
    }
    else
    {
LABEL_17:
      v8 = 0;
    }
  }
LABEL_18:

  return v8;
}

void __41__PBBridgeIDSReachability_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_object;
  sharedInstance_object = (uint64_t)v1;

}

- (PBBridgeIDSReachability)init
{
  PBBridgeIDSReachability *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableOrderedSet *observers;
  NSObject *v8;
  _QWORD block[4];
  PBBridgeIDSReachability *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)PBBridgeIDSReachability;
  v2 = -[PBBridgeIDSReachability init](&v12, sel_init);
  if (v2)
  {
    pbb_bridge_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v14 = "-[PBBridgeIDSReachability init]";
      _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.bridge.COSIDSReachability.ids", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableOrderedSet *)v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__PBBridgeIDSReachability_init__block_invoke;
    block[3] = &unk_24CBBE1E0;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  PBBridgeIDSReachabilityStatusObject *v9;
  NSObject *queue;
  _QWORD block[5];
  id v12;
  PBBridgeIDSReachabilityStatusObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_bridge_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v15 = "-[PBBridgeIDSReachability addObserver:]";
    v16 = 2112;
    v17 = v7;
    v18 = 2048;
    v19 = v4;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s %@[%p]", buf, 0x20u);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObserver:", v4);
  os_unfair_lock_lock(&self->_lock);
  v9 = self->_activeDeviceStatus;
  -[NSMutableOrderedSet addObject:](self->_observers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PBBridgeIDSReachability_addObserver___block_invoke;
    block[3] = &unk_24CBBE880;
    block[4] = self;
    v12 = v8;
    v13 = v9;
    dispatch_async(queue, block);

  }
}

+ (id)nrDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  PBGetSetupCompletedDevicesWeShouldList();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "bluetoothIdentifier", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "deviceForBluetoothID:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)reachabilityForDevice:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  int v7;
  unint64_t v8;

  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x24BE6B510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PBBridgeIDSReachabilityStatusObject idsDeviceID](self->_activeDeviceStatus, "idsDeviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if (v7)
      v8 = -[PBBridgeIDSReachabilityStatusObject reachability](self->_activeDeviceStatus, "reachability");
    else
      v8 = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __39__PBBridgeIDSReachability_addObserver___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "nrDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v2 = (void *)a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireReachability:deviceStatus:devices:", v3, v4, v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_bridge_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "-[PBBridgeIDSReachability removeObserver:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)-[NSMutableOrderedSet copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "observer");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "observer");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 != v4)
            continue;
        }
        -[NSMutableOrderedSet removeObject:](self->_observers, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[PBBridgeIDSReachability service:nearbyDevicesChanged:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeIDSReachability _processDevices:](self, "_processDevices:", v7);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[PBBridgeIDSReachability service:connectedDevicesChanged:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeIDSReachability _processDevices:](self, "_processDevices:", v7);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[PBBridgeIDSReachability service:activeAccountsChanged:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeIDSReachability _processDevices:](self, "_processDevices:", v7);
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[PBBridgeIDSReachability service:linkedDevicesChanged:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeIDSReachability _processDevices:](self, "_processDevices:", v7);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[PBBridgeIDSReachability service:devicesChanged:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeIDSReachability _processDevices:](self, "_processDevices:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reachabilityService, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
