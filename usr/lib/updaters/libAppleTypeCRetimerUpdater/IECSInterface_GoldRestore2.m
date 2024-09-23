@implementation IECSInterface_GoldRestore2

- (NSNumber)rid
{
  io_registry_entry_t v2;
  void *Value;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = -[IECSInterface_GoldRestore2 service](self, "service");
  Value = 0;
  if (!IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
  {
    Value = (void *)CFDictionaryGetValue(properties, CFSTR("RID"));
    CFRelease(properties);
  }
  return (NSNumber *)Value;
}

+ (IECSInterface_GoldRestore2)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__IECSInterface_GoldRestore2_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, block);
  return (IECSInterface_GoldRestore2 *)(id)sharedInstance_sharedInstance;
}

- (IECSInterface_GoldRestore2)init
{
  IECSInterface_GoldRestore2 *v2;
  IECSInterface_GoldRestore2 *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IECSInterface_GoldRestore2;
  v2 = -[IECSInterface_GoldRestore2 init](&v5, sel_init);
  v3 = v2;
  if (!v2 || -[IECSInterface_GoldRestore2 createUserClient](v2, "createUserClient"))
  {

    return 0;
  }
  return v3;
}

- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3 isHCPM:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  IECSInterface_GoldRestore2 *v6;
  uint64_t v7;
  uint64_t ParentEntry;
  io_service_t v9;
  const __CFUUID *v10;
  const __CFUUID *v11;
  uint64_t v12;
  IOCFPlugInInterfaceStruct **cfPlugInInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v15;
  CFUUIDBytes v16;
  uint64_t v17;
  SInt32 theScore;
  io_registry_entry_t parent;
  objc_super v21;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)IECSInterface_GoldRestore2;
  v6 = -[IECSInterface_GoldRestore2 init](&v21, sel_init);
  if (!v6)
    goto LABEL_11;
  parent = 0;
  if (v4)
  {
    parent = v5;
    IOObjectRetain(v5);
    v7 = v5;
  }
  else
  {
    ParentEntry = IORegistryEntryGetParentEntry(v5, "IOService", &parent);
    if ((_DWORD)ParentEntry)
    {
      NSLog(CFSTR("...Unable to find parent for IECS service.  err = 0x%X"), ParentEntry);
      goto LABEL_11;
    }
    v7 = parent;
  }
  -[IECSInterface_GoldRestore2 setService:](v6, "setService:", v7);
  theScore = 0;
  v9 = -[IECSInterface_GoldRestore2 service](v6, "service");
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v12 = IOCreatePlugInInterfaceForService(v9, v10, v11, &v6->_cfPlugInInterface, &theScore);
  if ((_DWORD)v12)
  {
    NSLog(CFSTR("...Unable to create CFPlugInInterface. err = 0x%X"), v12);
  }
  else
  {
    cfPlugInInterface = v6->_cfPlugInInterface;
    QueryInterface = (*cfPlugInInterface)->QueryInterface;
    v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
    v16 = CFUUIDGetUUIDBytes(v15);
    v17 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, AppleHPMLibInterfaceStructV3 ***))QueryInterface)(cfPlugInInterface, *(_QWORD *)&v16.byte0, *(_QWORD *)&v16.byte8, &v6->_deviceInterface);
    if (!(_DWORD)v17)
    {
      IOObjectRetain(v5);
      -[IECSInterface_GoldRestore2 setDeviceService:](v6, "setDeviceService:", v5);
      v6->_userClientActive = 1;
      return v6;
    }
    NSLog(CFSTR("...Unable to create Device Interface. err = 0x%X"), v17);
  }
LABEL_11:

  return 0;
}

- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3
{
  return -[IECSInterface_GoldRestore2 initWithService:isHCPM:](self, "initWithService:isHCPM:", *(_QWORD *)&a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[IECSInterface_GoldRestore2 destroyUserClient](self, "destroyUserClient");
  if (-[IECSInterface_GoldRestore2 service](self, "service"))
    IOObjectRelease(-[IECSInterface_GoldRestore2 service](self, "service"));
  if (-[IECSInterface_GoldRestore2 deviceService](self, "deviceService"))
    IOObjectRelease(-[IECSInterface_GoldRestore2 deviceService](self, "deviceService"));
  v3.receiver = self;
  v3.super_class = (Class)IECSInterface_GoldRestore2;
  -[IECSInterface_GoldRestore2 dealloc](&v3, sel_dealloc);
}

+ (id)locatedDevices
{
  void *v2;
  uint64_t v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  IECSInterface_GoldRestore2 *v8;
  void *v9;
  CFMutableDictionaryRef v11;
  CFMutableDictionaryRef v12;
  io_iterator_t existing;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  existing = 0;
  if (v2)
  {
    v12 = IOServiceMatching("AppleHPMDevice");
    v3 = 0;
    v11 = IOServiceMatching("AppleHCPM");
    v14[0] = &v12;
    v14[1] = &v11;
    v4 = *MEMORY[0x24BDD8B20];
    do
    {
      v5 = *(const __CFDictionary **)v14[v3];
      if (v5)
      {
        if (IOServiceGetMatchingServices(v4, v5, &existing))
        {
          NSLog(CFSTR("Did NOT find service(s) matching AppleHPMDevice(index:%d)"), v3);
        }
        else
        {
          v6 = IOIteratorNext(existing);
          if ((_DWORD)v6)
          {
            v7 = v6;
            do
            {
              v8 = -[IECSInterface_GoldRestore2 initWithService:isHCPM:]([IECSInterface_GoldRestore2 alloc], "initWithService:isHCPM:", v7, v3 == 1);
              if (v8)
                objc_msgSend(v2, "addObject:", v8);

              IOObjectRelease(v7);
              v7 = IOIteratorNext(existing);
            }
            while ((_DWORD)v7);
          }
          if (existing)
            IOObjectRelease(existing);
        }
      }
      else
      {
        NSLog(CFSTR("Did NOT build matching dict(index:%d)"), v3);
      }
      ++v3;
    }
    while (v3 != 2);
    v9 = (void *)objc_msgSend(v2, "copy");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)createUserClient
{
  const __CFDictionary *v3;
  uint64_t v4;
  int v5;
  io_service_t v6;
  const __CFUUID *v7;
  const __CFUUID *v8;
  IOCFPlugInInterfaceStruct ***p_cfPlugInInterface;
  unsigned __int8 v10;
  IOCFPlugInInterfaceStruct **v11;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v13;
  CFUUIDBytes v14;
  SInt32 theScore;

  NSLog(CFSTR("IECSInterface::createUserClient..."), a2);
  v3 = IOServiceMatching("AppleHPMDevice");
  if (!v3)
  {
    v4 = 14;
    NSLog(CFSTR("Did NOT build matching dict"));
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  -[IECSInterface_GoldRestore2 setService:](self, "setService:", IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v3));
  if (!-[IECSInterface_GoldRestore2 service](self, "service"))
  {
    v4 = 16;
    NSLog(CFSTR("Did NOT find service matching AppleHPMDevice"));
    goto LABEL_6;
  }
  v4 = 0;
  v5 = 1;
LABEL_7:
  NSLog(CFSTR("IECS createUserClient - status = 0x%X, self.service = %u, _deviceInterface = %p (prior to IOCreatePlugInInterfaceForService)"), v4, -[IECSInterface_GoldRestore2 service](self, "service"), self->_deviceInterface);
  if (v5)
  {
    theScore = 0;
    v6 = -[IECSInterface_GoldRestore2 service](self, "service");
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
    v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    p_cfPlugInInterface = &self->_cfPlugInInterface;
    v10 = IOCreatePlugInInterfaceForService(v6, v7, v8, &self->_cfPlugInInterface, &theScore);
    v4 = v10;
    if (!v10)
    {
      v11 = *p_cfPlugInInterface;
      QueryInterface = (**p_cfPlugInInterface)->QueryInterface;
      v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
      v14 = CFUUIDGetUUIDBytes(v13);
      if (((unsigned int (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, AppleHPMLibInterfaceStructV3 ***))QueryInterface)(v11, *(_QWORD *)&v14.byte0, *(_QWORD *)&v14.byte8, &self->_deviceInterface))
      {
        v4 = 17;
      }
      else
      {
        v4 = 0;
        self->_userClientActive = 1;
      }
    }
  }
  NSLog(CFSTR("IECS createUserClient - status = 0x%X, self.service = %u, _deviceInterface = %p (after to IOCreatePlugInInterfaceForService or at exit)"), v4, -[IECSInterface_GoldRestore2 service](self, "service"), self->_deviceInterface);
  return v4;
}

- (void)destroyUserClient
{
  AppleHPMLibInterfaceStructV3 **deviceInterface;
  IOCFPlugInInterface **cfPlugInInterface;

  self->_userClientActive = 0;
  deviceInterface = self->_deviceInterface;
  if (deviceInterface)
  {
    (*((void (**)(AppleHPMLibInterfaceStructV3 **, SEL))*deviceInterface + 3))(deviceInterface, a2);
    self->_deviceInterface = 0;
  }
  cfPlugInInterface = self->_cfPlugInInterface;
  if (cfPlugInInterface)
  {
    IODestroyPlugInInterface(cfPlugInInterface);
    self->_cfPlugInInterface = 0;
  }
}

- (id)createFileNameForFirmware:(id *)a3
{
  void *v5;
  io_registry_entry_t v6;
  int v8;
  __CFDictionary *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  _OWORD v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v16, 0, sizeof(v16));
  parent = 0;
  if (IORegistryEntryGetParentEntry(-[IECSInterface_GoldRestore2 service](self, "service"), "IOService", &parent))
    goto LABEL_2;
  v8 = MEMORY[0x24BD2F9BC](-[IECSInterface_GoldRestore2 service](self, "service"), v16);
  v5 = 0;
  v6 = parent;
  if (!v8 && parent)
  {
    if (!*a3)
    {
      properties = 0;
      v5 = 0;
      if (!IORegistryEntryCreateCFProperties(parent, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
      {
        v9 = properties;
        -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("usbc-fw-personality"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x24BDD17C8]);
        if (v10)
          v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("USB-C_%s"), objc_msgSend(objc_retainAutorelease(v10), "bytes"));
        else
          v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("USB-C_FW"), v13);
        v5 = (void *)v12;
        if (properties)
          CFRelease(properties);

      }
      goto LABEL_3;
    }
LABEL_2:
    v5 = 0;
LABEL_3:
    v6 = parent;
  }
  if (v6)
    IOObjectRelease(v6);
  return v5;
}

- (int)iecsReadForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 andOutReadLength:(unint64_t *)a7
{
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v10;

  v10 = 0;
  if (!self->_userClientActive)
  {
    v8 = 17;
LABEL_7:
    NSLog(CFSTR("Failure code: 0x%08X"), a2, a3, a4, a5, *(_QWORD *)&a6, a7, v8, v10);
    return v8;
  }
  if (!a7)
    a7 = (unint64_t *)&v10;
  v7 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, _QWORD, _QWORD, void *, unint64_t, _QWORD, unint64_t *))*self->_deviceInterface
        + 5))(self->_deviceInterface, 0, a3, a4, a5, 0, a7);
  v8 = v7;
  if (v7)
    goto LABEL_7;
  return v8;
}

- (int)iecsWriteForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6
{
  unsigned __int8 v6;
  uint64_t v7;

  if (self->_userClientActive)
  {
    v6 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, _QWORD, _QWORD, void *, unint64_t, _QWORD))*self->_deviceInterface
          + 6))(self->_deviceInterface, 0, a3, a4, a5, 0);
    v7 = v6;
    if (!v6)
      return v7;
  }
  else
  {
    v7 = 17;
  }
  NSLog(CFSTR("Failure code: 0x%08X"), a2, a3, a4, a5, *(_QWORD *)&a6, v7);
  return v7;
}

- (int)iecsAtomicCommand:(unsigned int)a3 data:(void *)a4 dataLength:(unint64_t)a5 retData:(void *)a6 retDataLength:(unint64_t)a7 flags:(unsigned int)a8 timeout:(unint64_t)a9
{
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v12;

  HIDWORD(v12) = a3;
  if (self->_userClientActive)
  {
    LODWORD(v12) = 0;
    v9 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, uint64_t, char *, void *, _QWORD, void *, _QWORD, _QWORD, _WORD, unint64_t, _QWORD, uint64_t))*self->_deviceInterface
          + 13))(self->_deviceInterface, 1, (char *)&v12 + 4, a4, 0, a6, 0, (unsigned __int16)a5, a7, a9, 0, v12);
    v10 = v9;
    if (!v9)
      return v10;
  }
  else
  {
    v10 = 17;
  }
  NSLog(CFSTR("Failure code: 0x%08X"), a2, *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a8, v10);
  return v10;
}

- (int)iecsWaitForIdle:(unsigned int)a3 pollInterval:(unsigned int)a4 timeout:(unsigned int)a5
{
  uint64_t v6;
  unsigned int v8;
  int v9;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;

  v6 = *(_QWORD *)&a3;
  v13 = 0;
  v8 = -1;
  if (!a4 || !a5)
  {
    while (1)
    {
LABEL_7:
      v9 = -[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 8, &v13, 4, v6, 0);
      if (v9)
      {
        if (a4)
          goto LABEL_9;
      }
      else
      {
        v11 = bswap32(v13);
        v13 = v11;
        if (v11)
          v12 = v11 == 558058820;
        else
          v12 = 1;
        if (v12)
          return 0;
        NSLog(CFSTR("IECS command '%c%c%c%c' still outstanding"), HIBYTE(v11), BYTE2(v11), BYTE1(v11), v11);
        if (a4)
LABEL_9:
          usleep(a4);
      }
      if (v8 == -1)
        v8 = -1;
      else
        --v8;
      if (v9 || !v8)
        return v9;
    }
  }
  if (a4 <= a5)
  {
    v8 = a5 / a4;
    goto LABEL_7;
  }
  return 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)deviceService
{
  return self->_deviceService;
}

- (void)setDeviceService:(unsigned int)a3
{
  self->_deviceService = a3;
}

- (NSArray)locatedObjects
{
  return self->_locatedObjects;
}

- (void)setLocatedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_locatedObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedObjects, 0);
}

@end
