BOOL _TelephonyUSBCreatePlugInInterface(io_service_t a1, const __CFUUID *a2, IOCFPlugInInterface ***a3)
{
  int v6;
  const __CFUUID *v7;
  kern_return_t v8;
  SInt32 theScore;

  theScore = -1431655766;
  v6 = 5;
  while (1)
  {
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v8 = IOCreatePlugInInterfaceForService(a1, a2, v7, a3, &theScore);
    if (v8 != -536870210)
      break;
    _TelephonyUtilDebugPrint();
    usleep(0x30D40u);
    if (!--v6)
      return 0;
  }
  if (!v8)
    return *a3 != 0;
  _TelephonyUtilDebugPrint();
  return 0;
}

uint64_t TelephonyUSBIterateIterator(io_iterator_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = IOIteratorNext(a1);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
      IOObjectRelease(v5);
      result = IOIteratorNext(a1);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

CFMutableDictionaryRef TelephonyUSBDeviceCreateServiceMatchingDictionary()
{
  return IOServiceMatching("IOUSBDevice");
}

CFMutableDictionaryRef TelephonyUSBInterfaceCreateServiceMatchingDictionary()
{
  return IOServiceMatching("IOUSBInterface");
}

BOOL TelephonyUSBAddVendorIDMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("idVendor"), a2);
}

BOOL _TelephonyUSBAddNumberToDictionary<int>(void *a1, const void *a2, int a3)
{
  const __CFAllocator *v6;
  CFNumberRef v7;
  CFNumberRef v8;
  void *v9;
  void *value;
  const void *valuePtr;

  value = 0;
  v6 = CFGetAllocator(a1);
  LODWORD(valuePtr) = a3;
  v7 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  v8 = v7;
  if (v7)
  {
    v9 = value;
    value = v7;
    valuePtr = v9;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&valuePtr);
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, value);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&value);
  return v8 != 0;
}

void sub_20E5CE570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&a9);
  _Unwind_Resume(a1);
}

BOOL TelephonyUSBAddProductIDMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("idProduct"), a2);
}

BOOL TelephonyUSBAddDeviceClassMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bDeviceClass"), a2);
}

BOOL TelephonyUSBAddDeviceSubClassMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bDeviceSubClass"), a2);
}

BOOL TelephonyUSBAddInterfaceNumberMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bInterfaceNumber"), a2);
}

BOOL TelephonyUSBAddConfigurationValueMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bConfigurationValue"), a2);
}

BOOL TelephonyUSBAddInterfaceClassMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bInterfaceClass"), a2);
}

BOOL TelephonyUSBAddInterfaceSubClassMatching(void *a1, int a2)
{
  return _TelephonyUSBAddNumberToDictionary<int>(a1, CFSTR("bInterfaceSubClass"), a2);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *TelephonyUSBRegisterForDevicesWithAllocator(const void *a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, const char *a6, uint64_t a7)
{
  _QWORD *Instance;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  IONotificationPort *v17;
  CFRunLoopMode *v18;
  CFRunLoopSourceRef RunLoopSource;
  char v20;
  __CFRunLoop **v21;
  __CFRunLoop *v22;
  _QWORD block[5];

  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
    return Instance;
  v14 = malloc(0x40uLL);
  Instance[2] = v14;
  if (!v14)
    goto LABEL_13;
  v15 = v14;
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *(_OWORD *)v14 = 0u;
  strncpy((char *)v14 + 48, a6, 8uLL);
  v15[7] = a7;
  v15[4] = _Block_copy(a3);
  v15[5] = _Block_copy(a4);
  v16 = Instance[2];
  *(_QWORD *)v16 = a2;
  v17 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *(_QWORD *)(v16 + 16) = v17;
  v18 = (CFRunLoopMode *)MEMORY[0x24BDBD5A0];
  if (!v17)
    goto LABEL_10;
  RunLoopSource = IONotificationPortGetRunLoopSource(v17);
  *(_QWORD *)(v16 + 8) = RunLoopSource;
  if (!RunLoopSource)
    goto LABEL_10;
  CFRetain(RunLoopSource);
  _TelephonyUtilDebugPrint();
  CFRunLoopAddSource(*(CFRunLoopRef *)v16, *(CFRunLoopSourceRef *)(v16 + 8), *v18);
  CFRetain(a1);
  if (IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v16 + 16), "IOServiceFirstMatch", (CFDictionaryRef)a1, (IOServiceMatchingCallback)_TelephonyUSBDeviceRegistrationCheckDeviceAdded, (void *)v16, (io_iterator_t *)(v16 + 24))|| (CFRetain(a1), IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v16 + 16), "IOServiceTerminate", (CFDictionaryRef)a1, (IOServiceMatchingCallback)_TelephonyUSBDeviceRegistrationCheckDeviceRemoved, (void *)v16, (io_iterator_t *)(v16 + 28))))
  {
    _TelephonyUtilDebugPrint();
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v20 = 1;
LABEL_11:
  v21 = (__CFRunLoop **)Instance[2];
  v22 = *v21;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___TelephonyUSBDeviceRegistrationHandlePoll_block_invoke;
  block[3] = &__block_descriptor_tmp_15;
  block[4] = v21;
  if (!v22)
  {
    ___TelephonyUSBDeviceRegistrationHandlePoll_block_invoke((uint64_t)block);
    if ((v20 & 1) != 0)
      return Instance;
    goto LABEL_13;
  }
  CFRunLoopPerformBlock(v22, *v18, block);
  CFRunLoopWakeUp(v22);
  if ((v20 & 1) == 0)
  {
LABEL_13:
    CFRelease(Instance);
    return 0;
  }
  return Instance;
}

_QWORD *TelephonyUSBDeviceCreateInterfaceWithAllocator(io_service_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  uint64_t Instance;
  _QWORD *v8;
  io_service_t *v9;
  _BOOL4 v10;
  IOCFPlugInInterface **v11;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v14;
  CFUUIDBytes v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  IOCFPlugInInterface **interface;

  if (qword_254A2AC50 != -1)
    dispatch_once(&qword_254A2AC50, &__block_literal_global_17);
  Instance = _CFRuntimeCreateInstance();
  v8 = (_QWORD *)Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    v9 = (io_service_t *)(Instance + 16);
    *(_OWORD *)(Instance + 48) = 0u;
    strncpy((char *)(Instance + 48), a3, 8uLL);
    v8[7] = a4;
    interface = 0;
    v10 = _TelephonyUSBDeviceCreatePlugInInterface(a1, &interface);
    v11 = interface;
    if (v10 && interface != 0)
    {
      QueryInterface = (*interface)->QueryInterface;
      v14 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
      v15 = CFUUIDGetUUIDBytes(v14);
      v16 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, _QWORD *))QueryInterface)(v11, *(_QWORD *)&v15.byte0, *(_QWORD *)&v15.byte8, v8 + 3);
      IODestroyPlugInInterface(interface);
      v17 = v8[3];
      if (v16)
        v18 = 1;
      else
        v18 = v17 == 0;
      if (!v18
        && !(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v17 + 112))(v17, (uint64_t)v8 + 22)
        && !(*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)v8[3] + 104))(v8[3], (uint64_t)v8 + 20))
      {
        _TelephonyUtilDebugPrint();
        IOObjectRetain(a1);
        *v9 = a1;
        return v8;
      }
      _TelephonyUtilDebugPrint();
    }
    CFRelease(v8);
    return 0;
  }
  return v8;
}

_QWORD *TelephonyUSBDeviceCreateInterface(io_service_t a1, const char *a2, uint64_t a3)
{
  return TelephonyUSBDeviceCreateInterfaceWithAllocator(a1, *MEMORY[0x24BDBD240], a2, a3);
}

uint64_t TelephonyUSBDeviceRegisterForGeneralInterest(uint64_t a1, IONotificationPort *a2, const void *a3, const void *a4)
{
  uint64_t result;
  _QWORD *v9;
  void *v10;

  result = (uint64_t)malloc(0x10uLL);
  *(_QWORD *)(a1 + 40) = result;
  if (result)
  {
    v9 = (_QWORD *)result;
    *(_QWORD *)(result + 8) = a3;
    CFRetain(a3);
    *v9 = _Block_copy(a4);
    if (!a2)
      goto LABEL_6;
    v10 = *(void **)(a1 + 40);
    if (!v10)
    {
      __TUAssertTrigger();
      v10 = *(void **)(a1 + 40);
    }
    if (!IOServiceAddInterestNotification(a2, *(_DWORD *)(a1 + 16), "IOGeneralInterest", (IOServiceInterestCallback)_TelephonyUSBDeviceHandleNotification, v10, (io_object_t *)(a1 + 32)))
    {
      _TelephonyUtilDebugPrint();
      return 1;
    }
    else
    {
LABEL_6:
      _TelephonyUtilDebugPrint();
      return 0;
    }
  }
  return result;
}

uint64_t TelephonyUSBDeviceGetDeviceInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

BOOL TelephonyUSBDeviceIsValid(uint64_t a1)
{
  _BOOL8 v1;
  IOCFPlugInInterface **interface;

  interface = 0;
  v1 = _TelephonyUSBDeviceCreatePlugInInterface(*(_DWORD *)(a1 + 16), &interface);
  if (interface)
    IODestroyPlugInInterface(interface);
  return v1;
}

BOOL _TelephonyUSBDeviceCreatePlugInInterface(io_service_t a1, IOCFPlugInInterface ***a2)
{
  const __CFUUID *v4;

  v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  return _TelephonyUSBCreatePlugInInterface(a1, v4, a2);
}

uint64_t TelephonyUSBDeviceGetProductID(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 22);
}

uint64_t TelephonyUSBDeviceGetVendorID(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 20);
}

BOOL TelephonyUSBDeviceGetLocationID(uint64_t a1)
{
  return (*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 160))(*(_QWORD *)(a1 + 24)) == 0;
}

void _TelephonyUSBDeviceRegistrationHandleDestroy(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  io_object_t v3;
  io_object_t v4;
  uint64_t v5;
  __CFRunLoop *v6;
  CFTypeRef *v7;
  __CFRunLoop *v8;
  __CFRunLoop *v9;
  _QWORD v10[7];
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 56);
    v3 = *(_DWORD *)(v1 + 24);
    if (v3)
    {
      IOObjectRelease(v3);
      *(_DWORD *)(v1 + 24) = 0;
    }
    v4 = *(_DWORD *)(v1 + 28);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(v1 + 28) = 0;
    }
    v5 = MEMORY[0x24BDAC760];
    block = MEMORY[0x24BDAC760];
    v12 = 0x40000000;
    v13 = ___TelephonyUSBDeviceRegistrationUnregisterForDevicesInternal_block_invoke;
    v14 = &__block_descriptor_tmp_7;
    v15 = v1;
    v6 = *(__CFRunLoop **)v1;
    v7 = (CFTypeRef *)MEMORY[0x24BDBD5A0];
    if (*(_QWORD *)v1)
    {
      CFRunLoopPerformBlock(*(CFRunLoopRef *)v1, (CFTypeRef)*MEMORY[0x24BDBD5A0], &block);
      CFRunLoopWakeUp(v6);
    }
    else
    {
      ___TelephonyUSBDeviceRegistrationUnregisterForDevicesInternal_block_invoke((uint64_t)&block);
    }
    v8 = *(__CFRunLoop **)v1;
    block = v5;
    v12 = 0x40000000;
    v13 = ___TelephonyUSBDeviceRegistrationFreeCallbacks_block_invoke;
    v14 = &__block_descriptor_tmp_8;
    v15 = v1;
    if (v8)
    {
      CFRunLoopPerformBlock(v8, *v7, &block);
      CFRunLoopWakeUp(v8);
    }
    else
    {
      ___TelephonyUSBDeviceRegistrationFreeCallbacks_block_invoke((uint64_t)&block);
    }
    v9 = *(__CFRunLoop **)v1;
    v10[0] = v5;
    v10[1] = 0x40000000;
    v10[2] = ___TelephonyUSBDeviceRegistrationHandleDestroy_block_invoke;
    v10[3] = &__block_descriptor_tmp_5;
    v10[4] = v1 + 48;
    v10[5] = v2;
    v10[6] = v1;
    if (v9)
    {
      CFRunLoopPerformBlock(v9, *v7, v10);
      CFRunLoopWakeUp(v9);
    }
    else
    {
      _TelephonyUtilDebugPrint();
      free((void *)v1);
    }
  }
}

uint64_t _TelephonyUSBDeviceRegistrationCheckDeviceAdded(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _TelephonyUSBDeviceRegistrationCheckDeviceRemoved(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t _TelephonyUSBDeviceHandleDestroy(uint64_t a1)
{
  io_object_t v2;
  uint64_t v3;
  __CFRunLoop *v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  _QWORD block[5];

  _TelephonyUtilDebugPrint();
  v2 = *(_DWORD *)(a1 + 32);
  if (v2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(a1 + 32) = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = *(__CFRunLoop **)(v3 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___TelephonyUSBDeviceFreeCallbacks_block_invoke;
    block[3] = &__block_descriptor_tmp_20;
    block[4] = v3;
    if (v4)
    {
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(v4);
    }
    else
    {
      ___TelephonyUSBDeviceFreeCallbacks_block_invoke((uint64_t)block);
    }
    CFRelease(v4);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    *(_QWORD *)(a1 + 24) = 0;
    if (v6)
      _TelephonyUtilDebugPrint();
  }
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 16) = 0;
  }
  return result;
}

uint64_t _TelephonyUSBDeviceHandleNotification(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *a1;
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

_QWORD *TelephonyUSBRegisterForInterfacesWithAllocator(const void *a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, const char *a6, uint64_t a7)
{
  _QWORD *Instance;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  IONotificationPort *v18;
  CFRunLoopMode *v19;
  CFRunLoopSourceRef RunLoopSource;
  char v21;
  __CFRunLoop **v22;
  __CFRunLoop *v23;
  _QWORD block[5];

  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v14 = (char *)malloc(0x40uLL);
    Instance[2] = v14;
    if (v14)
    {
      v15 = v14;
      *((_OWORD *)v14 + 1) = 0u;
      *((_OWORD *)v14 + 2) = 0u;
      *(_OWORD *)v14 = 0u;
      strncpy(v14 + 48, a6, 8uLL);
      *((_QWORD *)v15 + 7) = a7;
    }
    else
    {
      CFRelease(Instance);
      Instance = 0;
    }
  }
  _TelephonyUtilDebugPrint();
  if (!Instance)
    return Instance;
  v16 = Instance[2];
  *(_QWORD *)(v16 + 32) = _Block_copy(a3);
  *(_QWORD *)(v16 + 40) = _Block_copy(a4);
  v17 = Instance[2];
  *(_QWORD *)v17 = a2;
  v18 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *(_QWORD *)(v17 + 16) = v18;
  v19 = (CFRunLoopMode *)MEMORY[0x24BDBD5A0];
  if (v18)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(v18);
    *(_QWORD *)(v17 + 8) = RunLoopSource;
    if (RunLoopSource)
    {
      CFRetain(RunLoopSource);
      _TelephonyUtilDebugPrint();
      CFRunLoopAddSource(*(CFRunLoopRef *)v17, *(CFRunLoopSourceRef *)(v17 + 8), *v19);
      CFRetain(a1);
      if (!IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v17 + 16), "IOServiceFirstMatch", (CFDictionaryRef)a1, (IOServiceMatchingCallback)_TelephonyUSBInterfaceRegistrationCheckInterfacesAdded, (void *)v17, (io_iterator_t *)(v17 + 24)))
      {
        CFRetain(a1);
        if (!IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v17 + 16), "IOServiceTerminate", (CFDictionaryRef)a1, (IOServiceMatchingCallback)_TelephonyUSBInterfaceRegistrationCheckInterfacesRemoved, (void *)v17, (io_iterator_t *)(v17 + 28)))
        {
          v21 = 1;
          goto LABEL_14;
        }
      }
      _TelephonyUtilDebugPrint();
    }
  }
  v21 = 0;
LABEL_14:
  v22 = (__CFRunLoop **)Instance[2];
  v23 = *v22;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___TelephonyUSBInterfaceRegistrationHandlePoll_block_invoke;
  block[3] = &__block_descriptor_tmp_18;
  block[4] = v22;
  if (!v23)
  {
    ___TelephonyUSBInterfaceRegistrationHandlePoll_block_invoke((uint64_t)block);
    if ((v21 & 1) != 0)
      return Instance;
    goto LABEL_16;
  }
  CFRunLoopPerformBlock(v23, *v19, block);
  CFRunLoopWakeUp(v23);
  if ((v21 & 1) == 0)
  {
LABEL_16:
    CFRelease(Instance);
    return 0;
  }
  return Instance;
}

uint64_t TelephonyUSBInterfaceCreateInterfaceWithAllocator(io_object_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  uint64_t Instance;
  uint64_t v8;
  IOCFPlugInInterface **v9;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v11;
  CFUUIDBytes v12;
  uint64_t v13;
  IOCFPlugInInterface **interface;

  if (qword_254A2AC70 != -1)
    dispatch_once(&qword_254A2AC70, &__block_literal_global_20);
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    strncpy((char *)(Instance + 44), a3, 8uLL);
    *(_BYTE *)(v8 + 24) = -1;
    *(_QWORD *)(v8 + 56) = a4;
    _TelephonyUtilDebugPrint();
    interface = 0;
    if (_TelephonyUSBInterfaceCreatePlugInInterface(a1, &interface))
    {
      v9 = interface;
      QueryInterface = (*interface)->QueryInterface;
      v11 = CFUUIDGetConstantUUIDWithBytes(0, 0x56u, 0x30u, 0x1Du, 0xF2u, 0x72u, 0xDEu, 0x40u, 0x4Bu, 0x91u, 0xEDu, 0xEDu, 0x30u, 0xBFu, 0x70u, 0x51u, 0x21u);
      v12 = CFUUIDGetUUIDBytes(v11);
      LODWORD(v9) = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t))QueryInterface)(v9, *(_QWORD *)&v12.byte0, *(_QWORD *)&v12.byte8, v8 + 32);
      IODestroyPlugInInterface(interface);
      v13 = *(_QWORD *)(v8 + 32);
      if (!(_DWORD)v9
        && v13
        && !(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 112))(v13, v8 + 22)
        && !(*(unsigned int (**)(_QWORD, uint64_t))(**(_QWORD **)(v8 + 32) + 104))(*(_QWORD *)(v8 + 32), v8 + 20)&& !(*(unsigned int (**)(_QWORD, uint64_t))(**(_QWORD **)(v8 + 32) + 136))(*(_QWORD *)(v8 + 32), v8 + 24))
      {
        _TelephonyUtilDebugPrint();
        IOObjectRetain(a1);
        *(_DWORD *)(v8 + 16) = a1;
        return v8;
      }
      _TelephonyUtilDebugPrint();
    }
    CFRelease((CFTypeRef)v8);
    return 0;
  }
  else
  {
    _TelephonyUtilDebugPrint();
  }
  return v8;
}

uint64_t TelephonyUSBInterfaceCreateInterface(io_object_t a1, const char *a2, uint64_t a3)
{
  return TelephonyUSBInterfaceCreateInterfaceWithAllocator(a1, *MEMORY[0x24BDBD240], a2, a3);
}

BOOL TelephonyUSBInterfaceOpen(uint64_t a1)
{
  int v2;

  _TelephonyUtilDebugPrint();
  v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 64))(*(_QWORD *)(a1 + 32));
  if (v2)
    _TelephonyUtilDebugPrint();
  else
    *(_BYTE *)(a1 + 25) = 1;
  return v2 == 0;
}

uint64_t TelephonyUSBInterfaceGetInterfaceInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

BOOL TelephonyUSBInterfaceIsValid(uint64_t a1)
{
  _BOOL8 v1;
  IOCFPlugInInterface **interface;

  interface = 0;
  v1 = _TelephonyUSBInterfaceCreatePlugInInterface(*(_DWORD *)(a1 + 16), &interface);
  if (interface)
    IODestroyPlugInInterface(interface);
  if (!v1)
    _TelephonyUtilDebugPrint();
  return v1;
}

BOOL _TelephonyUSBInterfaceCreatePlugInInterface(io_service_t a1, IOCFPlugInInterface ***a2)
{
  const __CFUUID *v4;

  v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  return _TelephonyUSBCreatePlugInInterface(a1, v4, a2);
}

uint64_t TelephonyUSBInterfaceGetProductID(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 22);
}

uint64_t TelephonyUSBInterfaceGetVendorID(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 20);
}

void _TelephonyUSBInterfaceRegistrationHandleDestroy(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  io_object_t v3;
  io_object_t v4;
  uint64_t v5;
  __CFRunLoop *v6;
  CFTypeRef *v7;
  __CFRunLoop *v8;
  __CFRunLoop *v9;
  _QWORD v10[7];
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 56);
    v3 = *(_DWORD *)(v1 + 24);
    if (v3)
    {
      IOObjectRelease(v3);
      *(_DWORD *)(v1 + 24) = 0;
    }
    v4 = *(_DWORD *)(v1 + 28);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(v1 + 28) = 0;
    }
    v5 = MEMORY[0x24BDAC760];
    block = MEMORY[0x24BDAC760];
    v12 = 0x40000000;
    v13 = ___TelephonyUSBInterfaceRegistrationUnregisterForInterfacesInternal_block_invoke;
    v14 = &__block_descriptor_tmp_10;
    v15 = v1;
    v6 = *(__CFRunLoop **)v1;
    v7 = (CFTypeRef *)MEMORY[0x24BDBD5A0];
    if (*(_QWORD *)v1)
    {
      CFRunLoopPerformBlock(*(CFRunLoopRef *)v1, (CFTypeRef)*MEMORY[0x24BDBD5A0], &block);
      CFRunLoopWakeUp(v6);
    }
    else
    {
      ___TelephonyUSBInterfaceRegistrationUnregisterForInterfacesInternal_block_invoke((uint64_t)&block);
    }
    v8 = *(__CFRunLoop **)v1;
    block = v5;
    v12 = 0x40000000;
    v13 = ___TelephonyUSBInterfaceRegistrationFreeCallbacks_block_invoke;
    v14 = &__block_descriptor_tmp_11;
    v15 = v1;
    if (v8)
    {
      CFRunLoopPerformBlock(v8, *v7, &block);
      CFRunLoopWakeUp(v8);
    }
    else
    {
      ___TelephonyUSBInterfaceRegistrationFreeCallbacks_block_invoke((uint64_t)&block);
    }
    v9 = *(__CFRunLoop **)v1;
    v10[0] = v5;
    v10[1] = 0x40000000;
    v10[2] = ___TelephonyUSBInterfaceRegistrationHandleDestroy_block_invoke;
    v10[3] = &__block_descriptor_tmp_8_0;
    v10[4] = v1 + 48;
    v10[5] = v2;
    v10[6] = v1;
    if (v9)
    {
      CFRunLoopPerformBlock(v9, *v7, v10);
      CFRunLoopWakeUp(v9);
    }
    else
    {
      _TelephonyUtilDebugPrint();
      free((void *)v1);
    }
  }
}

uint64_t _TelephonyUSBInterfaceRegistrationCheckInterfacesAdded(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _TelephonyUSBInterfaceRegistrationCheckInterfacesRemoved(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t _TelephonyUSBInterfaceHandleDestroy(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = _TelephonyUtilDebugPrint();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (*(_BYTE *)(a1 + 25))
    {
      _TelephonyUtilDebugPrint();
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3))
        _TelephonyUtilDebugPrint();
    }
    _TelephonyUtilDebugPrint();
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
  if (*(_DWORD *)(a1 + 16))
  {
    _TelephonyUtilDebugPrint();
    result = IOObjectRelease(*(_DWORD *)(a1 + 16));
    *(_DWORD *)(a1 + 16) = 0;
  }
  return result;
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x24BED97C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x24BED9EF0]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

