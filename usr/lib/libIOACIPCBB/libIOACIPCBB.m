void IOACIPCBBClass::~IOACIPCBBClass(IOACIPCBBClass *this)
{
  const void *v2;

  *(_QWORD *)this = &off_24E13AC88;
  IOACIPCClass::stop(this, 0);
  v2 = (const void *)*((_QWORD *)this + 23);
  if (v2)
  {
    _Block_release(v2);
    *((_QWORD *)this + 23) = 0;
  }
  IOACIPCClass::~IOACIPCClass(this);
}

{
  IOACIPCBBClass::~IOACIPCBBClass(this);
  JUMPOUT(0x220793EB0);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOACIPCBBClass::openRing(IOACIPCClass *a1, int a2, int a3, void *a4)
{
  mach_port_t v8;
  uint32_t v9;
  uint64_t v10;
  size_t v12;
  _DWORD inputStruct[2];
  uint64_t v14;
  uint64_t v15;

  if (!a4)
    return 3758097090;
  IOACIPCClass::lock(a1);
  inputStruct[0] = a3;
  inputStruct[1] = a2;
  v14 = 0;
  v15 = 0;
  v12 = 32;
  v8 = *((_DWORD *)a1 + 43);
  v9 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)a1 + 224))(a1, 17);
  v10 = IOConnectCallStructMethod(v8, v9, inputStruct, 0x18uLL, a4, &v12);
  IOACIPCClass::unlock(a1);
  return v10;
}

uint64_t IOACIPCBBClass::closeRing(IOACIPCClass *a1, int a2, int a3)
{
  mach_port_t v6;
  uint32_t v7;
  uint64_t v8;
  _DWORD inputStruct[2];
  uint64_t v11;
  uint64_t v12;

  IOACIPCClass::lock(a1);
  inputStruct[0] = a3;
  inputStruct[1] = a2;
  v11 = 0;
  v12 = 0;
  v6 = *((_DWORD *)a1 + 43);
  v7 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)a1 + 224))(a1, 18);
  v8 = IOConnectCallStructMethod(v6, v7, inputStruct, 0x18uLL, 0, 0);
  IOACIPCClass::unlock(a1);
  return v8;
}

uint64_t IOACIPCBBClass::enableRingEvents(uint64_t a1, uint64_t a2)
{
  const void *v4;
  mach_port_t v5;
  uint32_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t input;

  input = a2 != 0;
  IOACIPCClass::lock((IOACIPCClass *)a1);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
  v4 = *(const void **)(a1 + 184);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(a1 + 184) = 0;
  }
  if (a2)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZN14IOACIPCBBClass16enableRingEventsEU13block_pointerFvvE_block_invoke;
    v9[3] = &unk_24E13AD80;
    v9[4] = a2;
    *(_QWORD *)(a1 + 184) = _Block_copy(v9);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  v5 = *(_DWORD *)(a1 + 172);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 224))(a1, 19);
  v7 = IOConnectCallScalarMethod(v5, v6, &input, 1u, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)a1);
  return v7;
}

uint64_t ___ZN14IOACIPCBBClass16enableRingEventsEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t IOACIPCBBClass::readIndexArrays(mach_port_t *this)
{
  mach_port_t v2;
  uint32_t v3;
  uint64_t v4;

  IOACIPCClass::lock((IOACIPCClass *)this);
  v2 = this[43];
  v3 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(_QWORD *)this + 224))(this, 20);
  v4 = IOConnectCallStructMethod(v2, v3, 0, 0, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)this);
  return v4;
}

uint64_t IOACIPCBBClass::updateIndexArrays(IOACIPCClass *a1, const void *a2)
{
  mach_port_t v4;
  uint32_t v5;
  uint64_t v6;

  if (!a2)
    return 3758097090;
  IOACIPCClass::lock(a1);
  v4 = *((_DWORD *)a1 + 43);
  v5 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(_QWORD *)a1 + 224))(a1, 21);
  v6 = IOConnectCallStructMethod(v4, v5, a2, 0x68uLL, 0, 0);
  IOACIPCClass::unlock(a1);
  return v6;
}

uint64_t IOACIPCBBClass::mapUserMemory(mach_port_t *this, uint64_t a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4;
  mach_port_t v9;
  uint32_t v10;
  uint32_t outputCnt;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097090;
  if (a2 && a3)
  {
    IOACIPCClass::lock((IOACIPCClass *)this);
    input[0] = a2;
    input[1] = a3;
    outputCnt = 1;
    v9 = this[43];
    v10 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(_QWORD *)this + 224))(this, 22);
    v4 = IOConnectCallScalarMethod(v9, v10, input, 2u, a4, &outputCnt);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  return v4;
}

uint64_t IOACIPCBBClass::unmapUserMemory(IOACIPCBBClass *this, uint64_t a2)
{
  uint64_t v2;
  uint32_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 3758097090;
  v2 = a2;
  IOACIPCClass::lock(this);
  v7[0] = v2;
  LODWORD(v2) = *((_DWORD *)this + 43);
  v4 = (*(uint64_t (**)(IOACIPCBBClass *, uint64_t))(*(_QWORD *)this + 224))(this, 23);
  v5 = IOConnectCallScalarMethod(v2, v4, v7, 1u, 0, 0);
  IOACIPCClass::unlock(this);
  return v5;
}

uint64_t IOACIPCBBClass::mapIndexArrays(mach_port_t *this, uint64_t a2, int a3)
{
  uint64_t v3;
  mach_port_t v6;
  uint32_t v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  if (a2 && a3 == 104)
  {
    IOACIPCClass::lock((IOACIPCClass *)this);
    input[0] = a2;
    input[1] = 104;
    v6 = this[43];
    v7 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(_QWORD *)this + 224))(this, 24);
    v3 = IOConnectCallScalarMethod(v6, v7, input, 2u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  return v3;
}

uint64_t IOACIPCBBClass::unmapIndexArrays(mach_port_t *this)
{
  mach_port_t v2;
  uint32_t v3;
  uint64_t v4;

  IOACIPCClass::lock((IOACIPCClass *)this);
  v2 = this[43];
  v3 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(_QWORD *)this + 224))(this, 25);
  v4 = IOConnectCallScalarMethod(v2, v3, 0, 0, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)this);
  return v4;
}

uint64_t IOACIPCBBClass::timesyncAsync(IONotificationPortRef *this, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  __int128 v14;
  mach_port_t v15;
  uint32_t v16;
  mach_port_t MachPort;
  uint64_t v18;
  uint64_t input[4];
  uint64_t reference[2];
  void *v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v24 = v14;
    v25 = v14;
    input[0] = a2;
    input[1] = a3;
    input[2] = a4;
    input[3] = a5;
    reference[1] = (uint64_t)a6;
    v22 = a7;
    v15 = *((_DWORD *)this + 43);
    v16 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 14);
    MachPort = IONotificationPortGetMachPort(this[12]);
    v18 = IOConnectCallAsyncScalarMethod(v15, v16, MachPort, reference, 3u, input, 4u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v18;
}

uint64_t IOACIPCBBClass::registerTimeEvent(IONotificationPortRef *this, unsigned int a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  __int128 v8;
  mach_port_t v9;
  uint32_t v10;
  mach_port_t MachPort;
  uint64_t v12;
  uint64_t input;
  uint64_t reference[2];
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v18 = v8;
    v19 = v8;
    input = a2;
    reference[1] = (uint64_t)a3;
    v16 = a4;
    v9 = *((_DWORD *)this + 43);
    v10 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 15);
    MachPort = IONotificationPortGetMachPort(this[12]);
    v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, &input, 1u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v12;
}

uint64_t IOACIPCBBClass::deregisterTimeEvent(IONotificationPortRef *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  __int128 v8;
  mach_port_t v9;
  uint32_t v10;
  mach_port_t MachPort;
  uint64_t v12;
  uint64_t input;
  uint64_t reference[2];
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v18 = v8;
    v19 = v8;
    input = a2;
    reference[1] = (uint64_t)a3;
    v16 = a4;
    v9 = *((_DWORD *)this + 43);
    v10 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 16);
    MachPort = IONotificationPortGetMachPort(this[12]);
    v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, &input, 1u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v12;
}

void *IOACIPCBBClass::copyNotificationHandler(IOACIPCBBClass *this, uint64_t a2, void *a3)
{
  void *result;

  if ((_DWORD)a2 != -469794304)
    return (void *)IOACIPCClass::copyNotificationHandler(this, a2, a3);
  result = (void *)*((_QWORD *)this + 23);
  if (result)
    return _Block_copy(result);
  return result;
}

uint64_t IOACIPCBBControlClass::hostSleepEntryExit(mach_port_t *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t input;

  IOACIPCControlClass::lock((IOACIPCControlClass *)this);
  input = a2;
  v4 = IOConnectCallScalarMethod(this[42], 6u, &input, 1u, 0, 0);
  IOACIPCControlClass::unlock((IOACIPCControlClass *)this);
  return v4;
}

void IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  *(_QWORD *)this = &off_24E13ADC8;
  *((_DWORD *)this + 2) = 1;
  *((_QWORD *)this + 10) = 0;
  *((_BYTE *)this + 88) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(_QWORD *)this = &off_24E13ADC8;
  *((_DWORD *)this + 2) = 1;
  *((_QWORD *)this + 10) = 0;
  *((_BYTE *)this + 88) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  void (**v2)(IOACIPCBBNetCfgClass *__hidden);
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = &off_24E13ADC8;
  *(_QWORD *)this = &off_24E13ADC8;
  if ((*((_BYTE *)this + 8) & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "~IOACIPCBBNetCfgClass";
      _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v3, 0xCu);
      v2 = *(void (***)(IOACIPCBBNetCfgClass *__hidden))this;
    }
    else
    {
      v2 = &off_24E13ADC8;
    }
  }
  v2[3](this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(this);
  JUMPOUT(0x220793EB0);
}

void sub_21D92AA44(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t IOACIPCBBNetCfgClass::lock(IOACIPCBBNetCfgClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCBBNetCfgClass::unlock(IOACIPCBBNetCfgClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCBBNetCfgClass::start(IOACIPCBBNetCfgClass *this, const __CFDictionary *a2, int a3)
{
  pthread_mutex_t *v6;
  char v7;
  const __CFAllocator *v9;
  NSObject *v10;
  io_registry_entry_t v11;
  io_object_t v12;
  const __CFNumber *CFProperty;
  const __CFNumber *v14;
  CFTypeID v15;
  int Value;
  int v17;
  int v18;
  __int16 valuePtr;
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  existing = -1431655766;
  v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (!*((_DWORD *)this + 20))
  {
    CFRetain(a2);
    v7 = 0;
    if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], a2, &existing))
      goto LABEL_10;
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = MEMORY[0x24BDACB70];
    while (1)
    {
      v11 = IOIteratorNext(existing);
      if (!v11)
      {
LABEL_38:
        IOObjectRelease(existing);
        goto LABEL_6;
      }
      v12 = v11;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v11, CFSTR("sim-context"), v9, 0);
      if (CFProperty)
      {
        v14 = CFProperty;
        v15 = CFGetTypeID(CFProperty);
        if (v15 == CFNumberGetTypeID())
        {
          valuePtr = -21846;
          Value = CFNumberGetValue(v14, kCFNumberSInt16Type, &valuePtr);
          v17 = *((_DWORD *)this + 2);
          if (Value)
          {
            if ((v17 & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v22 = "start";
              v23 = 1024;
              v24 = valuePtr;
              _os_log_impl(&dword_21D929000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: SIM context: %d\n", buf, 0x12u);
            }
            if (valuePtr == a3)
            {
              *((_DWORD *)this + 20) = v12;
              IOObjectRetain(v12);
              if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v22 = "start";
                v23 = 1024;
                v24 = valuePtr;
                _os_log_impl(&dword_21D929000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Service selected with sim-context: %d\n", buf, 0x12u);
              }
              v18 = 3;
              v7 = 1;
              goto LABEL_36;
            }
          }
          else if ((v17 & 1) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "start";
            _os_log_impl(&dword_21D929000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: ERROR: unable to read SIM context\n", buf, 0xCu);
          }
          v18 = 2;
LABEL_36:
          CFRelease(v14);
          goto LABEL_37;
        }
        if ((*((_BYTE *)this + 8) & 1) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "start";
          _os_log_impl(&dword_21D929000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: ERROR: SIM context wrong type\n", buf, 0xCu);
        }
        CFRelease(v14);
      }
      else if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "start";
        _os_log_impl(&dword_21D929000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: IOService has no SIM context assigned\n", buf, 0xCu);
      }
      v18 = 2;
LABEL_37:
      if (v18 != 2)
        goto LABEL_38;
    }
  }
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "start";
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Service already available\n", buf, 0xCu);
  }
  v7 = 1;
LABEL_6:
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "start";
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: --done\n", buf, 0xCu);
  }
LABEL_10:
  pthread_mutex_unlock(v6);
  return v7 & 1;
}

uint64_t IOACIPCBBNetCfgClass::stop(IOACIPCBBNetCfgClass *this)
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
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  IOACIPCBBNetCfgClass::close_nl(this);
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
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: --done\n", (uint8_t *)&v5, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCBBNetCfgClass::close_nl(IOACIPCBBNetCfgClass *this)
{
  uint64_t v2;
  io_connect_t v3;

  if (!*((_BYTE *)this + 88))
    return 0;
  *((_BYTE *)this + 88) = 0;
  v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 1u, 0, 0, 0, 0);
  v3 = *((_DWORD *)this + 21);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 21) = 0;
  }
  return v2;
}

uint64_t IOACIPCBBNetCfgClass::open(IOACIPCBBNetCfgClass *this)
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
    v6 = "open";
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  v3 = IOACIPCBBNetCfgClass::open_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCBBNetCfgClass::open_nl(IOACIPCBBNetCfgClass *this)
{
  uint64_t v2;
  io_service_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v8;
  uint32_t outputCnt;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  outputCnt = 0;
  v8 = 0;
  if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "open_nl";
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", buf, 0xCu);
  }
  if (!*((_BYTE *)this + 88))
  {
    v3 = *((_DWORD *)this + 20);
    if (!v3)
    {
      if ((*((_BYTE *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "open_nl";
        _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: no service\n", buf, 0xCu);
      }
      return 3758096385;
    }
    v4 = IOServiceOpen(v3, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 21);
    if ((_DWORD)v4)
    {
      v2 = v4;
      if ((*((_BYTE *)this + 8) & 2) == 0 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return v2;
      *(_DWORD *)buf = 136315394;
      v11 = "open_nl";
      v12 = 1024;
      v13 = v2;
      v5 = MEMORY[0x24BDACB70];
      v6 = "IOACIPCBBNetCfgClass::%s: open failed: 0x%x\n";
    }
    else
    {
      v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 0, &v8, 1u, 0, &outputCnt);
      if (!(_DWORD)v2)
      {
        *((_BYTE *)this + 88) = 1;
        return v2;
      }
      if ((*((_BYTE *)this + 8) & 2) == 0 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return v2;
      *(_DWORD *)buf = 136315394;
      v11 = "open_nl";
      v12 = 1024;
      v13 = v2;
      v5 = MEMORY[0x24BDACB70];
      v6 = "IOACIPCBBNetCfgClass::%s: kACDPNetCfgUserClientOpen failed: 0x%x\n";
    }
    _os_log_impl(&dword_21D929000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x12u);
    return v2;
  }
  if ((*((_BYTE *)this + 8) & 2) == 0)
    return 0;
  v2 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "open_nl";
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: is open\n", buf, 0xCu);
    return 0;
  }
  return v2;
}

uint64_t IOACIPCBBNetCfgClass::close(IOACIPCBBNetCfgClass *this)
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
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  v3 = IOACIPCBBNetCfgClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCBBNetCfgClass::setLogLevel(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

uint64_t IOACIPCBBNetCfgClass::addNetIf(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  size_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 3758097090;
  if ((*(_BYTE *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int16 *)a2;
    v7 = a2[2];
    v8 = a2[3];
    *(_DWORD *)buf = 136315906;
    v13 = "addNetIf";
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Adding Network Interface (id = %u, prioUL = %u, rss = %u)\n", buf, 0x1Eu);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v11 = 478;
  v9 = IOConnectCallMethod(*(_DWORD *)(a1 + 84), 2u, 0, 0, a2, 0x1CuLL, 0, 0, a3, &v11);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if ((_DWORD)v9 && (*(_BYTE *)(a1 + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "addNetIf";
    v14 = 1024;
    v15 = v9;
    _os_log_impl(&dword_21D929000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Adding Network Interface failed (0x%x)\n", buf, 0x12u);
  }
  return v9;
}

uint64_t IOACIPCBBNetCfgClass::removeNetIf(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v7[0] = a2;
  v5 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 3u, v7, 1u, 0, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCBBNetCfgClass::addQueueSet(IOACIPCBBNetCfgClass *this, unsigned __int8 a2, BOOL a3, unsigned int *a4)
{
  return 3758097095;
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfRx(IOACIPCBBNetCfgClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  pthread_mutex_t *v8;
  uint64_t v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 5u, v10, 3u, 0, 0);
  return pthread_mutex_unlock(v8);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfRx(IOACIPCBBNetCfgClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  pthread_mutex_t *v8;
  uint64_t v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 4u, v10, 3u, 0, 0);
  return pthread_mutex_unlock(v8);
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfTx(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v6[0] = a2;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 7u, v6, 1u, 0, 0);
  return pthread_mutex_unlock(v4);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfTx(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v6[0] = a2;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 6u, v6, 1u, 0, 0);
  return pthread_mutex_unlock(v4);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
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

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
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

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
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

uint64_t IOACIPCClass::copyNotificationHandler(IOACIPCClass *this, uint64_t a2, void *a3)
{
  return MEMORY[0x24BED4688](this, a2, a3);
}

uint64_t IOACIPCClass::lock(IOACIPCClass *this)
{
  return MEMORY[0x24BED4698](this);
}

uint64_t IOACIPCClass::stop(IOACIPCClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x24BED46A8](this, a2);
}

uint64_t IOACIPCClass::unlock(IOACIPCClass *this)
{
  return MEMORY[0x24BED46D0](this);
}

void IOACIPCClass::~IOACIPCClass(IOACIPCClass *this)
{
  MEMORY[0x24BED46F0](this);
}

uint64_t IOACIPCControlClass::lock(IOACIPCControlClass *this)
{
  return MEMORY[0x24BED47A8](this);
}

uint64_t IOACIPCControlClass::unlock(IOACIPCControlClass *this)
{
  return MEMORY[0x24BED47D8](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24E13ABF0();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

