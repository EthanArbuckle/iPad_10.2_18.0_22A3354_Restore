uint64_t IOABPClass::writeAsync(IOABPClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  __int128 v10;
  pthread_mutex_t *v11;
  IONotificationPort *v12;
  mach_port_t v13;
  mach_port_t MachPort;
  uint64_t v15;
  uint64_t input[2];
  uint64_t reference[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v10;
  v21 = v10;
  *(_OWORD *)reference = v10;
  v19 = v10;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "writeAsync", a2, a3);
  v12 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v12)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    reference[1] = (uint64_t)a4;
    *(_QWORD *)&v19 = a5;
    v13 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v12);
    v15 = IOConnectCallAsyncScalarMethod(v13, 2u, MachPort, reference, 3u, input, 2u, 0, 0);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "writeAsync");
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

uint64_t IOABPClass::readAsync(IOABPClass *this, uint64_t a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  __int128 v10;
  pthread_mutex_t *v11;
  IONotificationPort *v12;
  mach_port_t v13;
  mach_port_t MachPort;
  uint64_t v15;
  uint64_t input[2];
  uint64_t reference[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v10;
  v21 = v10;
  *(_OWORD *)reference = v10;
  v19 = v10;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v12 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v12)
  {
    input[0] = a2;
    input[1] = a3;
    reference[1] = (uint64_t)a4;
    *(_QWORD *)&v19 = a5;
    v13 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v12);
    v15 = IOConnectCallAsyncScalarMethod(v13, 3u, MachPort, reference, 3u, input, 2u, 0, 0);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "readAsync");
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

void IOABPControlClass::IOABPControlClass(IOABPControlClass *this)
{
  *(_DWORD *)this = 0;
  *((_DWORD *)this + 18) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((_BYTE *)this + 164) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

{
  *(_DWORD *)this = 0;
  *((_DWORD *)this + 18) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((_BYTE *)this + 164) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

void IOABPControlClass::~IOABPControlClass(IOABPControlClass *this)
{
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: \n", "~IOABPControlClass");
  IOABPControlClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOABPControlClass::stop(io_object_t *this)
{
  pthread_mutex_t *v2;
  io_object_t v3;

  v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: \n", "stop");
  IOABPControlClass::close_nl((IOABPControlClass *)this);
  IOABPControlClass::deregisterEventNotification_nl((IOABPControlClass *)this, 0);
  v3 = this[18];
  if (v3)
  {
    IOObjectRelease(v3);
    this[18] = 0;
  }
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: --done\n", "stop");
  pthread_mutex_unlock(v2);
  return 1;
}

BOOL IOABPControlClass::start(IOABPControlClass *this)
{
  pthread_mutex_t *v2;
  _BOOL8 v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*((_DWORD *)this + 18))
  {
    v3 = 1;
  }
  else
  {
    v4 = IOServiceMatching("AppleBasebandPCIControl");
    if (v4)
    {
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v4);
      v3 = MatchingService != 0;
      if (!MatchingService && (*(_BYTE *)this & 2) != 0)
        syslog(5, "IOABPControlClass::%s: could not get matching service\n", "start");
      *((_DWORD *)this + 18) = MatchingService;
    }
    else
    {
      if ((*(_BYTE *)this & 2) != 0)
        syslog(5, "IOABPControlClass::%s: could not create matching dictionary\n", "start");
      v3 = 0;
    }
  }
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: --done\n", "start");
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOABPControlClass::close_nl(IOABPControlClass *this)
{
  uint64_t v2;
  io_connect_t v3;
  const void *v4;
  NSObject *v5;

  if (!*((_BYTE *)this + 164))
    return 0;
  *((_BYTE *)this + 164) = 0;
  v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 1u, 0, 0, 0, 0);
  v3 = *((_DWORD *)this + 40);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 40) = 0;
  }
  IOABPControlClass::clearNotificationPort(this);
  v4 = (const void *)*((_QWORD *)this + 10);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)this + 10) = 0;
  }
  v5 = *((_QWORD *)this + 11);
  if (v5)
  {
    dispatch_release(v5);
    *((_QWORD *)this + 11) = 0;
  }
  return v2;
}

void IOABPControlClass::deregisterEventNotification_nl(IOABPControlClass *this, NSObject *a2)
{
  CFRunLoopRef Current;
  NSObject *v5;
  char v6;
  uint64_t v7;
  __CFRunLoop *v8;
  NSObject *v9;
  char v10;
  _QWORD block[6];

  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: +\n", "deregisterEventNotification_nl");
  if (*((_QWORD *)this + 14) || *((_QWORD *)this + 15))
  {
    IOObjectRelease(*((_DWORD *)this + 36));
    *((_DWORD *)this + 36) = 0;
    IOABPControlClass::clearEventNotificationPort(this);
    if (*((_QWORD *)this + 14))
    {
      Current = CFRunLoopGetCurrent();
      if (Current == *((CFRunLoopRef *)this + 14))
      {
        if (*((_QWORD *)this + 19))
        {
          _Block_release(*((const void **)this + 19));
          *((_QWORD *)this + 19) = 0;
          Current = (CFRunLoopRef)*((_QWORD *)this + 14);
        }
        if (Current)
        {
          CFRelease(Current);
          *((_QWORD *)this + 14) = 0;
        }
        goto LABEL_24;
      }
    }
    v5 = a2;
    if (!a2)
    {
      if (*((_QWORD *)this + 15))
      {
        v6 = 0;
        v5 = 0;
        goto LABEL_11;
      }
      v5 = dispatch_group_create();
      if (!v5)
      {
        v6 = 0;
        goto LABEL_11;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    v6 = 1;
LABEL_11:
    v7 = *((_QWORD *)this + 19);
    *((_QWORD *)this + 19) = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN17IOABPControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke;
    block[3] = &unk_24C805F10;
    block[4] = v7;
    block[5] = v5;
    v8 = (__CFRunLoop *)*((_QWORD *)this + 14);
    if (v8)
    {
      if (*((_QWORD *)this + 15))
        IOABPControlClass::deregisterEventNotification_nl();
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
      CFRelease(*((CFTypeRef *)this + 14));
      *((_QWORD *)this + 14) = 0;
    }
    v9 = *((_QWORD *)this + 15);
    if (v9)
    {
      dispatch_async(v9, block);
      dispatch_release(*((dispatch_object_t *)this + 15));
      *((_QWORD *)this + 15) = 0;
    }
    v10 = v6 ^ 1;
    if (a2)
      v10 = 1;
    if ((v10 & 1) == 0)
    {
      pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
    }
LABEL_24:
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPControlClass::%s: -\n", "deregisterEventNotification_nl");
  }
}

void IOABPControlClass::setNotificationPort(IOABPControlClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 12))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 12) = v2;
    if (!v2)
      IOABPControlClass::setNotificationPort();
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

void IOABPControlClass::clearNotificationPort(IOABPControlClass *this)
{
  IONotificationPort *v2;
  _QWORD *v3;

  v3 = (_QWORD *)((char *)this + 96);
  v2 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v2)
  {
    if (*((_QWORD *)this + 10))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 10), *((CFRunLoopSourceRef *)this + 13), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v2 = (IONotificationPort *)*((_QWORD *)this + 12);
    }
    IONotificationPortDestroy(v2);
    *v3 = 0;
    v3[1] = 0;
  }
}

void IOABPControlClass::setEventNotificationPort(IOABPControlClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 16))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 16) = v2;
    if (!v2)
      IOABPControlClass::setEventNotificationPort();
    if (*((_QWORD *)this + 14))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((_QWORD *)this + 17) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 14), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    v4 = *((_QWORD *)this + 15);
    if (v4)
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 16), v4);
  }
}

void IOABPControlClass::clearEventNotificationPort(IOABPControlClass *this)
{
  uint64_t v1;
  _QWORD *v2;
  __CFRunLoop *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  v2 = (_QWORD *)((char *)this + 128);
  v1 = *((_QWORD *)this + 16);
  if (v1)
  {
    v4 = (__CFRunLoop *)*((_QWORD *)this + 14);
    v5 = *((_QWORD *)this + 17);
    *v2 = 0;
    v2[1] = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN17IOABPControlClass26clearEventNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((_QWORD *)this + 15))
        IOABPControlClass::clearEventNotificationPort();
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
    }
    v6 = *((_QWORD *)this + 15);
    if (v6)
    {
      if (*((_QWORD *)this + 14))
        IOABPControlClass::clearEventNotificationPort();
      dispatch_async(v6, block);
    }
  }
}

void ___ZN17IOABPControlClass26clearEventNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  __CFRunLoop *v2;

  v2 = a1[4];
  if (v2)
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  IONotificationPortDestroy(a1[6]);
}

uint64_t IOABPControlClass::open(IOABPControlClass *this, __CFRunLoop *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: \n", "open");
  v5 = IOABPControlClass::open_nl(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPControlClass::open_nl(IOABPControlClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t result;
  io_service_t v5;
  uint64_t v8;
  uint32_t outputCnt;

  result = 0;
  outputCnt = 0;
  v8 = 0;
  if (!*((_BYTE *)this + 164))
  {
    v5 = *((_DWORD *)this + 18);
    if (v5)
    {
      result = IOServiceOpen(v5, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 40);
      if (!(_DWORD)result)
      {
        result = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 0, &v8, 1u, 0, &outputCnt);
        if (!(_DWORD)result)
        {
          *((_BYTE *)this + 164) = 1;
          if (a2)
          {
            if (a3)
              IOABPControlClass::open_nl();
            *((_QWORD *)this + 10) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *((_QWORD *)this + 11) = a3;
            dispatch_retain(a3);
          }
          IOABPControlClass::setNotificationPort(this);
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

uint64_t IOABPControlClass::open(IOABPControlClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: \n", "open");
  v5 = IOABPControlClass::open_nl(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPControlClass::close(IOABPControlClass *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPControlClass::%s: \n", "close");
  v3 = IOABPControlClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOABPControlClass::readLogsAsync(IOABPControlClass *this, void *a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  __int128 v12;
  pthread_mutex_t *v13;
  IONotificationPort *v14;
  mach_port_t v15;
  mach_port_t MachPort;
  uint64_t v17;
  uint64_t input[3];
  uint64_t reference[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v12;
  v23 = v12;
  *(_OWORD *)reference = v12;
  v21 = v12;
  v13 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 4) != 0)
    syslog(5, "IOABPControlClass::%s: buff %p, size %u\n", "readLogsAsync", a2, a3);
  v14 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v14)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    input[2] = a4;
    reference[1] = (uint64_t)a5;
    *(_QWORD *)&v21 = a6;
    v15 = *((_DWORD *)this + 40);
    MachPort = IONotificationPortGetMachPort(v14);
    v17 = IOConnectCallAsyncScalarMethod(v15, 2u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v13);
  }
  else
  {
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPControlClass::%s: no async port\n", "readLogsAsync");
    pthread_mutex_unlock(v13);
    return 3758097112;
  }
  return v17;
}

uint64_t IOABPControlClass::registerEventNotification(uint64_t a1, const void *a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v7 = IOABPControlClass::registerEventNotification_nl(a1, a2, 0, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPControlClass::registerEventNotification_nl(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v5;
  kern_return_t v9;
  _QWORD aBlock[5];

  if (*(_DWORD *)(a1 + 72))
  {
    if (*(_QWORD *)(a1 + 152))
    {
      v5 = 3758097093;
      if ((*(_BYTE *)a1 & 2) != 0)
        syslog(5, "IOABPControlClass::%s: a notification block is already registered. deregister it before registering a new block");
    }
    else if (a4)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___ZN17IOABPControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFv12abpErrorTypePvS5_E_block_invoke;
      aBlock[3] = &unk_24C805EE8;
      aBlock[4] = a4;
      *(_QWORD *)(a1 + 152) = _Block_copy(aBlock);
      if (a2)
      {
        if (a3)
          IOABPControlClass::registerEventNotification_nl();
        *(_QWORD *)(a1 + 112) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *(_QWORD *)(a1 + 120) = a3;
        dispatch_retain(a3);
      }
      IOABPControlClass::setEventNotificationPort((IOABPControlClass *)a1);
      v9 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 128), *(_DWORD *)(a1 + 72), "IOGeneralInterest", (IOServiceInterestCallback)IOABPControlClass::generalInterestCallback, *(void **)(a1 + 152), (io_object_t *)(a1 + 144));
      if (v9)
      {
        if ((*(_BYTE *)a1 & 2) != 0)
          syslog(5, "IOABPControlClass::%s: could not add interest notification on service: %#x\n", "registerEventNotification_nl", v9);
        _Block_release(*(const void **)(a1 + 152));
        *(_QWORD *)(a1 + 152) = 0;
        return 3758097084;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      v5 = 3758097090;
      if ((*(_BYTE *)a1 & 2) != 0)
        syslog(5, "IOABPControlClass::%s: block must be provided\n");
    }
  }
  else
  {
    v5 = 3758097136;
    if ((*(_BYTE *)a1 & 2) != 0)
      syslog(5, "IOABPControlClass::%s: service is NULL - must successfully start() first\n");
  }
  return v5;
}

uint64_t IOABPControlClass::registerEventNotification(uint64_t a1, NSObject *a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v7 = IOABPControlClass::registerEventNotification_nl(a1, 0, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ___ZN17IOABPControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFv12abpErrorTypePvS5_E_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794560 && a4 != 0)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *a4, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
  }
  return result;
}

void IOABPControlClass::generalInterestCallback(IOABPControlClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOABPControlClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);
  _Block_release(this);
}

uint64_t IOABPControlClass::deregisterEventNotification(IOABPControlClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  IOABPControlClass::deregisterEventNotification_nl(this, a2);
  return pthread_mutex_unlock(v4);
}

void ___ZN17IOABPControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke(uint64_t a1)
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

BOOL IOABPControlClass::getLogInternalBufferSize(IOABPControlClass *this, unsigned int *a2)
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
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("logSnapshotBufferSize"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
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

uint64_t IOABPControlClass::loggerTune(IOABPControlClass *this, unsigned int a2, unsigned int a3, void *a4, void *a5)
{
  pthread_mutex_t *v10;
  uint64_t v11;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v10 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 4) != 0)
    syslog(5, "IOABPControlClass::%s: subsystem %u, index %u, arg1 %p, arg2 %p\n", "loggerTune", a2, a3, a4, a5);
  input[0] = a2;
  input[1] = a3;
  input[2] = (uint64_t)a4;
  input[3] = (uint64_t)a5;
  v11 = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 3u, input, 4u, 0, 0);
  pthread_mutex_unlock(v10);
  return v11;
}

BOOL IOABPControlClass::getLastKnownBootStage(IOABPControlClass *this, unsigned int *a2)
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

const char *getABPErrorTypeString(unsigned int a1)
{
  if (a1 > 0x31)
    return "invalid";
  else
    return abpErrorTypeStrings[a1];
}

const char *getABPBHIRegistersString(unsigned int a1)
{
  if (a1 > 5)
    return "invalid";
  else
    return abpBHIRegistersStrings[a1];
}

const char *getABPBTIRegistersString(unsigned int a1)
{
  if (a1 > 1)
    return "invalid";
  else
    return abpBTIRegistersStrings[a1];
}

const char *getABPDirectionString(unsigned int a1)
{
  if (a1 > 1)
    return "invalid";
  else
    return abpDirectionStrings[a1];
}

const char *getABPLinkStateString(unsigned int a1)
{
  if (a1 > 4)
    return "invalid";
  else
    return abpLinkStateStrings[a1];
}

const char *getABPAERErrorTypeString(unsigned int a1)
{
  if (a1 > 2)
    return "invalid";
  else
    return abpAERErrorTypeStrings[a1];
}

void IOABPClass::IOABPClass(IOABPClass *this)
{
  *(_QWORD *)this = &off_24C806160;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = &unk_20DA790C5;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_BYTE *)this + 160) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(_QWORD *)this = &off_24C806160;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = &unk_20DA790C5;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_BYTE *)this + 160) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOABPClass::~IOABPClass(IOABPClass *this)
{
  *(_QWORD *)this = &off_24C806160;
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: \n", "~IOABPClass");
  IOABPClass::stop(this, 0);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOABPClass::stop(IOABPClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  NSObject *v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  __CFRunLoop *v9;
  NSObject *v10;
  char v11;
  _QWORD block[4];
  __int128 v14;
  uint64_t v15;
  NSObject *v16;

  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: \n", "stop");
  if (*((_QWORD *)this + 10) || *((_QWORD *)this + 11))
  {
    IOABPClass::close_nl(this);
    IOABPClass::clearIterators(this);
    IOABPClass::clearNotificationPort(this);
    v5 = a2;
    if (!a2)
    {
      if (*((_QWORD *)this + 11))
      {
        v6 = 0;
        v5 = 0;
        goto LABEL_9;
      }
      v5 = dispatch_group_create();
      if (!v5)
      {
        v6 = 0;
        goto LABEL_9;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    v6 = 1;
LABEL_9:
    v7 = *((_QWORD *)this + 18);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN10IOABPClass4stopEP16dispatch_group_s_block_invoke;
    block[3] = &unk_24C806240;
    v8 = *((_OWORD *)this + 8);
    *((_QWORD *)this + 16) = 0;
    *((_QWORD *)this + 17) = 0;
    *((_QWORD *)this + 18) = 0;
    v14 = v8;
    v15 = v7;
    v16 = v5;
    v9 = (__CFRunLoop *)*((_QWORD *)this + 10);
    if (v9)
    {
      if (*((_QWORD *)this + 11))
        IOABPClass::stop();
      CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
      CFRelease(*((CFTypeRef *)this + 10));
      *((_QWORD *)this + 10) = 0;
    }
    v10 = *((_QWORD *)this + 11);
    if (v10)
    {
      dispatch_async(v10, block);
      dispatch_release(*((dispatch_object_t *)this + 11));
      *((_QWORD *)this + 11) = 0;
    }
    pthread_mutex_unlock(v4);
    v11 = v6 ^ 1;
    if (a2)
      v11 = 1;
    if ((v11 & 1) == 0)
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
    }
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: --done\n", "stop");
    return 1;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: already stopped, returning true\n", "stop");
  pthread_mutex_unlock(v4);
  return 1;
}

uint64_t IOABPClass::start(uint64_t a1, const char *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  pthread_mutex_t *v12;
  uint64_t started;

  v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  started = IOABPClass::start_nl(a1, a2, a3, 0, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t IOABPClass::start_nl(uint64_t a1, const char *a2, CFTypeRef cf, dispatch_object_t object, uint64_t a5, uint64_t a6, uint64_t a7)
{
  const void *v13;
  NSObject *v14;
  __CFDictionary *v15;
  CFStringRef v16;
  uint64_t v17;
  uint64_t v18;
  io_object_t v19;
  __CFRunLoop *v20;
  NSObject *v21;
  io_object_t v23;
  __CFRunLoop *v24;
  NSObject *v25;
  _QWORD v26[5];
  io_object_t v27;
  _QWORD v28[5];
  _QWORD block[5];
  io_object_t v30;
  _QWORD v31[5];
  _QWORD aBlock[5];

  *(_QWORD *)(a1 + 120) = a2;
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: for %s\n", "start_nl", a2);
  v13 = *(const void **)(a1 + 80);
  if (v13)
    CFRelease(v13);
  v14 = *(NSObject **)(a1 + 88);
  if (v14)
    dispatch_release(v14);
  if (cf)
  {
    if (object)
      IOABPClass::start_nl();
    *(_QWORD *)(a1 + 80) = cf;
    CFRetain(cf);
  }
  else if (object)
  {
    *(_QWORD *)(a1 + 88) = object;
    dispatch_retain(object);
  }
  v15 = IOServiceMatching("AppleBasebandPCIInterface");
  if (!v15 && (*(_BYTE *)(a1 + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: could not create matching dictionary\n", "start_nl");
  v16 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], *(const char **)(a1 + 120), 0x600u);
  CFDictionarySetValue(v15, CFSTR("ABPInterfaceProtocol"), v16);
  CFRelease(v16);
  v17 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke;
  aBlock[3] = &unk_24C806178;
  aBlock[4] = a7;
  *(_QWORD *)(a1 + 144) = _Block_copy(aBlock);
  IOABPClass::setNotificationPort((IOABPClass *)a1);
  if (!v15)
  {
    v18 = 0;
    goto LABEL_31;
  }
  v31[0] = v17;
  v31[1] = 0x40000000;
  v31[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_2;
  v31[3] = &unk_24C8061A0;
  v31[4] = a5;
  *(_QWORD *)(a1 + 128) = _Block_copy(v31);
  CFRetain(v15);
  if (IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)IOABPClass::interfaceMatched, *(void **)(a1 + 128), (io_iterator_t *)(a1 + 112)))
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: IOServiceAddMatchingNotification (kIOFirstMatchNotification) failed, ret = 0x%08x");
  }
  else
  {
    v19 = *(_DWORD *)(a1 + 112);
    IOObjectRetain(v19);
    block[0] = v17;
    block[1] = 0x40000000;
    block[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_3;
    block[3] = &unk_24C8061C8;
    block[4] = v31;
    v30 = v19;
    v20 = *(__CFRunLoop **)(a1 + 80);
    if (v20)
    {
      if (*(_QWORD *)(a1 + 88))
        IOABPClass::start_nl();
      CFRunLoopPerformBlock(v20, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
    }
    v21 = *(NSObject **)(a1 + 88);
    if (v21)
    {
      if (*(_QWORD *)(a1 + 80))
        IOABPClass::start_nl();
      dispatch_async(v21, block);
    }
    v28[0] = v17;
    v28[1] = 0x40000000;
    v28[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_4;
    v28[3] = &unk_24C8061F0;
    v28[4] = a6;
    *(_QWORD *)(a1 + 136) = _Block_copy(v28);
    CFRetain(v15);
    if (!IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceTerminate", v15, (IOServiceMatchingCallback)IOABPClass::interfaceMatched, *(void **)(a1 + 136), (io_iterator_t *)(a1 + 116)))
    {
      v23 = *(_DWORD *)(a1 + 116);
      IOObjectRetain(v23);
      v26[0] = v17;
      v26[1] = 0x40000000;
      v26[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_5;
      v26[3] = &unk_24C806218;
      v26[4] = v28;
      v27 = v23;
      v24 = *(__CFRunLoop **)(a1 + 80);
      if (v24)
      {
        if (*(_QWORD *)(a1 + 88))
          IOABPClass::start_nl();
        CFRunLoopPerformBlock(v24, (CFTypeRef)*MEMORY[0x24BDBD5A0], v26);
        CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
      }
      v25 = *(NSObject **)(a1 + 88);
      if (v25)
      {
        if (*(_QWORD *)(a1 + 80))
          IOABPClass::start_nl();
        dispatch_async(v25, v26);
      }
      v18 = 1;
      goto LABEL_30;
    }
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: IOServiceAddMatchingNotification (kIOTerminatedNotification) failed, ret = 0x%08x");
  }
  v18 = 0;
LABEL_30:
  CFRelease(v15);
LABEL_31:
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: --done\n", "start_nl");
  return v18;
}

uint64_t IOABPClass::start(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  pthread_mutex_t *v12;
  uint64_t started;

  v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  started = IOABPClass::start_nl(a1, a2, 0, a3, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794559)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *a4, a4[2], a4[4]);
  }
  return result;
}

void IOABPClass::setNotificationPort(IOABPClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 12))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 12) = v2;
    if (!v2)
      IOABPClass::setNotificationPort();
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

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_2(uint64_t a1, io_iterator_t iterator)
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

void IOABPClass::interfaceMatched(IOABPClass *this, void *a2)
{
  _Block_copy(this);
  (*((void (**)(IOABPClass *, void *))this + 2))(this, a2);
  _Block_release(this);
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_4(uint64_t a1, io_iterator_t iterator)
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

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

uint64_t IOABPClass::close_nl(IOABPClass *this)
{
  uint64_t v2;
  io_connect_t v3;
  io_object_t v4;

  if (*((_BYTE *)this + 160))
  {
    *((_BYTE *)this + 160) = 0;
    v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 39), 1u, 0, 0, 0, 0);
    v3 = *((_DWORD *)this + 39);
    if (v3)
    {
      IOServiceClose(v3);
      *((_DWORD *)this + 39) = 0;
    }
    v4 = *((_DWORD *)this + 38);
    if (v4)
    {
      IOObjectRelease(v4);
      *((_DWORD *)this + 38) = 0;
    }
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: not open, return success\n", "close_nl");
    return 0;
  }
  return v2;
}

uint64_t IOABPClass::clearIterators(IOABPClass *this)
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

void IOABPClass::clearNotificationPort(IOABPClass *this)
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
    block[2] = ___ZN10IOABPClass21clearNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_28;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((_QWORD *)this + 11))
        IOABPClass::clearNotificationPort();
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x24BDBD5A0], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
    }
    v6 = *((_QWORD *)this + 11);
    if (v6)
    {
      if (*((_QWORD *)this + 10))
        IOABPClass::clearNotificationPort();
      dispatch_async(v6, block);
    }
  }
}

void ___ZN10IOABPClass4stopEP16dispatch_group_s_block_invoke(uint64_t a1)
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

void ___ZN10IOABPClass21clearNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  __CFRunLoop *v2;

  v2 = a1[4];
  if (v2)
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  IONotificationPortDestroy(a1[6]);
}

uint64_t IOABPClass::open(IOABPClass *this, io_service_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: \n", "open");
  v5 = IOABPClass::open_nl((io_connect_t *)this, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPClass::open_nl(io_connect_t *this, io_service_t a2)
{
  uint64_t v2;
  io_connect_t v5;
  io_object_t v6;
  uint64_t v8;
  uint32_t outputCnt;

  v2 = 0;
  outputCnt = 0;
  v8 = 0;
  if (!*((_BYTE *)this + 160))
  {
    if (IOABPClass::setUpNotificationCallback((IOABPClass *)this, a2))
    {
      v2 = IOServiceOpen(a2, *MEMORY[0x24BDAEC58], 0, this + 39);
      if (!(_DWORD)v2)
      {
        v2 = IOConnectCallScalarMethod(this[39], 0, &v8, 1u, 0, &outputCnt);
        if (!(_DWORD)v2)
        {
          *((_BYTE *)this + 160) = 1;
          return v2;
        }
      }
    }
    else
    {
      v2 = 3758097112;
    }
    v5 = this[39];
    if (v5)
    {
      IOServiceClose(v5);
      this[39] = 0;
    }
    v6 = this[38];
    if (v6)
    {
      IOObjectRelease(v6);
      this[38] = 0;
    }
  }
  return v2;
}

BOOL IOABPClass::setUpNotificationCallback(IOABPClass *this, io_service_t a2)
{
  kern_return_t v3;
  kern_return_t v4;

  v3 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 12), a2, "IOGeneralInterest", (IOServiceInterestCallback)IOABPClass::notificationCallback, *((void **)this + 18), (io_object_t *)this + 38);
  v4 = v3;
  if (v3 && (*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: Could not add interest notification on service: %#x\n", "setUpNotificationCallback", v3);
  return v4 == 0;
}

uint64_t IOABPClass::cleanUpNotificationCallback(IOABPClass *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 38);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 38) = 0;
  }
  return result;
}

uint64_t IOABPClass::close(IOABPClass *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: \n", "close");
  v3 = IOABPClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

void IOABPClass::notificationCallback(IOABPClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOABPClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);
  _Block_release(this);
}

uint64_t IOABPClass::write(IOABPClass *this, const void *a2, unsigned int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "write", a2, a3);
  input[0] = 0;
  input[1] = 0;
  v7 = IOConnectCallMethod(*((_DWORD *)this + 39), 2u, input, 2u, a2, a3, 0, 0, 0, 0);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPClass::read(IOABPClass *this, void *a2, unsigned int *a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  size_t outputStructCnt;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "read", a2, *a3);
  input[0] = 0;
  input[1] = 0;
  outputStructCnt = *a3;
  v7 = IOConnectCallMethod(*((_DWORD *)this + 39), 3u, input, 2u, 0, 0, 0, 0, a2, &outputStructCnt);
  if (!(_DWORD)v7)
    *a3 = outputStructCnt;
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPClass::sendImage(IOABPClass *this, const void *a2, unsigned int a3, unsigned int *a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v13;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  outputCnt = 2;
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "sendImage", a2, a3);
  input[0] = 0;
  input[1] = 0;
  output = 0;
  v13 = 0;
  v9 = IOConnectCallMethod(*((_DWORD *)this + 39), 4u, input, 2u, a2, a3, &output, &outputCnt, 0, 0);
  if (!(_DWORD)v9)
  {
    *a4 = output;
    v9 = v13;
  }
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: ret 0x%x, buff %p, size %u, cookie %u\n", "sendImage", v9, a2, a3, *a4);
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t IOABPClass::sendImageAsync(IOABPClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  __int128 v10;
  pthread_mutex_t *v11;
  IONotificationPort *v12;
  mach_port_t v13;
  mach_port_t MachPort;
  uint64_t v15;
  uint32_t outputCnt;
  uint64_t output[2];
  uint64_t input[2];
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
  outputCnt = 2;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "sendImageAsync", a2, a3);
  v12 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v12)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    output[0] = 0;
    output[1] = 0;
    reference[1] = (uint64_t)a4;
    *(_QWORD *)&v21 = a5;
    v13 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v12);
    v15 = IOConnectCallAsyncScalarMethod(v13, 4u, MachPort, reference, 3u, input, 2u, output, &outputCnt);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "sendImageAsync");
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

uint64_t IOABPClass::readRegister(IOABPClass *this, unsigned int a2, void *a3, unsigned int *a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  size_t v11;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: reg %u, buff %p, size %u\n", "readRegister", a2, a3, *a4);
  v11 = *a4;
  input[0] = a2;
  v9 = IOConnectCallMethod(*((_DWORD *)this + 39), 5u, input, 1u, 0, 0, 0, 0, a3, &v11);
  if (!(_DWORD)v9)
    *a4 = v11;
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t IOABPClass::abortChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  __int128 v8;
  pthread_mutex_t *v9;
  const char *v10;
  IONotificationPort *v11;
  mach_port_t v12;
  mach_port_t MachPort;
  uint64_t v14;
  uint64_t input[2];
  uint64_t reference[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v8;
  v20 = v8;
  *(_OWORD *)reference = v8;
  v18 = v8;
  v9 = (pthread_mutex_t *)(a1 + 16);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    if (a2 > 1)
      v10 = "invalid";
    else
      v10 = abpDirectionStrings[a2];
    syslog(5, "IOABPClass::%s: direction %s\n", "abortChannelAsync", v10);
  }
  v11 = *(IONotificationPort **)(a1 + 96);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(_QWORD *)&v18 = a4;
    v12 = *(_DWORD *)(a1 + 156);
    MachPort = IONotificationPortGetMachPort(v11);
    v14 = IOConnectCallAsyncScalarMethod(v12, 6u, MachPort, reference, 3u, input, 1u, 0, 0);
    pthread_mutex_unlock(v9);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "abortChannelAsync");
    pthread_mutex_unlock(v9);
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPClass::startChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  __int128 v8;
  pthread_mutex_t *v9;
  const char *v10;
  IONotificationPort *v11;
  mach_port_t v12;
  mach_port_t MachPort;
  uint64_t v14;
  uint64_t input[2];
  uint64_t reference[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v8;
  v20 = v8;
  *(_OWORD *)reference = v8;
  v18 = v8;
  v9 = (pthread_mutex_t *)(a1 + 16);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    if (a2 > 1)
      v10 = "invalid";
    else
      v10 = abpDirectionStrings[a2];
    syslog(5, "IOABPClass::%s: direction %s\n", "startChannelAsync", v10);
  }
  v11 = *(IONotificationPort **)(a1 + 96);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(_QWORD *)&v18 = a4;
    v12 = *(_DWORD *)(a1 + 156);
    MachPort = IONotificationPortGetMachPort(v11);
    v14 = IOConnectCallAsyncScalarMethod(v12, 7u, MachPort, reference, 3u, input, 1u, 0, 0);
    pthread_mutex_unlock(v9);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "startChannelAsync");
    pthread_mutex_unlock(v9);
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPClass::timeSyncAsync(IOABPClass *this, unsigned int a2, void *a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  __int128 v12;
  pthread_mutex_t *v13;
  IONotificationPort *v14;
  mach_port_t v15;
  mach_port_t MachPort;
  uint64_t v17;
  uint64_t input[3];
  uint64_t reference[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v12;
  v23 = v12;
  *(_OWORD *)reference = v12;
  v21 = v12;
  v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "timeSyncAsync", a3, a4);
  v14 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v14)
  {
    input[0] = a2;
    input[1] = (uint64_t)a3;
    input[2] = a4;
    reference[1] = (uint64_t)a5;
    *(_QWORD *)&v21 = a6;
    v15 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v14);
    v17 = IOConnectCallAsyncScalarMethod(v15, 8u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v13);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "timeSyncAsync");
    pthread_mutex_unlock(v13);
    return 3758097112;
  }
  return v17;
}

uint64_t IOABPClass::mapMemoryAsync(IOABPClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  __int128 v7;
  pthread_mutex_t *v8;
  IONotificationPort *v9;
  mach_port_t v10;
  mach_port_t MachPort;
  uint64_t v12;
  uint64_t input[3];
  uint64_t reference[2];
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = v7;
  v19 = v7;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  reference[1] = (uint64_t)a5;
  v16 = a6;
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: region %u, size %u\n", "mapMemoryAsync", a2, a4);
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v9 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v9)
  {
    v10 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v9);
    v12 = IOConnectCallAsyncScalarMethod(v10, 9u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "mapMemoryAsync");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097112;
  }
  return v12;
}

uint64_t IOABPClass::unmapMemoryAsync(IOABPClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  __int128 v5;
  pthread_mutex_t *v6;
  IONotificationPort *v7;
  mach_port_t v8;
  mach_port_t MachPort;
  uint64_t v10;
  uint64_t input;
  uint64_t reference[2];
  void *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16 = v5;
  v17 = v5;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input = a2;
  reference[1] = (uint64_t)a3;
  v14 = a4;
  if ((*((_BYTE *)this + 8) & 2) != 0)
    syslog(5, "IOABPClass::%s: region %u\n", "unmapMemoryAsync", a2);
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v7 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v7)
  {
    v8 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v7);
    v10 = IOConnectCallAsyncScalarMethod(v8, 0xAu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v6);
  }
  else
  {
    if ((*((_BYTE *)this + 8) & 2) != 0)
      syslog(5, "IOABPClass::%s: no async port\n", "unmapMemoryAsync");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097112;
  }
  return v10;
}

uint64_t IOABPClass::registerTimeEvent(IOABPClass *this, unsigned int a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  pthread_mutex_t *v8;
  IONotificationPort *v9;
  __int128 v10;
  mach_port_t v11;
  mach_port_t MachPort;
  uint64_t v13;
  uint64_t input;
  uint64_t reference[2];
  void *v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v9 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v9)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v18 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v19 = v10;
    v20 = v10;
    input = a2;
    reference[1] = (uint64_t)a3;
    v17 = a4;
    v11 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v9);
    v13 = IOConnectCallAsyncScalarMethod(v11, 0xBu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    pthread_mutex_unlock(v8);
    return 3758097112;
  }
  return v13;
}

uint64_t IOABPClass::deregisterTimeEvent(IOABPClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  pthread_mutex_t *v8;
  IONotificationPort *v9;
  __int128 v10;
  mach_port_t v11;
  mach_port_t MachPort;
  uint64_t v13;
  uint64_t input;
  uint64_t reference[2];
  void *v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v9 = (IONotificationPort *)*((_QWORD *)this + 12);
  if (v9)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v18 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v19 = v10;
    v20 = v10;
    input = a2;
    reference[1] = (uint64_t)a3;
    v17 = a4;
    v11 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v9);
    v13 = IOConnectCallAsyncScalarMethod(v11, 0xCu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    pthread_mutex_unlock(v8);
    return 3758097112;
  }
  return v13;
}

void IOABPTraceClass::IOABPTraceClass(IOABPTraceClass *this)
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

void IOABPTraceClass::~IOABPTraceClass(IOABPTraceClass *this)
{
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "~IOABPTraceClass");
  IOABPTraceClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

uint64_t IOABPTraceClass::stop(io_object_t *this)
{
  pthread_mutex_t *v2;
  io_object_t v3;

  v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "stop");
  IOABPTraceClass::closeService((IOABPTraceClass *)this);
  v3 = this[18];
  if (v3)
  {
    IOObjectRelease(v3);
    this[18] = 0;
  }
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: --done\n", "stop");
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, __CFRunLoop *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = IOABPTraceClass::connect(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPTraceClass::connect(IOABPTraceClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t v4;
  const __CFDictionary *v7;
  io_service_t MatchingService;

  if (*((_DWORD *)this + 18))
  {
LABEL_2:
    v4 = 1;
    goto LABEL_14;
  }
  v7 = IOServiceMatching("AppleBasebandPCITraceBackendRaw");
  if (!v7)
  {
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: could not create matching dictionary\n");
    goto LABEL_13;
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v7);
  *((_DWORD *)this + 18) = MatchingService;
  if (!MatchingService)
  {
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: could not get matching service\n");
LABEL_13:
    v4 = 0;
    goto LABEL_14;
  }
  if (!IOABPTraceClass::openService(this))
  {
    if (a2)
    {
      if (a3)
        IOABPTraceClass::connect();
      *((_QWORD *)this + 11) = a2;
      CFRetain(a2);
    }
    else if (a3)
    {
      *((_QWORD *)this + 12) = a3;
      dispatch_retain(a3);
    }
    IOABPTraceClass::setNotificationPort(this);
    goto LABEL_2;
  }
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: could not open service\n", "connect");
  IOObjectRelease(*((_DWORD *)this + 18));
  v4 = 0;
  *((_DWORD *)this + 18) = 0;
LABEL_14:
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: --done\n", "connect");
  return v4;
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, NSObject *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = IOABPTraceClass::connect(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPTraceClass::openService(IOABPTraceClass *this)
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
  return v3;
}

void IOABPTraceClass::setNotificationPort(IOABPTraceClass *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v4;

  if (!*((_QWORD *)this + 13))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 13) = v2;
    if (!v2)
      IOABPTraceClass::setNotificationPort();
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

uint64_t IOABPTraceClass::closeService(IOABPTraceClass *this)
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
  IOABPTraceClass::clearNotificationPort(this);
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

void IOABPTraceClass::clearNotificationPort(IOABPTraceClass *this)
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

const __CFArray *IOABPTraceClass::getPipeCount(IOABPTraceClass *this)
{
  const __CFArray *result;

  result = (const __CFArray *)*((_QWORD *)this + 10);
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

uint64_t IOABPTraceClass::getPipeCodeAndName(IOABPTraceClass *this, unsigned int a2, unsigned int *a3, char *a4, unsigned int a5)
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

uint64_t IOABPTraceClass::openPipe(IOABPTraceClass *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "openPipe");
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t IOABPTraceClass::closePipe(IOABPTraceClass *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "closePipe");
  pthread_mutex_unlock(v2);
  return 0;
}

BOOL IOABPTraceClass::getSnapshotBufferSize(IOABPTraceClass *this, unsigned int *a2)
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

uint64_t IOABPTraceClass::readLogsAsync(IOABPTraceClass *this, unsigned int a2, void *a3, unsigned int a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
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
  if ((*(_BYTE *)this & 4) != 0)
    syslog(5, "IOABPTraceClass::%s: buff %p, size %u\n", "readLogsAsync", a3, a4);
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
    pthread_mutex_unlock(v14);
  }
  else
  {
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no async port\n", "readLogsAsync");
    pthread_mutex_unlock(v14);
    return 3758097112;
  }
  return v19;
}

uint64_t IOABPTraceClass::dumpRegistry(IOABPTraceClass *this)
{
  mach_port_t v2;
  uint64_t v3;

  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "dumpRegistry");
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    v3 = IOConnectCallScalarMethod(v2, 2u, 0, 0, 0, 0);
  }
  else
  {
    v3 = 3758097112;
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no connection\n", "dumpRegistry");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOABPTraceClass::flushTraceBuffers(IOABPTraceClass *this, unsigned int a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
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
  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "flushTraceBuffers");
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
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no connection\n", "flushTraceBuffers");
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPTraceClass::demo(IOABPTraceClass *this)
{
  mach_port_t v2;
  uint64_t v3;

  if ((*(_BYTE *)this & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "demo");
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    v3 = IOConnectCallScalarMethod(v2, 6u, 0, 0, 0, 0);
  }
  else
  {
    v3 = 3758097112;
    if ((*(_BYTE *)this & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no connection\n", "demo");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

BOOL IOABPTraceClass::getRegistryInfo(uint64_t a1, void *a2)
{
  mach_port_t v4;
  kern_return_t v5;
  size_t outputStructCnt;

  if ((*(_BYTE *)a1 & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "getRegistryInfo");
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
    if ((*(_BYTE *)a1 & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no connection\n", "getRegistryInfo");
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
}

BOOL IOABPTraceClass::getTraceCode(uint64_t a1, unsigned int a2, uint64_t a3)
{
  mach_port_t v6;
  unint64_t *v7;
  std::string::size_type v8;
  kern_return_t v9;
  BOOL v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  std::string::size_type size;
  std::string *v15;
  std::string::size_type v16;
  char v17;
  uint64_t v18;
  std::string::size_type v19;
  char *v20;
  std::string::size_type v21;
  char *outputStruct;
  unint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::string v31;
  int v32;
  std::string v33;
  size_t v34[2];
  unint64_t *v35;
  std::string v36;
  _QWORD v37[2];
  uint64_t input[3];

  input[1] = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)a1 & 2) != 0)
    syslog(5, "IOABPTraceClass::%s: \n", "getTraceCode");
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v6 = *(_DWORD *)(a1 + 76);
  if (v6)
  {
    v7 = (unint64_t *)operator new(0x808uLL);
    v7[2] = 0;
    *v7 = (unint64_t)&unk_24C8062A0;
    v7[1] = 0;
    bzero(v7 + 3, 0x7ECuLL);
    v34[1] = (size_t)(v7 + 3);
    v35 = v7;
    v34[0] = 2028;
    v8 = a2;
    input[0] = a2;
    v9 = IOConnectCallMethod(v6, 4u, input, 1u, 0, 0, 0, 0, v7 + 3, v34);
    v10 = v9 == 0;
    if (v9)
    {
      if ((*(_BYTE *)a1 & 2) != 0)
        syslog(5, "IOABPTraceClass::%s: TraceCode invalid\n", "getTraceCode");
LABEL_35:
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
LABEL_36:
      v25 = v7 + 1;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        (*(void (**)(unint64_t *))(*v7 + 16))(v7);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
      }
      return v10;
    }
    *(_DWORD *)(a3 + 48) = *((_DWORD *)v7 + 7);
    MEMORY[0x212BADAE0](a3, (char *)v7 + 44);
    if (*((_BYTE *)v7 + 1044))
    {
      std::string::basic_string[abi:ne180100]<0>(&v33, ":");
      v11 = std::string::insert(&v33, 0, (const std::string::value_type *)v7 + 1044);
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v31.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v36, *((_DWORD *)v7 + 511));
      if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v36;
      else
        v13 = (std::string *)v36.__r_.__value_.__r.__words[0];
      if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v36.__r_.__value_.__r.__words[2]);
      else
        size = v36.__r_.__value_.__l.__size_;
      v15 = std::string::append(&v31, (const std::string::value_type *)v13, size);
      v16 = v15->__r_.__value_.__r.__words[0];
      v37[0] = v15->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v37 + 7) = *(std::string::size_type *)((char *)&v15->__r_.__value_.__r.__words[1] + 7);
      v17 = HIBYTE(v15->__r_.__value_.__r.__words[2]);
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a3 + 47) < 0)
        operator delete(*(void **)(a3 + 24));
      v18 = v37[0];
      *(_QWORD *)(a3 + 24) = v16;
      *(_QWORD *)(a3 + 32) = v18;
      *(_QWORD *)(a3 + 39) = *(_QWORD *)((char *)v37 + 7);
      *(_BYTE *)(a3 + 47) = v17;
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
    }
    std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100]((uint64_t *)(a3 + 56));
    v19 = *((unsigned int *)v7 + 8);
    if (!(_DWORD)v19)
      goto LABEL_35;
    v20 = (char *)operator new(0x118uLL);
    v21 = 0;
    v10 = 0;
    *((_QWORD *)v20 + 2) = 0;
    *(_QWORD *)v20 = &unk_24C8062F0;
    *((_QWORD *)v20 + 1) = 0;
    *(_OWORD *)(v20 + 24) = 0u;
    outputStruct = v20 + 24;
    *(_OWORD *)(v20 + 40) = 0u;
    *(_OWORD *)(v20 + 56) = 0u;
    *(_OWORD *)(v20 + 72) = 0u;
    *(_OWORD *)(v20 + 88) = 0u;
    *(_OWORD *)(v20 + 104) = 0u;
    *(_OWORD *)(v20 + 120) = 0u;
    *(_OWORD *)(v20 + 136) = 0u;
    *(_OWORD *)(v20 + 152) = 0u;
    *(_OWORD *)(v20 + 168) = 0u;
    *(_OWORD *)(v20 + 184) = 0u;
    *(_OWORD *)(v20 + 200) = 0u;
    *(_OWORD *)(v20 + 216) = 0u;
    *(_OWORD *)(v20 + 232) = 0u;
    *(_OWORD *)(v20 + 248) = 0u;
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)(v20 + 24);
    v33.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
    v34[0] = 256;
    *(_OWORD *)(v20 + 264) = 0u;
    while (1)
    {
      v36.__r_.__value_.__r.__words[0] = v8;
      v36.__r_.__value_.__l.__size_ = v21;
      if (IOConnectCallMethod(*(_DWORD *)(a1 + 76), 5u, (const uint64_t *)&v36, 2u, 0, 0, 0, 0, outputStruct, v34))
      {
        break;
      }
      std::string::basic_string[abi:ne180100]<0>(&v31, outputStruct + 4);
      outputStruct = (char *)v33.__r_.__value_.__r.__words[0];
      v32 = *(_DWORD *)(v33.__r_.__value_.__r.__words[0] + 244);
      v23 = *(_QWORD *)(a3 + 64);
      if (v23 >= *(_QWORD *)(a3 + 72))
      {
        v24 = std::vector<IOABPTraceCodeAttachment const>::__push_back_slow_path<IOABPTraceCodeAttachment const>((uint64_t *)(a3 + 56), (__int128 *)&v31);
      }
      else
      {
        std::vector<IOABPTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOABPTraceCodeAttachment const>(a3 + 56, (__int128 *)&v31);
        v24 = v23 + 32;
      }
      *(_QWORD *)(a3 + 64) = v24;
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      v10 = ++v21 >= v19;
      if (v19 == v21)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
        v10 = 1;
        goto LABEL_41;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
LABEL_41:
    v27 = (std::__shared_weak_count *)v33.__r_.__value_.__l.__size_;
    if (v33.__r_.__value_.__l.__size_)
    {
      v28 = (unint64_t *)(v33.__r_.__value_.__l.__size_ + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v7 = v35;
    if (v35)
      goto LABEL_36;
  }
  else
  {
    if ((*(_BYTE *)a1 & 2) != 0)
      syslog(5, "IOABPTraceClass::%s: no connection\n", "getTraceCode");
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
  return v10;
}

void sub_20DA77CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  std::shared_ptr<ABPTraceRegistryTracePoint>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  std::shared_ptr<ABPTraceRegistryTracePoint>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__shared_ptr_emplace<ABPTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8062A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABPTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8062A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BADB34);
}

uint64_t std::shared_ptr<ABPTraceRegistryTracePoint>::~shared_ptr[abi:ne180100](uint64_t a1)
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
  __cxa_throw(exception, (struct type_info *)off_24C805DB0, MEMORY[0x24BEDAAF0]);
}

void sub_20DA77F34(_Unwind_Exception *a1)
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

void std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100](uint64_t *a1)
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

void std::__shared_ptr_emplace<ABPTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8062F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABPTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8062F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BADB34);
}

void std::vector<IOABPTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOABPTraceCodeAttachment const>(uint64_t a1, __int128 *a2)
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

void sub_20DA7806C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<IOABPTraceCodeAttachment const>::__push_back_slow_path<IOABPTraceCodeAttachment const>(uint64_t *a1, __int128 *a2)
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
    std::vector<IOABPTraceCodeAttachment const>::__throw_length_error[abi:ne180100]();
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
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>>(v7, v9);
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
  std::vector<IOABPTraceCodeAttachment const>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<IOABPTraceCodeAttachment const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_20DA78174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<IOABPTraceCodeAttachment const>::~__split_buffer((uint64_t)&a9);
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

uint64_t std::vector<IOABPTraceCodeAttachment const>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
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

void std::vector<IOABPTraceCodeAttachment const>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

void sub_20DA783A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>::operator()[abi:ne180100](uint64_t a1)
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

uint64_t std::__split_buffer<IOABPTraceCodeAttachment const>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<IOABPTraceCodeAttachment const>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<IOABPTraceCodeAttachment const>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
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

void IOABPControlClass::deregisterEventNotification_nl()
{
  __assert_rtn("deregisterEventNotification_nl", "IOABPControlClass.cpp", 547, "!fEventQueue");
}

void IOABPControlClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOABPControlClass.cpp", 135, "fNotificationPort");
}

void IOABPControlClass::setEventNotificationPort()
{
  __assert_rtn("setEventNotificationPort", "IOABPControlClass.cpp", 173, "fEventNotificationPort");
}

void IOABPControlClass::clearEventNotificationPort()
{
  __assert_rtn("clearEventNotificationPort", "IOABPControlClass.cpp", 219, "!fEventRunLoopRef");
}

{
  __assert_rtn("clearEventNotificationPort", "IOABPControlClass.cpp", 213, "!fEventQueue");
}

void IOABPControlClass::open_nl()
{
  __assert_rtn("open_nl", "IOABPControlClass.cpp", 278, "!queue");
}

void IOABPControlClass::registerEventNotification_nl()
{
  __assert_rtn("registerEventNotification_nl", "IOABPControlClass.cpp", 438, "!queue");
}

void IOABPClass::stop()
{
  __assert_rtn("stop", "IOABPClass.cpp", 441, "!fQueue");
}

void IOABPClass::start_nl()
{
  __assert_rtn("start_nl", "IOABPClass.cpp", 347, "!fRunLoopRef");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 341, "!fQueue");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 290, "!fRunLoopRef");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 284, "!fQueue");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 202, "!queue");
}

void IOABPClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOABPClass.cpp", 476, "fNotificationPort");
}

void IOABPClass::clearNotificationPort()
{
  __assert_rtn("clearNotificationPort", "IOABPClass.cpp", 522, "!fRunLoopRef");
}

{
  __assert_rtn("clearNotificationPort", "IOABPClass.cpp", 516, "!fQueue");
}

void IOABPTraceClass::connect()
{
  __assert_rtn("connect", "IOABPTraceClass.cpp", 119, "!queue");
}

void IOABPTraceClass::setNotificationPort()
{
  __assert_rtn("setNotificationPort", "IOABPTraceClass.cpp", 230, "fNotificationPort");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
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
  off_24C805DC8(__p);
}

uint64_t operator delete()
{
  return off_24C805DD0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C805DD8(__sz);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

