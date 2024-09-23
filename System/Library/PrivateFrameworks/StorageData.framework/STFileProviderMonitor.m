@implementation STFileProviderMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_2 != -1)
    dispatch_once(&sharedMonitor_onceToken_2, &__block_literal_global_11);
  return (id)sharedMonitor__gMonitor;
}

void __38__STFileProviderMonitor_sharedMonitor__block_invoke()
{
  STFileProviderMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STFileProviderMonitor);
  v1 = (void *)sharedMonitor__gMonitor;
  sharedMonitor__gMonitor = (uint64_t)v0;

}

- (void)startMonitor
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[STFileProviderMonitor fpContext](self, "fpContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __37__STFileProviderMonitor_startMonitor__block_invoke;
    v5[3] = &unk_24C75FF90;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BDC82F8], "beginMonitoringProviderDomainChangesWithHandler:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFileProviderMonitor setFpContext:](self, "setFpContext:", v4);

  }
}

void __37__STFileProviderMonitor_startMonitor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled", (_QWORD)v11)
          && objc_msgSend(v10, "supportsEnumeration")
          && objc_msgSend(v10, "isAvailableSystemWide")
          && (objc_msgSend(v10, "isHidden") & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFpDomains:", v4);
  objc_msgSend(*(id *)(a1 + 32), "postNotify");

}

- (void)stopMonitor
{
  void *v3;
  id v4;

  -[STFileProviderMonitor fpContext](self, "fpContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STFileProviderMonitor setFpContext:](self, "setFpContext:", 0);
  v3 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDC82F8], "endMonitoringProviderDomainChanges:", v4);
    v3 = v4;
  }

}

- (void)_postNotify:(id)a3
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

- (void)postNotify
{
  _QWORD v2[5];
  __CFString *v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__STFileProviderMonitor_postNotify__block_invoke;
  v2[3] = &unk_24C75F680;
  v2[4] = self;
  v3 = CFSTR("com.apple.storage.fp_domains");
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __35__STFileProviderMonitor_postNotify__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__postNotify_, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__postNotify_, *(_QWORD *)(a1 + 40), 0.1);
}

- (void)sync
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  STFileProviderMonitor *v12;
  dispatch_semaphore_t v13;

  v3 = (void *)MEMORY[0x212BA72F0](self, a2);
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)MEMORY[0x24BDC82F8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __29__STFileProviderMonitor_sync__block_invoke;
  v11 = &unk_24C75FFB8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "beginMonitoringProviderDomainChangesWithHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDC82F8], "endMonitoringProviderDomainChanges:", v7, v8, v9, v10, v11, v12);

  objc_autoreleasePoolPop(v3);
}

void __29__STFileProviderMonitor_sync__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled", (_QWORD)v11)
          && objc_msgSend(v10, "supportsEnumeration")
          && objc_msgSend(v10, "isAvailableSystemWide")
          && (objc_msgSend(v10, "isHidden") & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFpDomains:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (NSArray)fpDomains
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFpDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)fpContext
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFpContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fpContext, 0);
  objc_storeStrong((id *)&self->_fpDomains, 0);
}

@end
