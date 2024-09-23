@implementation PSYSyncCoordinator

- (void)setDelegate:(id)a3
{
  -[PSYSyncCoordinator setDelegate:queue:](self, "setDelegate:queue:", a3, 0);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id obj;

  obj = a4;
  if (!obj)
  {
    obj = (id)MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
  }
  v7 = a3;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v7);

  objc_storeStrong((id *)&self->_delegateQueue, obj);
  if (!self->_hasStartedListening)
  {
    -[NSXPCListener resume](self->_listener, "resume");
    self->_hasStartedListening = 1;
  }
  pthread_mutex_unlock(&self->_delegateLock);

}

uint64_t __37__PSYSyncCoordinator_syncRestriction__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_syncRestriction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_syncRestriction
{
  void *v3;
  void *v4;
  BOOL v5;
  unint64_t syncIDOfStartedSync;
  unint64_t v7;
  void *v9;
  uint64_t v10;

  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && ((v5 = -[PSYSyncCoordinator _pairedSyncFinishedMigrationSyncWithPairingID:](self, "_pairedSyncFinishedMigrationSyncWithPairingID:", v4), syncIDOfStartedSync = self->_syncIDOfStartedSync, v5)|| syncIDOfStartedSync))
  {
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "switchIndex");

    if (syncIDOfStartedSync == v10)
      v7 = 0;
    else
      v7 = -[PSYSyncCoordinator _pairedSyncFinishedReunionSync](self, "_pairedSyncFinishedReunionSync") ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)syncRestriction
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__PSYSyncCoordinator_syncRestriction__block_invoke;
  v5[3] = &unk_24C5E5018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (PSYSyncCoordinator)syncCoordinatorWithServiceName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (syncCoordinatorWithServiceName__onceToken != -1)
    dispatch_once(&syncCoordinatorWithServiceName__onceToken, &__block_literal_global_0);
  pthread_mutex_lock(&__serviceLock);
  objc_msgSend((id)syncCoordinatorWithServiceName____listeners, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceName:", v4);
      if (v6)
        objc_msgSend((id)syncCoordinatorWithServiceName____listeners, "setObject:forKey:", v6, v4);
    }
  }
  pthread_mutex_unlock(&__serviceLock);

  return (PSYSyncCoordinator *)v6;
}

- (PSYSyncCoordinator)initWithServiceName:(id)a3
{
  id v4;
  void *v5;
  PSYSyncCoordinator *v6;

  v4 = a3;
  PSYGetClientListDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PSYSyncCoordinator initWithServiceName:serviceLookupPath:](self, "initWithServiceName:serviceLookupPath:", v4, v5);

  return v6;
}

- (PSYSyncCoordinator)initWithServiceName:(id)a3 serviceLookupPath:(id)a4
{
  id v6;
  id v7;
  PSYSyncCoordinator *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  NSString *serviceName;
  uint64_t v19;
  PSYSyncCoordinator *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSXPCListener *listener;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  PSYSyncCoordinator *v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PSYSyncCoordinator;
  v8 = -[PSYSyncCoordinator init](&v36, sel_init);
  if (v8)
  {
    psy_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      psy_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[PSYSyncCoordinator initWithServiceName:serviceLookupPath:]";
        v39 = 2114;
        v40 = v6;
        _os_log_impl(&dword_20CFE4000, v11, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
      }

    }
    v8->_syncSwitchIDToken = -1;
    objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("plist"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSYActivityInfo activityWithPlist:](PSYActivityInfo, "activityWithPlist:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_syncRestriction = 1;
    objc_initWeak((id *)buf, v8);
    if (v14)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v28 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create("com.apple.pairedsync.coordinator", v28);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v15;

      objc_storeStrong((id *)&v8->_delegateQueue, MEMORY[0x24BDAC9B8]);
      v17 = objc_msgSend(v6, "copy");
      serviceName = v8->_serviceName;
      v8->_serviceName = (NSString *)v17;

      v19 = MEMORY[0x24BDAC760];
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke;
      v33[3] = &unk_24C5E5220;
      objc_copyWeak(&v35, (id *)buf);
      v20 = v8;
      v34 = v20;
      v21 = (void *)MEMORY[0x212B9AF40](v33);
      v30[0] = v19;
      v30[1] = 3221225472;
      v30[2] = __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke_2;
      v30[3] = &unk_24C5E5248;
      objc_copyWeak(&v32, (id *)buf);
      v22 = v21;
      v31 = v22;
      v8->_syncSwitchIDToken = -[PSYSyncCoordinator registerNotifyTokenWithName:withBlock:](v20, "registerNotifyTokenWithName:withBlock:", CFSTR("com.apple.pairedsync.lastsyncswitchid"), v30);
      -[PSYSyncCoordinator _registerMonitorAllNRDevicesForMigrationChanges:](v20, "_registerMonitorAllNRDevicesForMigrationChanges:", v22);
      +[PSYRegistrySingleton addDelegate:](PSYRegistrySingleton, "addDelegate:", v20);
      pthread_mutex_init(&v20->_delegateLock, 0);
      v23 = objc_alloc(MEMORY[0x24BDD1998]);
      objc_msgSend(v14, "machServiceName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "initWithMachServiceName:", v24);
      listener = v20->_listener;
      v20->_listener = (NSXPCListener *)v25;

      -[NSXPCListener setDelegate:](v20->_listener, "setDelegate:", v20);
      objc_destroyWeak(&v32);

      objc_destroyWeak(&v35);
    }
    else
    {

      NSLog(CFSTR("Error: Could not create service from plist at path: %@. Returning nil PSYSyncCoordinator for service name %@.  Please check that your plist exists and is in the correct format."), v12, v6);
      v20 = 0;
    }
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  const char *v11;
  uint32_t v12;
  uint32_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  int out_token;
  uint8_t buf[4];
  uint32_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  out_token = -1;
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  if (v9)
    v12 = notify_register_dispatch(v11, &out_token, v8, v9);
  else
    v12 = notify_register_check(v11, &out_token);
  v13 = v12;
  if (v12)
  {
    psy_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      psy_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v21 = v13;
        v22 = 2114;
        v23 = v10;
        _os_log_impl(&dword_20CFE4000, v16, OS_LOG_TYPE_DEFAULT, "notify_register call failed with state: (%u) for %{public}@", buf, 0x12u);
      }

    }
  }
  v17 = out_token;

  return v17;
}

- (int)registerNotifyTokenWithName:(id)a3 withBlock:(id)a4
{
  return -[PSYSyncCoordinator registerNotifyTokenWithName:withQueue:withBlock:](self, "registerNotifyTokenWithName:withQueue:withBlock:", a3, self->_queue, a4);
}

- (void)_registerMonitorAllNRDevicesForMigrationChanges:(id)a3
{
  void *v4;
  id migrationChangeBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  migrationChangeBlock = self->_migrationChangeBlock;
  self->_migrationChangeBlock = v4;

}

void __53__PSYSyncCoordinator_syncCoordinatorWithServiceName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)syncCoordinatorWithServiceName____listeners;
  syncCoordinatorWithServiceName____listeners = (uint64_t)v0;

}

void __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "_syncRestriction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_syncRestrictionDidUpdate:forServiceName:", v4, v5[20]);

    WeakRetained = v5;
  }

}

void __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "_syncRestriction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_syncRestrictionDidUpdate:forServiceName:", v3, v4[20]);

    objc_msgSend(v4, "_registerMonitorAllNRDevicesForMigrationChanges:", *(_QWORD *)(a1 + 32));
    WeakRetained = v4;
  }

}

- (unint64_t)readNotifyToken:(int)a3
{
  uint64_t state64;

  if (a3 == -1)
    return 0;
  state64 = 0;
  if (notify_get_state(a3, &state64))
    return 0;
  else
    return state64;
}

- (void)_unregisterNRDeviceMonitors
{
  id migrationChangeBlock;

  migrationChangeBlock = self->_migrationChangeBlock;
  self->_migrationChangeBlock = 0;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  PSYSyncCoordinator *v20;
  id v21;
  _BYTE location[12];
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.pairedsync.scheduler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    PSYActivityXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", self);
    PSYActivityProgressXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11);

    objc_initWeak((id *)location, self);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke;
    v19 = &unk_24C5E5270;
    v20 = self;
    objc_copyWeak(&v21, (id *)location);
    objc_msgSend(v7, "setInvalidationHandler:", &v16);
    objc_storeStrong((id *)&self->_connection, a4);
    objc_msgSend(v7, "resume", v16, v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    psy_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      psy_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v7;
        v23 = 2112;
        v24 = CFSTR("com.apple.pairedsync.scheduler");
        _os_log_impl(&dword_20CFE4000, v14, OS_LOG_TYPE_DEFAULT, "Dropping connection %{public}@ because it's missing the entitlement for %@", location, 0x16u);
      }

    }
  }

  return v9;
}

void __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_24C5E5130;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

  psd_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    psd_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "Connection to pairedsyncd lost, invalidating sync session", v7, 2u);
    }

  }
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "invalidateActiveSyncSession");

}

- (BOOL)_pairedSyncFinishedReunionSync
{
  unint64_t v2;
  void *v3;

  v2 = -[PSYSyncCoordinator readNotifyToken:](self, "readNotifyToken:", self->_syncSwitchIDToken);
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v2 == objc_msgSend(v3, "switchIndex");

  return v2;
}

- (BOOL)_pairedSyncFinishedMigrationSyncWithPairingID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForPairingID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6E678]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSynchronize(CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v10 = (void *)CFPreferencesCopyValue(CFSTR("pairingIDMigrationCountDictionary"), CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), v9);
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = v8 == objc_msgSend(v11, "integerValue");

  return v8;
}

- (void)_syncRestrictionDidUpdate:(id)a3 forServiceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  OS_dispatch_queue *v10;
  id WeakRetained;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PSYSyncCoordinator *v21;
  uint8_t buf[4];
  OS_dispatch_queue *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_syncRestriction);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if ((v9 & 1) == 0)
  {
    self->_syncRestriction = objc_msgSend(v6, "integerValue");
    if (objc_msgSend(v7, "isEqual:", self->_serviceName))
    {
      pthread_mutex_lock(&self->_delegateLock);
      v10 = self->_delegateQueue;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      pthread_mutex_unlock(&self->_delegateLock);
      psy_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        psy_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v23 = v10;
          v24 = 2112;
          v25 = v17;
          v26 = 1024;
          v27 = objc_msgSend(v6, "integerValue");
          _os_log_impl(&dword_20CFE4000, v14, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - dispatching sync restriction did update on queue %{public}@ to delegate %@ (%d)", buf, 0x1Cu);

        }
      }
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __63__PSYSyncCoordinator__syncRestrictionDidUpdate_forServiceName___block_invoke;
      v19[3] = &unk_24C5E4FF0;
      v20 = WeakRetained;
      v21 = self;
      v18 = WeakRetained;
      dispatch_async((dispatch_queue_t)v10, v19);

    }
  }

}

uint64_t __63__PSYSyncCoordinator__syncRestrictionDidUpdate_forServiceName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "syncCoordinatorDidChangeSyncRestriction:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)beginSyncWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  psy_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    psy_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_20CFE4000, v10, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - beginSyncWithOptions: %{public}@", buf, 0xCu);
    }

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke;
  block[3] = &unk_24C5E5298;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(queue, block);

}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  objc_class *v41;
  void *v42;
  __CFString *v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  NSObject *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 40));
  v4 = objc_opt_respondsToSelector();
  psd_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    psd_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      v9 = CFSTR("DOES NOT SUPPORT");
      *(_DWORD *)buf = 138412802;
      v47 = v8;
      if ((v4 & 1) != 0)
        v9 = CFSTR("SUPPORTS");
      v48 = 2048;
      v49 = WeakRetained;
      v50 = 2112;
      v51 = v9;
      v10 = v8;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator: in beginSyncWithOptions determined that delegate %@<%p> %@ migration sync", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "syncSessionForOptions:supportsMigrationSync:", *(_QWORD *)(a1 + 40), v4 & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(v12, "switchIndex");

    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "_syncRestriction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_syncRestrictionDidUpdate:forServiceName:", v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));

    v15 = MEMORY[0x212B9AF40](*(_QWORD *)(a1 + 48));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 16);
    *(_QWORD *)(v16 + 16) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "sessionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      psd_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        psd_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CFE4000, v23, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator received beginSyncWithOptions: for the current sessionIdentifier. Ignoring message", buf, 2u);
        }

      }
    }
    v24 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(v24 + 112);
    v25 = (id *)(v24 + 112);
    if (v26)
    {
      psy_log();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
        psy_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_cold_1(v29);

      }
    }
    else
    {
      objc_storeStrong(v25, v11);
      objc_msgSend(*(id *)(a1 + 32), "beginMonitoringDeviceChanges");
      v35 = objc_msgSend(*(id *)(a1 + 40), "dryRun");
      psy_log();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        if (v37)
        {
          psy_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20CFE4000, v38, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - Dry run - not calling delegate", buf, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "beginDryRunSyncWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      else
      {
        if (v37)
        {
          psy_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringfromPSYSyncSessionType(objc_msgSend(v11, "syncSessionType"));
            v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v47 = v2;
            v48 = 2112;
            v49 = v42;
            v50 = 2112;
            v51 = v43;
            _os_log_impl(&dword_20CFE4000, v39, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - dispatching start sync on queue %{public}@ to delegate %@ syncType %@", buf, 0x20u);

          }
        }
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_25;
        v44[3] = &unk_24C5E4FF0;
        v44[4] = *(_QWORD *)(a1 + 32);
        v45 = WeakRetained;
        dispatch_async(v2, v44);

      }
    }
  }
  else
  {
    psy_log();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

    if (v31)
    {
      psy_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CFE4000, v32, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - No sync session could be created. Most likely no active device in NanoRegistry. Skipping beginSyncSession call into client.", buf, 2u);
      }

    }
    v33 = *(_QWORD *)(a1 + 48);
    PSYErrorForCode(6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v34);

  }
}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_25(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "activeSyncSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v3 = objc_opt_respondsToSelector();
      v4 = *(void **)(a1 + 40);
      if ((v3 & 1) != 0)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(v5, "activeSyncSession");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "syncCoordinator:beginSyncSession:", v5, v12);

      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "syncCoordinatorDidReceiveStartSyncCommand:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        v9 = (void *)MEMORY[0x24BDBCE88];
        v10 = *MEMORY[0x24BDBCAB0];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "raise:format:", v10, CFSTR("delegate %@ must respond to either syncCoordinator:beginSyncSession: or syncCoordinatorDidReceiveStartSyncCommand:"), v13);

      }
    }
  }
  else
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      psy_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - Sync session disappeared before it could be started. Most likely the daemon has died due to a quickswitch.", buf, 2u);
      }

    }
  }
}

- (void)abortSyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  psy_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    psy_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - abortSyncWithCompletion:", buf, 2u);
    }

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__PSYSyncCoordinator_abortSyncWithCompletion___block_invoke;
  v10[3] = &unk_24C5E52C0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, v10);

}

uint64_t __46__PSYSyncCoordinator_abortSyncWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateActiveSyncSession");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (PSYServiceSyncSession)activeSyncSession
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__PSYSyncCoordinator_activeSyncSession__block_invoke;
  v5[3] = &unk_24C5E5018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PSYServiceSyncSession *)v3;
}

void __39__PSYSyncCoordinator_activeSyncSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (id)progressHandler
{
  void *v2;
  void *v3;

  -[PSYSyncCoordinator connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)syncSessionDidCompleteSending:(id)a3
{
  id v3;

  -[PSYSyncCoordinator progressHandler](self, "progressHandler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityDidCompleteSending");

}

- (void)syncSessionDidComplete:(id)a3
{
  void (**pendingCompletion)(id, uint64_t, _QWORD);

  pendingCompletion = (void (**)(id, uint64_t, _QWORD))self->_pendingCompletion;
  if (pendingCompletion)
  {
    pendingCompletion[2](pendingCompletion, 1, 0);
    -[PSYSyncCoordinator _cleanup](self, "_cleanup");
    -[PSYSyncCoordinator invalidateActiveSyncSession](self, "invalidateActiveSyncSession");
  }
}

- (void)syncSession:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  psy_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    psy_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "psy_safeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client called syncDidFailWithError: %{public}@", (uint8_t *)&v14, 0xCu);

    }
  }
  if (self->_pendingCompletion)
  {
    +[PSYSyncCoordinator filteredErrorWithError:](PSYSyncCoordinator, "filteredErrorWithError:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v5)
    {
      psy_log();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        psy_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v10;
          _os_log_impl(&dword_20CFE4000, v13, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client has custom classes in NSError userinfo, filtered error is: %@", (uint8_t *)&v14, 0xCu);
        }

      }
    }
    (*((void (**)(void))self->_pendingCompletion + 2))();
    -[PSYSyncCoordinator _cleanup](self, "_cleanup");
    -[PSYSyncCoordinator invalidateActiveSyncSession](self, "invalidateActiveSyncSession");

  }
}

+ (id)filteredErrorWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSYPlistFilter filteredPlistDictionary:](PSYPlistFilter, "filteredPlistDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v9 = v3;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v3, "code"), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)syncSession:(id)a3 reportProgress:(double)a4
{
  double v5;
  id v6;

  -[PSYSyncCoordinator progressHandler](self, "progressHandler", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a4;
  objc_msgSend(v6, "activityDidUpdateProgress:", v5);

}

- (void)syncDidCompleteSending
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__PSYSyncCoordinator_syncDidCompleteSending__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__PSYSyncCoordinator_syncDidCompleteSending__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "syncDidCompleteSending");
}

- (void)syncDidComplete
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PSYSyncCoordinator_syncDidComplete__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__PSYSyncCoordinator_syncDidComplete__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "syncDidComplete");
}

- (void)syncDidFailWithError:(id)a3
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
  v7[2] = __43__PSYSyncCoordinator_syncDidFailWithError___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __43__PSYSyncCoordinator_syncDidFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "syncDidFailWithError:", *(_QWORD *)(a1 + 40));
}

- (void)reportProgress:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__PSYSyncCoordinator_reportProgress___block_invoke;
  v4[3] = &unk_24C5E51C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __37__PSYSyncCoordinator_reportProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "reportProgress:", *(double *)(a1 + 40));
}

- (PSYSyncCoordinatorDelegate)delegate
{
  _opaque_pthread_mutex_t *p_delegateLock;
  id WeakRetained;

  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  pthread_mutex_unlock(p_delegateLock);
  return (PSYSyncCoordinatorDelegate *)WeakRetained;
}

- (void)performDelegateBlock:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_delegateLock;
  PSYSyncCoordinatorDelegate **p_delegate;
  OS_dispatch_queue *v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  p_delegate = &self->_delegate;
  v7 = self->_delegateQueue;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  pthread_mutex_unlock(p_delegateLock);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__PSYSyncCoordinator_performDelegateBlock___block_invoke;
  v11[3] = &unk_24C5E5068;
  v12 = WeakRetained;
  v13 = v4;
  v9 = WeakRetained;
  v10 = v4;
  dispatch_async((dispatch_queue_t)v7, v11);

}

uint64_t __43__PSYSyncCoordinator_performDelegateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invalidateActiveSyncSession
{
  PSYServiceSyncSession *activeSyncSession;
  PSYServiceSyncSession *v4;
  PSYServiceSyncSession *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  PSYServiceSyncSession *v9;
  _QWORD v10[5];
  PSYServiceSyncSession *v11;
  uint8_t buf[4];
  PSYServiceSyncSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  activeSyncSession = self->_activeSyncSession;
  if (activeSyncSession)
  {
    v4 = activeSyncSession;
    v5 = self->_activeSyncSession;
    self->_activeSyncSession = 0;

    -[PSYSyncCoordinator endMonitoringDeviceChanges](self, "endMonitoringDeviceChanges");
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      psy_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating sync session: %{public}@", buf, 0xCu);
      }

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__PSYSyncCoordinator_invalidateActiveSyncSession__block_invoke;
    v10[3] = &unk_24C5E52E8;
    v10[4] = self;
    v11 = v4;
    v9 = v4;
    -[PSYSyncCoordinator performDelegateBlock:](self, "performDelegateBlock:", v10);

  }
}

void __49__PSYSyncCoordinator_invalidateActiveSyncSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "syncCoordinator:didInvalidateSyncSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  void *v3;
  int syncSwitchIDToken;
  objc_super v5;

  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  syncSwitchIDToken = self->_syncSwitchIDToken;
  if (syncSwitchIDToken != -1)
    notify_cancel(syncSwitchIDToken);
  v5.receiver = self;
  v5.super_class = (Class)PSYSyncCoordinator;
  -[PSYSyncCoordinator dealloc](&v5, sel_dealloc);
}

- (void)_cleanup
{
  id pendingCompletion;

  pendingCompletion = self->_pendingCompletion;
  self->_pendingCompletion = 0;

}

- (void)beginMonitoringDeviceChanges
{
  self->_monitoringDeviceChanges = 1;
}

- (void)endMonitoringDeviceChanges
{
  self->_monitoringDeviceChanges = 0;
}

- (void)deviceChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__PSYSyncCoordinator_deviceChanged___block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__PSYSyncCoordinator_deviceChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint8_t v10[16];

  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v4)
  {
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v3);

    if ((v6 & 1) == 0)
    {
      psd_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        psd_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_20CFE4000, v9, OS_LOG_TYPE_DEFAULT, "Device changed, invalidating sync session", v10, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidateActiveSyncSession");
    }
  }

}

- (id)syncSessionForOptions:(id)a3 supportsMigrationSync:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  PSYServiceSyncSession *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v24 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPairedDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      objc_msgSend(v13, "pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pairingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v13;

    if (!v17)
      goto LABEL_12;
    v18 = -[PSYServiceSyncSession initWithQueue:supportsMigrationSync:]([PSYServiceSyncSession alloc], "initWithQueue:supportsMigrationSync:", self->_queue, v24);
    -[PSYServiceSyncSession setPdrPairedDevice:](v18, "setPdrPairedDevice:", v17);
    -[PSYServiceSyncSession setSyncSessionType:](v18, "setSyncSessionType:", objc_msgSend(v5, "syncSessionType"));
    objc_msgSend(v5, "sessionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSYServiceSyncSession setSessionIdentifier:](v18, "setSessionIdentifier:", v19);

    -[PSYServiceSyncSession setDelegate:](v18, "setDelegate:", self);
    -[PSYServiceSyncSession setSyncCoordinator:](v18, "setSyncCoordinator:", self);
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSYServiceSyncSession setSwitchID:](v18, "setSwitchID:", objc_msgSend(v20, "switchIndex"));

  }
  else
  {
LABEL_9:

LABEL_12:
    psd_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (!v22)
    {
      v18 = 0;
      goto LABEL_18;
    }
    psd_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PSYSyncCoordinator syncSessionForOptions:supportsMigrationSync:].cold.1(v8, v17);
    v18 = 0;
  }

LABEL_18:
  return v18;
}

- (void)beginDryRunSyncWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD handler[5];
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[3];
  int v25;

  v6 = a3;
  v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  objc_msgSend(v6, "testInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "action");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(0, v10);
  v12 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v11);

  dispatch_source_set_timer(v12, 0, 0x5F5E100uLL, 0);
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke;
  handler[3] = &unk_24C5E5310;
  v22 = v12;
  v23 = v24;
  handler[4] = self;
  v14 = v12;
  dispatch_source_set_event_handler(v14, handler);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke_2;
  v17[3] = &unk_24C5E5338;
  v17[4] = self;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v15 = v7;
  v16 = v8;
  dispatch_source_set_cancel_handler(v14, v17);
  dispatch_resume(v14);

  _Block_object_dispose(v24, 8);
}

void __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(float *)(v2 + 24) + 0.1;
  *(float *)(v2 + 24) = v3;
  objc_msgSend(*(id *)(a1 + 32), "reportProgress:", *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1.0)
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v2 - 2) >= 2)
  {
    v3 = 0;
    v5 = 0;
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.pairedsync.synccoordinator"), 1, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v2 = *(_QWORD *)(a1 + 56);
    v5 = (void *)v3;
  }
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "exitForTestInput:", *(_QWORD *)(a1 + 40));
    v5 = (void *)v3;
  }
  psy_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    psy_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "psy_safeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 1024;
      v16 = v4;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "Service %{public}@ completed dry run with success: %d error: %{public}@", (uint8_t *)&v13, 0x1Cu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = 0;

}

- (void)exitForTestInput:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "action"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "Exiting due to test input action: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  exit(1);
}

- (void)registry:(id)a3 added:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_monitoringDeviceChanges && objc_msgSend(v6, "isActive"))
    -[PSYSyncCoordinator deviceChanged:](self, "deviceChanged:", v7);

}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_monitoringDeviceChanges)
  {
    v11 = objc_msgSend(v9, "containsObject:", *MEMORY[0x24BE6E670]);
    v12 = objc_msgSend(v10, "containsObject:", *MEMORY[0x24BE6E668]);
    if (v12)
      v12 = objc_msgSend(v8, "isActive");
    if (v12 | v11)
      -[PSYSyncCoordinator deviceChanged:](self, "deviceChanged:", v8);
  }
  if (self->_migrationChangeBlock && objc_msgSend(v10, "containsObject:", *MEMORY[0x24BE6E678]))
    dispatch_async((dispatch_queue_t)self->_queue, self->_migrationChangeBlock);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_migrationChangeBlock, 0);
  objc_storeStrong((id *)&self->_activeSyncSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CFE4000, log, OS_LOG_TYPE_ERROR, "PSYSyncCoordinator - Sync session already in progress.  Ignoring additional begin sync message. This is a serious error", v1, 2u);
}

- (void)syncSessionForOptions:(void *)a1 supportsMigrationSync:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_20CFE4000, a2, OS_LOG_TYPE_ERROR, "missing paired device. devices count: %tu", (uint8_t *)&v3, 0xCu);
}

@end
