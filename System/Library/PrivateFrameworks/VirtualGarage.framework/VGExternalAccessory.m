@implementation VGExternalAccessory

- (void)setAccessoryUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryUpdateDelegate, a3);
}

- (void)listCarsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  VGExternalAccessory *v7;
  __CFString *v8;
  NSObject *workQueue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint8_t buf[4];
  __CFString *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2080;
    v17 = "-[VGExternalAccessory listCarsWithCompletion:]";
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__VGExternalAccessory_listCarsWithCompletion___block_invoke;
  block[3] = &unk_24C2FB5A0;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (VGExternalAccessory)init
{
  VGExternalAccessory *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *delegateQueue;
  uint64_t v10;
  NSMutableDictionary *trackedAccessoriesByConnectionId;
  void *v12;
  NSObject *v13;
  void *v14;
  int BOOL;
  NSObject *p_super;
  _BOOL4 v17;
  VGExternalAccessoryModelFilter *v18;
  objc_super v20;
  uint8_t buf[4];
  VGExternalAccessory *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)VGExternalAccessory;
  v2 = -[VGExternalAccessory init](&v20, sel_init);
  if (v2)
  {
    VGGetExternalAccessoryLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v22 = v2;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "[%{public}p] init: created new VGExternalAccessory", buf, 0xCu);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("VGExternalAccessory.WorkQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("VGExternalAccessory.DelegateQueue", v7);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    trackedAccessoriesByConnectionId = v2->_trackedAccessoriesByConnectionId;
    v2->_trackedAccessoriesByConnectionId = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__accessoryDidConnect_, *MEMORY[0x24BDC7BC8], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdateVehicle_, *MEMORY[0x24BDC7BE8], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__accessoryDidDisconnect_, *MEMORY[0x24BDC7BD0], 0);
    VGGetExternalAccessoryLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v22 = v2;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "[%{public}p] Registering for local accessory notifications", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForLocalNotifications");

    -[VGExternalAccessory _checkAvailableAccessoriesAndAttachIfNeeded](v2, "_checkAvailableAccessoriesAndAttachIfNeeded");
    BOOL = GEOConfigGetBOOL();
    VGGetExternalAccessoryLog();
    p_super = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_INFO);
    if (BOOL)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        v22 = v2;
        _os_log_impl(&dword_20A329000, p_super, OS_LOG_TYPE_INFO, "[%{public}p] Allowlisting enabled, will initialize model filter", buf, 0xCu);
      }

      v18 = objc_alloc_init(VGExternalAccessoryModelFilter);
      p_super = &v2->_modelFilter->super;
      v2->_modelFilter = v18;
    }
    else if (v17)
    {
      *(_DWORD *)buf = 134349056;
      v22 = v2;
      _os_log_impl(&dword_20A329000, p_super, OS_LOG_TYPE_INFO, "[%{public}p] Allowlisting disabled, will not initialize model filter", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  VGExternalAccessory *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VGGetExternalAccessoryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "[%{public}p] dealloc: deallocating accessory", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterForLocalNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)VGExternalAccessory;
  -[VGExternalAccessory dealloc](&v6, sel_dealloc);
}

- (void)_checkAvailableAccessoriesAndAttachIfNeeded
{
  void *v3;
  NSObject *workQueue;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__VGExternalAccessory__checkAvailableAccessoriesAndAttachIfNeeded__block_invoke;
  block[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__VGExternalAccessory__checkAvailableAccessoriesAndAttachIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  __int128 v27;
  uint64_t v28;
  id *WeakRetained;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "connectedAccessories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v31;
      *(_QWORD *)&v4 = 134349570;
      v27 = v4;
      do
      {
        v7 = 0;
        v28 = v5;
        do
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v2);
          v8 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * v7);
          v9 = -[__CFString _vg_supportsCarPlay](v8, "_vg_supportsCarPlay", v27);
          VGGetExternalAccessoryLog();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
          if (v9)
          {
            if (v11)
            {
              v12 = -[__CFString supportsCarPlay](v8, "supportsCarPlay");
              v13 = v6;
              v14 = CFSTR("YES");
              if (!v12)
                v14 = CFSTR("NO");
              v15 = v14;
              if (-[__CFString supportsWirelessCarPlay](v8, "supportsWirelessCarPlay"))
                v16 = CFSTR("YES");
              else
                v16 = CFSTR("NO");
              v17 = v16;
              if (-[__CFString supportsUSBCarPlay](v8, "supportsUSBCarPlay"))
                v18 = CFSTR("YES");
              else
                v18 = CFSTR("NO");
              v19 = v2;
              v20 = v18;
              *(_DWORD *)buf = 134350082;
              v35 = (const char *)WeakRetained;
              v36 = 2112;
              v37 = (uint64_t)v8;
              v38 = 2112;
              v39 = v15;
              v40 = 2112;
              v41 = v17;
              v42 = 2112;
              v43 = v20;
              _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "[%{public}p] init: will use accessory: %@ supportsCarPlay: %@, supportsWirelessCarPlay: %@. supportsUSBCarPlay: %@", buf, 0x34u);

              v2 = v19;
              v6 = v13;
              v5 = v28;

            }
            objc_msgSend(WeakRetained, "_addNewCarPlayAccessory:", v8);
          }
          else
          {
            if (v11)
            {
              *(_DWORD *)buf = v27;
              v35 = (const char *)WeakRetained;
              v36 = 2048;
              v37 = (uint64_t)v8;
              v38 = 2112;
              v39 = v8;
              _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "[%{public}p] init: skipping accessory as it doesn't support CarPlay: %p %@", buf, 0x20u);
            }

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      }
      while (v5);
    }

    VGGetExternalAccessoryLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(WeakRetained[3], "count");
      *(_DWORD *)buf = 134349312;
      v35 = (const char *)WeakRetained;
      v36 = 2048;
      v37 = v22;
      v23 = "[%{public}p] _checkCurrentAccessoriesAndAttachIfNeeded: currently connected to %lu CarPlay accessories";
      v24 = v21;
      v25 = OS_LOG_TYPE_INFO;
      v26 = 22;
LABEL_28:
      _os_log_impl(&dword_20A329000, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[VGExternalAccessory _checkAvailableAccessoriesAndAttachIfNeeded]_block_invoke";
      v36 = 1024;
      LODWORD(v37) = 268;
      v23 = "strongSelf went away in %s line %d";
      v24 = v21;
      v25 = OS_LOG_TYPE_ERROR;
      v26 = 18;
      goto LABEL_28;
    }
  }

}

- (void)_addNewCarPlayAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  VGExternalAccessory *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "connectionID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedAccessoriesByConnectionId, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      VGGetExternalAccessoryLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 134349570;
        v14 = self;
        v15 = 2112;
        v16 = v8;
        v17 = 2112;
        v18 = (uint64_t)v5;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "[%{public}p] _addNewCarPlayAccessory: trying to add an accessory, it is already tracked -> replacing, name: %@ key: %@", (uint8_t *)&v13, 0x20u);

      }
    }
    VGGetExternalAccessoryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134349570;
      v14 = self;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = (uint64_t)v5;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "[%{public}p] _addNewCarPlayAccessory: added a new accessory: %@ key: %@.", (uint8_t *)&v13, 0x20u);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedAccessoriesByConnectionId, "setObject:forKeyedSubscript:", v4, v5);
    objc_msgSend(v4, "getVehicleInfoData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessory _updateFromVehicleInfo:](self, "_updateFromVehicleInfo:", v11);

    objc_msgSend(v4, "vehicleInfoInitialData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessory _updateFromVehicleInfo:](self, "_updateFromVehicleInfo:", v12);
    goto LABEL_11;
  }
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134349570;
    v14 = self;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = objc_msgSend(v4, "connectionID");
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_FAULT, "[%{public}p] _addNewCarPlayAccessory: tried to add an accessory, but it has an invalid key. %@, %lu", (uint8_t *)&v13, 0x20u);
LABEL_11:

  }
}

- (void)_removeCarPlayAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  VGExternalAccessoryState *accessoryState;
  VGVehicleState *currentVehicleState;
  VGVehicle *currentVehicle;
  NSObject *v14;
  int v15;
  VGExternalAccessory *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "connectionID"))
  {
    VGGetExternalAccessoryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v15 = 134349570;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = objc_msgSend(v4, "connectionID");
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "[%{public}p] _removeCarPlayAccessory: tried to remove an accessory that has an invalid key. %@, %lu", (uint8_t *)&v15, 0x20u);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedAccessoriesByConnectionId, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VGGetExternalAccessoryLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 134349570;
      v16 = self;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = (uint64_t)v5;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] _removeCarPlayAccessory: tried to remove an accessory that was not tracked. %@, %@", (uint8_t *)&v15, 0x20u);

    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    v15 = 134349570;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = (uint64_t)v5;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "[%{public}p] _removeCarPlayAccessory: removing accessory with key. %@, %@", (uint8_t *)&v15, 0x20u);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_trackedAccessoriesByConnectionId, "removeObjectForKey:", v5);
  if (!-[NSMutableDictionary count](self->_trackedAccessoriesByConnectionId, "count"))
  {
    VGGetExternalAccessoryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 134349056;
      v16 = self;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "[%{public}p] _removeCarPlayAccessory: currently not tracking any accessories. clearing tracked vehicle state", (uint8_t *)&v15, 0xCu);
    }

    accessoryState = self->_accessoryState;
    self->_accessoryState = 0;

    currentVehicleState = self->_currentVehicleState;
    self->_currentVehicleState = 0;

    currentVehicle = self->_currentVehicle;
    self->_currentVehicle = 0;

    -[VGExternalAccessory _notifyDelegateWithCurrentVehicle](self, "_notifyDelegateWithCurrentVehicle");
  }
LABEL_14:

}

- (BOOL)_isAccessoryTracked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  int v11;
  VGExternalAccessory *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "connectionID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedAccessoriesByConnectionId, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    VGGetExternalAccessoryLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134349570;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 2048;
      v16 = objc_msgSend(v4, "connectionID");
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] _isAccessoryTracked: tried to check status of accessory with an invalid key. %@ %lu", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

- (void)_accessoryDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  VGExternalAccessory *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidConnect: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__VGExternalAccessory__accessoryDidConnect___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __44__VGExternalAccessory__accessoryDidConnect___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSObject *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC7BD8]);
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4 && (-[NSObject _vg_supportsCarPlay](v4, "_vg_supportsCarPlay") & 1) != 0)
    {
      VGGetExternalAccessoryLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        if (-[NSObject supportsCarPlay](v4, "supportsCarPlay"))
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        v7 = v6;
        if (-[NSObject supportsWirelessCarPlay](v4, "supportsWirelessCarPlay"))
          v8 = CFSTR("YES");
        else
          v8 = CFSTR("NO");
        v9 = v8;
        if (-[NSObject supportsUSBCarPlay](v4, "supportsUSBCarPlay"))
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        v11 = v10;
        v13 = 134350338;
        v14 = WeakRetained;
        v15 = 2048;
        v16 = v4;
        v17 = 2112;
        v18 = v4;
        v19 = 2112;
        v20 = v7;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidConnect: new accessory: %p, %@, supportsCarPlay: %@, supportsWirelessCarPlay: %@. supportsUSBCarPlay: %@", (uint8_t *)&v13, 0x3Eu);

      }
      objc_msgSend(WeakRetained, "_addNewCarPlayAccessory:", v4);
    }
    else
    {
      VGGetExternalAccessoryLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 134349570;
        v14 = WeakRetained;
        v15 = 2048;
        v16 = v4;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_ERROR, "[%{public}p] _accessoryDidConnect: received an unsupported accessory: %p, %@", (uint8_t *)&v13, 0x20u);
      }

    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[VGExternalAccessory _accessoryDidConnect:]_block_invoke";
      v15 = 1024;
      LODWORD(v16) = 352;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v13, 0x12u);
    }
  }

}

- (void)_accessoryDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  VGExternalAccessory *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__VGExternalAccessory__accessoryDidDisconnect___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __47__VGExternalAccessory__accessoryDidDisconnect___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  NSObject *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC7BD8]);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = -[NSObject _vg_supportsCarPlay](v4, "_vg_supportsCarPlay");
    VGGetExternalAccessoryLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if ((v5 & 1) != 0)
    {
      if (v7)
      {
        v9 = 134349314;
        v10 = WeakRetained;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: will disconnect a tracked accessory: %@", (uint8_t *)&v9, 0x16u);
      }

      objc_msgSend(WeakRetained, "_removeCarPlayAccessory:", v4);
    }
    else
    {
      if (v7)
      {
        -[NSObject name](v4, "name");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = 134349314;
        v10 = WeakRetained;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: disconnected accessory that is not tracked %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[VGExternalAccessory _accessoryDidDisconnect:]_block_invoke";
      v11 = 1024;
      LODWORD(v12) = 368;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }

}

- (void)_accessoryDidUpdateVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  VGExternalAccessory *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__VGExternalAccessory__accessoryDidUpdateVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __50__VGExternalAccessory__accessoryDidUpdateVehicle___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC7BD8]);
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4 && (-[NSObject _vg_supportsCarPlay](v4, "_vg_supportsCarPlay") & 1) == 0)
    {
      VGGetExternalAccessoryLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[NSObject name](v4, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134349314;
        v13 = WeakRetained;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: accessory %@ does not support CarPlay, ignoring update", (uint8_t *)&v12, 0x16u);

      }
    }
    else
    {
      VGGetExternalAccessoryLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[NSObject name](v4, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134349570;
        v13 = WeakRetained;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: received a vehicle update update for accessory %@ with userInfo: %@", (uint8_t *)&v12, 0x20u);

      }
      if (v4 && (objc_msgSend(WeakRetained, "_isAccessoryTracked:", v4) & 1) == 0)
      {
        VGGetExternalAccessoryLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          -[NSObject name](v4, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 134349314;
          v13 = WeakRetained;
          v14 = 2112;
          v15 = v9;

        }
        objc_msgSend(WeakRetained, "_addNewCarPlayAccessory:", v4);
      }
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateFromVehicleInfo:", v10);
    }

  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[VGExternalAccessory _accessoryDidUpdateVehicle:]_block_invoke";
      v14 = 1024;
      LODWORD(v15) = 384;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v12, 0x12u);
    }
  }

}

- (void)_updateFromVehicleInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *workQueue;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  VGExternalAccessory *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _updateFromVehicleInfo: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__VGExternalAccessory__updateFromVehicleInfo___block_invoke;
    v8[3] = &unk_24C2FB3C8;
    objc_copyWeak(&v10, (id *)buf);
    v9 = v4;
    dispatch_async(workQueue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v12 = self;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "[%{public}p] _updateFromVehicleInfo: tried to update from a nil vehicleInfo.", buf, 0xCu);
    }

  }
}

void __46__VGExternalAccessory__updateFromVehicleInfo___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  VGExternalAccessoryState *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[4];
    if (!v4)
    {
      v5 = objc_alloc_init(VGExternalAccessoryState);
      v6 = (void *)*((_QWORD *)v3 + 4);
      *((_QWORD *)v3 + 4) = v5;

      v4 = (void *)*((_QWORD *)v3 + 4);
    }
    objc_msgSend(v4, "_updateWithVehicleInfo:", *(_QWORD *)(a1 + 32));
    VGGetExternalAccessoryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *((_QWORD *)v3 + 4);
      v9 = *(_QWORD *)(a1 + 32);
      v17 = 134349570;
      v18 = (const char *)v3;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "[%{public}p] _updateFromVehicleInfo: did update accessoryState: %@ from vehicleInfo: %@", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(v3, "_vehicleStateForCurrentState");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = v10;

    objc_msgSend(v3, "_vehicleForCurrentState");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v3 + 6);
    *((_QWORD *)v3 + 6) = v12;

    objc_msgSend(*((id *)v3 + 6), "_updateWithVehicleState:", *((_QWORD *)v3 + 5));
    VGGetExternalAccessoryLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *((_QWORD *)v3 + 6);
      v17 = 134349314;
      v18 = (const char *)v3;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_INFO, "[%{public}p] updated _currentVehicle: %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v3, "_notifyDelegateWithCurrentVehicle");
  }
  else
  {
    VGGetVirtualGarageLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[VGExternalAccessory _updateFromVehicleInfo:]_block_invoke";
      v19 = 1024;
      LODWORD(v20) = 411;
      _os_log_impl(&dword_20A329000, v16, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v17, 0x12u);
    }

  }
}

- (void)_notifyDelegateWithCurrentVehicle
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  VGExternalAccessory *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  VGGetExternalAccessoryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v13 = self;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "[%{public}p] _notifyDelegateWithCurrentVehicle", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[VGExternalAccessory accessoryUpdateDelegate](self, "accessoryUpdateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = (void *)-[VGVehicle copy](self->_currentVehicle, "copy");
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__VGExternalAccessory__notifyDelegateWithCurrentVehicle__block_invoke;
    v9[3] = &unk_24C2FB3C8;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v6;
    v8 = v6;
    dispatch_async(delegateQueue, v9);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak((id *)buf);
}

void __56__VGExternalAccessory__notifyDelegateWithCurrentVehicle__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "accessoryUpdateDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      VGGetExternalAccessoryLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v9 = 134349314;
        v10 = v3;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "[%{public}p] notifying delegate with vehicle: %@", (uint8_t *)&v9, 0x16u);
      }

      -[NSObject accessoryUpdatedWithVehicle:](v5, "accessoryUpdatedWithVehicle:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      VGGetVirtualGarageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[VGExternalAccessory _notifyDelegateWithCurrentVehicle]_block_invoke";
        v11 = 1024;
        LODWORD(v12) = 434;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", (uint8_t *)&v9, 0x12u);
      }

      v5 = 0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[VGExternalAccessory _notifyDelegateWithCurrentVehicle]_block_invoke";
      v11 = 1024;
      LODWORD(v12) = 433;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }

}

- (id)_vehicleForCurrentState
{
  VGVehicle *v3;
  void *v4;
  void *v5;
  VGVehicle *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (-[VGExternalAccessory _currentStatePassesEVRoutingRequirements](self, "_currentStatePassesEVRoutingRequirements"))
  {
    v3 = [VGVehicle alloc];
    -[VGExternalAccessoryState name](self->_accessoryState, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "copy");
    -[VGExternalAccessoryState year](self->_accessoryState, "year");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState manufacturer](self->_accessoryState, "manufacturer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v23, "copy");
    -[VGExternalAccessoryState model](self->_accessoryState, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "copy");
    -[VGExternalAccessoryState colorHex](self->_accessoryState, "colorHex");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_24C2FC068);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length") == 6)
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("ff"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    -[VGExternalAccessory _identifier](self, "_identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v18, "copy");
    -[VGExternalAccessory _bluetoothIdentifier](self, "_bluetoothIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v17, "copy");
    -[VGExternalAccessoryState supportedConnectors](self->_accessoryState, "supportedConnectors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    v11 = v10 & 0x128 | (v10 >> 2) & 1 | (2 * (v10 & 3)) & 0x7F | (v10 >> 2) & 0x10 | (v10 >> 1) & 0x40 | (((v10 >> 4) & 1) << 7);
    -[VGExternalAccessoryState powerByConnector](self->_accessoryState, "powerByConnector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    v6 = -[VGVehicle initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:](v3, "initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:", v26, v25, v22, v20, v5, v7, v8, v11, v13);

    -[VGExternalAccessory _identifier](self, "_identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[VGVehicle setIapIdentifier:](v6, "setIapIdentifier:", v15);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_vehicleStateForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  VGVehicleState *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VGVehicleState *v20;
  void *v21;
  void *v22;

  if (-[VGExternalAccessory _currentStatePassesEVRoutingRequirements](self, "_currentStatePassesEVRoutingRequirements"))
  {
    v20 = [VGVehicleState alloc];
    -[VGExternalAccessory _identifier](self, "_identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState batteryCharge](self->_accessoryState, "batteryCharge");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState currentEVRange](self->_accessoryState, "currentEVRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState maxEVRange](self->_accessoryState, "maxEVRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState minBatteryCapacity](self->_accessoryState, "minBatteryCapacity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState currentBatteryCapacity](self->_accessoryState, "currentBatteryCapacity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState maxBatteryCapacity](self->_accessoryState, "maxBatteryCapacity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessoryState consumptionArguments](self->_accessoryState, "consumptionArguments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v17, "copy");
    -[VGExternalAccessoryState chargingArguments](self->_accessoryState, "chargingArguments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v15, "copy");
    v7 = -[VGExternalAccessoryState isCharging](self->_accessoryState, "isCharging");
    -[VGExternalAccessoryState activeConnector](self->_accessoryState, "activeConnector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    LOBYTE(v12) = v7;
    v10 = -[VGVehicleState initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:](v20, "initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:", v16, v3, 1, v21, v19, v18, v14, v13, v4, v5, v6, v12, v9 & 0x128 | (v9 >> 2) & 1 | (2 * (v9 & 3)) & 0x7F | (v9 >> 2) & 0x10 | (v9 >> 1) & 0x40 | (((v9 >> 4) & 1) << 7));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)_currentStatePassesEVRoutingRequirements
{
  void *v3;
  VGExternalAccessoryState *accessoryState;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  VGExternalAccessory *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  LODWORD(v3) = -[VGExternalAccessory _isConnectedToElectricVehicle](self, "_isConnectedToElectricVehicle");
  if ((_DWORD)v3)
  {
    -[VGExternalAccessory _identifier](self, "_identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      accessoryState = self->_accessoryState;

      if (accessoryState)
      {
        if (-[VGExternalAccessory _isConnectedVehicleAllowlisted](self, "_isConnectedVehicleAllowlisted"))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        VGGetExternalAccessoryLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          -[VGExternalAccessoryState consumptionArguments](self->_accessoryState, "consumptionArguments");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessory _modelIdFromArguments:](self, "_modelIdFromArguments:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessoryState chargingArguments](self->_accessoryState, "chargingArguments");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessory _modelIdFromArguments:](self, "_modelIdFromArguments:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessory _firmwareId](self, "_firmwareId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessoryState year](self->_accessoryState, "year");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGExternalAccessoryState model](self->_accessoryState, "model");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 134350338;
          v15 = self;
          v16 = 2112;
          v17 = v7;
          v18 = 2112;
          v19 = v9;
          v20 = 2112;
          v21 = v10;
          v22 = 2112;
          v23 = v11;
          v24 = 2112;
          v25 = v12;
          _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "[%{public}p] Connected vehicle is not allowlisted. consumption modelId: %@, charging modelId: %@, firmwareId: %@, year: %@, model: %@", (uint8_t *)&v14, 0x3Eu);

        }
      }
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)_modelIdFromArguments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  VGExternalAccessory *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGDictionaryFromVGVehicleArguments(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    VGGetExternalAccessoryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_FAULT, "[%{public}p] Failed to parse arguments: %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_9;
  }
  GEOConfigGetString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    VGGetExternalAccessoryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_FAULT, "[%{public}p] Failed to parse model id from arguments: %@", (uint8_t *)&v11, 0x16u);
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v7 = v7;
  v8 = v7;
LABEL_10:

  return v8;
}

- (BOOL)_isConnectedVehicleAllowlisted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VGExternalAccessoryModelFilter *modelFilter;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  VGExternalAccessoryModelFilter *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  VGExternalAccessory *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (GEOConfigGetBOOL())
  {
    -[VGExternalAccessoryState consumptionArguments](self->_accessoryState, "consumptionArguments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessory _modelIdFromArguments:](self, "_modelIdFromArguments:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[VGExternalAccessoryState chargingArguments](self->_accessoryState, "chargingArguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGExternalAccessory _modelIdFromArguments:](self, "_modelIdFromArguments:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && v6)
    {
      modelFilter = self->_modelFilter;
      -[VGExternalAccessory _firmwareId](self, "_firmwareId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGExternalAccessoryState year](self->_accessoryState, "year");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGExternalAccessoryState model](self->_accessoryState, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VGExternalAccessoryModelFilter allowsVehicleWithModelId:firmwareId:year:model:](modelFilter, "allowsVehicleWithModelId:firmwareId:year:model:", v4, v8, v9, v10);

      v12 = self->_modelFilter;
      -[VGExternalAccessory _firmwareId](self, "_firmwareId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGExternalAccessoryState year](self->_accessoryState, "year");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGExternalAccessoryState model](self->_accessoryState, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[VGExternalAccessoryModelFilter allowsVehicleWithModelId:firmwareId:year:model:](v12, "allowsVehicleWithModelId:firmwareId:year:model:", v6, v13, v14, v15);

      if (v11 && v16)
      {
        v17 = 1;
LABEL_13:

        return v17;
      }
      VGGetExternalAccessoryLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 134349056;
        v23 = self;
        _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_ERROR, "[%{public}p] Currently connected vehicle is an EV, but does is not allow listed. Onboarding won't be allowed", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      VGGetExternalAccessoryLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        -[VGExternalAccessoryState consumptionArguments](self->_accessoryState, "consumptionArguments");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VGExternalAccessoryState chargingArguments](self->_accessoryState, "chargingArguments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134349570;
        v23 = self;
        v24 = 2112;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_FAULT, "[%{public}p] Vehicle does not have valid consumption or charging arguments. consumption: %@, charging: %@", (uint8_t *)&v22, 0x20u);

      }
    }

    v17 = 0;
    goto LABEL_13;
  }
  return 1;
}

- (BOOL)_isConnectedToElectricVehicle
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[VGExternalAccessory _isConnectedToCarPlayAccessory](self, "_isConnectedToCarPlayAccessory"))
    return 0;
  -[VGExternalAccessoryState consumptionArguments](self->_accessoryState, "consumptionArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[VGExternalAccessoryState chargingArguments](self->_accessoryState, "chargingArguments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isConnectedToCarPlayAccessory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  -[NSMutableDictionary allValues](self->_trackedAccessoriesByConnectionId, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isConnected") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_identifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[NSMutableDictionary allValues](self->_trackedAccessoriesByConnectionId, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      v4 = CFSTR("CarDisplaySim");
    }
    else
    {
      objc_msgSend(v3, "serialNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CFString *)objc_msgSend(v5, "copy");

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_bluetoothIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[NSMutableDictionary allValues](self->_trackedAccessoriesByConnectionId, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      v4 = CFSTR("CarDisplaySim");
    }
    else
    {
      objc_msgSend(v3, "macAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CFString *)objc_msgSend(v5, "copy");

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_firmwareId
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[NSMutableDictionary allValues](self->_trackedAccessoriesByConnectionId, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      v4 = CFSTR("CarDisplaySimFirmware");
    }
    else
    {
      objc_msgSend(v3, "firmwareRevision");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CFString *)objc_msgSend(v5, "copy");

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectedToVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  VGExternalAccessory *v7;
  __CFString *v8;
  NSObject *workQueue;
  id v10;
  char v11;
  _QWORD block[5];
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VGExternalAccessory isConnectedToVehicle:]";
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VGExternalAccessory_isConnectedToVehicle___block_invoke;
  block[3] = &unk_24C2FB550;
  v14 = v4;
  v15 = buf;
  block[4] = self;
  v10 = v4;
  dispatch_sync(workQueue, block);
  v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __44__VGExternalAccessory_isConnectedToVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isConnectedToCarPlayAccessory"))
  {
    objc_msgSend(*(id *)(a1 + 40), "iapIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v5 = v2;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "iapIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "iapIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "isEqualToString:", v4);

      v2 = v5;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)isConnectedToAccessoryWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  VGExternalAccessory *v7;
  __CFString *v8;
  NSObject *workQueue;
  id v10;
  char v11;
  _QWORD block[5];
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetExternalAccessoryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VGExternalAccessory isConnectedToAccessoryWithIdentifier:]";
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__VGExternalAccessory_isConnectedToAccessoryWithIdentifier___block_invoke;
  block[3] = &unk_24C2FB550;
  v14 = v4;
  v15 = buf;
  block[4] = self;
  v10 = v4;
  dispatch_sync(workQueue, block);
  v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __60__VGExternalAccessory_isConnectedToAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isConnectedToCarPlayAccessory") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_identifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  VGExternalAccessory *v10;
  __CFString *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VGGetExternalAccessoryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = self;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2080;
    v22 = "-[VGExternalAccessory getStateOfChargeForVehicle:completion:]";
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__VGExternalAccessory_getStateOfChargeForVehicle_completion___block_invoke;
  block[3] = &unk_24C2FB578;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v6;
  v17 = v7;
  v13 = v6;
  v14 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __61__VGExternalAccessory_getStateOfChargeForVehicle_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[5] && objc_msgSend(WeakRetained[3], "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "iapIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3[5], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqualToString:", v5);

      if ((v6 & 1) != 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
      v12 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, -13, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      VGGetExternalAccessoryLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v3[5];
        v16 = 134349570;
        v17 = (const char *)v3;
        v18 = 2112;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] SoC requested for %@ but the currently connected vehicle is %@", (uint8_t *)&v16, 0x20u);

      }
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -11, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      VGGetExternalAccessoryLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v16 = 134349056;
        v17 = (const char *)v3;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] Either accessory is not connected or we don't have any _currentVehicleState yet.", (uint8_t *)&v16, 0xCu);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  VGGetVirtualGarageLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[VGExternalAccessory getStateOfChargeForVehicle:completion:]_block_invoke";
    v18 = 1024;
    LODWORD(v19) = 655;
    _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v16, 0x12u);
  }

LABEL_14:
}

void __46__VGExternalAccessory_listCarsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (char *)WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 6) && objc_msgSend(*((id *)WeakRetained + 3), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v9 = *((_QWORD *)v3 + 6);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
      v5 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, NSObject *, _QWORD))(v4 + 16))(v4, v5, 0);
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -11, 0);
      v5 = objc_claimAutoreleasedReturnValue();

      VGGetExternalAccessoryLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v11 = v3;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] Either accessory is not connected or we don't have any _currentVehicleState yet.", buf, 0xCu);
      }

      (*(void (**)(_QWORD, _QWORD, NSObject *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[VGExternalAccessory listCarsWithCompletion:]_block_invoke";
      v12 = 1024;
      v13 = 677;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

- (VGExternalAccessoryUpdating)accessoryUpdateDelegate
{
  return (VGExternalAccessoryUpdating *)objc_loadWeakRetained((id *)&self->_accessoryUpdateDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryUpdateDelegate);
  objc_storeStrong((id *)&self->_modelFilter, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);
  objc_storeStrong((id *)&self->_trackedAccessoriesByConnectionId, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
