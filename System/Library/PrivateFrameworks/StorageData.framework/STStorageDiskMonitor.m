@implementation STStorageDiskMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceMonitorToken != -1)
    dispatch_once(&sharedMonitor_onceMonitorToken, &__block_literal_global_14);
  return (id)sharedMonitor_gSharedMonitor;
}

void __37__STStorageDiskMonitor_sharedMonitor__block_invoke()
{
  STStorageDiskMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STStorageDiskMonitor);
  v1 = (void *)sharedMonitor_gSharedMonitor;
  sharedMonitor_gSharedMonitor = (uint64_t)v0;

}

- (STStorageDiskMonitor)init
{
  STStorageDiskMonitor *v2;
  STStorageDiskMonitor *v3;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStorageDiskMonitor;
  v2 = -[STStorageDiskMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STStorageDiskMonitor updateDiskSpace](v2, "updateDiskSpace");
    v6 = 0;
    GetDeviceSpace(&v6, &v5);
    v3->_deviceSize = 1000000000 * (uint64_t)rint((double)v6 / 1000000000.0);
    v3->_updateDelta = 104857600;
  }
  return v3;
}

- (void)_sendNotify:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v4, 0);

}

- (void)sendNotify:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__STStorageDiskMonitor_sendNotify___block_invoke;
  v6[3] = &unk_24C75F680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __35__STStorageDiskMonitor_sendNotify___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__sendNotify_, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__sendNotify_, *(_QWORD *)(a1 + 40), 0.1);
}

- (void)sync
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  STStorageSpace *v14;
  STStorageSpace *storageSpace;
  int64_t deviceSize;
  uint64_t v17;

  v3 = (void *)MEMORY[0x212BA72F0](self, a2);
  deviceSize = self->_deviceSize;
  v17 = deviceSize;
  GetDeviceSpace(&v17, &deviceSize);
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "totalPurgeable");

  v7 = deviceSize;
  v6 = v17;
  STLog(1, CFSTR("disk space tot: %lld, free: %lld, purge: %lld"), v8, v9, v10, v11, v12, v13, v17);
  v14 = -[STStorageSpace initWithTotal:free:purgeable:]([STStorageSpace alloc], "initWithTotal:free:purgeable:", v6, v7, v5);
  storageSpace = self->_storageSpace;
  self->_storageSpace = v14;

  objc_autoreleasePoolPop(v3);
}

- (void)updateDiskSpace
{
  int64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[STStorageSpace availableBytes](self->_storageSpace, "availableBytes");
  -[STStorageDiskMonitor sync](self, "sync");
  v4 = -[STStorageSpace availableBytes](self->_storageSpace, "availableBytes");
  v5 = v4 - v3;
  if (v4 - v3 < 0)
    v5 = v3 - v4;
  if (v5 > self->_updateDelta)
    -[STStorageDiskMonitor sendNotify:](self, "sendNotify:", CFSTR("STStorageUsageChangedNotification"));
}

- (void)startMonitor
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD handler[5];

  -[STStorageDiskMonitor diskSizeTimer](self, "diskSizeTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    dispatch_get_global_queue(9, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);

    -[STStorageDiskMonitor setDiskSizeTimer:](self, "setDiskSizeTimer:", v3);
    dispatch_source_set_timer(v3, 0, 0xB2D05E00uLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__STStorageDiskMonitor_startMonitor__block_invoke;
    handler[3] = &unk_24C75F658;
    handler[4] = self;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
  }
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitor");

}

uint64_t __36__STStorageDiskMonitor_startMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDiskSpace");
}

- (void)stopMonitor
{
  void *v3;
  NSObject *source;

  -[STStorageDiskMonitor diskSizeTimer](self, "diskSizeTimer");
  source = objc_claimAutoreleasedReturnValue();
  if (source)
  {
    -[STStorageDiskMonitor setDiskSizeTimer:](self, "setDiskSizeTimer:", 0);
    dispatch_source_cancel(source);
  }
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitor");

}

- (int64_t)deviceSize
{
  return self->_deviceSize;
}

- (STStorageSpace)storageSpace
{
  return (STStorageSpace *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_source)diskSizeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDiskSizeTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSizeTimer, 0);
  objc_storeStrong((id *)&self->_storageSpace, 0);
}

@end
