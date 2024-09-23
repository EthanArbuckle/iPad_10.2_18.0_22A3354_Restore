@implementation SCRDUSBDevice

- (SCRDUSBDevice)initWithIOObject:(unsigned int)a3
{
  SCRDUSBDevice *v4;
  const __CFUUID *v5;
  const __CFUUID *v6;
  IOCFPlugInInterface **v7;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v9;
  CFUUIDBytes v10;
  SCRDUSBDevice *v11;
  IOUSBDeviceStruct300 **v12;
  uint64_t v13;
  NSString *privateRunLoopMode;
  objc_super v16;
  IOUSBDeviceStruct300 **v17;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;

  v16.receiver = self;
  v16.super_class = (Class)SCRDUSBDevice;
  v4 = -[SCRDUSBDevice init](&v16, sel_init);
  if (!v4)
  {
LABEL_8:
    v11 = v4;
    goto LABEL_9;
  }
  if (a3)
  {
    theScore = 0;
    theInterface = 0;
    v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    v6 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(a3, v5, v6, &theInterface, &theScore))
    {
      v17 = 0;
      v7 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x39u, 0x61u, 4u, 0xF7u, 0x94u, 0x3Du, 0x48u, 0x93u, 0x90u, 0xF1u, 0x69u, 0xBDu, 0x6Cu, 0xF5u, 0xC2u, 0xEBu);
      v10 = CFUUIDGetUUIDBytes(v9);
      LODWORD(v7) = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, IOUSBDeviceStruct300 ***))QueryInterface)(v7, *(_QWORD *)&v10.byte0, *(_QWORD *)&v10.byte8, &v17);
      ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
      if (!(_DWORD)v7)
      {
        v12 = v17;
        v4->_device = v17;
        if (!v12)
        {
          v11 = 0;
          goto LABEL_9;
        }
        v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SCRDUSBDevicePrivateRunLoop%lld"), v4);
        privateRunLoopMode = v4->_privateRunLoopMode;
        v4->_privateRunLoopMode = (NSString *)v13;

        goto LABEL_8;
      }
    }
  }
  v11 = 0;
  v4->_device = 0;
LABEL_9:

  return v11;
}

- (void)dealloc
{
  IOUSBInterfaceStruct220 **interface;
  __CFRunLoopSource *v4;
  __CFRunLoopSource *v5;
  IOUSBDeviceStruct300 **device;
  objc_super v7;

  -[SCRDUSBDevice registerForDisconnectNotifications:](self, "registerForDisconnectNotifications:", 0);
  interface = self->_interface;
  if (interface)
  {
    v4 = (__CFRunLoopSource *)((uint64_t (*)(IOUSBInterfaceStruct220 **))(*interface)->GetInterfaceAsyncEventSource)(interface);
    if (v4)
    {
      v5 = v4;
      CFRunLoopSourceInvalidate(v4);
      CFRelease(v5);
    }
    ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->USBInterfaceClose)(self->_interface);
    ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->Release)(self->_interface);
  }
  device = self->_device;
  if (device)
  {
    if (self->_isOpen)
    {
      ((void (*)(IOUSBDeviceStruct300 **))(*device)->USBDeviceClose)(device);
      device = self->_device;
    }
    ((void (*)(IOUSBDeviceStruct300 **))(*device)->Release)(device);
  }
  v7.receiver = self;
  v7.super_class = (Class)SCRDUSBDevice;
  -[SCRDUSBDevice dealloc](&v7, sel_dealloc);
}

- (BOOL)open
{
  return -[SCRDUSBDevice openWithSeize:](self, "openWithSeize:", 1);
}

- (BOOL)openWithSeize:(BOOL)a3
{
  BOOL result;
  IOUSBDeviceStruct300 **device;
  uint64_t v6;

  if (self->_isOpen)
    return 1;
  device = self->_device;
  v6 = 64;
  if (a3)
    v6 = 232;
  if ((*(unsigned int (**)(void))((char *)&(*device)->_reserved + v6))())
    return 0;
  result = 1;
  self->_isOpen = 1;
  return result;
}

- (BOOL)close
{
  IOUSBInterfaceStruct220 **interface;
  __CFRunLoopSource *v4;
  __CFRunLoopSource *v5;

  if (self->_isOpen)
  {
    interface = self->_interface;
    if (interface)
    {
      v4 = (__CFRunLoopSource *)((uint64_t (*)(IOUSBInterfaceStruct220 **, SEL))(*interface)->GetInterfaceAsyncEventSource)(interface, a2);
      if (v4)
      {
        v5 = v4;
        CFRunLoopSourceInvalidate(v4);
        CFRelease(v5);
      }
      ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->USBInterfaceClose)(self->_interface);
      ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->Release)(self->_interface);
      self->_interface = 0;
    }
    ((void (*)(IOUSBDeviceStruct300 **, SEL))(*self->_device)->USBDeviceClose)(self->_device, a2);
    *(_WORD *)&self->_isOpen = 0;
  }
  return 1;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (BOOL)isConfigured
{
  return self->_isConfigured;
}

- (int)vendor
{
  IOUSBDeviceStruct300 **device;
  unsigned __int16 v4;

  device = self->_device;
  if (!device)
    return -1;
  v4 = 0;
  if (((unsigned int (*)(IOUSBDeviceStruct300 **, unsigned __int16 *))(*device)->GetDeviceVendor)(device, &v4))
  {
    return -1;
  }
  else
  {
    return v4;
  }
}

- (int)product
{
  IOUSBDeviceStruct300 **device;
  unsigned __int16 v4;

  device = self->_device;
  if (!device)
    return -1;
  v4 = 0;
  if (((unsigned int (*)(IOUSBDeviceStruct300 **, unsigned __int16 *))(*device)->GetDeviceProduct)(device, &v4))
  {
    return -1;
  }
  else
  {
    return v4;
  }
}

- (BOOL)reset
{
  return self->_isOpen
      && ((unsigned int (*)(IOUSBDeviceStruct300 **, SEL))(*self->_device)->ResetDevice)(self->_device, a2) == 0;
}

- (unsigned)numberOfConfigurations
{
  IOUSBDeviceStruct300 **device;
  int v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v6 = 0;
  device = self->_device;
  if (!device)
    return 0;
  v3 = ((uint64_t (*)(IOUSBDeviceStruct300 **, unsigned __int8 *))(*device)->GetNumberOfConfigurations)(device, &v6);
  v4 = v6;
  if (v3)
    return 0;
  return v4;
}

- (BOOL)setConfiguration:(unsigned __int8)a3
{
  BOOL result;
  uint64_t v5;

  if (!self->_isOpen)
    return 0;
  v5 = 0;
  if (((unsigned int (*)(IOUSBDeviceStruct300 **, _QWORD, uint64_t *))(*self->_device)->GetConfigurationDescriptorPtr)(self->_device, a3, &v5)|| ((unsigned int (*)(IOUSBDeviceStruct300 **, _QWORD))(*self->_device)->SetConfiguration)(self->_device, *(unsigned __int8 *)(v5 + 5)))
  {
    return 0;
  }
  result = 1;
  self->_isConfigured = 1;
  return result;
}

- (BOOL)setInterface:(unsigned __int8)a3
{
  unsigned int v4;
  IOUSBInterfaceStruct220 **v5;
  int v6;
  io_object_t v7;
  io_service_t v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  IOCFPlugInInterface **v11;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v13;
  CFUUIDBytes v14;
  int v15;
  int v16;
  IOUSBInterfaceStruct220 **interface;
  __CFRunLoopSource *v18;
  __CFRunLoopSource *v19;
  SInt32 theScore;
  IOUSBInterfaceStruct220 **v22;
  IOCFPlugInInterface **theInterface;
  io_iterator_t iterator;
  uint64_t v25;

  if (!self->_isOpen)
    goto LABEL_4;
  if (!self->_isConfigured)
    goto LABEL_4;
  v4 = a3;
  iterator = 0;
  v22 = 0;
  theInterface = 0;
  theScore = 0;
  v25 = -1;
  if (((unsigned int (*)(IOUSBDeviceStruct300 **, uint64_t *, io_iterator_t *))(*self->_device)->CreateInterfaceIterator)(self->_device, &v25, &iterator))
  {
    goto LABEL_4;
  }
  v6 = 0;
  do
  {
    v7 = IOIteratorNext(iterator);
    ++v6;
  }
  while (v4 >= v6);
  v8 = v7;
  IOObjectRelease(iterator);
  if (!v8)
    goto LABEL_4;
  v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  IOCreatePlugInInterfaceForService(v8, v9, v10, &theInterface, &theScore);
  IOObjectRelease(v8);
  v11 = theInterface;
  if (!theInterface)
    goto LABEL_4;
  QueryInterface = (*theInterface)->QueryInterface;
  v13 = CFUUIDGetConstantUUIDWithBytes(0, 0x77u, 0xDu, 0xE6u, 0xCu, 0x2Fu, 0xE8u, 0x11u, 0xD8u, 0xA5u, 0x82u, 0, 3u, 0x93u, 0xDCu, 0xB1u, 0xD0u);
  v14 = CFUUIDGetUUIDBytes(v13);
  v15 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, IOUSBInterfaceStruct220 ***))QueryInterface)(v11, *(_QWORD *)&v14.byte0, *(_QWORD *)&v14.byte8, &v22);
  ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
  if (v15 || !v22)
    goto LABEL_4;
  v16 = ((uint64_t (*)(IOUSBInterfaceStruct220 **))(*v22)->USBInterfaceOpenSeize)(v22);
  v5 = v22;
  if (v16)
  {
    ((void (*)(IOUSBInterfaceStruct220 **))(*v22)->Release)(v22);
LABEL_4:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (v22)
  {
    interface = self->_interface;
    if (interface)
    {
      v18 = (__CFRunLoopSource *)((uint64_t (*)(IOUSBInterfaceStruct220 **))(*interface)->GetInterfaceAsyncEventSource)(self->_interface);
      if (v18)
      {
        v19 = v18;
        CFRunLoopSourceInvalidate(v18);
        CFRelease(v19);
      }
      ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->USBInterfaceClose)(self->_interface);
      ((void (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->Release)(self->_interface);
      v5 = v22;
    }
    self->_interface = v5;
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

- (BOOL)setAlternateInterface:(unsigned __int8)a3
{
  IOUSBInterfaceStruct220 **interface;

  interface = self->_interface;
  if (interface)
    LOBYTE(interface) = ((unsigned int (*)(IOUSBInterfaceStruct220 **, _QWORD))(*interface)->SetAlternateInterface)(interface, a3) == 0;
  return (char)interface;
}

- (BOOL)sendControlRequest:(unsigned __int8)a3 type:(unsigned __int8)a4 value:(unsigned __int16)a5 index:(unsigned __int16)a6 data:(void *)a7 size:(unsigned __int16)a8 sizeTransferred:(unint64_t *)a9 pipe:(unsigned __int8)a10 timeout:(double)a11
{
  __CFRunLoop *Current;
  _DWORD *v20;
  _DWORD *v21;
  __CFRunLoopSource *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v27;
  void *v28;
  _BYTE v29[2];
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  void *v33;
  uint64_t v34;
  CFRunLoopSourceRef source;

  if (!self->_interface)
    return 0;
  Current = CFRunLoopGetCurrent();
  v20 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
  if (!v20)
    return 0;
  v21 = v20;
  v29[1] = a3;
  v29[0] = a4;
  v30 = a5;
  v31 = a6;
  v32 = a8;
  v33 = a7;
  v34 = 0;
  v22 = (__CFRunLoopSource *)((uint64_t (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->GetInterfaceAsyncEventSource)(self->_interface);
  source = v22;
  if (!v22)
  {
    if (((unsigned int (*)(IOUSBInterfaceStruct220 **, CFRunLoopSourceRef *))(*self->_interface)->CreateInterfaceAsyncEventSource)(self->_interface, &source))
    {
      goto LABEL_7;
    }
    v22 = source;
  }
  CFRunLoopAddSource(Current, v22, (CFRunLoopMode)self->_privateRunLoopMode);
  +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addCompletion:", v21);

  if (((unsigned int (*)(IOUSBInterfaceStruct220 **, _QWORD, _BYTE *, void (*)(uint64_t, int, uint64_t), _DWORD *))(*self->_interface)->ControlRequestAsync)(self->_interface, a10, v29, _readWriteAsyncCallback, v21))
  {
    CFRunLoopRemoveSource(Current, source, (CFRunLoopMode)self->_privateRunLoopMode);
    +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeCompletion:", v21);

LABEL_7:
    free(v21);
    return 0;
  }
  if (CFRunLoopRunInMode((CFRunLoopMode)self->_privateRunLoopMode, a11, 1u) == kCFRunLoopRunTimedOut)
  {
    ((void (*)(IOUSBInterfaceStruct220 **, _QWORD))(*self->_interface)->AbortPipe)(self->_interface, a10);
    CFRunLoopRunInMode((CFRunLoopMode)self->_privateRunLoopMode, 0.0, 1u);
  }
  CFRunLoopRemoveSource(Current, source, (CFRunLoopMode)self->_privateRunLoopMode);
  v27 = v21[2];
  v25 = v27 == 0;
  if (a9 && !v27)
    *a9 = *(_QWORD *)v21;
  +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeCompletion:", v21);

  free(v21);
  return v25;
}

- (unint64_t)writeData:(void *)a3 withSize:(unint64_t)a4 toPipe:(unsigned __int8)a5 withTimeout:(double)a6
{
  uint64_t v8;
  void *v11;
  unint64_t v12;

  if (!a3 || !a4)
    return 0;
  v8 = a5;
  v11 = malloc_type_malloc(a4, 0x9ADBDC9CuLL);
  memcpy(v11, a3, a4);
  v12 = -[SCRDUSBDevice _transferData:withSize:toPipe:withTimeout:withFunction:](self, "_transferData:withSize:toPipe:withTimeout:withFunction:", v11, a4, v8, (*self->_interface)->WritePipeAsync, a6);
  free(v11);
  return v12;
}

- (BOOL)writeData:(void *)a3 withSize:(unint64_t)a4 toBulkPipe:(unsigned __int8)a5 withNoDataTimeout:(unsigned int)a6 andCompletionTimeOut:(unsigned int)a7
{
  BOOL v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;

  v7 = 0;
  if (a3 && a4 && self->_interface)
  {
    v10 = *(_QWORD *)&a7;
    v11 = *(_QWORD *)&a6;
    v12 = a5;
    v14 = malloc_type_malloc(a4, 0x28BCEB67uLL);
    memcpy(v14, a3, a4);
    v7 = ((unsigned int (*)(IOUSBInterfaceStruct220 **, uint64_t, void *, unint64_t, uint64_t, uint64_t))(*self->_interface)->WritePipeTO)(self->_interface, v12, v14, a4, v11, v10) == 0;
    free(v14);
  }
  return v7;
}

- (unint64_t)readData:(void *)a3 withSize:(unint64_t)a4 fromPipe:(unsigned __int8)a5 withTimeout:(double)a6
{
  return -[SCRDUSBDevice _transferData:withSize:toPipe:withTimeout:withFunction:](self, "_transferData:withSize:toPipe:withTimeout:withFunction:", a3, a4, a5, (*self->_interface)->ReadPipeAsync, a6);
}

- (BOOL)readData:(void *)a3 withSize:(unint64_t *)a4 fromPipe:(unsigned __int8)a5
{
  IOUSBInterfaceStruct220 **interface;

  interface = self->_interface;
  if (interface)
    LOBYTE(interface) = ((unsigned int (*)(IOUSBInterfaceStruct220 **, _QWORD, void *, unint64_t *))(*interface)->ReadPipe)(interface, a5, a3, a4) == 0;
  return (char)interface;
}

- (unint64_t)readData:(void *)a3 withSize:(unint64_t)a4 fromBulkPipe:(unsigned __int8)a5 withNoDataTimeout:(unsigned int)a6 andCompletionTimeOut:(unsigned int)a7
{
  unint64_t result;
  unsigned int v8;

  result = (unint64_t)self->_interface;
  if (result)
  {
    v8 = a4;
    (*(void (**)(unint64_t, _QWORD, void *, unsigned int *, _QWORD, _QWORD))(*(_QWORD *)result + 312))(result, a5, a3, &v8, *(_QWORD *)&a6, *(_QWORD *)&a7);
    return v8;
  }
  return result;
}

- (unint64_t)_transferData:(void *)a3 withSize:(unint64_t)a4 toPipe:(unsigned __int8)a5 withTimeout:(double)a6 withFunction:(void *)a7
{
  uint64_t v9;
  unint64_t *v13;
  unint64_t *v14;
  __CFRunLoop *Current;
  __CFRunLoopSource *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  CFRunLoopSourceRef source;

  v9 = a5;
  v13 = (unint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
  if (!v13)
    return 0;
  v14 = v13;
  if (!self->_interface)
  {
LABEL_12:
    v19 = *v14;
    +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeCompletion:", v14);

    free(v14);
    return v19;
  }
  Current = CFRunLoopGetCurrent();
  v16 = (__CFRunLoopSource *)((uint64_t (*)(IOUSBInterfaceStruct220 **))(*self->_interface)->GetInterfaceAsyncEventSource)(self->_interface);
  source = v16;
  if (!v16)
  {
    if (((unsigned int (*)(IOUSBInterfaceStruct220 **, CFRunLoopSourceRef *))(*self->_interface)->CreateInterfaceAsyncEventSource)(self->_interface, &source))
    {
      goto LABEL_7;
    }
    v16 = source;
  }
  CFRunLoopAddSource(Current, v16, (CFRunLoopMode)self->_privateRunLoopMode);
  +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addCompletion:", v14);

  if (!((unsigned int (*)(IOUSBInterfaceStruct220 **, uint64_t, void *, unint64_t, void (*)(uint64_t, int, uint64_t), unint64_t *))a7)(self->_interface, v9, a3, a4, _readWriteAsyncCallback, v14))
  {
    if (CFRunLoopRunInMode((CFRunLoopMode)self->_privateRunLoopMode, a6, 1u) == kCFRunLoopRunTimedOut)
    {
      ((void (*)(IOUSBInterfaceStruct220 **, uint64_t))(*self->_interface)->AbortPipe)(self->_interface, v9);
      CFRunLoopRunInMode((CFRunLoopMode)self->_privateRunLoopMode, 0.01, 1u);
    }
    CFRunLoopRemoveSource(Current, source, (CFRunLoopMode)self->_privateRunLoopMode);
    goto LABEL_12;
  }
  CFRunLoopRemoveSource(Current, source, (CFRunLoopMode)self->_privateRunLoopMode);
  +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeCompletion:", v14);

LABEL_7:
  free(v14);
  return 0;
}

- (BOOL)getInformationForPipe:(unsigned __int8)a3 direction:(char *)a4 number:(char *)a5 transferType:(char *)a6 maxPacketSize:(unsigned __int16 *)a7 interval:(char *)a8
{
  IOUSBInterfaceStruct220 **interface;
  int v14;
  unsigned __int16 v16;
  __int16 v17;
  __int16 v18;

  interface = self->_interface;
  if (interface)
  {
    v18 = 0;
    v17 = 0;
    v16 = 0;
    v14 = ((uint64_t (*)(IOUSBInterfaceStruct220 **, _QWORD, char *, __int16 *, char *, unsigned __int16 *, __int16 *))(*interface)->GetPipeProperties)(interface, a3, (char *)&v18 + 1, &v18, (char *)&v17 + 1, &v16, &v17);
    LOBYTE(interface) = v14 == 0;
    if (!v14)
    {
      if (a4)
        *a4 = HIBYTE(v18);
      if (a5)
        *a5 = v18;
      if (a6)
        *a6 = HIBYTE(v17);
      if (a7)
        *a7 = v16;
      if (a8)
        *a8 = v17;
    }
  }
  return (char)interface;
}

- (void)registerForDisconnectNotifications:(BOOL)a3
{
  io_object_t notification;
  unsigned int *p_notification;
  IOUSBInterfaceStruct220 **interface;
  IONotificationPort *notificationPort;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  IONotificationPort *v10;
  io_service_t service;

  p_notification = &self->_notification;
  notification = self->_notification;
  if (a3)
  {
    if (!notification)
    {
      interface = self->_interface;
      if (interface)
      {
        service = 0;
        if (!((unsigned int (*)(IOUSBInterfaceStruct220 **, io_service_t *))(*interface)->GetDevice)(interface, &service))
        {
          notificationPort = self->_notificationPort;
          if (notificationPort
            || (notificationPort = IONotificationPortCreate(*MEMORY[0x24BDD8B18]),
                (self->_notificationPort = notificationPort) != 0))
          {
            if (!IOServiceAddInterestNotification(notificationPort, service, "IOGeneralInterest", (IOServiceInterestCallback)_notificationHandler, self, p_notification))
            {
              Current = CFRunLoopGetCurrent();
              RunLoopSource = IONotificationPortGetRunLoopSource(self->_notificationPort);
              CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
            }
          }
        }
      }
    }
  }
  else
  {
    if (notification)
    {
      IOObjectRelease(notification);
      *p_notification = 0;
    }
    v10 = self->_notificationPort;
    if (v10)
    {
      IONotificationPortDestroy(v10);
      self->_notificationPort = 0;
    }
  }
}

- (void)abortPipe:(unsigned __int8)a3
{
  IOUSBInterfaceStruct220 **interface;

  interface = self->_interface;
  if (interface)
    ((void (*)(IOUSBInterfaceStruct220 **, _QWORD))(*interface)->AbortPipe)(interface, a3);
}

- (BOOL)clearPipe:(unsigned __int8)a3 bothEnds:(BOOL)a4
{
  IOUSBInterfaceStruct220 **interface;
  uint64_t v5;

  interface = self->_interface;
  if (interface)
  {
    v5 = 240;
    if (a4)
      v5 = 360;
    LOBYTE(interface) = (*(unsigned int (**)(void))((char *)&(*interface)->_reserved + v5))() == 0;
  }
  return (char)interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateRunLoopMode, 0);
}

@end
