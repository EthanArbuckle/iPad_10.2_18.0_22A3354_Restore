void IOACIPCTraceClass::IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 9) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 9) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

void IOACIPCTraceClass::~IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "~IOACIPCTraceClass");
  IOACIPCTraceClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOACIPCTraceClass::stop(io_object_t *this)
{
  pthread_mutex_t *v2;
  FILE **v3;
  io_object_t v4;

  v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  v3 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*this >= 2)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "stop");
  IOACIPCTraceClass::closeService((IOACIPCTraceClass *)this);
  v4 = this[18];
  if (v4)
  {
    IOObjectRelease(v4);
    this[18] = 0;
  }
  if (*this >= 2)
    fprintf(*v3, "IOACIPCTraceClass::%s: --done\n", "stop");
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, __CFRunLoop *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = IOACIPCTraceClass::connect(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCTraceClass::connect(IOACIPCTraceClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t v4;
  const __CFDictionary *v7;
  io_service_t MatchingService;

  if (*((_DWORD *)this + 18))
  {
LABEL_2:
    v4 = 1;
    goto LABEL_3;
  }
  v7 = IOServiceMatching("IOAppleConvergedIPCTraceBackendRaw");
  if (v7)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v7);
    *((_DWORD *)this + 18) = MatchingService;
    if (MatchingService)
    {
      if (IOACIPCTraceClass::openService(this))
      {
        if (*(_DWORD *)this >= 2u)
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: could not open service\n", "connect");
        IOObjectRelease(*((_DWORD *)this + 18));
        v4 = 0;
        *((_DWORD *)this + 18) = 0;
        goto LABEL_3;
      }
      if (a2)
      {
        if (a3)
          IOACIPCTraceClass::connect();
        *((_QWORD *)this + 11) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *((_QWORD *)this + 12) = a3;
        dispatch_retain(a3);
      }
      IOACIPCTraceClass::setNotificationPort(this);
      goto LABEL_2;
    }
    if (*(_DWORD *)this >= 2u)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: could not get matching service\n");
      goto LABEL_15;
    }
    return 0;
  }
  if (*(_DWORD *)this < 2u)
    return 0;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: could not create matching dictionary\n");
LABEL_15:
  v4 = 0;
LABEL_3:
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: --done\n", "connect");
  return v4;
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = IOACIPCTraceClass::connect(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCTraceClass::openService(IOACIPCTraceClass *this)
{
  io_registry_entry_t v2;
  uint64_t v3;
  const void *v4;

  v2 = *((_DWORD *)this + 18);
  if (!v2)
    return 3758096385;
  if (*((_DWORD *)this + 19))
    return 0;
  if (*((_QWORD *)this + 10))
  {
    CFRelease(*((CFTypeRef *)this + 10));
    *((_QWORD *)this + 10) = 0;
    v2 = *((_DWORD *)this + 18);
  }
  *((_QWORD *)this + 10) = IORegistryEntryCreateCFProperty(v2, CFSTR("TracePipes"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = IOServiceOpen(*((_DWORD *)this + 18), *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 19);
  if ((_DWORD)v3)
  {
    v4 = (const void *)*((_QWORD *)this + 10);
    if (v4)
    {
      CFRelease(v4);
      *((_QWORD *)this + 10) = 0;
    }
  }
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: ret = %x\n", "openService", v3);
  return v3;
}

void IOACIPCTraceClass::setNotificationPort(IOACIPCTraceClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 13))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 13) = v2;
    if (!v2)
      IOACIPCTraceClass::setNotificationPort();
    if (*((_QWORD *)this + 11))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((_QWORD *)this + 14) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 11), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    v4 = *((_QWORD *)this + 12);
    if (v4)
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 13), v4);
  }
}

uint64_t IOACIPCTraceClass::closeService(IOACIPCTraceClass *this)
{
  const void *v2;
  io_connect_t v3;
  const void *v4;
  NSObject *v5;

  v2 = (const void *)*((_QWORD *)this + 10);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 10) = 0;
  }
  v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 19) = 0;
  }
  IOACIPCTraceClass::clearNotificationPort(this);
  v4 = (const void *)*((_QWORD *)this + 11);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)this + 11) = 0;
  }
  v5 = *((_QWORD *)this + 12);
  if (v5)
  {
    dispatch_release(v5);
    *((_QWORD *)this + 12) = 0;
  }
  return 0;
}

void IOACIPCTraceClass::clearNotificationPort(IOACIPCTraceClass *this)
{
  IONotificationPort *v2;
  _QWORD *v3;

  v3 = (_QWORD *)((char *)this + 104);
  v2 = (IONotificationPort *)*((_QWORD *)this + 13);
  if (v2)
  {
    if (*((_QWORD *)this + 11))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 11), *((CFRunLoopSourceRef *)this + 14), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v2 = (IONotificationPort *)*((_QWORD *)this + 13);
    }
    IONotificationPortDestroy(v2);
    *v3 = 0;
    v3[1] = 0;
  }
}

const __CFArray *IOACIPCTraceClass::getPipeCount(IOACIPCTraceClass *this)
{
  const __CFArray *result;

  result = (const __CFArray *)*((_QWORD *)this + 10);
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

uint64_t IOACIPCTraceClass::getPipeCodeAndName(IOACIPCTraceClass *this, unsigned int a2, unsigned int *a3, char *a4, unsigned int a5)
{
  uint64_t result;
  unsigned int Count;
  const __CFDictionary *v12;
  const __CFNumber *Value;
  const __CFString *v14;

  result = *((_QWORD *)this + 10);
  if (result)
  {
    Count = CFArrayGetCount((CFArrayRef)result);
    result = 0;
    if (a3)
    {
      if (a4)
      {
        if (Count > a2)
        {
          result = (uint64_t)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 10), a2);
          if (result)
          {
            v12 = (const __CFDictionary *)result;
            Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("Code"));
            result = CFNumberGetValue(Value, kCFNumberIntType, a3);
            if ((_DWORD)result)
            {
              result = (uint64_t)CFDictionaryGetValue(v12, CFSTR("Name"));
              if (result)
              {
                v14 = (const __CFString *)result;
                if (CFStringGetLength((CFStringRef)result))
                {
                  return CFStringGetCString(v14, a4, a5, 0x600u) != 0;
                }
                else
                {
                  strncpy(a4, "DEFAULT", a5);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOACIPCTraceClass::openPipe(IOACIPCTraceClass *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "openPipe");
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t IOACIPCTraceClass::closePipe(IOACIPCTraceClass *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "closePipe");
  pthread_mutex_unlock(v2);
  return 0;
}

BOOL IOACIPCTraceClass::getSnapshotBufferSize(IOACIPCTraceClass *this, unsigned int *a2)
{
  _BOOL8 v2;
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;

  v2 = 0;
  if (a2)
  {
    v3 = *((_DWORD *)this + 18);
    if (v3)
    {
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("SnapshotBufferSize"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOACIPCTraceClass::readLogsAsync(IOACIPCTraceClass *this, unsigned int a2, void *a3, unsigned int a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  pthread_mutex_t *v14;
  IONotificationPort *v15;
  __int128 v16;
  mach_port_t v17;
  mach_port_t MachPort;
  uint64_t v19;
  uint64_t reference[2];
  void *v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v14 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 3u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: buff %p, size %u\n", "readLogsAsync", a3, a4);
  v15 = (IONotificationPort *)*((_QWORD *)this + 13);
  if (v15)
  {
    input[0] = a2;
    input[1] = (uint64_t)a3;
    input[2] = a4;
    input[3] = a5;
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v24 = v16;
    v25 = v16;
    reference[1] = (uint64_t)a6;
    v22 = a7;
    v17 = *((_DWORD *)this + 19);
    MachPort = IONotificationPortGetMachPort(v15);
    v19 = IOConnectCallAsyncScalarMethod(v17, 0, MachPort, reference, 3u, input, 4u, 0, 0);
    if (*(_DWORD *)this >= 3u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: ret = %x\n", "readLogsAsync", v19);
    pthread_mutex_unlock(v14);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no async port\n", "readLogsAsync");
    pthread_mutex_unlock(v14);
    return 3758097112;
  }
  return v19;
}

uint64_t IOACIPCTraceClass::dumpRegistry(IOACIPCTraceClass *this)
{
  mach_port_t v2;
  uint64_t v3;

  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "dumpRegistry");
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    v3 = IOConnectCallScalarMethod(v2, 2u, 0, 0, 0, 0);
  }
  else
  {
    v3 = 3758097112;
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "dumpRegistry");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOACIPCTraceClass::flushTraceBuffers(IOACIPCTraceClass *this, unsigned int a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  mach_port_t v10;
  __int128 v11;
  mach_port_t MachPort;
  uint64_t v13;
  uint64_t v14;
  uint64_t reference[2];
  void *v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "flushTraceBuffers");
  input[0] = a2;
  input[1] = a3;
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v10 = *((_DWORD *)this + 19);
  if (v10)
  {
    if (a4)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v18 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      v19 = v11;
      v20 = v11;
      reference[1] = (uint64_t)a4;
      v17 = a5;
      MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 13));
      v13 = IOConnectCallAsyncScalarMethod(v10, 1u, MachPort, reference, 3u, input, 2u, 0, 0);
    }
    else
    {
      v13 = IOConnectCallScalarMethod(*((_DWORD *)this + 19), 1u, input, 2u, 0, 0);
    }
    v14 = v13;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "flushTraceBuffers");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v14;
}

uint64_t IOACIPCTraceClass::demo(IOACIPCTraceClass *this)
{
  mach_port_t v2;
  uint64_t v3;

  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "demo");
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    v3 = IOConnectCallScalarMethod(v2, 6u, 0, 0, 0, 0);
  }
  else
  {
    v3 = 3758097112;
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "demo");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOACIPCTraceClass::enablePipe(IOACIPCTraceClass *this, unsigned int a2, unsigned int a3)
{
  pthread_mutex_t *v6;
  mach_port_t v7;
  uint64_t v8;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "enablePipe");
  input[0] = a2;
  input[1] = a3;
  v6 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v7 = *((_DWORD *)this + 19);
  if (v7)
  {
    v8 = IOConnectCallScalarMethod(v7, 7u, input, 2u, 0, 0);
    pthread_mutex_unlock(v6);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "enablePipe");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v8;
}

uint64_t IOACIPCTraceClass::activateAllTracePoints(IOACIPCTraceClass *this)
{
  pthread_mutex_t *v2;
  mach_port_t v3;
  uint64_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "activateAllTracePoints");
  input[0] = 1;
  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    v4 = IOConnectCallScalarMethod(v3, 8u, input, 1u, 0, 0);
    pthread_mutex_unlock(v2);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "activateAllTracePoints");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v4;
}

uint64_t IOACIPCTraceClass::deactivateAllTracePoints(IOACIPCTraceClass *this)
{
  pthread_mutex_t *v2;
  mach_port_t v3;
  uint64_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "deactivateAllTracePoints");
  input[0] = 0;
  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    v4 = IOConnectCallScalarMethod(v3, 8u, input, 1u, 0, 0);
    pthread_mutex_unlock(v2);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "deactivateAllTracePoints");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v4;
}

uint64_t IOACIPCTraceClass::activateTracePoint(IOACIPCTraceClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  mach_port_t v5;
  uint64_t v6;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "activateTracePoint");
  input[0] = 1;
  input[1] = a2;
  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = *((_DWORD *)this + 19);
  if (v5)
  {
    v6 = IOConnectCallScalarMethod(v5, 9u, input, 2u, 0, 0);
    pthread_mutex_unlock(v4);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "activateTracePoint");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v6;
}

uint64_t IOACIPCTraceClass::deactivateTracePoint(IOACIPCTraceClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  mach_port_t v5;
  uint64_t v6;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)this >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "deactivateTracePoint");
  input[0] = 0;
  input[1] = a2;
  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = *((_DWORD *)this + 19);
  if (v5)
  {
    v6 = IOConnectCallScalarMethod(v5, 9u, input, 2u, 0, 0);
    pthread_mutex_unlock(v4);
  }
  else
  {
    if (*(_DWORD *)this >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "deactivateTracePoint");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v6;
}

BOOL IOACIPCTraceClass::getRegistryInfo(uint64_t a1, void *a2)
{
  mach_port_t v4;
  kern_return_t v5;
  size_t outputStructCnt;

  if (*(_DWORD *)a1 >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "getRegistryInfo");
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v4 = *(_DWORD *)(a1 + 76);
  if (v4)
  {
    outputStructCnt = 36;
    v5 = IOConnectCallStructMethod(v4, 3u, 0, 0, a2, &outputStructCnt);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return v5 == 0;
  }
  else
  {
    if (*(_DWORD *)a1 >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "getRegistryInfo");
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
}

BOOL IOACIPCTraceClass::getTraceCode(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  mach_port_t v6;
  std::__shared_weak_count *v7;
  std::string::size_type v8;
  kern_return_t v9;
  BOOL v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v14;
  uint64_t *v15;
  std::string::size_type v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  std::string::size_type size;
  std::string *v29;
  std::string::size_type v30;
  char v31;
  uint64_t v32;
  std::string::size_type shared_owners_low;
  char *v34;
  std::string::size_type v35;
  char *outputStruct;
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::string v42;
  size_t v43[2];
  std::__shared_weak_count *v44;
  std::string input;
  int v46;
  std::string v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)a1 >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: \n", "getTraceCode");
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v6 = *(_DWORD *)(a1 + 76);
  if (v6)
  {
    v7 = (std::__shared_weak_count *)operator new(0x808uLL);
    v7->__shared_weak_owners_ = 0;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_24F28D228;
    v7->__shared_owners_ = 0;
    bzero(&v7[1], 0x7ECuLL);
    v43[1] = (size_t)&v7[1];
    v44 = v7;
    v43[0] = 2028;
    v8 = a2;
    input.__r_.__value_.__r.__words[0] = a2;
    v9 = IOConnectCallMethod(v6, 4u, (const uint64_t *)&input, 1u, 0, 0, 0, 0, &v7[1], v43);
    v10 = v9 == 0;
    if (v9)
    {
      if (*(_DWORD *)a1 >= 2u)
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: TraceCode invalid\n", "getTraceCode");
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
      goto LABEL_8;
    }
    *((_DWORD *)a3 + 12) = HIDWORD(v7[1].__vftable);
    MEMORY[0x22E2D1F48](a3, (char *)&v7[1].__shared_weak_owners_ + 4);
    v14 = *((unsigned __int8 *)a3 + 23);
    if ((v14 & 0x80u) == 0)
      v15 = a3;
    else
      v15 = (uint64_t *)*a3;
    if ((v14 & 0x80u) != 0)
      v14 = a3[1];
    if (v14)
    {
      v16 = 0;
      while (*((_BYTE *)v15 + v16) == 32)
      {
        if (v14 == ++v16)
          goto LABEL_25;
      }
    }
    else
    {
LABEL_25:
      v16 = -1;
    }
    std::string::erase((std::string *)a3, 0, v16);
    v17 = *((unsigned __int8 *)a3 + 23);
    if ((v17 & 0x80u) == 0)
      v18 = a3;
    else
      v18 = (uint64_t *)*a3;
    if ((v17 & 0x80u) != 0)
      v17 = a3[1];
    v19 = (uint64_t)v18 - 1;
    while (v17)
    {
      v20 = *(unsigned __int8 *)(v19 + v17--);
      if (v20 != 32)
        goto LABEL_36;
    }
    v17 = -1;
LABEL_36:
    std::string::erase((std::string *)a3, v17 + 1, 0xFFFFFFFFFFFFFFFFLL);
    v21 = *((unsigned __int8 *)a3 + 23);
    if ((v21 & 0x80u) == 0)
      v22 = a3;
    else
      v22 = (uint64_t *)*a3;
    if ((v21 & 0x80u) != 0)
      v21 = a3[1];
    v23 = (uint64_t)v22 - 1;
    while (v21)
    {
      v24 = *(unsigned __int8 *)(v23 + v21--);
      if (v24 != 10)
        goto LABEL_46;
    }
    v21 = -1;
LABEL_46:
    std::string::erase((std::string *)a3, v21 + 1, 0xFFFFFFFFFFFFFFFFLL);
    if (BYTE4(v7[43].__shared_owners_))
    {
      std::string::basic_string[abi:ne180100]<0>(&v42, ":");
      v25 = std::string::insert(&v42, 0, (const std::string::value_type *)&v7[43].__shared_owners_ + 4);
      v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
      input.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
      *(_OWORD *)&input.__r_.__value_.__l.__data_ = v26;
      v25->__r_.__value_.__l.__size_ = 0;
      v25->__r_.__value_.__r.__words[2] = 0;
      v25->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v47, HIDWORD(v7[85].__vftable));
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v47;
      else
        v27 = (std::string *)v47.__r_.__value_.__r.__words[0];
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v47.__r_.__value_.__r.__words[2]);
      else
        size = v47.__r_.__value_.__l.__size_;
      v29 = std::string::append(&input, (const std::string::value_type *)v27, size);
      v30 = v29->__r_.__value_.__r.__words[0];
      v48[0] = v29->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v48 + 7) = *(std::string::size_type *)((char *)&v29->__r_.__value_.__r.__words[1] + 7);
      v31 = HIBYTE(v29->__r_.__value_.__r.__words[2]);
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      if (*((char *)a3 + 47) < 0)
        operator delete((void *)a3[3]);
      v32 = v48[0];
      a3[3] = v30;
      a3[4] = v32;
      *(uint64_t *)((char *)a3 + 39) = *(_QWORD *)((char *)v48 + 7);
      *((_BYTE *)a3 + 47) = v31;
      if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v47.__r_.__value_.__l.__data_);
      if (SHIBYTE(input.__r_.__value_.__r.__words[2]) < 0)
        operator delete(input.__r_.__value_.__l.__data_);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v42.__r_.__value_.__l.__data_);
    }
    std::vector<IOACIPCTraceCodeAttachment const>::__clear[abi:ne180100](a3 + 7);
    shared_owners_low = LODWORD(v7[1].__shared_owners_);
    if (!(_DWORD)shared_owners_low)
    {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
LABEL_8:
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
      return v10;
    }
    v34 = (char *)operator new(0x118uLL);
    v35 = 0;
    v10 = 0;
    *((_QWORD *)v34 + 2) = 0;
    *(_QWORD *)v34 = &unk_24F28D278;
    *((_QWORD *)v34 + 1) = 0;
    *(_OWORD *)(v34 + 24) = 0u;
    outputStruct = v34 + 24;
    *(_OWORD *)(v34 + 40) = 0u;
    *(_OWORD *)(v34 + 56) = 0u;
    *(_OWORD *)(v34 + 72) = 0u;
    *(_OWORD *)(v34 + 88) = 0u;
    *(_OWORD *)(v34 + 104) = 0u;
    *(_OWORD *)(v34 + 120) = 0u;
    *(_OWORD *)(v34 + 136) = 0u;
    *(_OWORD *)(v34 + 152) = 0u;
    *(_OWORD *)(v34 + 168) = 0u;
    *(_OWORD *)(v34 + 184) = 0u;
    *(_OWORD *)(v34 + 200) = 0u;
    *(_OWORD *)(v34 + 216) = 0u;
    *(_OWORD *)(v34 + 232) = 0u;
    *(_OWORD *)(v34 + 248) = 0u;
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)(v34 + 24);
    v42.__r_.__value_.__l.__size_ = (std::string::size_type)v34;
    v43[0] = 256;
    *(_OWORD *)(v34 + 264) = 0u;
    while (1)
    {
      v47.__r_.__value_.__r.__words[0] = v8;
      v47.__r_.__value_.__l.__size_ = v35;
      if (IOConnectCallMethod(*(_DWORD *)(a1 + 76), 5u, (const uint64_t *)&v47, 2u, 0, 0, 0, 0, outputStruct, v43))
      {
        break;
      }
      std::string::basic_string[abi:ne180100]<0>(&input, outputStruct + 4);
      outputStruct = (char *)v42.__r_.__value_.__r.__words[0];
      v46 = *(_DWORD *)(v42.__r_.__value_.__r.__words[0] + 244);
      v37 = a3[8];
      if (v37 >= a3[9])
      {
        v38 = std::vector<IOACIPCTraceCodeAttachment const>::__push_back_slow_path<IOACIPCTraceCodeAttachment const>(a3 + 7, (__int128 *)&input);
      }
      else
      {
        std::vector<IOACIPCTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOACIPCTraceCodeAttachment const>((uint64_t)(a3 + 7), (__int128 *)&input);
        v38 = v37 + 32;
      }
      a3[8] = v38;
      if (SHIBYTE(input.__r_.__value_.__r.__words[2]) < 0)
        operator delete(input.__r_.__value_.__l.__data_);
      v10 = ++v35 >= shared_owners_low;
      if (shared_owners_low == v35)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
        v10 = 1;
        goto LABEL_73;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
LABEL_73:
    v39 = (std::__shared_weak_count *)v42.__r_.__value_.__l.__size_;
    if (v42.__r_.__value_.__l.__size_)
    {
      v40 = (unint64_t *)(v42.__r_.__value_.__l.__size_ + 8);
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    v7 = v44;
    if (v44)
      goto LABEL_8;
  }
  else
  {
    if (*(_DWORD *)a1 >= 2u)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOACIPCTraceClass::%s: no connection\n", "getTraceCode");
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
  return v10;
}

void sub_22987FBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  std::shared_ptr<IOAppleConvergedIPCTraceRegistryTracePoint>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<IOAppleConvergedIPCTraceRegistryTracePoint>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

_DWORD *IOACIPCTraceClass::setLogLevel(_DWORD *this, int a2)
{
  *this = a2;
  return this;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24F28D228;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24F28D228;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E2D1F9CLL);
}

uint64_t std::shared_ptr<IOAppleConvergedIPCTraceRegistryTracePoint>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24F28D0C8, MEMORY[0x24BEDAAF0]);
}

void sub_22987FE2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::vector<IOACIPCTraceCodeAttachment const>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24F28D278;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24F28D278;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E2D1F9CLL);
}

void std::vector<IOACIPCTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOACIPCTraceCodeAttachment const>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  *(_DWORD *)(v4 + 24) = *((_DWORD *)a2 + 6);
  *(_QWORD *)(a1 + 8) = v4 + 32;
}

void sub_22987FF64(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<IOACIPCTraceCodeAttachment const>::__push_back_slow_path<IOACIPCTraceCodeAttachment const>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::string *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    std::vector<IOACIPCTraceCodeAttachment const>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment const>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  v16 = (std::string *)((char *)v11 + 32);
  std::vector<IOACIPCTraceCodeAttachment const>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<IOACIPCTraceCodeAttachment const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_22988006C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<IOACIPCTraceCodeAttachment const>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::vector<IOACIPCTraceCodeAttachment const>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::vector<IOACIPCTraceCodeAttachment const>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment const>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const std::string::value_type **v9;
  std::string *v10;
  __int128 *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  unint64_t v17;
  __int128 v18;
  __int128 v19;

  v7 = a7;
  *(_QWORD *)&v19 = a6;
  *((_QWORD *)&v19 + 1) = a7;
  v18 = v19;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  v17 = 0xAAAAAAAAAAAAAA00;
  if (a3 == a5)
  {
    v14 = a6;
  }
  else
  {
    v9 = (const std::string::value_type **)a3;
    do
    {
      v10 = (std::string *)(v7 - 32);
      v11 = (__int128 *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        std::string::__init_copy_ctor_external(v10, *(v9 - 4), (std::string::size_type)*(v9 - 3));
        v13 = *((_QWORD *)&v19 + 1);
      }
      else
      {
        v12 = *v11;
        *(_QWORD *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v12;
        v13 = v7;
      }
      *(_DWORD *)(v7 - 8) = *((_DWORD *)v9 - 2);
      v7 = v13 - 32;
      *((_QWORD *)&v19 + 1) = v13 - 32;
      v9 -= 4;
    }
    while (v11 != a5);
    v14 = v19;
  }
  LOBYTE(v17) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

void sub_22988029C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment const>,std::reverse_iterator<IOACIPCTraceCodeAttachment const*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<IOACIPCTraceCodeAttachment const>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<IOACIPCTraceCodeAttachment const>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<IOACIPCTraceCodeAttachment const>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void IOACIPCControlClass::IOACIPCControlClass(IOACIPCControlClass *this)
{
  *(_QWORD *)this = &off_24F28D2C8;
  *((_DWORD *)this + 2) = 1;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  *((_BYTE *)this + 172) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(_QWORD *)this = &off_24F28D2C8;
  *((_DWORD *)this + 2) = 1;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  *((_BYTE *)this + 172) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOACIPCControlClass::~IOACIPCControlClass(IOACIPCControlClass *this)
{
  void (**v2)(IOACIPCControlClass *__hidden);
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = &off_24F28D2C8;
  *(_QWORD *)this = &off_24F28D2C8;
  if ((*((_BYTE *)this + 8) & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "~IOACIPCControlClass";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v3, 0xCu);
      v2 = *(void (***)(IOACIPCControlClass *__hidden))this;
    }
    else
    {
      v2 = &off_24F28D2C8;
    }
  }
  v2[3](this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  IOACIPCControlClass::~IOACIPCControlClass(this);
  JUMPOUT(0x22E2D1F9CLL);
}

void sub_229880560(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t IOACIPCControlClass::lock(IOACIPCControlClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCControlClass::unlock(IOACIPCControlClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

BOOL IOACIPCControlClass::start(IOACIPCControlClass *this, const __CFDictionary *a2)
{
  pthread_mutex_t *v4;
  _BOOL8 v5;
  io_service_t MatchingService;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_DWORD *)this + 20))
  {
    v5 = 1;
  }
  else
  {
    CFRetain(a2);
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], a2);
    v5 = MatchingService != 0;
    if (!MatchingService
      && (*((_BYTE *)this + 8) & 2) != 0
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "start";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: could not get matching service\n", (uint8_t *)&v8, 0xCu);
    }
    *((_DWORD *)this + 20) = MatchingService;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "start";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: --done\n", (uint8_t *)&v8, 0xCu);
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::stop(IOACIPCControlClass *this)
{
  pthread_mutex_t *v2;
  io_object_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "stop";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  IOACIPCControlClass::close_nl(this);
  IOACIPCControlClass::deregisterEventNotification_nl(this, 0);
  v3 = *((_DWORD *)this + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 20) = 0;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "stop";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: --done\n", (uint8_t *)&v5, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCControlClass::close_nl(IOACIPCControlClass *this)
{
  uint64_t v2;
  io_connect_t v3;
  const void *v4;
  NSObject *v5;

  if (!*((_BYTE *)this + 172))
    return 0;
  *((_BYTE *)this + 172) = 0;
  v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 1u, 0, 0, 0, 0);
  v3 = *((_DWORD *)this + 42);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 42) = 0;
  }
  IOACIPCControlClass::clearNotificationPort(this);
  v4 = (const void *)*((_QWORD *)this + 11);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)this + 11) = 0;
  }
  v5 = *((_QWORD *)this + 12);
  if (v5)
  {
    dispatch_release(v5);
    *((_QWORD *)this + 12) = 0;
  }
  return v2;
}

void IOACIPCControlClass::deregisterEventNotification_nl(IOACIPCControlClass *this, NSObject *a2)
{
  CFRunLoopRef Current;
  NSObject *v5;
  char v6;
  uint64_t v7;
  __CFRunLoop *v8;
  NSObject *v9;
  char v10;
  _QWORD v11[6];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "deregisterEventNotification_nl";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: +\n", buf, 0xCu);
  }
  if (*((_QWORD *)this + 15) || *((_QWORD *)this + 16))
  {
    IOObjectRelease(*((_DWORD *)this + 38));
    *((_DWORD *)this + 38) = 0;
    IOACIPCControlClass::clearEventNotificationPort(this);
    if (*((_QWORD *)this + 15))
    {
      Current = CFRunLoopGetCurrent();
      if (Current == *((CFRunLoopRef *)this + 15))
      {
        if (*((_QWORD *)this + 20))
        {
          _Block_release(*((const void **)this + 20));
          *((_QWORD *)this + 20) = 0;
          Current = (CFRunLoopRef)*((_QWORD *)this + 15);
        }
        if (Current)
        {
          CFRelease(Current);
          *((_QWORD *)this + 15) = 0;
        }
        goto LABEL_25;
      }
    }
    v5 = a2;
    if (!a2)
    {
      if (*((_QWORD *)this + 16))
      {
        v6 = 0;
        v5 = 0;
        goto LABEL_12;
      }
      v5 = dispatch_group_create();
      if (!v5)
      {
        v6 = 0;
        goto LABEL_12;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    v6 = 1;
LABEL_12:
    v7 = *((_QWORD *)this + 20);
    *((_QWORD *)this + 20) = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 0x40000000;
    v11[2] = ___ZN19IOACIPCControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke;
    v11[3] = &unk_24F28D398;
    v11[4] = v7;
    v11[5] = v5;
    v8 = (__CFRunLoop *)*((_QWORD *)this + 15);
    if (v8)
    {
      if (*((_QWORD *)this + 16))
        IOACIPCControlClass::deregisterEventNotification_nl();
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x24BDBD5A0], v11);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 15));
      CFRelease(*((CFTypeRef *)this + 15));
      *((_QWORD *)this + 15) = 0;
    }
    v9 = *((_QWORD *)this + 16);
    if (v9)
    {
      dispatch_async(v9, v11);
      dispatch_release(*((dispatch_object_t *)this + 16));
      *((_QWORD *)this + 16) = 0;
    }
    v10 = v6 ^ 1;
    if (a2)
      v10 = 1;
    if ((v10 & 1) == 0)
    {
      pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
    }
LABEL_25:
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "deregisterEventNotification_nl";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: -\n", buf, 0xCu);
    }
  }
}

void IOACIPCControlClass::setNotificationPort(IOACIPCControlClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 13))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 13) = v2;
    if (!v2)
      IOACIPCControlClass::setNotificationPort();
    if (*((_QWORD *)this + 11))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((_QWORD *)this + 14) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 11), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    v4 = *((_QWORD *)this + 12);
    if (v4)
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 13), v4);
  }
}

void IOACIPCControlClass::clearNotificationPort(IOACIPCControlClass *this)
{
  IONotificationPort *v2;
  _QWORD *v3;

  v3 = (_QWORD *)((char *)this + 104);
  v2 = (IONotificationPort *)*((_QWORD *)this + 13);
  if (v2)
  {
    if (*((_QWORD *)this + 11))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 11), *((CFRunLoopSourceRef *)this + 14), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v2 = (IONotificationPort *)*((_QWORD *)this + 13);
    }
    IONotificationPortDestroy(v2);
    *v3 = 0;
    v3[1] = 0;
  }
}

void IOACIPCControlClass::setEventNotificationPort(IOACIPCControlClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 17))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 17) = v2;
    if (!v2)
      IOACIPCControlClass::setEventNotificationPort();
    if (*((_QWORD *)this + 15))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((_QWORD *)this + 18) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 15), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    v4 = *((_QWORD *)this + 16);
    if (v4)
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 17), v4);
  }
}

void IOACIPCControlClass::clearEventNotificationPort(IOACIPCControlClass *this)
{
  uint64_t v1;
  _QWORD *v2;
  __CFRunLoop *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  v2 = (_QWORD *)((char *)this + 136);
  v1 = *((_QWORD *)this + 17);
  if (v1)
  {
    v4 = (__CFRunLoop *)*((_QWORD *)this + 15);
    v5 = *((_QWORD *)this + 18);
    *v2 = 0;
    v2[1] = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN19IOACIPCControlClass26clearEventNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((_QWORD *)this + 16))
        IOACIPCControlClass::clearEventNotificationPort();
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 15));
    }
    v6 = *((_QWORD *)this + 16);
    if (v6)
    {
      if (*((_QWORD *)this + 15))
        IOACIPCControlClass::clearEventNotificationPort();
      dispatch_async(v6, block);
    }
  }
}

void ___ZN19IOACIPCControlClass26clearEventNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  __CFRunLoop *v2;

  v2 = a1[4];
  if (v2)
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  IONotificationPortDestroy(a1[6]);
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, __CFRunLoop *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "open";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  v5 = IOACIPCControlClass::open_nl(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::open_nl(IOACIPCControlClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t result;
  io_service_t v5;
  uint64_t v8;
  uint32_t outputCnt;

  result = 0;
  outputCnt = 0;
  v8 = 0;
  if (!*((_BYTE *)this + 172))
  {
    v5 = *((_DWORD *)this + 20);
    if (v5)
    {
      result = IOServiceOpen(v5, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 42);
      if (!(_DWORD)result)
      {
        result = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 0, &v8, 1u, 0, &outputCnt);
        if (!(_DWORD)result)
        {
          *((_BYTE *)this + 172) = 1;
          if (a2)
          {
            if (a3)
              IOACIPCControlClass::open_nl();
            *((_QWORD *)this + 11) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *((_QWORD *)this + 12) = a3;
            dispatch_retain(a3);
          }
          IOACIPCControlClass::setNotificationPort(this);
          return 0;
        }
      }
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "open";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  v5 = IOACIPCControlClass::open_nl(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::close(IOACIPCControlClass *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "close";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  v3 = IOACIPCControlClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCControlClass::readLogsAsync(IOACIPCControlClass *this, void *a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  __int128 v12;
  pthread_mutex_t *v13;
  IONotificationPort *v14;
  mach_port_t v15;
  mach_port_t MachPort;
  uint64_t v17;
  _BYTE buf[24];
  unsigned int v20;
  uint64_t reference[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v12;
  v24 = v12;
  *(_OWORD *)reference = v12;
  v22 = v12;
  v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "readLogsAsync";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 1024;
    v20 = a3;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  v14 = (IONotificationPort *)*((_QWORD *)this + 13);
  if (v14)
  {
    *(_QWORD *)buf = a2;
    *(_QWORD *)&buf[8] = a3;
    *(_QWORD *)&buf[16] = a4;
    reference[1] = (uint64_t)a5;
    *(_QWORD *)&v22 = a6;
    v15 = *((_DWORD *)this + 42);
    MachPort = IONotificationPortGetMachPort(v14);
    v17 = IOConnectCallAsyncScalarMethod(v15, 2u, MachPort, reference, 3u, (const uint64_t *)buf, 3u, 0, 0);
  }
  else
  {
    v17 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "readLogsAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v13);
  return v17;
}

uint64_t IOACIPCControlClass::triggerTrap(IOACIPCControlClass *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 4u, 0, 0, 0, 0);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCControlClass::collectSnapshotAsync(IOACIPCControlClass *this, void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  __int128 v10;
  pthread_mutex_t *v11;
  IONotificationPort *v12;
  mach_port_t v13;
  mach_port_t MachPort;
  uint64_t v15;
  _BYTE buf[22];
  __int16 v18;
  unsigned int v19;
  uint64_t reference[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v10;
  v23 = v10;
  *(_OWORD *)reference = v10;
  v21 = v10;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "collectSnapshotAsync";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a2;
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  v12 = (IONotificationPort *)*((_QWORD *)this + 13);
  if (v12)
  {
    *(_QWORD *)buf = a2;
    *(_QWORD *)&buf[8] = a3;
    reference[1] = (uint64_t)a4;
    *(_QWORD *)&v21 = a5;
    v13 = *((_DWORD *)this + 42);
    MachPort = IONotificationPortGetMachPort(v12);
    v15 = IOConnectCallAsyncScalarMethod(v13, 5u, MachPort, reference, 3u, (const uint64_t *)buf, 2u, 0, 0);
  }
  else
  {
    v15 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "collectSnapshotAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v11);
  return v15;
}

uint64_t IOACIPCControlClass::registerEventNotification(uint64_t a1, const void *a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v7 = IOACIPCControlClass::registerEventNotification_nl(a1, a2, 0, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOACIPCControlClass::registerEventNotification_nl(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 80))
  {
    if (*(_QWORD *)(a1 + 160))
    {
      v5 = 3758097093;
      if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "registerEventNotification_nl";
        _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: a notification block is already registered. deregister it before registering a new block", buf, 0xCu);
        return 3758097093;
      }
    }
    else if (a4)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___ZN19IOACIPCControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjPvS4_E_block_invoke;
      aBlock[3] = &unk_24F28D370;
      aBlock[4] = a4;
      *(_QWORD *)(a1 + 160) = _Block_copy(aBlock);
      if (a2)
      {
        if (a3)
          IOACIPCControlClass::registerEventNotification_nl();
        *(_QWORD *)(a1 + 120) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *(_QWORD *)(a1 + 128) = a3;
        dispatch_retain(a3);
      }
      IOACIPCControlClass::setEventNotificationPort((IOACIPCControlClass *)a1);
      v5 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 136), *(_DWORD *)(a1 + 80), "IOGeneralInterest", (IOServiceInterestCallback)IOACIPCControlClass::generalInterestCallback, *(void **)(a1 + 160), (io_object_t *)(a1 + 152));
      if ((_DWORD)v5)
      {
        if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v11 = "registerEventNotification_nl";
          v12 = 1024;
          v13 = v5;
          _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: could not add interest notification on service: %#x\n", buf, 0x12u);
        }
        _Block_release(*(const void **)(a1 + 160));
        *(_QWORD *)(a1 + 160) = 0;
        return 3758097084;
      }
    }
    else
    {
      v5 = 3758097090;
      if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "registerEventNotification_nl";
        _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: block must be provided\n", buf, 0xCu);
      }
    }
  }
  else
  {
    v5 = 3758097136;
    if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "registerEventNotification_nl";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: service is NULL - must successfully start() first\n", buf, 0xCu);
      return 3758097136;
    }
  }
  return v5;
}

uint64_t IOACIPCControlClass::registerEventNotification(uint64_t a1, NSObject *a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v7 = IOACIPCControlClass::registerEventNotification_nl(a1, 0, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ___ZN19IOACIPCControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjPvS4_E_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794560 && a4 != 0)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *a4, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
  }
  return result;
}

void IOACIPCControlClass::generalInterestCallback(IOACIPCControlClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOACIPCControlClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);
  _Block_release(this);
}

uint64_t IOACIPCControlClass::deregisterEventNotification(IOACIPCControlClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  IOACIPCControlClass::deregisterEventNotification_nl(this, a2);
  return pthread_mutex_unlock(v4);
}

void ___ZN19IOACIPCControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  const void *v2;
  NSObject *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

BOOL IOACIPCControlClass::getLogInternalBufferSize(IOACIPCControlClass *this, unsigned int *a2)
{
  _BOOL8 v2;
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;

  v2 = 0;
  if (a2)
  {
    v3 = *((_DWORD *)this + 20);
    if (v3)
    {
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("currentLogSnapshotBufferSize"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOACIPCControlClass::loggerTune(IOACIPCControlClass *this, unsigned int a2, unsigned int a3, void *a4, void *a5)
{
  pthread_mutex_t *v10;
  uint64_t v11;
  _BYTE v13[24];
  _BYTE v14[10];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v13 = 136316162;
    *(_QWORD *)&v13[4] = "loggerTune";
    *(_WORD *)&v13[12] = 1024;
    *(_DWORD *)&v13[14] = a2;
    *(_WORD *)&v13[18] = 1024;
    *(_DWORD *)&v13[20] = a3;
    *(_WORD *)v14 = 2048;
    *(_QWORD *)&v14[2] = a4;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: subsystem %u, index %u, arg1 %p, arg2 %p\n", v13, 0x2Cu);
  }
  *(_QWORD *)v13 = a2;
  *(_QWORD *)&v13[8] = a3;
  *(_QWORD *)&v13[16] = a4;
  *(_QWORD *)v14 = a5;
  v11 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 3u, (const uint64_t *)v13, 4u, 0, 0);
  pthread_mutex_unlock(v10);
  return v11;
}

BOOL IOACIPCControlClass::getLastKnownBootStage(IOACIPCControlClass *this, unsigned int *a2)
{
  _BOOL8 v2;
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;

  v2 = 0;
  if (a2)
  {
    v3 = *((_DWORD *)this + 20);
    if (v3)
    {
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("bootstage"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

const char *getACIPCErrorTypeString(unsigned int a1)
{
  if (a1 > 0x37)
    return "invalid";
  else
    return acipcErrorTypeStrings[a1];
}

const char *getACIPCDirectionString(unsigned int a1)
{
  if (a1 > 2)
    return "invalid";
  else
    return acipcDirectionStrings[a1];
}

const char *getACIPCLinkStateString(unsigned int a1)
{
  if (a1 > 4)
    return "invalid";
  else
    return acipcLinkStateStrings[a1];
}

const char *getACIPCAERErrorTypeString(unsigned int a1)
{
  if (a1 > 2)
    return "invalid";
  else
    return acipcAERErrorTypeStrings[a1];
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
  pthread_mutexattr_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_24F28D5F0;
  *((_DWORD *)this + 2) = 1;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_BYTE *)this + 176) = 0;
  v2.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v2.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v2);
  pthread_mutexattr_settype(&v2, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), &v2);
}

void IOACIPCClass::~IOACIPCClass(IOACIPCClass *this)
{
  void (**v2)(IOACIPCClass *__hidden);
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = &off_24F28D5F0;
  *(_QWORD *)this = &off_24F28D5F0;
  if ((*((_BYTE *)this + 8) & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "~IOACIPCClass";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v3, 0xCu);
      v2 = *(void (***)(IOACIPCClass *__hidden))this;
    }
    else
    {
      v2 = &off_24F28D5F0;
    }
  }
  ((void (*)(IOACIPCClass *, _QWORD))v2[4])(this, 0);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  IOACIPCClass::~IOACIPCClass(this);
  JUMPOUT(0x22E2D1F9CLL);
}

void sub_229881DF4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t IOACIPCClass::apiAdapter(IOACIPCClass *this, uint64_t a2)
{
  return a2;
}

uint64_t IOACIPCClass::lock(IOACIPCClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCClass::unlock(IOACIPCClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCClass::start(uint64_t a1, const void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  pthread_mutex_t *v12;
  uint64_t started;

  v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  started = IOACIPCClass::start_nl(a1, a2, a3, 0, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t IOACIPCClass::start_nl(uint64_t a1, const void *a2, CFTypeRef cf, dispatch_object_t object, uint64_t a5, uint64_t a6, uint64_t a7)
{
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  io_object_t *v17;
  kern_return_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  io_object_t v22;
  __CFRunLoop *v23;
  NSObject *v24;
  io_object_t *v25;
  kern_return_t v26;
  io_object_t v28;
  __CFRunLoop *v29;
  NSObject *v30;
  const char *v31;
  int v32;
  const char *v33;
  int v34;
  _QWORD v35[5];
  io_object_t v36;
  _QWORD v37[5];
  _QWORD block[5];
  io_object_t v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD aBlock[6];
  _QWORD v44[6];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  kern_return_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v14 = *(const void **)(a1 + 80);
  if (v14)
    CFRelease(v14);
  v15 = *(NSObject **)(a1 + 88);
  if (v15)
    dispatch_release(v15);
  if (cf)
  {
    if (object)
      IOACIPCClass::start_nl();
    *(_QWORD *)(a1 + 80) = cf;
    CFRetain(cf);
  }
  else if (object)
  {
    *(_QWORD *)(a1 + 88) = object;
    dispatch_retain(object);
  }
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3002000000;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  v44[5] = 0xAAAAAA0000000000;
  v16 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke;
  aBlock[3] = &unk_24F28D6E8;
  aBlock[4] = v44;
  aBlock[5] = a1;
  *(_QWORD *)(a1 + 152) = _Block_copy(aBlock);
  v42[0] = v16;
  v42[1] = 0x40000000;
  v42[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2;
  v42[3] = &unk_24F28D710;
  v42[4] = v44;
  *(_QWORD *)(a1 + 160) = _Block_copy(v42);
  if (a7)
  {
    v41[0] = v16;
    v41[1] = 0x40000000;
    v41[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_3;
    v41[3] = &unk_24F28D738;
    v41[4] = a7;
    *(_QWORD *)(a1 + 136) = _Block_copy(v41);
  }
  IOACIPCClass::setNotificationPort((IOACIPCClass *)a1);
  v40[0] = v16;
  v40[1] = 0x40000000;
  v40[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_4;
  v40[3] = &unk_24F28D760;
  v40[4] = a5;
  *(_QWORD *)(a1 + 120) = _Block_copy(v40);
  CFRetain(a2);
  v17 = (io_object_t *)(a1 + 112);
  v18 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceFirstMatch", (CFDictionaryRef)a2, (IOServiceMatchingCallback)IOACIPCClass::interfaceMatched, *(void **)(a1 + 120), (io_iterator_t *)(a1 + 112));
  if (v18)
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
    {
      v19 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "start_nl";
        v47 = 1024;
        v48 = v18;
        v20 = MEMORY[0x24BDACB70];
        v21 = "IOACIPCClass::%s: IOServiceAddMatchingNotification (kIOFirstMatchNotification) failed, ret = 0x%08x";
LABEL_26:
        _os_log_impl(&dword_22987D000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x12u);
        goto LABEL_27;
      }
      goto LABEL_28;
    }
LABEL_27:
    v19 = 0;
    goto LABEL_28;
  }
  v22 = *v17;
  IOObjectRetain(*v17);
  block[0] = v16;
  block[1] = 0x40000000;
  block[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_5;
  block[3] = &unk_24F28D788;
  block[4] = v40;
  v39 = v22;
  v23 = *(__CFRunLoop **)(a1 + 80);
  if (v23)
  {
    if (*(_QWORD *)(a1 + 88))
    {
      v31 = "!fQueue";
      v32 = 283;
      goto LABEL_42;
    }
    CFRunLoopPerformBlock(v23, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
  }
  v24 = *(NSObject **)(a1 + 88);
  if (!v24)
    goto LABEL_22;
  if (*(_QWORD *)(a1 + 80))
  {
    v31 = "!fRunLoopRef";
    v32 = 289;
LABEL_42:
    __assert_rtn("start_nl", "IOACIPCClass.cpp", v32, v31);
  }
  dispatch_async(v24, block);
LABEL_22:
  v37[0] = v16;
  v37[1] = 0x40000000;
  v37[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_15;
  v37[3] = &unk_24F28D7B0;
  v37[4] = a6;
  *(_QWORD *)(a1 + 128) = _Block_copy(v37);
  CFRetain(a2);
  v25 = (io_object_t *)(a1 + 116);
  v26 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceTerminate", (CFDictionaryRef)a2, (IOServiceMatchingCallback)IOACIPCClass::interfaceMatched, *(void **)(a1 + 128), (io_iterator_t *)(a1 + 116));
  if (!v26)
  {
    v28 = *v25;
    IOObjectRetain(*v25);
    v35[0] = v16;
    v35[1] = 0x40000000;
    v35[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2_18;
    v35[3] = &unk_24F28D7D8;
    v35[4] = v37;
    v36 = v28;
    v29 = *(__CFRunLoop **)(a1 + 80);
    if (v29)
    {
      if (*(_QWORD *)(a1 + 88))
      {
        v33 = "!fQueue";
        v34 = 340;
        goto LABEL_45;
      }
      CFRunLoopPerformBlock(v29, (CFTypeRef)*MEMORY[0x24BDBD5A0], v35);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
    }
    v30 = *(NSObject **)(a1 + 88);
    if (!v30)
    {
LABEL_38:
      v19 = 1;
      goto LABEL_28;
    }
    if (!*(_QWORD *)(a1 + 80))
    {
      dispatch_async(v30, v35);
      goto LABEL_38;
    }
    v33 = "!fRunLoopRef";
    v34 = 346;
LABEL_45:
    __assert_rtn("start_nl", "IOACIPCClass.cpp", v34, v33);
  }
  if ((*(_BYTE *)(a1 + 8) & 2) == 0)
    goto LABEL_27;
  v19 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "start_nl";
    v47 = 1024;
    v48 = v26;
    v20 = MEMORY[0x24BDACB70];
    v21 = "IOACIPCClass::%s: IOServiceAddMatchingNotification (kIOTerminatedNotification) failed, ret = 0x%08x";
    goto LABEL_26;
  }
LABEL_28:
  if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "start_nl";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: --done\n", buf, 0xCu);
  }
  _Block_object_dispose(v44, 8);
  return v19;
}

void sub_2298823D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t IOACIPCClass::start(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  pthread_mutex_t *v12;
  uint64_t started;

  v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  started = IOACIPCClass::start_nl(a1, a2, 0, a3, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(result + 44) = *(_BYTE *)(a2 + 44);
  *(_DWORD *)(result + 40) = v2;
  return result;
}

void ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_s *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v7 = *(os_unfair_lock_s **)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v8 + 44))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 40));
  }
  else
  {
    v9 = v7 + 36;
    os_unfair_lock_lock(v7 + 36);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))(*(uint64_t (**)(os_unfair_lock_s *, uint64_t, uint64_t))(*(_QWORD *)&v7->_os_unfair_lock_opaque + 232))(v7, a3, a4);
    os_unfair_lock_unlock(v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    if (v10)
    {
      v10[2](v10, a3, a4);
      _Block_release(v10);
    }
  }
}

void ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void IOACIPCClass::setNotificationPort(IOACIPCClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 12))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 12) = v2;
    if (!v2)
      IOACIPCClass::setNotificationPort();
    if (*((_QWORD *)this + 10))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((_QWORD *)this + 13) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 10), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    v4 = *((_QWORD *)this + 11);
    if (v4)
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 12), v4);
  }
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_4(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  io_object_t v5;
  int v6;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = 0;
    do
    {
      if (!v6)
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
      --v6;
    }
    while ((_DWORD)result);
  }
  return result;
}

void IOACIPCClass::interfaceMatched(IOACIPCClass *this, void *a2)
{
  _Block_copy(this);
  (*((void (**)(IOACIPCClass *, void *))this + 2))(this, a2);
  _Block_release(this);
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_15(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  io_object_t v5;
  int v6;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = 0;
    do
    {
      if (!v6)
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
      --v6;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2_18(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

uint64_t IOACIPCClass::stop(IOACIPCClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  NSObject *v5;
  char v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __CFRunLoop *v12;
  NSObject *v13;
  char v14;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "stop";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", buf, 0xCu);
  }
  if (*((_QWORD *)this + 10) || *((_QWORD *)this + 11))
  {
    IOACIPCClass::close_nl(this);
    IOACIPCClass::clearIterators(this);
    IOACIPCClass::clearNotificationPort(this);
    v5 = a2;
    if (!a2)
    {
      if (*((_QWORD *)this + 11))
      {
        v6 = 0;
        v5 = 0;
        goto LABEL_10;
      }
      v5 = dispatch_group_create();
      if (!v5)
      {
        v6 = 0;
        goto LABEL_10;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    v6 = 1;
LABEL_10:
    v7 = *((_QWORD *)this + 20);
    if (v7)
    {
      (*(void (**)(void))(v7 + 16))();
      _Block_release(*((const void **)this + 20));
      *((_QWORD *)this + 20) = 0;
    }
    v8 = (const void *)*((_QWORD *)this + 17);
    if (v8)
    {
      _Block_release(v8);
      *((_QWORD *)this + 17) = 0;
    }
    v9 = *((_QWORD *)this + 19);
    v10 = MEMORY[0x24BDAC760];
    *((_QWORD *)this + 19) = 0;
    v16[0] = v10;
    v16[1] = 0x40000000;
    v16[2] = ___ZN12IOACIPCClass4stopEP16dispatch_group_s_block_invoke;
    v16[3] = &unk_24F28D800;
    v11 = *(_OWORD *)((char *)this + 120);
    *((_QWORD *)this + 15) = 0;
    *((_QWORD *)this + 16) = 0;
    v17 = v11;
    v18 = v9;
    v19 = v5;
    v12 = (__CFRunLoop *)*((_QWORD *)this + 10);
    if (v12)
    {
      if (*((_QWORD *)this + 11))
        IOACIPCClass::stop();
      CFRunLoopPerformBlock(v12, (CFTypeRef)*MEMORY[0x24BDBD5A0], v16);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
      CFRelease(*((CFTypeRef *)this + 10));
      *((_QWORD *)this + 10) = 0;
    }
    v13 = *((_QWORD *)this + 11);
    if (v13)
    {
      dispatch_async(v13, v16);
      dispatch_release(*((dispatch_object_t *)this + 11));
      *((_QWORD *)this + 11) = 0;
    }
    pthread_mutex_unlock(v4);
    v14 = v6 ^ 1;
    if (a2)
      v14 = 1;
    if ((v14 & 1) == 0)
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
    }
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "stop";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: --done\n", buf, 0xCu);
    }
    return 1;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "stop";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: already stopped, returning true\n", buf, 0xCu);
  }
  pthread_mutex_unlock(v4);
  return 1;
}

uint64_t IOACIPCClass::close_nl(IOACIPCClass *this)
{
  mach_port_t v2;
  uint32_t v3;
  uint64_t v4;
  io_connect_t v5;
  io_object_t v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)this + 176))
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
    {
      v4 = 0;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return v4;
      v8 = 136315138;
      v9 = "close_nl";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: not open, return success\n", (uint8_t *)&v8, 0xCu);
    }
    return 0;
  }
  *((_BYTE *)this + 176) = 0;
  v2 = *((_DWORD *)this + 43);
  v3 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 1);
  v4 = IOConnectCallScalarMethod(v2, v3, 0, 0, 0, 0);
  v5 = *((_DWORD *)this + 43);
  if (v5)
  {
    IOServiceClose(v5);
    *((_DWORD *)this + 43) = 0;
  }
  v6 = *((_DWORD *)this + 42);
  if (v6)
  {
    IOObjectRelease(v6);
    *((_DWORD *)this + 42) = 0;
  }
  return v4;
}

uint64_t IOACIPCClass::clearIterators(IOACIPCClass *this)
{
  io_object_t v2;
  uint64_t result;

  v2 = *((_DWORD *)this + 28);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 28) = 0;
  }
  result = *((unsigned int *)this + 29);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 29) = 0;
  }
  return result;
}

void IOACIPCClass::clearNotificationPort(IOACIPCClass *this)
{
  uint64_t v1;
  _QWORD *v2;
  __CFRunLoop *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  v2 = (_QWORD *)((char *)this + 96);
  v1 = *((_QWORD *)this + 12);
  if (v1)
  {
    v4 = (__CFRunLoop *)*((_QWORD *)this + 10);
    v5 = *((_QWORD *)this + 13);
    *v2 = 0;
    v2[1] = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN12IOACIPCClass21clearNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_22;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((_QWORD *)this + 11))
        IOACIPCClass::clearNotificationPort();
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
    }
    v6 = *((_QWORD *)this + 11);
    if (v6)
    {
      if (*((_QWORD *)this + 10))
        IOACIPCClass::clearNotificationPort();
      dispatch_async(v6, block);
    }
  }
}

void ___ZN12IOACIPCClass4stopEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    _Block_release(v3);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    _Block_release(v4);
  v5 = *(NSObject **)(a1 + 56);
  if (v5)
  {
    dispatch_group_leave(v5);
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }
}

void ___ZN12IOACIPCClass21clearNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  __CFRunLoop *v2;

  v2 = a1[4];
  if (v2)
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  IONotificationPortDestroy(a1[6]);
}

const void *IOACIPCClass::getTransferRingInfo(IOACIPCClass *this, io_registry_entry_t entry)
{
  CFTypeRef CFProperty;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("AppleConvergedIPCTransferRingProperties"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    if ((*((_BYTE *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "getTransferRingInfo";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR properties are not available\n", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  v4 = CFProperty;
  v5 = CFGetTypeID(CFProperty);
  if (v5 != CFArrayGetTypeID())
  {
    if ((*((_BYTE *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "getTransferRingInfo";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR properties has invalid type\n", (uint8_t *)&v7, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  return v4;
}

const void *IOACIPCClass::getCompletionRingInfo(IOACIPCClass *this, io_registry_entry_t entry)
{
  CFTypeRef CFProperty;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("AppleConvergedIPCCompletionRingProperties"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    if ((*((_BYTE *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "getCompletionRingInfo";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: CR properties are not available\n", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  v4 = CFProperty;
  v5 = CFGetTypeID(CFProperty);
  if (v5 != CFArrayGetTypeID())
  {
    if ((*((_BYTE *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "getCompletionRingInfo";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: CR properties has invalid type\n", (uint8_t *)&v7, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  return v4;
}

uint64_t IOACIPCClass::open(IOACIPCClass *this, io_service_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "open";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  v5 = IOACIPCClass::open_nl((io_connect_t *)this, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCClass::open_nl(io_connect_t *this, io_service_t a2)
{
  uint64_t v2;
  mach_port_t v5;
  uint32_t v6;
  io_connect_t v7;
  io_object_t v8;
  uint64_t v10;
  uint32_t outputCnt;

  v2 = 0;
  outputCnt = 0;
  v10 = 0;
  if (!*((_BYTE *)this + 176))
  {
    if (IOACIPCClass::setUpNotificationCallback((IOACIPCClass *)this, a2))
    {
      v2 = IOServiceOpen(a2, *MEMORY[0x24BDAEC58], 0, this + 43);
      if (!(_DWORD)v2)
      {
        v5 = this[43];
        v6 = (*(uint64_t (**)(io_connect_t *, _QWORD))(*(_QWORD *)this + 224))(this, 0);
        v2 = IOConnectCallScalarMethod(v5, v6, &v10, 1u, 0, &outputCnt);
        if (!(_DWORD)v2)
        {
          *((_BYTE *)this + 176) = 1;
          return v2;
        }
      }
    }
    else
    {
      v2 = 3758097112;
    }
    v7 = this[43];
    if (v7)
    {
      IOServiceClose(v7);
      this[43] = 0;
    }
    v8 = this[42];
    if (v8)
    {
      IOObjectRelease(v8);
      this[42] = 0;
    }
  }
  return v2;
}

BOOL IOACIPCClass::setUpNotificationCallback(IOACIPCClass *this, io_service_t a2)
{
  kern_return_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  kern_return_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 12), a2, "IOGeneralInterest", (IOServiceInterestCallback)IOACIPCClass::notificationCallback, *((void **)this + 19), (io_object_t *)this + 42);
  if (v3 && (*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "setUpNotificationCallback";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: Could not add interest notification on service: %#x\n", (uint8_t *)&v5, 0x12u);
  }
  return v3 == 0;
}

uint64_t IOACIPCClass::cleanUpNotificationCallback(IOACIPCClass *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 42);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 42) = 0;
  }
  return result;
}

uint64_t IOACIPCClass::close(IOACIPCClass *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "close";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  v3 = IOACIPCClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCClass::notificationCallback(uint64_t (**this)(IOACIPCClass *, void *), void *a2, unsigned int a3, unsigned int a4, void *a5)
{
  return this[2]((IOACIPCClass *)this, a2);
}

void *IOACIPCClass::copyNotificationHandler(IOACIPCClass *this, int a2, void *a3)
{
  const void *v3;

  if (a2 == -469794559 && (v3 = (const void *)*((_QWORD *)this + 17)) != 0)
    return _Block_copy(v3);
  else
    return 0;
}

uint64_t IOACIPCClass::io(uint64_t a1, unsigned int a2, void *a3, unsigned int *a4, unsigned int a5)
{
  pthread_mutex_t *v10;
  int v11;
  size_t v12;
  mach_port_t v13;
  uint32_t v14;
  uint64_t v15;
  _BYTE buf[12];
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t input[2];
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  *(_OWORD *)input = 0u;
  v25 = 0u;
  v10 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *a4;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "io";
    v18 = 1024;
    v19 = a2;
    v20 = 2048;
    v21 = a3;
    v22 = 1024;
    v23 = v11;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: trIndex %u, buff %p, size %u\n", buf, 0x22u);
  }
  input[0] = a2;
  input[1] = a5;
  v26 = 0;
  v25 = 0uLL;
  v12 = *a4;
  *(_QWORD *)buf = v12;
  v13 = *(_DWORD *)(a1 + 172);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 224))(a1, 2);
  if (a5 == 1)
  {
    v15 = IOConnectCallMethod(v13, v14, input, 5u, a3, v12, 0, 0, 0, 0);
  }
  else
  {
    v15 = IOConnectCallMethod(v13, v14, input, 5u, 0, 0, 0, 0, a3, (size_t *)buf);
    if (!(_DWORD)v15)
      *a4 = *(_DWORD *)buf;
  }
  pthread_mutex_unlock(v10);
  return v15;
}

uint64_t IOACIPCClass::ioAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void *a5, unsigned int a6, void (*a7)(void *, int, void *), void *a8)
{
  __int128 v16;
  pthread_mutex_t *v17;
  mach_port_t v18;
  uint32_t v19;
  mach_port_t MachPort;
  uint64_t v21;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  uint64_t input[2];
  __int128 v36;
  uint64_t v37;
  uint64_t reference[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v40 = v16;
  v41 = v16;
  *(_OWORD *)reference = v16;
  v39 = v16;
  v37 = 0;
  *(_OWORD *)input = 0u;
  v36 = 0u;
  v17 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v24 = "ioAsync";
    v25 = 1024;
    v26 = a2;
    v27 = 2048;
    v28 = a3;
    v29 = 1024;
    v30 = a4;
    v31 = 2048;
    v32 = a5;
    v33 = 1024;
    v34 = a6;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: trIndex %u, buff %p, size %u, footer %p, size %u\n", buf, 0x32u);
  }
  if (*((_QWORD *)this + 12))
  {
    input[0] = a3;
    input[1] = a4;
    *(_QWORD *)&v36 = a5;
    *((_QWORD *)&v36 + 1) = a6;
    v37 = a2;
    reference[1] = (uint64_t)a7;
    *(_QWORD *)&v39 = a8;
    v18 = *((_DWORD *)this + 43);
    v19 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 2);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v21 = IOConnectCallAsyncScalarMethod(v18, v19, MachPort, reference, 3u, input, 5u, 0, 0);
  }
  else
  {
    v21 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "ioAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v17);
  return v21;
}

uint64_t IOACIPCClass::sendImage(IOACIPCClass *this, const void *a2, unsigned int a3, unsigned int *a4, unsigned int a5)
{
  pthread_mutex_t *v10;
  mach_port_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint32_t outputCnt;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BYTE v20[14];
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t output;
  uint64_t v26;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  outputCnt = 2;
  v10 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "sendImage";
    v19 = 2048;
    *(_QWORD *)v20 = a2;
    *(_WORD *)&v20[8] = 1024;
    *(_DWORD *)&v20[10] = a3;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  input[0] = 0;
  input[1] = 0;
  input[2] = a5;
  output = 0;
  v26 = 0;
  v11 = *((_DWORD *)this + 43);
  v12 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 3);
  v13 = IOConnectCallMethod(v11, v12, input, 3u, a2, a3, &output, &outputCnt, 0, 0);
  if (!(_DWORD)v13)
  {
    *a4 = output;
    v13 = v26;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v14 = *a4;
    *(_DWORD *)buf = 136316162;
    v18 = "sendImage";
    v19 = 1024;
    *(_DWORD *)v20 = v13;
    *(_WORD *)&v20[4] = 2048;
    *(_QWORD *)&v20[6] = a2;
    v21 = 1024;
    v22 = a3;
    v23 = 1024;
    v24 = v14;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: ret 0x%x, buff %p, size %u, cookie %u\n", buf, 0x28u);
  }
  pthread_mutex_unlock(v10);
  return v13;
}

uint64_t IOACIPCClass::sendImageAsync(IOACIPCClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *, void *), void *a5, unsigned int a6)
{
  __int128 v12;
  pthread_mutex_t *v13;
  mach_port_t v14;
  uint32_t v15;
  mach_port_t MachPort;
  uint64_t v17;
  uint32_t outputCnt;
  _BYTE buf[24];
  unsigned int v21;
  uint64_t output[2];
  uint64_t reference[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = v12;
  v26 = v12;
  *(_OWORD *)reference = v12;
  v24 = v12;
  outputCnt = 2;
  v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "sendImageAsync";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 1024;
    v21 = a3;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  if (*((_QWORD *)this + 12))
  {
    *(_QWORD *)buf = a2;
    *(_QWORD *)&buf[8] = a3;
    *(_QWORD *)&buf[16] = a6;
    output[0] = 0;
    output[1] = 0;
    reference[1] = (uint64_t)a4;
    *(_QWORD *)&v24 = a5;
    v14 = *((_DWORD *)this + 43);
    v15 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 3);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v17 = IOConnectCallAsyncScalarMethod(v14, v15, MachPort, reference, 3u, (const uint64_t *)buf, 3u, output, &outputCnt);
  }
  else
  {
    v17 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "sendImageAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v13);
  return v17;
}

uint64_t IOACIPCClass::generateNonce(IOACIPCClass *this)
{
  pthread_mutex_t *v2;
  mach_port_t v3;
  uint32_t v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "generateNonce";
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  v3 = *((_DWORD *)this + 43);
  v4 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 12);
  v5 = IOConnectCallScalarMethod(v3, v4, 0, 0, 0, 0);
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "generateNonce";
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: ret 0x%x\n", (uint8_t *)&v7, 0x12u);
  }
  pthread_mutex_unlock(v2);
  return v5;
}

uint64_t IOACIPCClass::readRegister(IOACIPCClass *this, unsigned int a2, void *a3, unsigned int *a4)
{
  pthread_mutex_t *v8;
  int v9;
  mach_port_t v10;
  uint32_t v11;
  uint64_t v12;
  size_t v14;
  _BYTE buf[12];
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *a4;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "readRegister";
    v16 = 1024;
    v17 = a2;
    v18 = 2048;
    v19 = a3;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: reg %u, buff %p, size %u\n", buf, 0x22u);
  }
  v14 = *a4;
  *(_QWORD *)buf = a2;
  v10 = *((_DWORD *)this + 43);
  v11 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 4);
  v12 = IOConnectCallMethod(v10, v11, (const uint64_t *)buf, 1u, 0, 0, 0, 0, a3, &v14);
  if (!(_DWORD)v12)
    *a4 = v14;
  pthread_mutex_unlock(v8);
  return v12;
}

uint64_t IOACIPCClass::writeRegister(IOACIPCClass *this, unsigned int a2, void *a3, unsigned int a4)
{
  pthread_mutex_t *v8;
  mach_port_t v9;
  uint32_t v10;
  uint64_t v11;
  _BYTE buf[12];
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "writeRegister";
    v14 = 1024;
    v15 = a2;
    v16 = 2048;
    v17 = a3;
    v18 = 1024;
    v19 = a4;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: reg %u, buff %p, size %u\n", buf, 0x22u);
  }
  *(_QWORD *)buf = a2;
  v9 = *((_DWORD *)this + 43);
  v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 13);
  v11 = IOConnectCallMethod(v9, v10, (const uint64_t *)buf, 1u, a3, a4, 0, 0, 0, 0);
  pthread_mutex_unlock(v8);
  return v11;
}

uint64_t IOACIPCClass::queryTransferCredit(IOACIPCClass *this, unsigned int a2, unsigned int *a3)
{
  pthread_mutex_t *v6;
  mach_port_t v7;
  uint32_t v8;
  uint64_t v9;
  BOOL v10;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  input[0] = a2;
  *a3 = 0;
  v7 = *((_DWORD *)this + 43);
  v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 5);
  v9 = IOConnectCallMethod(v7, v8, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v9)
    v10 = 0;
  else
    v10 = outputCnt == 1;
  if (v10)
    *a3 = output;
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t IOACIPCClass::getIOMMUPageSize(IOACIPCClass *this, unsigned int *a2)
{
  pthread_mutex_t *v4;
  mach_port_t v5;
  uint32_t v6;
  uint64_t v7;
  BOOL v8;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  *a2 = 0;
  v5 = *((_DWORD *)this + 43);
  v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 6);
  v7 = IOConnectCallMethod(v5, v6, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if ((_DWORD)v7)
    v8 = 0;
  else
    v8 = outputCnt == 1;
  if (v8)
    *a2 = output[0];
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::mapMemory(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8)
{
  pthread_mutex_t *v11;
  mach_port_t v12;
  uint32_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t input[8];

  input[7] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  input[3] = a5;
  input[4] = a6;
  input[5] = a7;
  input[6] = a8;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "mapMemory";
    v18 = 1024;
    v19 = a2;
    v20 = 1024;
    v21 = a4;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, size %u\n", buf, 0x18u);
  }
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v12 = *((_DWORD *)this + 43);
  v13 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 7);
  v14 = IOConnectCallMethod(v12, v13, input, 7u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v11);
  return v14;
}

uint64_t IOACIPCClass::mapMemoryAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, void (*a9)(void *, int), void *a10)
{
  __int128 v11;
  mach_port_t v14;
  uint32_t v15;
  mach_port_t MachPort;
  uint64_t v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t input[7];
  uint64_t reference[2];
  void *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = v11;
  v30 = v11;
  v28 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  input[3] = a5;
  input[4] = a6;
  input[5] = a7;
  input[6] = a8;
  reference[1] = (uint64_t)a9;
  v27 = a10;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "mapMemoryAsync";
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    v24 = a4;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, size %u\n", buf, 0x18u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_QWORD *)this + 12))
  {
    v14 = *((_DWORD *)this + 43);
    v15 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 7);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v17 = IOConnectCallAsyncScalarMethod(v14, v15, MachPort, reference, 3u, input, 7u, 0, 0);
  }
  else
  {
    v17 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "mapMemoryAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v17;
}

uint64_t IOACIPCClass::unmapMemory(IOACIPCClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  mach_port_t v5;
  uint32_t v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unsigned int v12;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "unmapMemory";
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v5 = *((_DWORD *)this + 43);
  v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 8);
  v7 = IOConnectCallMethod(v5, v6, input, 1u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::unmapMemoryAsync(IOACIPCClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  __int128 v5;
  mach_port_t v7;
  uint32_t v8;
  mach_port_t MachPort;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t input;
  uint64_t reference[2];
  void *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v5;
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input = a2;
  reference[1] = (uint64_t)a3;
  v18 = a4;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "unmapMemoryAsync";
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_QWORD *)this + 12))
  {
    v7 = *((_DWORD *)this + 43);
    v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 8);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v10 = IOConnectCallAsyncScalarMethod(v7, v8, MachPort, reference, 3u, &input, 1u, 0, 0);
  }
  else
  {
    v10 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "unmapMemoryAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v10;
}

uint64_t IOACIPCClass::updateMemory(IOACIPCClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  pthread_mutex_t *v8;
  mach_port_t v9;
  uint32_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "updateMemory";
    v15 = 1024;
    v16 = a2;
    v17 = 1024;
    v18 = a3;
    v19 = 1024;
    v20 = a4;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, prio -> %u, tc -> %u\n", buf, 0x1Eu);
  }
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v9 = *((_DWORD *)this + 43);
  v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 9);
  v11 = IOConnectCallMethod(v9, v10, input, 3u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v8);
  return v11;
}

uint64_t IOACIPCClass::updateMemoryAsync(IOACIPCClass *this, unsigned int a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  __int128 v7;
  mach_port_t v11;
  uint32_t v12;
  mach_port_t MachPort;
  uint64_t v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  uint64_t input[3];
  uint64_t reference[2];
  void *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28 = v7;
  v29 = v7;
  v27 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  reference[1] = (uint64_t)a5;
  v26 = a6;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "updateMemoryAsync";
    v18 = 1024;
    v19 = a2;
    v20 = 1024;
    v21 = a3;
    v22 = 1024;
    v23 = a4;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, prio -> %u, tc -> %u\n", buf, 0x1Eu);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_QWORD *)this + 12))
  {
    v11 = *((_DWORD *)this + 43);
    v12 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 9);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v14 = IOConnectCallAsyncScalarMethod(v11, v12, MachPort, reference, 3u, input, 3u, 0, 0);
  }
  else
  {
    v14 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "updateMemoryAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v14;
}

uint64_t IOACIPCClass::notifyMemory(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4)
{
  pthread_mutex_t *v6;
  mach_port_t v7;
  uint32_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unsigned int v14;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "notifyMemory";
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v7 = *((_DWORD *)this + 43);
  v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 10);
  v9 = IOConnectCallMethod(v7, v8, input, 3u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t IOACIPCClass::notifyMemoryAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  __int128 v7;
  mach_port_t v9;
  uint32_t v10;
  mach_port_t MachPort;
  uint64_t v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t input[3];
  uint64_t reference[2];
  void *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v7;
  v23 = v7;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  reference[1] = (uint64_t)a5;
  v20 = a6;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "notifyMemoryAsync";
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_QWORD *)this + 12))
  {
    v9 = *((_DWORD *)this + 43);
    v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 10);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, input, 3u, 0, 0);
  }
  else
  {
    v12 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "notifyMemoryAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v12;
}

uint64_t IOACIPCClass::abortTransferRing(IOACIPCClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  mach_port_t v5;
  uint32_t v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unsigned int v12;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "abortTransferRing";
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR index %u\n", buf, 0x12u);
  }
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v5 = *((_DWORD *)this + 43);
  v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 11);
  v7 = IOConnectCallMethod(v5, v6, input, 1u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::abortTransferRingAsync(IOACIPCClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  __int128 v5;
  mach_port_t v7;
  uint32_t v8;
  mach_port_t MachPort;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t input;
  uint64_t reference[2];
  void *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v5;
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input = a2;
  reference[1] = (uint64_t)a3;
  v18 = a4;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "abortTransferRingAsync";
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR index %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_QWORD *)this + 12))
  {
    v7 = *((_DWORD *)this + 43);
    v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)this + 224))(this, 11);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    v10 = IOConnectCallAsyncScalarMethod(v7, v8, MachPort, reference, 3u, &input, 1u, 0, 0);
  }
  else
  {
    v10 = 3758097112;
    if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "abortTransferRingAsync";
      _os_log_impl(&dword_22987D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v10;
}

void IOACIPCTraceClass::connect()
{
  __assert_rtn("connect", "IOACIPCTraceClass.cpp", 118, "!queue");
}

void IOACIPCTraceClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOACIPCTraceClass.cpp", 231, "fNotificationPort");
}

void IOACIPCControlClass::deregisterEventNotification_nl()
{
  __assert_rtn("deregisterEventNotification_nl", "IOACIPCControlClass.cpp", 573, "!fEventQueue");
}

void IOACIPCControlClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOACIPCControlClass.cpp", 118, "fNotificationPort");
}

void IOACIPCControlClass::setEventNotificationPort()
{
  __assert_rtn("setEventNotificationPort", "IOACIPCControlClass.cpp", 156, "fEventNotificationPort");
}

void IOACIPCControlClass::clearEventNotificationPort()
{
  __assert_rtn("clearEventNotificationPort", "IOACIPCControlClass.cpp", 202, "!fEventRunLoopRef");
}

{
  __assert_rtn("clearEventNotificationPort", "IOACIPCControlClass.cpp", 196, "!fEventQueue");
}

void IOACIPCControlClass::open_nl()
{
  __assert_rtn("open_nl", "IOACIPCControlClass.cpp", 261, "!queue");
}

void IOACIPCControlClass::registerEventNotification_nl()
{
  __assert_rtn("registerEventNotification_nl", "IOACIPCControlClass.cpp", 464, "!queue");
}

void IOACIPCClass::start_nl()
{
  __assert_rtn("start_nl", "IOACIPCClass.cpp", 180, "!queue");
}

void IOACIPCClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOACIPCClass.cpp", 482, "fNotificationPort");
}

void IOACIPCClass::stop()
{
  __assert_rtn("stop", "IOACIPCClass.cpp", 447, "!fQueue");
}

void IOACIPCClass::clearNotificationPort()
{
  __assert_rtn("clearNotificationPort", "IOACIPCClass.cpp", 528, "!fRunLoopRef");
}

{
  __assert_rtn("clearNotificationPort", "IOACIPCClass.cpp", 522, "!fQueue");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
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

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
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

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F28D0E0(__p);
}

uint64_t operator delete()
{
  return off_24F28D0E8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F28D0F0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

