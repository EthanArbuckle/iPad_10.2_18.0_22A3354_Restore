@implementation ICNanoPairedDeviceStatusMonitor

- (id)_init
{
  ICNanoPairedDeviceStatusMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callBackQueue;
  uint64_t v9;
  NSMapTable *observers;
  NSObject *v11;
  id *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  PSYInitialSyncStateObserver *initialSyncStateObserver;
  void *v19;
  void *v20;
  id result;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[8];
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v24.receiver = self;
  v24.super_class = (Class)ICNanoPairedDeviceStatusMonitor;
  v2 = -[ICNanoPairedDeviceStatusMonitor init](&v24, sel_init);
  if (!v2)
    return v2;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICNanoPairedDeviceStatusMonitor.queue", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICNanoPairedDeviceStatusMonitor.callBackQueue", v6);
  callBackQueue = v2->_callBackQueue;
  v2->_callBackQueue = (OS_dispatch_queue *)v7;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 5);
  v9 = objc_claimAutoreleasedReturnValue();
  observers = v2->_observers;
  v2->_observers = (NSMapTable *)v9;

  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "HAS_PAIRED_SYNC", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v26 = (uint64_t)buf;
  v27 = 0x2020000000;
  v12 = (id *)getNRDevicePropertyPairingIDSymbolLoc_ptr;
  v28 = (void *)getNRDevicePropertyPairingIDSymbolLoc_ptr;
  if (!getNRDevicePropertyPairingIDSymbolLoc_ptr)
  {
    v13 = NanoRegistryLibrary();
    v12 = (id *)dlsym(v13, "NRDevicePropertyPairingID");
    *(_QWORD *)(v26 + 24) = v12;
    getNRDevicePropertyPairingIDSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(buf, 8);
  if (v12)
  {
    objc_storeStrong((id *)&v2->_pairingIDPropertyName, *v12);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v15 = (void *)getPSYInitialSyncStateObserverClass_softClass;
    v33 = getPSYInitialSyncStateObserverClass_softClass;
    if (!getPSYInitialSyncStateObserverClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = (uint64_t)__getPSYInitialSyncStateObserverClass_block_invoke;
      v28 = &unk_1E4391138;
      v29 = &v30;
      __getPSYInitialSyncStateObserverClass_block_invoke((uint64_t)buf);
      v15 = (void *)v31[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v30, 8);
    v17 = objc_msgSend([v16 alloc], "initWithDelegate:", v2);
    initialSyncStateObserver = v2->_initialSyncStateObserver;
    v2->_initialSyncStateObserver = (PSYInitialSyncStateObserver *)v17;

    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HandleDeviceDidPairNotification, CFSTR("com.apple.nanoregistry.devicedidpair"), 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HandleDeviceDidUnPairNotification, CFSTR("com.apple.nanoregistry.devicedidunpair"), 0, CFNotificationSuspensionBehaviorDrop);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getNRPairedDeviceRegistryDeviceDidBecomeActive();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel_deviceBecameActive_, v20, 0);

    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyPairingID(void)");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("ICNanoPairedDeviceStatusMonitor.m"), 31, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  PSYInitialSyncStateObserver *initialSyncStateObserver;
  void *v5;
  void *v6;
  objc_super v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  initialSyncStateObserver = self->_initialSyncStateObserver;
  self->_initialSyncStateObserver = 0;

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.nanoregistry.devicedidpair"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.nanoregistry.devicedidunpair"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.nanoregistry.paireddevicedidchangeversion"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getNRPairedDeviceRegistryDeviceDidBecomeActive();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)ICNanoPairedDeviceStatusMonitor;
  -[ICNanoPairedDeviceStatusMonitor dealloc](&v7, sel_dealloc);
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ICNanoPairedDeviceStatusMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ICNanoPairedDeviceStatusMonitor_removeObserver___block_invoke;
  v5[3] = &unk_1E438E1E8;
  v5[4] = self;
  v5[5] = a3;
  v4 = a3;
  dispatch_async(queue, v5);

}

- (NSUUID)activePairedDevicePairingID
{
  NSObject *queue;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6488;
  v12 = __Block_byref_object_dispose__6489;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ICNanoPairedDeviceStatusMonitor_activePairedDevicePairingID__block_invoke;
  v7[3] = &unk_1E4391568;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "active paired device pairing id %{public}@", buf, 0xCu);
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSUUID *)v5;
}

- (NSUUID)pairedDevicePairingID
{
  NSObject *queue;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6488;
  v12 = __Block_byref_object_dispose__6489;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICNanoPairedDeviceStatusMonitor_pairedDevicePairingID__block_invoke;
  block[3] = &unk_1E4391138;
  block[4] = &v8;
  dispatch_sync(queue, block);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "paired device pairing id %{public}@", buf, 0xCu);
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSUUID *)v5;
}

- (NSArray)allPairedDevicePairingIDs
{
  NSObject *queue;
  NSObject *v3;
  int v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6488;
  v12 = __Block_byref_object_dispose__6489;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ICNanoPairedDeviceStatusMonitor_allPairedDevicePairingIDs__block_invoke;
  v7[3] = &unk_1E4391568;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend((id)v9[5], "count");
    *(_DWORD *)buf = 67109120;
    v15 = v4;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Found %d paired device ids", buf, 8u);
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)allPairedDeviceGUIDs
{
  NSObject *queue;
  void *v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6488;
  v11 = __Block_byref_object_dispose__6489;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICNanoPairedDeviceStatusMonitor_allPairedDeviceGUIDs__block_invoke;
  block[3] = &unk_1E4391138;
  block[4] = &v7;
  dispatch_sync(queue, block);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSString)pairedDeviceGUID
{
  NSString *pairedDeviceGUID;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;

  pairedDeviceGUID = self->_pairedDeviceGUID;
  if (!pairedDeviceGUID)
  {
    -[ICNanoPairedDeviceStatusMonitor _activePairedDevice](self, "_activePairedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      getNRDevicePropertyUDID();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForProperty:", v5);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_pairedDeviceGUID;
      self->_pairedDeviceGUID = v6;

      if (self->_pairedDeviceGUID)
      {
LABEL_10:

        pairedDeviceGUID = self->_pairedDeviceGUID;
        return pairedDeviceGUID;
      }
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v9 = "failed to obtain paired device GUID - you may need an entitlement for this process";
        v10 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v9 = "failed to obtain paired device GUID because there is no active paired device";
        v10 = (uint8_t *)&v12;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
  return pairedDeviceGUID;
}

- (NSString)pairedDeviceMediaGUID
{
  NSString *pairedDeviceMediaGUID;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v20;
  void *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;

  pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  if (!pairedDeviceMediaGUID)
  {
    -[ICNanoPairedDeviceStatusMonitor _activePairedDevice](self, "_activePairedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      *(_QWORD *)buf = 0;
      v23 = buf;
      v24 = 0x2020000000;
      v5 = (_QWORD *)getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
      v25 = getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
      if (!getNRDevicePropertyIsAltAccountSymbolLoc_ptr)
      {
        v6 = NanoRegistryLibrary();
        v5 = dlsym(v6, "NRDevicePropertyIsAltAccount");
        *((_QWORD *)v23 + 3) = v5;
        getNRDevicePropertyIsAltAccountSymbolLoc_ptr = (uint64_t)v5;
      }
      _Block_object_dispose(buf, 8);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyIsAltAccount(void)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("ICNanoPairedDeviceStatusMonitor.m"), 35, CFSTR("%s"), dlerror());
        goto LABEL_23;
      }
      objc_msgSend(v4, "valueForProperty:", *v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if ((v8 & 1) != 0)
        goto LABEL_20;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C5DDE5DD-2FF7-4735-80A3-0108488556DE"));
      v10 = objc_msgSend(v4, "supportsCapability:", v9);

      if (v10)
      {
        *(_QWORD *)buf = 0;
        v23 = buf;
        v24 = 0x2020000000;
        v11 = (id *)getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr;
        v25 = getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr;
        if (!getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr)
        {
          v12 = NanoRegistryLibrary();
          v11 = (id *)dlsym(v12, "NRDevicePropertyCompanionMusicGUID");
          *((_QWORD *)v23 + 3) = v11;
          getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr = (uint64_t)v11;
        }
        _Block_object_dispose(buf, 8);
        if (!v11)
        {
          while (1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyCompanionMusicGUID(void)");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("ICNanoPairedDeviceStatusMonitor.m"), 33, CFSTR("%s"), dlerror());
LABEL_23:

            __break(1u);
          }
        }
        v13 = *v11;
      }
      else
      {
        getNRDevicePropertyUDID();
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v13;
      objc_msgSend(v4, "valueForProperty:", v13);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v18 = self->_pairedDeviceMediaGUID;
      self->_pairedDeviceMediaGUID = v17;

      if (self->_pairedDeviceMediaGUID)
        goto LABEL_20;
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "failed to obtain CompanionMusicGUID - you may need an entitlement for this process";
        goto LABEL_18;
      }
    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "failed to obtain pairedDeviceMediaGUID because there is no active paired device";
LABEL_18:
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }

LABEL_20:
    pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  }
  return pairedDeviceMediaGUID;
}

- (BOOL)isInitialSyncComplete
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  ICNanoPairedDeviceStatusMonitor *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  ICNanoPairedDeviceStatusMonitor *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldForceWatchInitialSyncCompletion");

  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Forcing initial sync completion from debug override", buf, 0xCu);
    }
    v6 = 1;
  }
  else
  {
    -[ICNanoPairedDeviceStatusMonitor activePairedDevicePairingID](self, "activePairedDevicePairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke;
    block[3] = &unk_1E43907D8;
    v11 = v7;
    v12 = self;
    v13 = &v14;
    v5 = v7;
    dispatch_sync(queue, block);
    v6 = *((_BYTE *)v15 + 24) != 0;

  }
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (BOOL)isMediaSyncingSupported
{
  return 1;
}

- (id)_allObservers
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
  v9 = __Block_byref_object_copy__6488;
  v10 = __Block_byref_object_dispose__6489;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICNanoPairedDeviceStatusMonitor__allObservers__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_activePairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handlePairedDeviceChangedNotification
{
  NSString *pairedDeviceGUID;
  NSString *pairedDeviceMediaGUID;
  NSObject *callBackQueue;
  _QWORD block[5];

  pairedDeviceGUID = self->_pairedDeviceGUID;
  self->_pairedDeviceGUID = 0;

  pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  self->_pairedDeviceMediaGUID = 0;

  callBackQueue = self->_callBackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICNanoPairedDeviceStatusMonitor__handlePairedDeviceChangedNotification__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

- (void)deviceBecameActive:(id)a3
{
  NSObject *callBackQueue;
  _QWORD block[5];

  callBackQueue = self->_callBackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICNanoPairedDeviceStatusMonitor_deviceBecameActive___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v5;
  NSObject *callBackQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  callBackQueue = self->_callBackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__ICNanoPairedDeviceStatusMonitor_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(callBackQueue, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncStateObserver, 0);
  objc_storeStrong((id *)&self->_pairedDeviceMediaGUID, 0);
  objc_storeStrong((id *)&self->_pairedDeviceGUID, 0);
  objc_storeStrong((id *)&self->_pairingIDPropertyName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callBackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __103__ICNanoPairedDeviceStatusMonitor_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(v7, "nanoPairedDeviceStatusMonitor:didFinishInitialSyncForPairingIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __54__ICNanoPairedDeviceStatusMonitor_deviceBecameActive___block_invoke(uint64_t a1)
{
  void *v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(v7, "nanoPairedDeviceStatusMonitorNewActiveDevice:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __73__ICNanoPairedDeviceStatusMonitor__handlePairedDeviceChangedNotification__block_invoke(uint64_t a1)
{
  void *v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(v7, "nanoPairedDeviceStatusMonitorPairedDeviceChanged:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __48__ICNanoPairedDeviceStatusMonitor__allObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_msgSend(v5, "objectEnumerator");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1[4] && *(_QWORD *)(a1[5] + 56))
  {
    v2 = dispatch_semaphore_create(0);
    v3 = (void *)a1[4];
    v4 = *(void **)(a1[5] + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke_2;
    v8[3] = &unk_1E438AEF0;
    v11 = a1[6];
    v9 = v3;
    v10 = v2;
    v5 = v2;
    objc_msgSend(v4, "requestInitialSyncStateForPairingIdentifier:completion:", v9, v8);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = *(_QWORD *)(a1[5] + 56);
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Could not get activePairedDeviceId %{public}@, _initialSyncStateObserver %{public}@.", buf, 0x16u);
    }
  }

}

void __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
    v6 = 1;
  else
    v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v10 = 138544130;
    v11 = v8;
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    v16 = 1024;
    v17 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "obtained initial sync state for %{public}@. hasCompletedSync=%d, err=%{public}@, initialSyncComplete=%d", (uint8_t *)&v10, 0x22u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__ICNanoPairedDeviceStatusMonitor_allPairedDeviceGUIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        getNRDevicePropertyUDID();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForProperty:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __60__ICNanoPairedDeviceStatusMonitor_allPairedDevicePairingIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "valueForProperty:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v2, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v2;

}

void __56__ICNanoPairedDeviceStatusMonitor_pairedDevicePairingID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__ICNanoPairedDeviceStatusMonitor_activePairedDevicePairingID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_activePairedDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__ICNanoPairedDeviceStatusMonitor_removeObserver___block_invoke(uint64_t a1)
{
  NSMapRemove(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 24), *(const void **)(a1 + 40));
}

uint64_t __47__ICNanoPairedDeviceStatusMonitor_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
}

+ (ICNanoPairedDeviceStatusMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken != -1)
    dispatch_once(&sharedMonitor_sOnceToken, &__block_literal_global_6529);
  return (ICNanoPairedDeviceStatusMonitor *)(id)sharedMonitor_sSharedMonitor;
}

void __48__ICNanoPairedDeviceStatusMonitor_sharedMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICNanoPairedDeviceStatusMonitor _init]([ICNanoPairedDeviceStatusMonitor alloc], "_init");
  v1 = (void *)sharedMonitor_sSharedMonitor;
  sharedMonitor_sSharedMonitor = (uint64_t)v0;

}

@end
