@implementation HPMForceRetimerDFUModeSetter

- (HPMForceRetimerDFUModeSetter)initWithHPMService:(unsigned int)a3 deviceService:(unsigned int)a4 enableDFUMode:(BOOL)a5
{
  uint64_t v6;
  id v8;
  os_log_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  IONotificationPort *v15;
  HPMForceRetimerDFUModeSetter *v16;
  objc_super v18;

  v6 = *(_QWORD *)&a4;
  v18.receiver = self;
  v18.super_class = (Class)HPMForceRetimerDFUModeSetter;
  v8 = -[HPMForceRetimerDFUModeSetter init](&v18, sel_init);
  if (v8)
  {
    v9 = os_log_create("com.apple.accessoryupdater.hpm", "retimerDFU");
    v10 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9;

    *((_DWORD *)v8 + 2) = a3;
    if (!objc_msgSend(v8, "getAddressForDeviceService:", v6)
      || !objc_msgSend(v8, "lookupThunderboltController")
      || !objc_msgSend(v8, "initHPMInterface"))
    {
      v16 = 0;
      goto LABEL_8;
    }
    v11 = dispatch_queue_create("HPMForceRetimerDFUModeSetter", 0);
    v12 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v11;

    v13 = dispatch_semaphore_create(0);
    v14 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v13;

    v15 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
    *((_QWORD *)v8 + 7) = v15;
    IONotificationPortSetDispatchQueue(v15, *((dispatch_queue_t *)v8 + 5));
    *((_BYTE *)v8 + 20) = a5;
  }
  v16 = (HPMForceRetimerDFUModeSetter *)v8;
LABEL_8:

  return v16;
}

- (void)dealloc
{
  io_object_t notification;
  IONotificationPort *notificationPort;
  io_object_t thunderboltController;
  AppleHPMLibInterfaceStructV3 **hpmInterface;
  IOCFPlugInInterface **cfPlugInInterface;
  objc_super v8;

  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  thunderboltController = self->_thunderboltController;
  if (thunderboltController)
    IOObjectRelease(thunderboltController);
  hpmInterface = self->_hpmInterface;
  if (hpmInterface)
  {
    (*((void (**)(AppleHPMLibInterfaceStructV3 **, SEL))*hpmInterface + 3))(hpmInterface, a2);
    self->_hpmInterface = 0;
  }
  cfPlugInInterface = self->_cfPlugInInterface;
  if (cfPlugInInterface)
  {
    IODestroyPlugInInterface(cfPlugInInterface);
    self->_cfPlugInInterface = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)HPMForceRetimerDFUModeSetter;
  -[HPMForceRetimerDFUModeSetter dealloc](&v8, sel_dealloc);
}

- (BOOL)initHPMInterface
{
  io_service_t hpmService;
  const __CFUUID *v4;
  const __CFUUID *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *log;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  IOCFPlugInInterfaceStruct **cfPlugInInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v18;
  CFUUIDBytes v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SInt32 theScore;

  theScore = 0;
  hpmService = self->_hpmService;
  v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
  v5 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v6 = IOCreatePlugInInterfaceForService(hpmService, v4, v5, &self->_cfPlugInInterface, &theScore);
  if ((_DWORD)v6)
  {
    v7 = v6;
    log = self->_log;
    v9 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[HPMForceRetimerDFUModeSetter initHPMInterface].cold.2(v7, log, v10, v11, v12, v13, v14, v15);
LABEL_7:
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    cfPlugInInterface = self->_cfPlugInInterface;
    QueryInterface = (*cfPlugInInterface)->QueryInterface;
    v18 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
    v19 = CFUUIDGetUUIDBytes(v18);
    v20 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, AppleHPMLibInterfaceStructV3 ***))QueryInterface)(cfPlugInInterface, *(_QWORD *)&v19.byte0, *(_QWORD *)&v19.byte8, &self->_hpmInterface);
    if (!(_DWORD)v20)
    {
      LOBYTE(v9) = 1;
      return v9;
    }
    v21 = v20;
    v22 = self->_log;
    v9 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[HPMForceRetimerDFUModeSetter initHPMInterface].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_7;
    }
  }
  return v9;
}

- (BOOL)getAddressForDeviceService:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  NSObject *v15;
  CFMutableDictionaryRef properties;

  properties = 0;
  v4 = IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter getAddressForDeviceService:].cold.2(v5, log, v7, v8, v9, v10, v11, v12);
    isKindOfClass = 0;
  }
  else
  {
    CFDictionaryGetValue(properties, CFSTR("Address"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      self->_address = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[HPMForceRetimerDFUModeSetter getAddressForDeviceService:].cold.1(v15);
    }
    CFRelease(properties);

  }
  return isKindOfClass & 1;
}

- (id)getACIOParentData
{
  io_object_t v4;
  io_registry_entry_t v5;
  void *v6;
  const __CFAllocator *v7;
  void *CFProperty;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x24BD2F9D4](self->_hpmService, "IOService", &iterator))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter getACIOParentData].cold.1();
    return 0;
  }
  else
  {
    v4 = IOIteratorNext(iterator);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("acio-parent"), v7, 3u);

        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
        v6 = CFProperty;
      }
      while (v5);
    }
    else
    {
      CFProperty = 0;
    }
    IOObjectRelease(iterator);
    return CFProperty;
  }
}

- (unsigned)getARMIODeviceRegistryEntryForACIOParentProperty:(id)a3
{
  id v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  unsigned int v7;
  io_object_t v8;
  io_registry_entry_t v9;
  const __CFAllocator *v10;
  void *CFProperty;
  void *v12;
  int v13;
  io_iterator_t existing;

  v4 = a3;
  existing = 0;
  v5 = *MEMORY[0x24BDD8B20];
  v6 = IOServiceMatching("AppleARMIODevice");
  if (IOServiceGetMatchingServices(v5, v6, &existing))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter getARMIODeviceRegistryEntryForACIOParentProperty:].cold.1();
    v7 = 0;
  }
  else
  {
    v8 = IOIteratorNext(existing);
    if (v8)
    {
      v9 = v8;
      v7 = 0;
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v9, CFSTR("AAPL,phandle"), v10, 0);
        v12 = CFProperty;
        if (CFProperty)
        {
          v13 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(CFProperty), "bytes");
          if (v13 == *(_DWORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes"))
            v7 = v9;
        }
        if (v7 != v9)
          IOObjectRelease(v9);

        v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    else
    {
      v7 = 0;
    }
    IOObjectRelease(existing);
  }

  return v7;
}

- (unsigned)getThunderboltControllerForARMIODevice:(unsigned int)a3
{
  io_object_t v3;
  io_registry_entry_t v4;
  io_registry_entry_t child;

  v3 = a3;
  child = 0;
  IOObjectRetain(a3);
  if (IORegistryEntryGetChildEntry(v3, "IOService", &child))
  {
LABEL_4:
    v4 = 0;
  }
  else
  {
    while (!IOObjectConformsTo(child, "IOThunderboltController"))
    {
      IOObjectRelease(v3);
      v3 = child;
      if (IORegistryEntryGetChildEntry(child, "IOService", &child))
        goto LABEL_4;
    }
    v4 = child;
  }
  IOObjectRelease(v3);
  return v4;
}

- (BOOL)lookupThunderboltController
{
  void *v3;
  uint64_t v4;
  io_object_t v5;
  unsigned int v6;
  BOOL v7;
  NSObject *log;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  -[HPMForceRetimerDFUModeSetter getACIOParentData](self, "getACIOParentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.1(log, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_11;
  }
  v4 = -[HPMForceRetimerDFUModeSetter getARMIODeviceRegistryEntryForACIOParentProperty:](self, "getARMIODeviceRegistryEntryForACIOParentProperty:", v3);
  if (!(_DWORD)v4)
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[HPMForceRetimerDFUModeSetter getThunderboltControllerForARMIODevice:](self, "getThunderboltControllerForARMIODevice:", v4);
  self->_thunderboltController = v6;
  if (!v6)
  {
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.3(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  IOObjectRelease(v5);
  v7 = self->_thunderboltController != 0;
LABEL_12:

  return v7;
}

- (BOOL)dfuModeEnabled
{
  CFTypeRef CFProperty;
  CFTypeRef v3;

  CFProperty = IORegistryEntryCreateCFProperty(self->_thunderboltController, CFSTR("Disable Scan"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = CFProperty;
  if (CFProperty)
    CFRelease(CFProperty);
  return v3 != 0;
}

- (void)propertyChanged
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[HPMForceRetimerDFUModeSetter propertyChanged]";
  _os_log_debug_impl(&dword_24BC99000, log, OS_LOG_TYPE_DEBUG, "%s: Set complete.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (BOOL)setComplete
{
  return -[HPMForceRetimerDFUModeSetter dfuModeEnabled](self, "dfuModeEnabled") ^ !self->_enableDFUMode;
}

- (BOOL)startMonitoringForOperationCompletion
{
  _BOOL4 v2;

  if (self->_notification
    || !IOServiceAddInterestNotification(self->_notificationPort, self->_thunderboltController, "IOGeneralInterest", (IOServiceInterestCallback)_generalInterestCallback, self, &self->_notification))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (v2)
    {
      -[HPMForceRetimerDFUModeSetter startMonitoringForOperationCompletion].cold.1();
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (BOOL)doSet
{
  NSObject *log;
  BOOL v4;
  NSObject *v5;
  BOOL *p_enableDFUMode;
  _BOOL8 v7;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[HPMForceRetimerDFUModeSetter setComplete](self, "setComplete"))
  {
    log = self->_log;
    v4 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v5 = log;
      v13 = 136315394;
      v14 = "-[HPMForceRetimerDFUModeSetter doSet]";
      v15 = 2080;
      v16 = -[HPMForceRetimerDFUModeSetter requestType](self, "requestType");
      _os_log_impl(&dword_24BC99000, v5, OS_LOG_TYPE_INFO, "%s: No work to do for %s request", (uint8_t *)&v13, 0x16u);

    }
    return v4;
  }
  p_enableDFUMode = &self->_enableDFUMode;
  if (self->_enableDFUMode)
  {
    if (!-[HPMForceRetimerDFUModeSetter startMonitoringForOperationCompletion](self, "startMonitoringForOperationCompletion"))return 0;
    v7 = *p_enableDFUMode;
  }
  else
  {
    v7 = 0;
  }
  if ((*((unsigned int (**)(AppleHPMLibInterfaceStructV3 **, _QWORD, _BOOL8))*self->_hpmInterface + 12))(self->_hpmInterface, self->_address, v7))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[HPMForceRetimerDFUModeSetter doSet].cold.4();
    return 0;
  }
  if (*p_enableDFUMode)
  {
    v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[HPMForceRetimerDFUModeSetter doSet].cold.3(v9);
    v10 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_notificationSemaphore, v10))
    {
      v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[HPMForceRetimerDFUModeSetter doSet].cold.2(p_enableDFUMode, v11);
      return 0;
    }
  }
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[HPMForceRetimerDFUModeSetter doSet].cold.1(v12);
  return 1;
}

- (const)requestType
{
  if (self->_enableDFUMode)
    return "enable";
  else
    return "disable";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSemaphore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initHPMInterface
{
  OUTLINED_FUNCTION_4(&dword_24BC99000, a2, a3, "Failed to locate plugin interface (0x%08x)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)getAddressForDeviceService:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24BC99000, log, OS_LOG_TYPE_ERROR, "Failed to locate valid address property.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getAddressForDeviceService:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_24BC99000, a2, a3, "Failed to locate device address (0x%08x)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)getACIOParentData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: HPM iterator lookup failed (0x%08x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)getARMIODeviceRegistryEntryForACIOParentProperty:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: Failed to look up ARM devices (0x%08x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)lookupThunderboltController
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Failed to locate _thunderboltController", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)startMonitoringForOperationCompletion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: Failed to register for interest (0x%08x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)doSet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: Force retimer DFU mode failed (0x%08x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
