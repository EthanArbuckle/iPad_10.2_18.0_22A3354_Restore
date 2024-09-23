@implementation PSSystemConfigurationDynamicStoreEthernetWatcher

- (id)ethernetNetworkInterfaces
{
  void *v3;
  int v4;
  CFArrayRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const __SCNetworkInterface *v9;
  const __SCNetworkInterface *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const __CFNumber *IOInterfaceType;
  const __CFNumber *FamilyType;
  const __CFNumber *FamilySubType;
  void *v19;
  unsigned int valuePtr;
  char __dst[16];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = socket(30, 1, 0);
  if (v4 < 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = SCNetworkInterfaceCopyAll();
    v6 = -[__CFArray count](v5, "count");
    if (!v6)
    {
LABEL_21:
      close(v4);
      goto LABEL_22;
    }
    v7 = v6;
    v19 = v3;
    for (i = 0; i != v7; ++i)
    {
      v9 = (const __SCNetworkInterface *)-[__CFArray objectAtIndex:](v5, "objectAtIndex:", i);
      valuePtr = 0;
      *(_OWORD *)__dst = 0u;
      v22 = 0u;
      if (v9)
      {
        v10 = v9;
        SCNetworkInterfaceGetBSDName(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "substringToIndex:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("en"));

          if (v14)
          {
            if (!-[PSSystemConfigurationDynamicStoreEthernetWatcher isHiddenEthernetInterface:](self, "isHiddenEthernetInterface:", v10))
            {
              IOInterfaceType = (const __CFNumber *)_SCNetworkInterfaceGetIOInterfaceType();
              if (IOInterfaceType)
              {
                CFNumberGetValue(IOInterfaceType, kCFNumberSInt32Type, &valuePtr);
                if (valuePtr == 6)
                {
                  FamilyType = (const __CFNumber *)_SCNetworkInterfaceGetFamilyType();
                  if (FamilyType)
                  {
                    CFNumberGetValue(FamilyType, kCFNumberSInt32Type, &valuePtr);
                    if (valuePtr == 2)
                    {
                      FamilySubType = (const __CFNumber *)_SCNetworkInterfaceGetFamilySubType();
                      if (FamilySubType)
                      {
                        CFNumberGetValue(FamilySubType, kCFNumberSInt32Type, &valuePtr);
                        if (valuePtr <= 1)
                        {
                          v12 = objc_retainAutorelease(v12);
                          strncpy(__dst, (const char *)objc_msgSend(v12, "UTF8String"), 0x10uLL);
                          if (ioctl(v4, 0xC020698EuLL, __dst) || (BYTE3(v22) & 0x20) == 0)
                            objc_msgSend(v19, "addObject:", v10);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v12 = 0;
      }

    }
    v3 = v19;
  }
  if (v4 != -1)
    goto LABEL_21;
LABEL_22:

  return v3;
}

- (BOOL)isHiddenEthernetInterface:(__SCNetworkInterface *)a3
{
  uint64_t IORegistryEntryID;
  uint64_t v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  io_object_t v7;
  io_object_t v8;
  io_registry_entry_t parent;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  parent = 0;
  IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID();
  if (!IORegistryEntryID)
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  v4 = IORegistryEntryID;
  IOMasterPort(*MEMORY[0x1E0C81720], &mainPort[1]);
  v5 = mainPort[1];
  if (!mainPort[1])
  {
    v8 = 0;
LABEL_9:
    if (mainPort[0])
      IOObjectRelease(mainPort[0]);
    if (v8)
      IOObjectRelease(v8);
    goto LABEL_13;
  }
  v6 = IORegistryEntryIDMatching(v4);
  IOServiceGetMatchingServices(v5, v6, mainPort);
  if (mainPort[0])
  {
    v7 = IOIteratorNext(mainPort[0]);
    v8 = v7;
    if (v7 && (IORegistryEntryGetParentEntry(v7, "IOService", &parent), parent))
    {
      if (IOObjectConformsTo(parent, "AppleUSBDeviceNCMData"))
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = IOObjectConformsTo(parent, "AppleUSBEthernetDevice") != 0;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
    goto LABEL_9;
  }
  LOBYTE(v5) = 0;
LABEL_13:
  if (parent)
    IOObjectRelease(parent);
LABEL_15:
  if (mainPort[1])
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], mainPort[1]);
  return v5;
}

void __65__PSSystemConfigurationDynamicStoreEthernetWatcher_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_gSharedEthernetWatcherInstance;
  sharedManager_gSharedEthernetWatcherInstance = (uint64_t)v1;

}

- (void)registerForEthernetAdapterNotifications
{
  const __CFAllocator *v3;
  __SCDynamicStore *v4;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  CFMutableArrayRef Mutable;
  __CFArray *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v12;
  const __CFString *v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef NetworkInterface;
  CFStringRef v17;
  CFMutableArrayRef v18;
  __CFArray *v19;
  const __CFString *v20;
  CFStringRef NetworkServiceEntity;
  CFStringRef v22;
  CFStringRef v23;
  CFStringRef v24;
  CFStringRef v25;
  CFStringRef v26;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v28;
  SCDynamicStoreContext v29;

  v29.version = 0;
  memset(&v29.retain, 0, 24);
  v29.info = self;
  if (!self->_dynamicStore)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.preferences.EthernetMananger"), (SCDynamicStoreCallBack)__registerForEthernetAdapterNotificationsCallback, &v29);
    self->_dynamicStore = v4;
    if (v4)
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(v3, v4, 0);
      self->_dynamicStoreSource = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_dynamicStoreSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        if (Mutable)
        {
          v8 = Mutable;
          v9 = (const __CFString *)*MEMORY[0x1E0CE8B30];
          v10 = (const __CFString *)*MEMORY[0x1E0CE8B78];
          NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
          if (NetworkGlobalEntity)
          {
            v12 = NetworkGlobalEntity;
            CFArrayAppendValue(v8, NetworkGlobalEntity);
            CFRelease(v12);
            v13 = (const __CFString *)*MEMORY[0x1E0CE8B80];
            v14 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v9, (CFStringRef)*MEMORY[0x1E0CE8B80]);
            if (v14)
            {
              v15 = v14;
              CFArrayAppendValue(v8, v14);
              CFRelease(v15);
              NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(v3, v9);
              if (NetworkInterface)
              {
                v17 = NetworkInterface;
                CFArrayAppendValue(v8, NetworkInterface);
                CFRelease(v17);
                v18 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
                if (v18)
                {
                  v19 = v18;
                  v20 = (const __CFString *)*MEMORY[0x1E0CE8B20];
                  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v9, (CFStringRef)*MEMORY[0x1E0CE8B20], v10);
                  if (NetworkServiceEntity)
                  {
                    v22 = NetworkServiceEntity;
                    CFArrayAppendValue(v19, NetworkServiceEntity);
                    CFRelease(v22);
                    v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v9, v20, v13);
                    if (v23)
                    {
                      v24 = v23;
                      CFArrayAppendValue(v19, v23);
                      CFRelease(v24);
                      v25 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E0CE8B28], v20, (CFStringRef)*MEMORY[0x1E0CE8B88]);
                      if (v25)
                      {
                        v26 = v25;
                        CFArrayAppendValue(v19, v25);
                        CFRelease(v26);
                        NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v3, v9, v20, (CFStringRef)*MEMORY[0x1E0CE8B90]);
                        if (NetworkInterfaceEntity)
                        {
                          v28 = NetworkInterfaceEntity;
                          CFArrayAppendValue(v19, NetworkInterfaceEntity);
                          CFRelease(v28);
                          SCDynamicStoreSetNotificationKeys(self->_dynamicStore, v8, v19);
                        }
                      }
                    }
                  }
                  CFRelease(v19);
                }
              }
            }
          }
          CFRelease(v8);
        }
      }
    }
  }
}

- (PSSystemConfigurationDynamicStoreEthernetWatcher)init
{
  PSSystemConfigurationDynamicStoreEthernetWatcher *v2;
  PSSystemConfigurationDynamicStoreEthernetWatcher *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreEthernetWatcher;
  v2 = -[PSSystemConfigurationDynamicStoreEthernetWatcher init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PSSystemConfigurationDynamicStoreEthernetWatcher registerForEthernetAdapterNotifications](v2, "registerForEthernetAdapterNotifications");
  return v3;
}

- (BOOL)hasEthernetNetworkInterfaces
{
  void *v2;
  BOOL v3;

  -[PSSystemConfigurationDynamicStoreEthernetWatcher ethernetNetworkInterfaces](self, "ethernetNetworkInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PSSystemConfigurationDynamicStoreEthernetWatcher_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_cacheOnce_124 != -1)
    dispatch_once(&sharedManager_cacheOnce_124, block);
  return (id)sharedManager_gSharedEthernetWatcherInstance;
}

- (void)dealloc
{
  __CFRunLoop *Current;
  __SCDynamicStore *dynamicStore;
  objc_super v5;

  if (self->_dynamicStoreSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_dynamicStoreSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_dynamicStoreSource);
  }
  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
    CFRelease(dynamicStore);
  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreEthernetWatcher;
  -[PSSystemConfigurationDynamicStoreEthernetWatcher dealloc](&v5, sel_dealloc);
}

- (void)ethernetDynamicStoreDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.Preferences.Ethernet"), 0);

}

@end
