@implementation STStorageMediaMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_1 != -1)
    dispatch_once(&sharedMonitor_onceToken_1, &__block_literal_global_8);
  return (id)sharedMonitor__monitor_0;
}

void __38__STStorageMediaMonitor_sharedMonitor__block_invoke()
{
  STStorageMediaMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STStorageMediaMonitor);
  v1 = (void *)sharedMonitor__monitor_0;
  sharedMonitor__monitor_0 = (uint64_t)v0;

}

- (STStorageMediaMonitor)init
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  _QWORD handler[4];
  id v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)STStorageMediaMonitor;
  v2 = -[STStorageMediaMonitor init](&v27, sel_init);
  if (v2)
  {
    +[STAppOverrides overrides](STAppOverrides, "overrides");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[STStorageMediaMonitor listOfUsedDataClassesInOverrides:](STStorageMediaMonitor, "listOfUsedDataClassesInOverrides:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_loadingComplete_, CFSTR("STNotify_LoadingComplete"), 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_initially_inactive(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.storagesettings.queue.ATCRefresh", v9);
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    v12 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 3));
    dispatch_source_set_timer(v12, 0, 0x6FC23AC00uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __29__STStorageMediaMonitor_init__block_invoke;
    handler[3] = &unk_24C75F658;
    v13 = v2;
    v26 = v13;
    dispatch_source_set_event_handler(v12, handler);
    objc_msgSend(v13, "setRefreshTimer:", v12);
    objc_msgSend(MEMORY[0x24BE03990], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getCurrentUsage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAtcDictionary:", v15);

    objc_msgSend(*((id *)v2 + 6), "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "atcDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    STLog(1, CFSTR("%s:%d ATC used data classes: %@; current usage: %@"),
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)"-[STStorageMediaMonitor init]");

  }
  return (STStorageMediaMonitor *)v2;
}

uint64_t __29__STStorageMediaMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateATCData");
}

- (void)startMonitor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  if (self->_isMonitoring)
  {
    STLog(1, CFSTR("media monitor monitoring calls are unbalanced"), v2, v3, v4, v5, v6, v7, v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_mpLibraryChanged_, *MEMORY[0x24BDDBCF0], 0);

    -[STStorageMediaMonitor refreshQueue](self, "refreshQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ALRegisterForPhotosAndVideosCount();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageMediaMonitor setPhotosLibToken:](self, "setPhotosLibToken:", v11);

    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginGeneratingLibraryChangeNotifications");

    -[STStorageMediaMonitor refreshTimer](self, "refreshTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v13);

    -[STStorageMediaMonitor setIsMonitoring:](self, "setIsMonitoring:", 1);
    objc_msgSend(MEMORY[0x24BE03990], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getCurrentUsage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageMediaMonitor setAtcDictionary:](self, "setAtcDictionary:", v15);

    -[STStorageMediaMonitor atcDictionary](self, "atcDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    STLog(1, CFSTR("%s:%d ATC %@"), v16, v17, v18, v19, v20, v21, (uint64_t)"-[STStorageMediaMonitor startMonitor]");

  }
  -[STStorageMediaMonitor updateATCData](self, "updateATCData");
}

uint64_t __37__STStorageMediaMonitor_startMonitor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STLog(1, CFSTR("%s:%d Photos/Videos change detected"), a3, a4, a5, a6, a7, a8, (uint64_t)"-[STStorageMediaMonitor startMonitor]_block_invoke");
  return objc_msgSend(*(id *)(a1 + 32), "_updateATCData");
}

- (void)stopMonitor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;

  if (self->_isMonitoring)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);

    -[STStorageMediaMonitor photosLibToken](self, "photosLibToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ALUnregisterForPhotosAndVideosCount();

    -[STStorageMediaMonitor setPhotosLibToken:](self, "setPhotosLibToken:", 0);
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endGeneratingLibraryChangeNotifications");

    -[STStorageMediaMonitor refreshTimer](self, "refreshTimer");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v12);

    -[STStorageMediaMonitor setIsMonitoring:](self, "setIsMonitoring:", 0);
  }
  else
  {
    STLog(1, CFSTR("media monitor monitoring calls are unbalanced"), v2, v3, v4, v5, v6, v7, v13);
  }
}

- (void)updateATCData
{
  NSObject *refreshQueue;
  _QWORD block[5];

  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__STStorageMediaMonitor_updateATCData__block_invoke;
  block[3] = &unk_24C75F658;
  block[4] = self;
  dispatch_async(refreshQueue, block);
}

uint64_t __38__STStorageMediaMonitor_updateATCData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateATCData");
}

- (void)_updateATCData
{
  NSObject *v3;
  _BOOL4 v4;
  __uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  void *v18;
  NSArray *usedDataClasses;
  _QWORD v20[5];

  -[STStorageMediaMonitor refreshQueue](self, "refreshQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[STStorageMediaMonitor isUpdating](self, "isUpdating");
  v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (v4)
  {
    -[STStorageMediaMonitor refreshStartTimestamp](self, "refreshStartTimestamp");
    STLog(1, CFSTR("%s:%d ATC update is already in progress, running for %0.3f s"), v6, v7, v8, v9, v10, v11, (uint64_t)"-[STStorageMediaMonitor _updateATCData]");
  }
  else
  {
    -[STStorageMediaMonitor setRefreshStartTimestamp:](self, "setRefreshStartTimestamp:", v5);
    -[STStorageMediaMonitor setIsUpdating:](self, "setIsUpdating:", 1);
    STLog(1, CFSTR("%s:%d Start updating ATC current usage"), v12, v13, v14, v15, v16, v17, (uint64_t)"-[STStorageMediaMonitor _updateATCData]");
    objc_msgSend(MEMORY[0x24BE03990], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    usedDataClasses = self->_usedDataClasses;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __39__STStorageMediaMonitor__updateATCData__block_invoke;
    v20[3] = &unk_24C75FDF8;
    v20[4] = self;
    objc_msgSend(v18, "getCurrentUsageWithUpdatedDataClasses:withCompletion:", usedDataClasses, v20);

  }
}

void __39__STStorageMediaMonitor__updateATCData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "refreshQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__STStorageMediaMonitor__updateATCData__block_invoke_2;
  v6[3] = &unk_24C75F680;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __39__STStorageMediaMonitor__updateATCData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(*(id *)(a1 + 32), "refreshStartTimestamp");
  STLog(1, CFSTR("%s:%d ATC update completed in %0.3fs %@"), v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor _updateATCData]_block_invoke_2");
  objc_msgSend(*(id *)(a1 + 32), "setAtcDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIsUpdating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsAsynchronouslyLoaded:", 1);
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postMediaSizesChanged");

}

- (void)sync
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSArray *usedDataClasses;
  NSObject *v7;
  _QWORD v8[5];
  dispatch_semaphore_t v9;

  v3 = (void *)MEMORY[0x212BA72F0](self, a2);
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BE03990], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  usedDataClasses = self->_usedDataClasses;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__STStorageMediaMonitor_sync__block_invoke;
  v8[3] = &unk_24C75FE20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getCurrentUsageWithUpdatedDataClasses:withCompletion:", usedDataClasses, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v3);
}

intptr_t __29__STStorageMediaMonitor_sync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v10 = a2;
  STLog(1, CFSTR("%s:%d ATC %@"), v3, v4, v5, v6, v7, v8, (uint64_t)"-[STStorageMediaMonitor sync]_block_invoke");
  objc_msgSend(*(id *)(a1 + 32), "setAtcDictionary:", v10);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)loadingComplete:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;
  id v10;

  STLog(1, CFSTR("%s:%d Loading complete, activating ATC refresh"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor loadingComplete:]");
  -[STStorageMediaMonitor refreshQueue](self, "refreshQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("STNotify_LoadingComplete"), 0);
  -[STStorageMediaMonitor updateATCData](self, "updateATCData");

}

- (void)mpLibraryChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  STLog(1, CFSTR("%s:%d Media library change detected"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageMediaMonitor mpLibraryChanged:]");
  -[STStorageMediaMonitor updateATCData](self, "updateATCData");
}

+ (id)listOfUsedDataClassesInOverrides:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v3;
  objc_msgSend(v3, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "includeMediaUsage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "componentsSeparatedByString:", CFSTR(":"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                objc_msgSend(v4, "addObject:", v15);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDictionary)atcDictionary
{
  return self->_atcDictionary;
}

- (void)setAtcDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAsynchronouslyLoaded
{
  return self->_isAsynchronouslyLoaded;
}

- (void)setIsAsynchronouslyLoaded:(BOOL)a3
{
  self->_isAsynchronouslyLoaded = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (OS_dispatch_queue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
  objc_storeStrong((id *)&self->_refreshQueue, a3);
}

- (OS_dispatch_source)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimer, a3);
}

- (unint64_t)refreshStartTimestamp
{
  return self->_refreshStartTimestamp;
}

- (void)setRefreshStartTimestamp:(unint64_t)a3
{
  self->_refreshStartTimestamp = a3;
}

- (NSArray)usedDataClasses
{
  return self->_usedDataClasses;
}

- (void)setUsedDataClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)photosLibToken
{
  return self->_photosLibToken;
}

- (void)setPhotosLibToken:(id)a3
{
  objc_storeStrong(&self->_photosLibToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_photosLibToken, 0);
  objc_storeStrong((id *)&self->_usedDataClasses, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_atcDictionary, 0);
}

@end
