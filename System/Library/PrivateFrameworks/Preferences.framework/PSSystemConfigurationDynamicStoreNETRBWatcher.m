@implementation PSSystemConfigurationDynamicStoreNETRBWatcher

- (BOOL)shouldShowTethering
{
  int v3;
  unsigned int v4;

  v4 = 0;
  v3 = 0;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher readNETRBState:andReason:](self, "readNETRBState:andReason:", &v4, &v3);
  return v4 > 0x3FD;
}

- (void)readNETRBState:(int *)a3 andReason:(int *)a4
{
  int netrbState;
  int netrbReason;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  netrbState = self->_netrbState;
  netrbReason = self->_netrbReason;
  v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, CFSTR("com.apple.MobileInternetSharing"));
  v11 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("State"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    netrbState = objc_msgSend(v9, "intValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("Reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    netrbReason = objc_msgSend(v10, "intValue");

  }
  if (a3)
    *a3 = netrbState;
  if (a4)
    *a4 = netrbReason;

}

void __62__PSSystemConfigurationDynamicStoreNETRBWatcher_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_gSharedNETRBWatcherInstance;
  sharedManager_gSharedNETRBWatcherInstance = (uint64_t)v1;

}

- (PSSystemConfigurationDynamicStoreNETRBWatcher)init
{
  PSSystemConfigurationDynamicStoreNETRBWatcher *v2;
  PSSystemConfigurationDynamicStoreNETRBWatcher *v3;
  SCDynamicStoreRef v4;
  __CFRunLoop *Current;
  SCDynamicStoreContext v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSSystemConfigurationDynamicStoreNETRBWatcher;
  v2 = -[PSSystemConfigurationDynamicStoreNETRBWatcher init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_netrbState = 1020;
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = v2;
    v4 = SCDynamicStoreCreate(0, CFSTR("com.apple.preferences.NETRBManager"), (SCDynamicStoreCallBack)__SCDynamicStoreCallback, &v7);
    v3->_scDynamicStore = v4;
    if (v4)
    {
      SCDynamicStoreAddWatchedKey();
      v3->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v3->_scDynamicStore, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v3->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    }
  }
  return v3;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PSSystemConfigurationDynamicStoreNETRBWatcher_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_cacheOnce != -1)
    dispatch_once(&sharedManager_cacheOnce, block);
  return (id)sharedManager_gSharedNETRBWatcherInstance;
}

- (void)dealloc
{
  __CFRunLoop *Current;
  __SCDynamicStore *scDynamicStore;
  objc_super v5;

  if (self->_scRunLoopSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_scRunLoopSource);
  }
  scDynamicStore = self->_scDynamicStore;
  if (scDynamicStore)
    CFRelease(scDynamicStore);
  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreNETRBWatcher;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher dealloc](&v5, sel_dealloc);
}

- (void)getNETRBState:(int *)a3 andReason:(int *)a4
{
  int *p_netrbState;
  int *p_netrbReason;

  p_netrbState = &self->_netrbState;
  p_netrbReason = &self->_netrbReason;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher readNETRBState:andReason:](self, "readNETRBState:andReason:", &self->_netrbState, &self->_netrbReason);
  if (a3)
    *a3 = *p_netrbState;
  if (a4)
    *a4 = *p_netrbReason;
}

- (void)sendStateUpdate
{
  uint64_t netrbState;
  uint64_t v4;
  uint64_t netrbReason;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = 0;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher readNETRBState:andReason:](self, "readNETRBState:andReason:", (char *)&v14 + 4, &v14);
  netrbState = self->_netrbState;
  if (HIDWORD(v14) != (_DWORD)netrbState)
  {
    netrbReason = self->_netrbReason;
    v4 = v14;
    goto LABEL_5;
  }
  v4 = v14;
  netrbReason = self->_netrbReason;
  if ((_DWORD)v14 != (_DWORD)netrbReason)
  {
LABEL_5:
    NSLog(CFSTR("%s: NETRB state change: %u -> %u, reason: %u -> %u"), "-[PSSystemConfigurationDynamicStoreNETRBWatcher sendStateUpdate]", netrbState, HIDWORD(v14), netrbReason, v4);
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v14));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_netrbState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_netrbReason);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("State"), v8, CFSTR("Reason"), v9, CFSTR("PreviousState"), v10, CFSTR("PreviousReason"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v14;
    self->_netrbState = HIDWORD(v14);
    self->_netrbReason = v12;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.Preferences.NETRB"), 0, v11);

  }
}

- (BOOL)isTetheringEnabled
{
  int v3;
  int v4;

  v4 = 0;
  v3 = 0;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher readNETRBState:andReason:](self, "readNETRBState:andReason:", &v4, &v3);
  return v4 == 1023;
}

- (BOOL)isDataEnabled
{
  int v3;
  int v4;

  v4 = 0;
  v3 = 0;
  -[PSSystemConfigurationDynamicStoreNETRBWatcher readNETRBState:andReason:](self, "readNETRBState:andReason:", &v4, &v3);
  return v3 != 4;
}

@end
