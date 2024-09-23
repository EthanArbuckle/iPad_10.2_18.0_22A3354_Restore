uint64_t WiFiCloudSyncEngineUnScheduleWithQueue(uint64_t result, const void *a2)
{
  uint64_t v2;
  int v3;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = *(_QWORD *)(result + 32);
      if (result)
      {
        result = CFEqual((CFTypeRef)result, a2);
        if ((_DWORD)result)
        {
          WiFiCloudSyncEngineStopEngine(v2);
          v3 = *(_DWORD *)(v2 + 168);
          if (v3)
            notify_cancel(v3);
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)result)
            return _os_log_send_and_compose_impl();
        }
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

void WiFiCloudSyncEngineLoggerLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v12;
  void *v13;
  void (*LogCallbackFunction)(void *);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, &a9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ %s: %@"), a2, a3, v12);
  LogCallbackFunction = (void (*)(void *))WiFiCloudSyncEngineGetLogCallbackFunction(a1);
  if (LogCallbackFunction)
    LogCallbackFunction(v13);
  else
    NSLog(CFSTR("[NO client logger] <%s %s> %@"), "Aug 13 2024", "20:07:26", v13);

}

uint64_t WiFiCloudSyncEngineAllowLegacyUpdates()
{
  return 0;
}

_QWORD *WiFiCloudSyncEngineCreate()
{
  _OWORD *Instance;
  _QWORD *v1;
  const __CFAllocator *v2;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v4;
  WiFiCloudSyncEngineCore *v5;
  WiFiCloudSyncEngineCore *v6;
  NSObject *v7;
  dispatch_source_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  dispatch_semaphore_t v11;

  if (!__wiFiCloudEngineTypeID)
    pthread_once(&__wiFiCloudEngineTypeInit, (void (*)(void))__WiFiCloudSyncEngineRegister);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();
    return 0;
  }
  v1 = Instance;
  Instance[16] = 0u;
  Instance[17] = 0u;
  Instance[14] = 0u;
  Instance[15] = 0u;
  Instance[12] = 0u;
  Instance[13] = 0u;
  Instance[10] = 0u;
  Instance[11] = 0u;
  Instance[8] = 0u;
  Instance[9] = 0u;
  Instance[6] = 0u;
  Instance[7] = 0u;
  Instance[4] = 0u;
  Instance[5] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[1] = 0u;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v1[18] = Mutable;
  if (!Mutable)
    goto LABEL_13;
  v4 = CFArrayCreateMutable(v2, 0, MEMORY[0x24BDBD690]);
  v1[30] = v4;
  if (!v4)
    goto LABEL_13;
  v5 = -[WiFiCloudSyncEngineCore initWithEncryptedKVS:]([WiFiCloudSyncEngineCore alloc], "initWithEncryptedKVS:", 0);
  v1[5] = v5;
  if (!v5)
    goto LABEL_13;
  v6 = -[WiFiCloudSyncEngineCore initWithEncryptedKVS:]([WiFiCloudSyncEngineCore alloc], "initWithEncryptedKVS:", 1);
  v1[6] = v6;
  if (!v6)
    goto LABEL_13;
  v7 = dispatch_queue_create("com.apple.wifi.wcse.serialQ.circleChanges", 0);
  v1[27] = v7;
  if (!v7
    || (v8 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, v7), (v1[28] = v8) == 0)
    || (v9 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM), v10 = dispatch_queue_create("com.apple.wifi.wcse.kvs_events", v9), (v1[34] = v10) == 0)|| (v11 = dispatch_semaphore_create(4), (v1[35] = v11) == 0))
  {
LABEL_13:
    CFRelease(v1);
    return 0;
  }
  return v1;
}

void WiFiCloudSyncEngineScheduleWithQueue(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD handler[5];
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = a2;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = "WiFiCloudSyncEngineScheduleWithQueue";
      v7 = 2080;
      v8 = "WiFiCloudSyncEngine.m";
      v9 = 1024;
      v10 = 735;
      _os_log_send_and_compose_impl();
    }
    __WiFiCloudSyncEngineSetupKeychainChangedNotification(a1);
    v3 = *(NSObject **)(a1 + 224);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __WiFiCloudSyncEngineScheduleWithQueue_block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = a1;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(a1);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __WiFiCloudSyncEngineSetupKeychainChangedNotification(uint64_t a1)
{
  __CFMachPort *v2;
  uint64_t result;
  CFRunLoopSourceRef RunLoopSource;
  CFMachPortContext context;
  mach_port_t notify_port;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)a1;
  if (!a1)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    notify_port = 136315650;
    v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    v8 = 2080;
    v9 = "WiFiCloudSyncEngine.m";
    v10 = 1024;
    v11 = 957;
    return _os_log_send_and_compose_impl();
  }
  if (!*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a1 + 24))
  {
    if (*(_QWORD *)(a1 + 32))
      goto LABEL_13;
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    notify_port = 136315650;
    v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    v8 = 2080;
    v9 = "WiFiCloudSyncEngine.m";
    v10 = 1024;
    v11 = 958;
    return _os_log_send_and_compose_impl();
  }
  v2 = *(__CFMachPort **)(a1 + 200);
  if (v2)
  {
LABEL_8:
    if (!*(_QWORD *)(a1 + 208))
    {
      RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0);
      *(_QWORD *)(a1 + 208) = RunLoopSource;
      if (!RunLoopSource)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if (!(_DWORD)result)
          return result;
        notify_port = 136315650;
        v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
        v8 = 2080;
        v9 = "WiFiCloudSyncEngine.m";
        v10 = 1024;
        v11 = 974;
        return _os_log_send_and_compose_impl();
      }
    }
LABEL_13:
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    notify_port = 136315650;
    v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    v8 = 2080;
    v9 = "WiFiCloudSyncEngine.m";
    v10 = 1024;
    v11 = 978;
    return _os_log_send_and_compose_impl();
  }
  notify_port = 0;
  result = notify_register_mach_port((const char *)kKeychainChangedNotificationName, &notify_port, 0, (int *)(a1 + 192));
  if (!(_DWORD)result)
  {
    result = (uint64_t)CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], notify_port, (CFMachPortCallBack)__WiFiCloudSyncEngineKeychainChangedNotificationCallback, &context, 0);
    *(_QWORD *)(a1 + 200) = result;
    if (result)
    {
      v2 = (__CFMachPort *)result;
      goto LABEL_8;
    }
  }
  return result;
}

void __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(uint64_t a1)
{
  __CFMachPort *v2;
  CFMachPortRef v3;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v5;
  const char *v6;
  _QWORD handler[5];
  CFMachPortContext context;
  mach_port_t notify_port;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)a1;
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    notify_port = 136315650;
    v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngine.m";
    v13 = 1024;
    v14 = 910;
    goto LABEL_22;
  }
  if (!*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a1 + 24))
  {
    if (*(_QWORD *)(a1 + 32))
      goto LABEL_12;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    notify_port = 136315650;
    v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngine.m";
    v13 = 1024;
    v14 = 911;
LABEL_22:
    _os_log_send_and_compose_impl();
    return;
  }
  v2 = *(__CFMachPort **)(a1 + 176);
  if (!v2)
  {
    notify_port = 0;
    if (notify_register_mach_port((const char *)*MEMORY[0x24BDE8518], &notify_port, 0, (int *)(a1 + 168)))
      return;
    v3 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], notify_port, (CFMachPortCallBack)__WiFiCloudSyncEngineKeychainSyncStateChanged, &context, 0);
    *(_QWORD *)(a1 + 176) = v3;
    if (!v3)
      return;
    v2 = v3;
  }
  RunLoopSource = *(__CFRunLoopSource **)(a1 + 184);
  if (!RunLoopSource)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0);
    *(_QWORD *)(a1 + 184) = RunLoopSource;
    if (!RunLoopSource)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      notify_port = 136315650;
      v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
      v11 = 2080;
      v12 = "WiFiCloudSyncEngine.m";
      v13 = 1024;
      v14 = 926;
      goto LABEL_22;
    }
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 16), RunLoopSource, *(CFRunLoopMode *)(a1 + 24));
LABEL_12:
  v5 = *(NSObject **)(a1 + 32);
  if (v5)
  {
    v6 = (const char *)*MEMORY[0x24BDE8518];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ____WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification_block_invoke;
    handler[3] = &__block_descriptor_40_e8_v12__0i8l;
    handler[4] = a1;
    notify_register_dispatch(v6, (int *)(a1 + 168), v5, handler);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    notify_port = 136315650;
    v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngine.m";
    v13 = 1024;
    v14 = 939;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineCheckKeychainSyncState(a1);
}

void WiFiCloudSyncEngineStopEngine(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  uint64_t v4;
  _BOOL4 v5;
  int *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v8 = 136315650;
    v9 = "WiFiCloudSyncEngineStopEngine";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 1358;
    goto LABEL_11;
  }
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (!v3)
      return;
    v8 = 136315650;
    v9 = "WiFiCloudSyncEngineStopEngine";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 1361;
    goto LABEL_11;
  }
  if (v3)
  {
    v8 = 136315650;
    v9 = "WiFiCloudSyncEngineStopEngine";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 1365;
    LODWORD(v7) = 28;
    v6 = &v8;
    _os_log_send_and_compose_impl();
  }
  *(_BYTE *)(a1 + 56) = 0;
  objc_msgSend(*(id *)(a1 + 40), "enableIcloudSyncing:ForBundleId:", 0, 0, v6, v7);
  objc_msgSend(*(id *)(a1 + 48), "enableIcloudSyncing:ForBundleId:", 0, 0);
  v4 = *(_QWORD *)(a1 + 144);
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
      return;
    v8 = 136315650;
    v9 = "__WiFiCloudSyncEngineFlushWaitingForPasswordList";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 2791;
LABEL_11:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v5)
  {
    v8 = 136315650;
    v9 = "__WiFiCloudSyncEngineFlushWaitingForPasswordList";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 2793;
    _os_log_send_and_compose_impl();
  }
  __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 144));
}

void WiFiCloudSyncEngineScheduleWithRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  _QWORD handler[5];
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 16) = a2;
    *(_QWORD *)(a1 + 24) = a3;
    *(_QWORD *)(a1 + 32) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "WiFiCloudSyncEngineScheduleWithRunLoop";
      v8 = 2080;
      v9 = "WiFiCloudSyncEngine.m";
      v10 = 1024;
      v11 = 789;
      _os_log_send_and_compose_impl();
    }
    __WiFiCloudSyncEngineSetupKeychainChangedNotification(a1);
    v4 = *(NSObject **)(a1 + 224);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(a1);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t WiFiCloudSyncEngineUnScheduleWithRunLoop(uint64_t result, void *cf2, const __CFString *a3)
{
  uint64_t v4;

  if (result)
  {
    if (cf2)
    {
      v4 = result;
      result = *(_QWORD *)(result + 16);
      if (result)
      {
        if (a3)
        {
          if (*(_QWORD *)(v4 + 24))
          {
            result = CFEqual((CFTypeRef)result, cf2);
            if ((_DWORD)result)
            {
              result = CFEqual(*(CFTypeRef *)(v4 + 24), a3);
              if ((_DWORD)result)
              {
                WiFiCloudSyncEngineStopEngine(v4);
                CFRunLoopRemoveSource((CFRunLoopRef)cf2, *(CFRunLoopSourceRef *)(v4 + 184), a3);
                result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)result)
                  return _os_log_send_and_compose_impl();
              }
            }
          }
        }
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

uint64_t WiFiCloudSyncEngineRegisterCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1)
  {
    if (a2)
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if ((_DWORD)result)
          _os_log_send_and_compose_impl();
        if (*(_QWORD *)(a2 + 40))
        {
          if (*(_QWORD *)(a2 + 8))
          {
            if (*(_QWORD *)(a2 + 24))
            {
              if (*(_QWORD *)(a2 + 48))
              {
                if (*(_QWORD *)(a2 + 16))
                {
                  if (*(_QWORD *)(a2 + 56))
                  {
                    if (*(_QWORD *)(a2 + 32))
                    {
                      *(_QWORD *)(a1 + 136) = a3;
                      *(_OWORD *)(a1 + 64) = *(_OWORD *)a2;
                      v9 = *(_OWORD *)(a2 + 16);
                      v10 = *(_OWORD *)(a2 + 32);
                      v11 = *(_OWORD *)(a2 + 48);
                      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 64);
                      *(_OWORD *)(a1 + 96) = v10;
                      *(_OWORD *)(a1 + 112) = v11;
                      *(_OWORD *)(a1 + 80) = v9;

                      *(_QWORD *)(a1 + 160) = objc_msgSend(a4, "copy");
                      objc_msgSend(*(id *)(a1 + 40), "registerCallback:context:", __WiFiCloudSyncEngineCloudEventCallback, a1);
                      objc_msgSend(*(id *)(a1 + 48), "registerCallback:context:", __WiFiCloudSyncEngineCloudEventCallback, a1);
                      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                      if (!(_DWORD)result)
                        return result;
                      return _os_log_send_and_compose_impl();
                    }
                    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    if ((_DWORD)result)
                      return _os_log_send_and_compose_impl();
                  }
                  else
                  {
                    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    if ((_DWORD)result)
                      return _os_log_send_and_compose_impl();
                  }
                }
                else
                {
                  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)result)
                    return _os_log_send_and_compose_impl();
                }
              }
              else
              {
                result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)result)
                  return _os_log_send_and_compose_impl();
              }
            }
            else
            {
              result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)result)
                return _os_log_send_and_compose_impl();
            }
          }
          else
          {
            result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)result)
              return _os_log_send_and_compose_impl();
          }
        }
        else
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)result)
            return _os_log_send_and_compose_impl();
        }
      }
      else if ((_DWORD)result)
      {
        return _os_log_send_and_compose_impl();
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
        return _os_log_send_and_compose_impl();
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

void __WiFiCloudSyncEngineCloudEventCallback(void *a1, void *a2, NSObject **a3)
{
  int v6;
  void *v7;

  if (a2 && a3)
  {
    if (objc_msgSend(a1, "isKVSEncrypted"))
    {
      v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("reason")), "intValue");
      v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("changedKeys"));
      switch(v6)
      {
        case 0:
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_9;
          goto LABEL_8;
        case 1:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
LABEL_8:
            _os_log_send_and_compose_impl();
LABEL_9:
          __WiFiCloudSyncEngineProcessCloudChangeEvent(a3, (uint64_t)a1, v7);
          break;
        case 2:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          break;
        case 3:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          break;
        default:
          return;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
LABEL_13:
    _os_log_send_and_compose_impl();
  }
}

uint64_t WiFiCloudSyncEngineRegisterCallbacksWithQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (a1)
  {
    if (a2)
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if ((_DWORD)result)
          _os_log_send_and_compose_impl();
        if (*(_QWORD *)(a2 + 40))
        {
          if (*(_QWORD *)(a2 + 8))
          {
            if (*(_QWORD *)(a2 + 24))
            {
              if (*(_QWORD *)(a2 + 48))
              {
                if (*(_QWORD *)(a2 + 16))
                {
                  if (*(_QWORD *)(a2 + 56))
                  {
                    if (*(_QWORD *)(a2 + 32))
                    {
                      *(_QWORD *)(a1 + 136) = a3;
                      *(_OWORD *)(a1 + 64) = *(_OWORD *)a2;
                      v11 = *(_OWORD *)(a2 + 16);
                      v12 = *(_OWORD *)(a2 + 32);
                      v13 = *(_OWORD *)(a2 + 48);
                      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 64);
                      *(_OWORD *)(a1 + 96) = v12;
                      *(_OWORD *)(a1 + 112) = v13;
                      *(_OWORD *)(a1 + 80) = v11;

                      *(_QWORD *)(a1 + 160) = objc_msgSend(a4, "copy");
                      objc_msgSend(*(id *)(a1 + 40), "registerCallback:queue:context:", __WiFiCloudSyncEngineCloudEventCallback, a5, a1);
                      objc_msgSend(*(id *)(a1 + 48), "registerCallback:queue:context:", __WiFiCloudSyncEngineCloudEventCallback, a5, a1);
                      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                      if (!(_DWORD)result)
                        return result;
                      return _os_log_send_and_compose_impl();
                    }
                    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    if ((_DWORD)result)
                      return _os_log_send_and_compose_impl();
                  }
                  else
                  {
                    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    if ((_DWORD)result)
                      return _os_log_send_and_compose_impl();
                  }
                }
                else
                {
                  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)result)
                    return _os_log_send_and_compose_impl();
                }
              }
              else
              {
                result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)result)
                  return _os_log_send_and_compose_impl();
              }
            }
            else
            {
              result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)result)
                return _os_log_send_and_compose_impl();
            }
          }
          else
          {
            result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)result)
              return _os_log_send_and_compose_impl();
          }
        }
        else
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)result)
            return _os_log_send_and_compose_impl();
        }
      }
      else if ((_DWORD)result)
      {
        return _os_log_send_and_compose_impl();
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
        return _os_log_send_and_compose_impl();
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

void WiFiCloudSyncEngineCheckKeychainSyncState(uint64_t a1)
{
  _BOOL4 v2;

  v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v2)
      _os_log_send_and_compose_impl();
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 224), 1uLL);
  }
  else if (v2)
  {
    _os_log_send_and_compose_impl();
  }
}

void WiFiCloudSyncEngineAddNetworkToKnownNetworksList(uint64_t a1, void *a2, void *a3)
{
  int NetworkSecurity;
  _BOOL4 v7;
  const __CFArray *v8;
  CFIndex Count;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  CFIndex v13;
  void *v14;
  void *ValueAtIndex;
  const __CFString *v16;
  void *v17;
  __CFRunLoop *v18;
  const __CFString *v19;
  __CFRunLoopSource *v20;
  NSObject *v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE handler[24];
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1229;
    goto LABEL_36;
  }
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1230;
    goto LABEL_36;
  }
  if (!__WiFiCloudSyncEngineIsNetworkSyncableFromCloud(a2, a3))
    return;
  NetworkSecurity = __WiFiCloudSyncEngineGetNetworkSecurity(a2, a3);
  v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!NetworkSecurity)
  {
    if (!v7)
      return;
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1241;
    goto LABEL_36;
  }
  if (v7)
  {
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1238;
    LODWORD(v23) = 28;
    v22 = handler;
    _os_log_send_and_compose_impl();
  }
  v8 = *(const __CFArray **)(a1 + 144);
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2740;
LABEL_36:
    _os_log_send_and_compose_impl();
    return;
  }
  Count = CFArrayGetCount(v8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)handler = 136315906;
    *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2743;
    WORD2(v25) = 2048;
    *(_QWORD *)((char *)&v25 + 6) = Count;
    LODWORD(v23) = 38;
    v22 = handler;
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend(a2, "isKVSEncrypted", v22, v23))
    v10 = CFSTR("SSID");
  else
    v10 = CFSTR("SSID_STR");
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", v10);
  if (v11)
  {
    v12 = v11;
    if (Count >= 1)
    {
      v13 = 0;
      do
      {
        v14 = (void *)MEMORY[0x2199D8164]();
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), v13);
        if (objc_msgSend(a2, "isKVSEncrypted"))
          v16 = CFSTR("SSID");
        else
          v16 = CFSTR("SSID_STR");
        v17 = (void *)objc_msgSend(ValueAtIndex, "objectForKeyedSubscript:", v16);
        if (v17 && !objc_msgSend(v17, "compare:", v12))
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), v13);
        else
          ++v13;
        Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 144));
        objc_autoreleasePoolPop(v14);
      }
      while (v13 < Count);
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 144), a3);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 136315906;
      *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
      *(_WORD *)&handler[12] = 2080;
      *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
      *(_WORD *)&handler[22] = 1024;
      LODWORD(v25) = 2769;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v12;
      _os_log_send_and_compose_impl();
    }
    if (Count)
      goto LABEL_41;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 136315650;
      *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
      *(_WORD *)&handler[12] = 2080;
      *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
      *(_WORD *)&handler[22] = 1024;
      LODWORD(v25) = 2773;
      _os_log_send_and_compose_impl();
    }
    v18 = *(__CFRunLoop **)(a1 + 16);
    if (v18 && (v19 = *(const __CFString **)(a1 + 24)) != 0)
    {
      v20 = *(__CFRunLoopSource **)(a1 + 208);
      if (!v20)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        *(_DWORD *)handler = 136315650;
        *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineStartKeychainChangedNotifications";
        *(_WORD *)&handler[12] = 2080;
        *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
        *(_WORD *)&handler[22] = 1024;
        LODWORD(v25) = 1047;
        goto LABEL_40;
      }
      CFRunLoopAddSource(v18, v20, v19);
      v21 = *(NSObject **)(a1 + 32);
      if (!v21)
      {
LABEL_39:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
LABEL_41:
          __WiFiCloudSyncEngineCheckWaitingForPasswordList(a1, a2);
          return;
        }
LABEL_40:
        _os_log_send_and_compose_impl();
        goto LABEL_41;
      }
    }
    else
    {
      v21 = *(NSObject **)(a1 + 32);
      if (!v21)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        *(_DWORD *)handler = 136315650;
        *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineStartKeychainChangedNotifications";
        *(_WORD *)&handler[12] = 2080;
        *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
        *(_WORD *)&handler[22] = 1024;
        LODWORD(v25) = 1043;
        goto LABEL_40;
      }
    }
    *(_QWORD *)handler = MEMORY[0x24BDAC760];
    *(_QWORD *)&handler[8] = 3221225472;
    *(_QWORD *)&handler[16] = ____WiFiCloudSyncEngineStartKeychainChangedNotifications_block_invoke;
    *(_QWORD *)&v25 = &__block_descriptor_40_e8_v12__0i8l;
    *((_QWORD *)&v25 + 1) = a1;
    notify_register_dispatch((const char *)kKeychainChangedNotificationName, (int *)(a1 + 192), v21, handler);
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)handler = 136315650;
    *(_QWORD *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(_QWORD *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2746;
    goto LABEL_36;
  }
}

uint64_t __WiFiCloudSyncEngineIsNetworkSyncableFromCloud(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t result;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;

  if (objc_msgSend(a1, "isKVSEncrypted"))
  {
    if (a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("minVersion"));
        if (!v4)
          return __WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(a1, a2);
        v5 = v4;
        if (objc_msgSend(v4, "integerValue") < 3)
          return __WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(a1, a2);
        v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v24)
          goto LABEL_48;
      }
      else
      {
        v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v20)
          goto LABEL_66;
      }
    }
    else
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v18)
        goto LABEL_66;
    }
  }
  else if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("minVersion"));
      if (v7 && (v5 = v7, objc_msgSend(v7, "integerValue") >= 3))
      {
        v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v25)
        {
LABEL_48:
          objc_msgSend(v5, "integerValue");
LABEL_66:
          _os_log_send_and_compose_impl();
          return 0;
        }
      }
      else
      {
        v8 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NOT_SYNCABLE"));
        if (v8 && objc_msgSend(v8, "BOOLValue"))
        {
          v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (v26)
            goto LABEL_66;
        }
        else
        {
          v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_EAP"));
          if (v9 && objc_msgSend(v9, "BOOLValue"))
          {
            v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
            result = 0;
            if (v27)
              goto LABEL_66;
          }
          else
          {
            v10 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_CUSTOMIZED"));
            if (v10 && objc_msgSend(v10, "BOOLValue"))
            {
              v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              result = 0;
              if (v28)
                goto LABEL_66;
            }
            else
            {
              v11 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_CONFIGURED"));
              if (v11 && objc_msgSend(v11, "BOOLValue"))
              {
                v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                result = 0;
                if (v29)
                  goto LABEL_66;
              }
              else
              {
                v12 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("AP_MODE"));
                if (v12 && objc_msgSend(v12, "intValue") != 2)
                {
                  v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                  result = 0;
                  if (v30)
                    goto LABEL_66;
                }
                else
                {
                  v13 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_EXPIRABLE"));
                  if (v13 && objc_msgSend(v13, "BOOLValue"))
                  {
                    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    result = 0;
                    if (v31)
                      goto LABEL_66;
                  }
                  else
                  {
                    v14 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("enabled"));
                    if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) == 0)
                    {
                      v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                      result = 0;
                      if (v32)
                        goto LABEL_66;
                    }
                    else
                    {
                      v15 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_CARPLAY_ONLY"));
                      if (v15 && objc_msgSend(v15, "BOOLValue"))
                      {
                        v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                        result = 0;
                        if (v33)
                          goto LABEL_66;
                      }
                      else if (__WiFiCloudSyncEngineIsNetworkHidden(a1, a2))
                      {
                        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                        result = 0;
                        if (v22)
                          goto LABEL_66;
                      }
                      else if (__WiFiCloudSyncEngineGetNetworkSecurity(a1, a2))
                      {
                        v16 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("IS_NETWORK_CAPTIVE"));
                        if (!v16 || objc_msgSend(v16, "BOOLValue"))
                        {
                          v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                          result = 0;
                          if (v17)
                            goto LABEL_66;
                        }
                        else
                        {
                          return 1;
                        }
                      }
                      else
                      {
                        v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                        result = 0;
                        if (v23)
                          goto LABEL_66;
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
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v21)
        goto LABEL_66;
    }
  }
  else
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v19)
      goto LABEL_66;
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineGetNetworkSecurity(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;

  if (!a2)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v10)
      return result;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
LABEL_22:
    _os_log_send_and_compose_impl();
    return 0;
  }
  if (!objc_msgSend(a1, "isKVSEncrypted"))
  {
    v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("WEP"));
    if (!v9 || (objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      if (!objc_msgSend(a2, "objectForKey:", CFSTR("WPA3_RSN_IE")))
      {
        if (!objc_msgSend(a2, "objectForKey:", CFSTR("RSN_IE")))
          return 2 * (objc_msgSend(a2, "objectForKey:", CFSTR("WPA_IE")) != 0);
        return 3;
      }
      return 4;
    }
    return 1;
  }
  v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isWEP"));
  if (v4 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
    return 1;
  v5 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isWPA3"));
  if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
    return 4;
  v6 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isWPA2"));
  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
    return 3;
  v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isWPA"));
  if (!v7 || (objc_msgSend(v7, "BOOLValue") & 1) == 0)
    return 0;
  return 2;
}

void WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList(uint64_t a1, void *a2, void *a3)
{
  uint64_t NetworkFromCloudFormatCallback;
  const void *v7;
  const __CFArray *v8;
  CFIndex Count;
  _BOOL4 v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  NSObject *v15;
  void *ValueAtIndex;
  const __CFString *v17;
  void *v18;
  int *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  CFIndex v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v23 = 136315650;
    v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    v25 = 2080;
    v26 = "WiFiCloudSyncEngine.m";
    v27 = 1024;
    v28 = 1256;
    goto LABEL_41;
  }
  if (!*(_QWORD *)(a1 + 104))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v23 = 136315650;
    v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    v25 = 2080;
    v26 = "WiFiCloudSyncEngine.m";
    v27 = 1024;
    v28 = 1258;
    goto LABEL_41;
  }
  if (!*(_QWORD *)(a1 + 80))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v23 = 136315650;
    v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    v25 = 2080;
    v26 = "WiFiCloudSyncEngine.m";
    v27 = 1024;
    v28 = 1259;
LABEL_41:
    _os_log_send_and_compose_impl();
    return;
  }
  if (!objc_msgSend(a2, "isKVSEncrypted")
    || __WiFiCloudSyncEngineIsNetworkSyncableFromCloud(a2, a3))
  {
    NetworkFromCloudFormatCallback = __WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(a1, a2, a3);
    if (NetworkFromCloudFormatCallback)
    {
      v7 = (const void *)NetworkFromCloudFormatCallback;
      (*(void (**)(uint64_t, _QWORD))(a1 + 80))(NetworkFromCloudFormatCallback, *(_QWORD *)(a1 + 136));
      v8 = *(const __CFArray **)(a1 + 144);
      if (v8)
      {
        Count = CFArrayGetCount(v8);
        v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if (Count)
        {
          if (v10)
          {
            v23 = 136315906;
            v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
            v25 = 2080;
            v26 = "WiFiCloudSyncEngine.m";
            v27 = 1024;
            v28 = 2820;
            v29 = 2048;
            v30 = Count;
            LODWORD(v21) = 38;
            v19 = &v23;
            _os_log_send_and_compose_impl();
          }
          if (objc_msgSend(a2, "isKVSEncrypted", v19, v21))
            v11 = CFSTR("SSID");
          else
            v11 = CFSTR("SSID_STR");
          v12 = objc_msgSend(a3, "objectForKeyedSubscript:", v11);
          if (Count >= 1)
          {
            v13 = v12;
            v14 = 0;
            v15 = MEMORY[0x24BDACB70];
            do
            {
              ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), v14);
              if (objc_msgSend(a2, "isKVSEncrypted"))
                v17 = CFSTR("SSID");
              else
                v17 = CFSTR("SSID_STR");
              v18 = (void *)objc_msgSend(ValueAtIndex, "objectForKeyedSubscript:", v17, v20, v22);
              if (v18 && !objc_msgSend(v18, "compare:", v13))
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = 136315906;
                  v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
                  v25 = 2080;
                  v26 = "WiFiCloudSyncEngine.m";
                  v27 = 1024;
                  v28 = 2831;
                  v29 = 2112;
                  v30 = v13;
                  LODWORD(v22) = 38;
                  v20 = &v23;
                  _os_log_send_and_compose_impl();
                }
                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), v14);
              }
              else
              {
                ++v14;
              }
            }
            while (v14 < CFArrayGetCount(*(CFArrayRef *)(a1 + 144)));
          }
          if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 144)))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v23 = 136315650;
              v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
              v25 = 2080;
              v26 = "WiFiCloudSyncEngine.m";
              v27 = 1024;
              v28 = 2842;
              _os_log_send_and_compose_impl();
            }
            __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
          }
          goto LABEL_31;
        }
        if (v10)
        {
          v23 = 136315650;
          v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
          v25 = 2080;
          v26 = "WiFiCloudSyncEngine.m";
          v27 = 1024;
          v28 = 2818;
          goto LABEL_46;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
        v25 = 2080;
        v26 = "WiFiCloudSyncEngine.m";
        v27 = 1024;
        v28 = 2815;
LABEL_46:
        _os_log_send_and_compose_impl();
      }
LABEL_31:
      CFRelease(v7);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315650;
      v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
      v25 = 2080;
      v26 = "WiFiCloudSyncEngine.m";
      v27 = 1024;
      v28 = 1269;
      goto LABEL_41;
    }
  }
}

uint64_t __WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  const __CFString **v20;
  uint64_t v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  _BYTE v50[24];
  void *v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 104))
  {
    v6 = (void *)MEMORY[0x2199D8164]();
    if (!objc_msgSend(a2, "isKVSEncrypted"))
    {
      v15 = (*(uint64_t (**)(void *, _QWORD))(a1 + 104))(a3, *(_QWORD *)(a1 + 136));
      goto LABEL_41;
    }
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SSID")), CFSTR("SSID_STR"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BSSID")), CFSTR("BSSID"));
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isPSK")), "BOOLValue");
    v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isEAP")), "BOOLValue");
    v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWEP")), "BOOLValue");
    v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWPA")), "BOOLValue");
    v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWPA2")), "BOOLValue");
    v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWPA3")), "BOOLValue");
    if (v9)
    {
      v14 = (void *)MEMORY[0x24BDBD1C8];
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IS_NETWORK_EAP"));
      if ((v12 & v13) == 1)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        *(_QWORD *)&v50[16] = &unk_24D23F9E0;
        v51 = &unk_24D23F9F8;
        v49 = CFSTR("IE_KEY_RSN_CAPS");
        v37 = CFSTR("MFP_CAPABLE");
        v38 = CFSTR("MFP_REQUIRED");
        v41 = v14;
        v42 = v14;
        v52 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v37, 2);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 5), CFSTR("RSN_IE"));
LABEL_22:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isHidden")), CFSTR("UserDirected"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isCaptive")), CFSTR("IS_NETWORK_CAPTIVE"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isWhitelistedCaptive")), CFSTR("IS_NETWORK_WHITELISTING_CAPTIVE"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isExpirable")), CFSTR("IS_NETWORK_EXPIRABLE"));
        v23 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isCustom")), "BOOLValue");
        v24 = MEMORY[0x24BDBD1C0];
        v25 = MEMORY[0x24BDBD1C8];
        if (v23)
          v26 = MEMORY[0x24BDBD1C8];
        else
          v26 = MEMORY[0x24BDBD1C0];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("IS_NETWORK_CUSTOMIZED"));
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isProfileBased")), "BOOLValue"))v27 = v25;
        else
          v27 = v24;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("IS_NETWORK_CONFIGURED"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isAppBased")), CFSTR("IS_NETWORK_APPBASED"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isCarPlayOnly")), CFSTR("IS_NETWORK_CARPLAY_ONLY"));
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isIBSS")), "BOOLValue"))
          v28 = &unk_24D23F818;
        else
          v28 = &unk_24D23F890;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("AP_MODE"));
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isAutoJoinDisabled")), "BOOLValue"))v29 = v24;
        else
          v29 = v25;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("enabled"));
        v30 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lowDataMode"));
        if (v30)
        {
          if (objc_msgSend(v30, "BOOLValue"))
            v31 = &unk_24D23F818;
          else
            v31 = &unk_24D23F890;
        }
        else
        {
          v31 = &unk_24D23F8C0;
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("LOW_DATA_MODE"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AddedAt")), CFSTR("addedAt"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lastJoinedByUserAt")), CFSTR("UserJoinedAt"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lastJoinedBySystemAtWeek")), CFSTR("lastJoinedBySystemAtWeek"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preferredOrderTimestamp")), CFSTR("UserPreferredTimestamp"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minVersion")), CFSTR("minVersion"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NOT_SYNCABLE")), CFSTR("NOT_SYNCABLE"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isPrivacyProxyEnabled")), CFSTR("IS_PRIVACY_PROXY_ENABLED"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isMoving")), CFSTR("IS_MOVING"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isPublic")), CFSTR("IS_PUBLIC"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("was6GHzOnlyAtWeek")), CFSTR("was6GHzOnlyAtWeek"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("seamlessSSIDList")), CFSTR("seamlessSSIDList"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privateMacPref")), CFSTR("privateMacPref"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("prvateMacPrefTimestamp")), CFSTR("prvateMacPrefTimestamp"));
        v32 = (id)objc_msgSend(v7, "copy");
        if (!v32)
        {
          v33 = 0;
          goto LABEL_42;
        }
        v15 = (*(uint64_t (**)(id, _QWORD))(a1 + 104))(v32, *(_QWORD *)(a1 + 136));
LABEL_41:
        v33 = v15;
LABEL_42:
        objc_autoreleasePoolPop(v6);
        return v33;
      }
      if (v13)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        *(_QWORD *)&v50[16] = &unk_24D23FA10;
        v51 = &unk_24D23FA28;
        v49 = CFSTR("IE_KEY_RSN_CAPS");
        v37 = CFSTR("MFP_CAPABLE");
        v38 = CFSTR("MFP_REQUIRED");
        v41 = v14;
        v42 = v14;
        v52 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v37, 2);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 5), CFSTR("WPA3_RSN_IE"));
        goto LABEL_22;
      }
      if ((v11 & v12) == 1)
      {
        v45 = CFSTR("IE_KEY_WPA_VERSION");
        v46 = CFSTR("IE_KEY_WPA_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F890;
        v47 = CFSTR("IE_KEY_WPA_UCIPHERS");
        v48 = CFSTR("IE_KEY_WPA_AUTHSELS");
        *(_QWORD *)&v50[16] = &unk_24D23FA40;
        v51 = &unk_24D23FA58;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 4), CFSTR("WPA_IE"));
        v37 = CFSTR("IE_KEY_RSN_VERSION");
        v38 = CFSTR("IE_KEY_RSN_MCIPHER");
        v41 = &unk_24D23F818;
        v42 = &unk_24D23F890;
        v39 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v40 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v43 = &unk_24D23FA70;
        v44 = &unk_24D23FA88;
LABEL_19:
        v18 = (void *)MEMORY[0x24BDBCE70];
        v19 = &v41;
        v20 = &v37;
        goto LABEL_20;
      }
      if (v12)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v16 = &unk_24D23FAA0;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v17 = &unk_24D23FAB8;
        goto LABEL_10;
      }
      if (v11)
      {
        v45 = CFSTR("IE_KEY_WPA_VERSION");
        v46 = CFSTR("IE_KEY_WPA_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F890;
        v35 = &unk_24D23FAD0;
        v47 = CFSTR("IE_KEY_WPA_UCIPHERS");
        v48 = CFSTR("IE_KEY_WPA_AUTHSELS");
        v36 = &unk_24D23FAE8;
LABEL_53:
        *(_QWORD *)&v50[16] = v35;
        v51 = v36;
        v21 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 4);
        v22 = CFSTR("WPA_IE");
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("IS_NETWORK_EAP"));
      if (!v8)
        goto LABEL_22;
      if ((v12 & v13) == 1)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v16 = &unk_24D23FB00;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v17 = &unk_24D23FB18;
LABEL_10:
        *(_QWORD *)&v50[16] = v16;
        v51 = v17;
        v18 = (void *)MEMORY[0x24BDBCE70];
        v19 = (void **)v50;
        v20 = &v45;
LABEL_20:
        v21 = objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 4);
        v22 = CFSTR("RSN_IE");
        goto LABEL_21;
      }
      if (v13)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        *(_QWORD *)&v50[16] = &unk_24D23FB30;
        v51 = &unk_24D23FB48;
        v21 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 4);
        v22 = CFSTR("WPA3_RSN_IE");
LABEL_21:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);
        goto LABEL_22;
      }
      if ((v11 & v12) == 1)
      {
        v45 = CFSTR("IE_KEY_WPA_VERSION");
        v46 = CFSTR("IE_KEY_WPA_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F890;
        v47 = CFSTR("IE_KEY_WPA_UCIPHERS");
        v48 = CFSTR("IE_KEY_WPA_AUTHSELS");
        *(_QWORD *)&v50[16] = &unk_24D23FB60;
        v51 = &unk_24D23FB78;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v45, 4), CFSTR("WPA_IE"));
        v37 = CFSTR("IE_KEY_RSN_VERSION");
        v38 = CFSTR("IE_KEY_RSN_MCIPHER");
        v41 = &unk_24D23F818;
        v42 = &unk_24D23F830;
        v39 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v40 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v43 = &unk_24D23FB90;
        v44 = &unk_24D23FBA8;
        goto LABEL_19;
      }
      if (v12)
      {
        v45 = CFSTR("IE_KEY_RSN_VERSION");
        v46 = CFSTR("IE_KEY_RSN_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F830;
        v16 = &unk_24D23FBC0;
        v47 = CFSTR("IE_KEY_RSN_UCIPHERS");
        v48 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v17 = &unk_24D23FBD8;
        goto LABEL_10;
      }
      if (v11)
      {
        v45 = CFSTR("IE_KEY_WPA_VERSION");
        v46 = CFSTR("IE_KEY_WPA_MCIPHER");
        *(_QWORD *)v50 = &unk_24D23F818;
        *(_QWORD *)&v50[8] = &unk_24D23F890;
        v35 = &unk_24D23FBF0;
        v47 = CFSTR("IE_KEY_WPA_UCIPHERS");
        v48 = CFSTR("IE_KEY_WPA_AUTHSELS");
        v36 = &unk_24D23FC08;
        goto LABEL_53;
      }
    }
    if (!v10)
      goto LABEL_22;
    v21 = MEMORY[0x24BDBD1C8];
    v22 = CFSTR("WEP");
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v50 = 136315650;
    *(_QWORD *)&v50[4] = "__WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback";
    *(_WORD *)&v50[12] = 2080;
    *(_QWORD *)&v50[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&v50[22] = 1024;
    LODWORD(v51) = 484;
    _os_log_send_and_compose_impl();
  }
  return 0;
}

void WiFiCloudSyncEngineStartEngine(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  NSObject *global_queue;
  int *v5;
  uint64_t v6;
  _QWORD block[5];
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v3)
      {
        v8 = 136315650;
        v9 = "WiFiCloudSyncEngineStartEngine";
        v10 = 2080;
        v11 = "WiFiCloudSyncEngine.m";
        v12 = 1024;
        v13 = 1300;
LABEL_5:
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      if (v3)
      {
        v8 = 136315650;
        v9 = "WiFiCloudSyncEngineStartEngine";
        v10 = 2080;
        v11 = "WiFiCloudSyncEngine.m";
        v12 = 1024;
        v13 = 1303;
        LODWORD(v6) = 28;
        v5 = &v8;
        _os_log_send_and_compose_impl();
      }
      objc_msgSend(*(id *)(a1 + 40), "enableIcloudSyncing:ForBundleId:", 1, *(_QWORD *)(a1 + 160), v5, v6);
      objc_msgSend(*(id *)(a1 + 48), "enableIcloudSyncing:ForBundleId:", 1, *(_QWORD *)(a1 + 160));
      *(_BYTE *)(a1 + 56) = 1;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = "WiFiCloudSyncEngineStartEngine";
        v10 = 2080;
        v11 = "WiFiCloudSyncEngine.m";
        v12 = 1024;
        v13 = 1311;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __WiFiCloudSyncEngineStartEngine_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(global_queue, block);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "WiFiCloudSyncEngineStartEngine";
    v10 = 2080;
    v11 = "WiFiCloudSyncEngine.m";
    v12 = 1024;
    v13 = 1297;
    goto LABEL_5;
  }
}

uint64_t __WiFiCloudSyncEngineMigrateToEncryptedKVS(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "keyValueStore"), "dictionaryRepresentation");
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "objectForKey:", CFSTR("enable_network_sync"));
  v29 = a1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136315650;
      v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
      v38 = 2080;
      v39 = "WiFiCloudSyncEngine.m";
      v40 = 1024;
      v41 = 528;
      LODWORD(v27) = 28;
      v25 = &v36;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "setObject:forKey:", &unk_24D23F8D8, CFSTR("version"));
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "keyValueStore");
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("enable_network_sync"));
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_msgSend(v2, "allKeys", v25, v27);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v6)
  {
    v8 = v6;
    v9 = CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_");
    v31 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v33 != v31)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2199D8164](v6, v7);
        v13 = objc_msgSend(v11, "length");
        v14 = -[__CFString length](v9, "length");
        if (!v3 && v13 < v14)
        {
          v15 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (id)objc_msgSend(__WiFiCloudSyncEngineTranslateFromLegacyFormat(v15), "mutableCopy");
            if (!v16)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_21;
              v36 = 136315906;
              v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
              v38 = 2080;
              v39 = "WiFiCloudSyncEngine.m";
              v40 = 1024;
              v41 = 559;
              v42 = 2112;
              v43 = v15;
              LODWORD(v28) = 38;
              v26 = &v36;
              goto LABEL_20;
            }
            v17 = v16;
            v18 = v9;
            v19 = v5;
            v20 = v2;
            __WiFiCloudSyncEngineAddVersionsToCloudNetwork(v16);
            v21 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SSID"));
            if (v21)
            {
              v22 = v21;
              v23 = (void *)objc_msgSend(*(id *)(v29 + 48), "keyValueStore");
              objc_msgSend(v23, "setObject:forKey:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("network."), v22));
              v2 = v20;
              v5 = v19;
              v9 = v18;
              v3 = 0;
              v8 = v30;
              goto LABEL_21;
            }
            v5 = v19;
            v9 = v18;
            v3 = 0;
            v8 = v30;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v36 = 136315906;
              v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
              v38 = 2080;
              v39 = "WiFiCloudSyncEngine.m";
              v40 = 1024;
              v41 = 554;
              v42 = 2112;
              v43 = v15;
              LODWORD(v28) = 38;
              v26 = &v36;
LABEL_20:
              _os_log_send_and_compose_impl();
            }
          }
        }
LABEL_21:
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      v8 = v6;
    }
    while (v6);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(v29 + 48), "keyValueStore", v26, v28), "synchronize");
}

void WiFiCloudSyncEnginePruneNetworksInCloud(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *global_queue;
  int *v21;
  uint64_t v22;
  _QWORD block[5];
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a2 && (objc_msgSend(a2, "isKVSEncrypted") & 1) == 0)
  {
    v5 = objc_msgSend(a3, "count");
    v6 = objc_msgSend(a3, "allKeys");
    if (v5)
    {
      v7 = (void *)v6;
      v8 = 0;
      v9 = MEMORY[0x24BDACB70];
      do
      {
        v10 = (void *)objc_msgSend(v7, "objectAtIndex:", v8, v21, v22);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136316162;
          v26 = "WiFiCloudSyncEnginePruneNetworksInCloud";
          v27 = 2080;
          v28 = "WiFiCloudSyncEngine.m";
          v29 = 1024;
          v30 = 1429;
          v31 = 2048;
          v32 = v8;
          v33 = 2112;
          v34 = v10;
          LODWORD(v22) = 48;
          v21 = &v25;
          _os_log_send_and_compose_impl();
        }
        if (!v10)
          goto LABEL_24;
        v11 = objc_msgSend(v10, "length");
        if (v11 >= objc_msgSend(CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_"), "length"))
          goto LABEL_24;
        v12 = (void *)objc_msgSend(a3, "objectForKey:", v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || __WiFiCloudSyncEngineGetNetworkSecurity(a2, v12))
          goto LABEL_24;
        if (v12)
        {
          if (a1)
          {
            if (*(_BYTE *)(a1 + 56))
            {
              if (objc_msgSend(a2, "isKVSEncrypted"))
                v13 = CFSTR("SSID");
              else
                v13 = CFSTR("SSID_STR");
              v14 = objc_msgSend(v12, "objectForKeyedSubscript:", v13, v21, v22);
              v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              if (v14)
              {
                if (v15)
                {
                  v25 = 136315906;
                  v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
                  v27 = 2080;
                  v28 = "WiFiCloudSyncEngine.m";
                  v29 = 1024;
                  v30 = 1395;
                  v31 = 2112;
                  v32 = v14;
                  LODWORD(v22) = 38;
                  v21 = &v25;
                  _os_log_send_and_compose_impl();
                }
                if (objc_msgSend(a2, "isKVSEncrypted", v21, v22))
                {
                  v21 = (int *)CFSTR("network.");
                  v22 = v14;
                  v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"));
                  v17 = a2;
                }
                else
                {
                  v17 = a2;
                  v16 = v14;
                }
                objc_msgSend(v17, "removeFromKVStore:", v16);
                goto LABEL_24;
              }
              if (v15)
              {
                v25 = 136315650;
                v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
                v27 = 2080;
                v28 = "WiFiCloudSyncEngine.m";
                v29 = 1024;
                v30 = 1394;
                LODWORD(v22) = 28;
                v21 = &v25;
                goto LABEL_34;
              }
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 136315650;
              v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
              v27 = 2080;
              v28 = "WiFiCloudSyncEngine.m";
              v29 = 1024;
              v30 = 1388;
              LODWORD(v22) = 28;
              v21 = &v25;
              goto LABEL_34;
            }
          }
          else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315650;
            v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
            v27 = 2080;
            v28 = "WiFiCloudSyncEngine.m";
            v29 = 1024;
            v30 = 1386;
            LODWORD(v22) = 28;
            v21 = &v25;
            goto LABEL_34;
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136315650;
          v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
          v27 = 2080;
          v28 = "WiFiCloudSyncEngine.m";
          v29 = 1024;
          v30 = 1384;
          LODWORD(v22) = 28;
          v21 = &v25;
LABEL_34:
          _os_log_send_and_compose_impl();
        }
LABEL_24:
        ++v8;
      }
      while (v5 != v8);
    }
    v18 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2, v21, v22);
    v19 = (id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer")), "mutableCopy");
    if (!v19)
      v19 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("UserDirected"));
    objc_msgSend((id)objc_msgSend(a2, "keyValueStore"), "removeObjectForKey:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"));
    objc_msgSend((id)objc_msgSend(a2, "keyValueStore"), "setObject:forKey:", v19, CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer"));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __WiFiCloudSyncEnginePruneNetworksInCloud_block_invoke;
    block[3] = &unk_24D23E4C0;
    block[4] = a2;
    dispatch_async(global_queue, block);
  }
}

uint64_t WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS(_QWORD *a1, void *a2, void *a3)
{
  uint64_t (*v6)(_QWORD);
  uint64_t result;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  CFIndex i;
  void *v16;
  const void *ValueAtIndex;
  id CloudFromNetworkFormatCallback;
  void *v19;
  NSObject *global_queue;
  uint64_t v21;
  void *v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _BOOL4 v47;
  int *v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _QWORD block[10];
  int v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1486;
    return _os_log_send_and_compose_impl();
  }
  if (!a2)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1488;
    return _os_log_send_and_compose_impl();
  }
  if (!a1[14])
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1491;
    return _os_log_send_and_compose_impl();
  }
  v6 = (uint64_t (*)(_QWORD))a1[15];
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (!(_DWORD)result)
      return result;
    v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1492;
    return _os_log_send_and_compose_impl();
  }
  if ((_DWORD)result)
  {
    v56 = 136315906;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1495;
    v62 = 2112;
    v63 = objc_msgSend(a3, "allKeys");
    LODWORD(v50) = 38;
    v48 = &v56;
    _os_log_send_and_compose_impl();
    v6 = (uint64_t (*)(_QWORD))a1[15];
  }
  v8 = (const __CFArray *)v6(a1[17]);
  v54 = a3;
  if (v8)
  {
    v9 = v8;
    Count = CFArrayGetCount(v8);
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (Count)
    {
      if (v11)
      {
        v56 = 136315906;
        v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
        v58 = 2080;
        v59 = "WiFiCloudSyncEngine.m";
        v60 = 1024;
        v61 = 1506;
        v62 = 2048;
        v63 = Count;
        LODWORD(v50) = 38;
        v48 = &v56;
        _os_log_send_and_compose_impl();
      }
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", Count);
      v14 = v12;
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          v16 = (void *)MEMORY[0x2199D8164](v12, v13);
          ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
          if (ValueAtIndex)
          {
            CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback((uint64_t)a1, a2, (uint64_t)ValueAtIndex);
            if (CloudFromNetworkFormatCallback)
            {
              v19 = CloudFromNetworkFormatCallback;
              objc_msgSend(v14, "insertObject:atIndex:", CloudFromNetworkFormatCallback, i);

            }
          }
          objc_autoreleasePoolPop(v16);
        }
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke;
      block[3] = &unk_24D23E558;
      block[8] = v9;
      block[9] = a1;
      v53 = v14;
      block[4] = v14;
      block[5] = a2;
      a3 = v54;
      block[6] = v54;
      block[7] = Count;
      dispatch_async(global_queue, block);
      goto LABEL_18;
    }
    if (v11)
    {
      v56 = 136315650;
      v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
      v58 = 2080;
      v59 = "WiFiCloudSyncEngine.m";
      v60 = 1024;
      v61 = 1504;
      LODWORD(v50) = 28;
      v48 = &v56;
      goto LABEL_69;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    v60 = 1024;
    v61 = 1501;
    LODWORD(v50) = 28;
    v48 = &v56;
LABEL_69:
    _os_log_send_and_compose_impl();
  }
  v53 = 0;
LABEL_18:
  v21 = objc_msgSend(a3, "count", v48, v50);
  v22 = (void *)objc_msgSend(a3, "allKeys");
  if (v21)
  {
    for (j = 0; v21 != j; ++j)
    {
      v24 = (void *)MEMORY[0x2199D8164]();
      v25 = (void *)objc_msgSend(v22, "objectAtIndex:", j);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v56 = 136316162;
        v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
        v58 = 2080;
        v59 = "WiFiCloudSyncEngine.m";
        v60 = 1024;
        v61 = 1628;
        v62 = 2048;
        v63 = j;
        v64 = 2112;
        v65 = v25;
        LODWORD(v51) = 48;
        v49 = &v56;
        _os_log_send_and_compose_impl();
      }
      if (objc_msgSend(a2, "isKVSEncrypted", v49, v51))
      {
        if (objc_msgSend(v25, "hasPrefix:", CFSTR("network.")))
        {
          v26 = objc_msgSend(a3, "objectForKey:", v25);
          if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v52 = objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("SSID"));
            v28 = (void *)objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("removedAt"));
            v29 = (void *)objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("addedAt"));
            v30 = __WiFiCloudSyncEngineIsCloudNetworkOnDevice(a2, v27, v53);
            if (v30)
            {
              v31 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("addedAt"));
              objc_msgSend(v28, "timeIntervalSinceReferenceDate");
              v33 = v32;
              objc_msgSend(v31, "timeIntervalSinceReferenceDate");
              if (v33 > v34)
              {
                a3 = v54;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  v60 = 1024;
                  v61 = 1648;
                  v62 = 2112;
                  v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
                  _os_log_send_and_compose_impl();
                }
                WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList((uint64_t)a1, a2, v27);
                goto LABEL_52;
              }
              objc_msgSend(v31, "timeIntervalSinceReferenceDate");
              v44 = v43;
              objc_msgSend(v29, "timeIntervalSinceReferenceDate");
              v46 = v45;
              v47 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              if (v44 < v46)
              {
                a3 = v54;
                if (v47)
                {
                  v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  v60 = 1024;
                  v61 = 1657;
                  v62 = 2112;
                  v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
                  goto LABEL_47;
                }
                goto LABEL_48;
              }
              a3 = v54;
              if (v47)
              {
                v56 = 136315906;
                v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                v58 = 2080;
                v59 = "WiFiCloudSyncEngine.m";
                v60 = 1024;
                v61 = 1653;
                v62 = 2112;
                v63 = v52;
                LODWORD(v51) = 38;
                v49 = &v56;
                goto LABEL_51;
              }
            }
            else
            {
              objc_msgSend(v28, "timeIntervalSinceReferenceDate");
              v39 = v38;
              objc_msgSend(v29, "timeIntervalSinceReferenceDate");
              v41 = v40;
              v42 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              if (v39 <= v41)
              {
                a3 = v54;
                if (v42)
                {
                  v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  v60 = 1024;
                  v61 = 1670;
                  v62 = 2112;
                  v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
LABEL_47:
                  _os_log_send_and_compose_impl();
                }
LABEL_48:
                WiFiCloudSyncEngineAddNetworkToKnownNetworksList((uint64_t)a1, a2, v27);
                goto LABEL_52;
              }
              a3 = v54;
              if (v42)
              {
                v56 = 136315906;
                v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                v58 = 2080;
                v59 = "WiFiCloudSyncEngine.m";
                v60 = 1024;
                v61 = 1666;
                v62 = 2112;
                v63 = v52;
                LODWORD(v51) = 38;
                v49 = &v56;
                goto LABEL_51;
              }
            }
          }
          else
          {
            objc_msgSend(a2, "removeFromKVStore:", v25);
          }
        }
      }
      else
      {
        if (!v25)
          goto LABEL_52;
        v35 = objc_msgSend(v25, "length");
        v36 = v35 >= objc_msgSend(CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_"), "length");
        a3 = v54;
        if (v36)
          goto LABEL_52;
        v37 = objc_msgSend(v54, "objectForKey:", v25);
        if (!v37)
          goto LABEL_52;
        v27 = (void *)v37;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_52;
        if (!__WiFiCloudSyncEngineIsCloudNetworkOnDevice(a2, v27, v53))
          goto LABEL_48;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v56 = 136315906;
          v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
          v58 = 2080;
          v59 = "WiFiCloudSyncEngine.m";
          v60 = 1024;
          v61 = 1690;
          v62 = 2112;
          v63 = (uint64_t)v25;
          LODWORD(v51) = 38;
          v49 = &v56;
LABEL_51:
          _os_log_send_and_compose_impl();
        }
      }
LABEL_52:
      objc_autoreleasePoolPop(v24);
    }
  }
  result = objc_msgSend(v22, "indexOfObject:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"), v49, v51);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(a2, "removeFromKVStore:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"));
  return result;
}

id __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  id v7;
  id v8;

  if (*(_QWORD *)(a1 + 112))
  {
    v6 = (void *)MEMORY[0x2199D8164]();
    v7 = (id)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 112))(a3, *(_QWORD *)(a1 + 136));
    if (objc_msgSend(a2, "isKVSEncrypted"))
    {
      v8 = __WiFiCloudSyncEngineTranslateFromLegacyFormat(v7);

      v7 = v8;
    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();
    return 0;
  }
  return v7;
}

void __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(uint64_t a1, void *a2, CFTypeRef cf, int a4)
{
  CFTypeRef v8;
  id CloudFromNetworkFormatCallback;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  int *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (!cf)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315650;
      v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      v35 = 2080;
      v36 = "WiFiCloudSyncEngine.m";
      v37 = 1024;
      v38 = 1997;
      _os_log_send_and_compose_impl();
    }
    v24 = 0;
    v8 = 0;
    goto LABEL_77;
  }
  v8 = CFRetain(cf);
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_76;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2002;
LABEL_75:
    _os_log_send_and_compose_impl();
    goto LABEL_76;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_76;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2004;
    goto LABEL_75;
  }
  if (!a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_76;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2006;
    goto LABEL_75;
  }
  if (!*(_QWORD *)(a1 + 112))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_76;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2009;
    goto LABEL_75;
  }
  if (!*(_QWORD *)(a1 + 96))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_76;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2010;
    goto LABEL_75;
  }
  CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(a1, a2, (uint64_t)v8);
  if (!CloudFromNetworkFormatCallback)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315650;
      v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      v35 = 2080;
      v36 = "WiFiCloudSyncEngine.m";
      v37 = 1024;
      v38 = 2014;
      goto LABEL_75;
    }
LABEL_76:
    v24 = 0;
LABEL_77:
    v30 = 0;
    v10 = 0;
    goto LABEL_57;
  }
  v10 = CloudFromNetworkFormatCallback;
  if (objc_msgSend(a2, "isKVSEncrypted"))
    v11 = CFSTR("SSID");
  else
    v11 = CFSTR("SSID_STR");
  v12 = objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v13)
    {
      v33 = 136315650;
      v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      v35 = 2080;
      v36 = "WiFiCloudSyncEngine.m";
      v37 = 1024;
      v38 = 2018;
LABEL_119:
      _os_log_send_and_compose_impl();
    }
LABEL_120:
    v24 = 0;
    goto LABEL_121;
  }
  if (v13)
  {
    v33 = 136315906;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2019;
    v39 = 2112;
    v40 = v12;
    LODWORD(v32) = 38;
    v31 = &v33;
    _os_log_send_and_compose_impl();
  }
  if ((objc_msgSend(a2, "isKVSEncrypted", v31, v32) & 1) != 0)
  {
    if (!__WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(a2, v10))
      goto LABEL_120;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2252;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v14 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("NOT_SYNCABLE"));
    if (v14 && objc_msgSend(v14, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2257;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v15 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_EAP"));
    if (!v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2261;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (objc_msgSend(v15, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2262;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v16 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_CUSTOMIZED"));
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2266;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (objc_msgSend(v16, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2267;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v17 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_CONFIGURED"));
    if (!v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2271;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (objc_msgSend(v17, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2272;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v18 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("AP_MODE"));
    if (v18 && objc_msgSend(v18, "intValue") != 2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2278;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v19 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_EXPIRABLE"));
    if (v19 && objc_msgSend(v19, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2284;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v20 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("enabled"));
    if (v20 && (objc_msgSend(v20, "BOOLValue") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2289;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v21 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_CARPLAY_ONLY"));
    if (v21 && objc_msgSend(v21, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2294;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (__WiFiCloudSyncEngineIsNetworkHidden(a2, v10))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2297;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (!__WiFiCloudSyncEngineGetNetworkSecurity(a2, v10))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2300;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    v22 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IS_NETWORK_CAPTIVE"));
    if (!v22 || objc_msgSend(v22, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        v35 = 2080;
        v36 = "WiFiCloudSyncEngine.m";
        v37 = 1024;
        v38 = 2304;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  if (!v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315650;
      v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      v35 = 2080;
      v36 = "WiFiCloudSyncEngine.m";
      v37 = 1024;
      v38 = 2026;
      goto LABEL_119;
    }
    goto LABEL_120;
  }
  v24 = v23;
  objc_msgSend(v23, "addEntriesFromDictionary:", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(a2, "isKVSEncrypted") & 1) == 0)
    {
      if (!objc_msgSend(v24, "objectForKey:", CFSTR("AP_MODE")))
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2), CFSTR("AP_MODE"));
      if (!objc_msgSend(v24, "objectForKey:", CFSTR("UserDirected")))
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), CFSTR("UserDirected"));
      if (!objc_msgSend(v24, "objectForKey:", CFSTR("enabled")))
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("enabled"));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddMissingKeysToCloudNetwork";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2516;
    _os_log_send_and_compose_impl();
  }
  if (!__WiFiCloudSyncEngineGetNetworkSecurity(a2, v24))
    goto LABEL_52;
  v25 = (*(uint64_t (**)(CFTypeRef, _QWORD))(a1 + 88))(cf, *(_QWORD *)(a1 + 136));
  v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v26)
    {
      v33 = 136315650;
      v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      v35 = 2080;
      v36 = "WiFiCloudSyncEngine.m";
      v37 = 1024;
      v38 = 2033;
      _os_log_send_and_compose_impl();
    }
    (*(void (**)(CFTypeRef, uint64_t, _QWORD))(a1 + 96))(v8, 1, *(_QWORD *)(a1 + 136));
LABEL_52:
    __WiFiCloudSyncEngineAddVersionsToCloudNetwork(v24);
    v27 = objc_msgSend(a2, "isKVSEncrypted");
    v28 = objc_alloc(MEMORY[0x24BDBCE70]);
    if (v27)
      v29 = objc_msgSend(v28, "initWithObjectsAndKeys:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("network."), v12), 0);
    else
      v29 = objc_msgSend(v28, "initWithObjectsAndKeys:", v24, v12, 0);
    v30 = (void *)v29;
    if (v29)
    {
      objc_msgSend(a2, "addToKVStore:synchronize:", v29, a4 != 0);
      goto LABEL_57;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_121;
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2048;
    goto LABEL_90;
  }
  if (v26)
  {
    v33 = 136315650;
    v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    v35 = 2080;
    v36 = "WiFiCloudSyncEngine.m";
    v37 = 1024;
    v38 = 2032;
LABEL_90:
    _os_log_send_and_compose_impl();
  }
LABEL_121:
  v30 = 0;
LABEL_57:

  if (v8)
    CFRelease(v8);
}

void *__WiFiCloudSyncEngineIsCloudNetworkOnDevice(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  int NetworkSecurity;

  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return 0;
LABEL_20:
    _os_log_send_and_compose_impl();
    return 0;
  }
  v6 = objc_msgSend(a3, "count");
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return 0;
    goto LABEL_20;
  }
  v7 = v6;
  if (v6 < 1)
    return 0;
  v8 = 0;
  while (1)
  {
    v9 = objc_msgSend(a3, "objectAtIndex:", v8);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(a1, "isKVSEncrypted") ? CFSTR("SSID") : CFSTR("SSID_STR");
      v12 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v11);
      v13 = objc_msgSend(a1, "isKVSEncrypted") ? CFSTR("SSID") : CFSTR("SSID_STR");
      if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v10, "objectForKeyedSubscript:", v13)))
      {
        NetworkSecurity = __WiFiCloudSyncEngineGetNetworkSecurity(a1, a2);
        if (NetworkSecurity == __WiFiCloudSyncEngineGetNetworkSecurity(a1, v10))
          break;
      }
    }
    if (v7 == ++v8)
      return 0;
  }
  return v10;
}

void WiFiCloudSyncEngineAddNetworkToCloud(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    goto LABEL_10;
  }
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(a1, *(void **)(a1 + 48), cf, 1);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
LABEL_10:
    _os_log_send_and_compose_impl();
}

void WiFiCloudSyncEngineRemoveNetworkFromCloud(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4;
  void *v5;
  id CloudFromNetworkFormatCallback;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (cf)
  {
    v4 = CFRetain(cf);
    if (a1)
    {
      if (*(_BYTE *)(a1 + 56))
      {
        v5 = *(void **)(a1 + 48);
        if (v5)
        {
          if (*(_QWORD *)(a1 + 112))
          {
            CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(a1, *(void **)(a1 + 48), (uint64_t)cf);
            if (CloudFromNetworkFormatCallback)
            {
              v7 = CloudFromNetworkFormatCallback;
              if (objc_msgSend(v5, "isKVSEncrypted"))
                v8 = CFSTR("SSID");
              else
                v8 = CFSTR("SSID_STR");
              v9 = objc_msgSend(v7, "objectForKeyedSubscript:", v8);
              v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              if (v9)
              {
                if (v10)
                {
                  v19 = 136315906;
                  v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
                  v21 = 2080;
                  v22 = "WiFiCloudSyncEngine.m";
                  v23 = 1024;
                  v24 = 2106;
                  v25 = 2112;
                  v26 = v9;
                  LODWORD(v16) = 38;
                  v15 = &v19;
                  _os_log_send_and_compose_impl();
                }
                if (objc_msgSend(v5, "isKVSEncrypted", v15, v16))
                {
                  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("network."), v9);
                  v12 = objc_msgSend((id)objc_msgSend(v5, "keyValueStore"), "objectForKey:", v11);
                  if (v12)
                  {
                    v13 = (void *)v12;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v14 = (id)objc_msgSend(v13, "mutableCopy");
                      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE60], "date"), CFSTR("removedAt"));
                      v17 = v11;
                      v18 = v14;
                      objc_msgSend(v5, "addToKVStore:synchronize:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1), 1);
                    }
                  }
                }
                else
                {
                  objc_msgSend(v5, "removeFromKVStore:", v9);
                }
              }
              else if (v10)
              {
                v19 = 136315650;
                v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
                v21 = 2080;
                v22 = "WiFiCloudSyncEngine.m";
                v23 = 1024;
                v24 = 2105;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_18;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
              v21 = 2080;
              v22 = "WiFiCloudSyncEngine.m";
              v23 = 1024;
              v24 = 2101;
              goto LABEL_34;
            }
LABEL_35:
            v7 = 0;
LABEL_18:

            if (v4)
              CFRelease(v4);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_35;
          v19 = 136315650;
          v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
          v21 = 2080;
          v22 = "WiFiCloudSyncEngine.m";
          v23 = 1024;
          v24 = 2097;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_35;
          v19 = 136315650;
          v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
          v21 = 2080;
          v22 = "WiFiCloudSyncEngine.m";
          v23 = 1024;
          v24 = 2094;
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        v19 = 136315650;
        v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
        v21 = 2080;
        v22 = "WiFiCloudSyncEngine.m";
        v23 = 1024;
        v24 = 2091;
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v19 = 136315650;
      v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
      v21 = 2080;
      v22 = "WiFiCloudSyncEngine.m";
      v23 = 1024;
      v24 = 2089;
    }
LABEL_34:
    _os_log_send_and_compose_impl();
    goto LABEL_35;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
    v21 = 2080;
    v22 = "WiFiCloudSyncEngine.m";
    v23 = 1024;
    v24 = 2084;
    _os_log_send_and_compose_impl();
  }
}

uint64_t WiFiCloudSyncEngineMergeKnownNetworksToCloud(uint64_t a1)
{
  void *v1;
  uint64_t result;

  if (!a1)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    return _os_log_send_and_compose_impl();
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    return _os_log_send_and_compose_impl();
  }
  v1 = *(void **)(a1 + 48);
  if (v1)
    return WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS((_QWORD *)a1, v1, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "dictionaryRepresentation"));
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
    return _os_log_send_and_compose_impl();
  return result;
}

uint64_t WiFiCloudSyncEngineGetLogCallbackFunction(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

uint64_t WiFiCloudSyncEngineIsRunning()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x2199D8164]();
  v1 = objc_alloc_init(MEMORY[0x24BDE84B8]);
  objc_msgSend(v1, "setContext:", *MEMORY[0x24BDE8508]);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE84B0]), "initWithContextData:", v1);
  if (v2)
  {
    v5 = 0;
    v3 = objc_msgSend(v2, "fetchUserControllableViewsSyncingEnabled:", &v5);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316162;
      v7 = "WiFiCloudSyncEngineIsRunning";
      v8 = 2080;
      v9 = "WiFiCloudSyncEngine.m";
      v10 = 1024;
      v11 = 2888;
      v12 = 1024;
      v13 = v3;
      v14 = 2112;
      v15 = v5;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    v3 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "WiFiCloudSyncEngineIsRunning";
      v8 = 2080;
      v9 = "WiFiCloudSyncEngine.m";
      v10 = 1024;
      v11 = 2892;
      _os_log_send_and_compose_impl();
      v3 = 0;
    }
  }
  objc_autoreleasePoolPop(v0);
  return v3;
}

uint64_t WiFiCloudSyncEngineCopyCompleteKVS(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 48;
  if (a2)
    v2 = 40;
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + v2), "keyValueStore"), "dictionaryRepresentation"), "copy");
}

uint64_t __WiFiCloudSyncEngineRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __wiFiCloudEngineTypeID = result;
  return result;
}

void __WiFiCloudSyncEngineRelease(uint64_t a1)
{
  __CFMachPort *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;
  NSObject *v6;
  __CFRunLoopTimer *v7;
  const void *v8;
  NSObject *v9;
  __CFMachPort *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  NSObject *v15;
  NSObject *v16;

  if (a1)
  {
    WiFiCloudSyncEngineStopEngine(a1);
    v2 = *(__CFMachPort **)(a1 + 176);
    if (v2)
    {
      CFMachPortInvalidate(v2);
      v3 = *(const void **)(a1 + 176);
      if (v3)
      {
        CFRelease(v3);
        *(_QWORD *)(a1 + 176) = 0;
      }
    }
    v4 = *(const void **)(a1 + 184);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 184) = 0;
    }
    v5 = *(NSObject **)(a1 + 216);
    if (v5)
      dispatch_release(v5);
    v6 = *(NSObject **)(a1 + 224);
    if (v6)
    {
      dispatch_source_cancel(v6);
      dispatch_release(*(dispatch_object_t *)(a1 + 224));
    }
    v7 = *(__CFRunLoopTimer **)(a1 + 248);
    if (v7)
    {
      CFRunLoopTimerInvalidate(v7);
      v8 = *(const void **)(a1 + 248);
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a1 + 248) = 0;
      }
    }
    v9 = *(NSObject **)(a1 + 256);
    if (v9)
    {
      dispatch_release(v9);
      *(_QWORD *)(a1 + 256) = 0;
    }
    v10 = *(__CFMachPort **)(a1 + 200);
    if (v10)
    {
      CFMachPortInvalidate(v10);
      v11 = *(const void **)(a1 + 200);
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(a1 + 200) = 0;
      }
    }
    v12 = *(const void **)(a1 + 208);
    if (v12)
    {
      CFRelease(v12);
      *(_QWORD *)(a1 + 208) = 0;
    }
    v13 = *(const void **)(a1 + 240);
    if (v13)
    {
      CFRelease(v13);
      *(_QWORD *)(a1 + 240) = 0;
    }
    v14 = *(const void **)(a1 + 144);
    if (v14)
    {
      CFRelease(v14);
      *(_QWORD *)(a1 + 144) = 0;
    }
    v15 = *(NSObject **)(a1 + 272);
    if (v15)
      dispatch_release(v15);
    v16 = *(NSObject **)(a1 + 280);
    if (v16)
      dispatch_release(v16);

    *(_QWORD *)(a1 + 160) = 0;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineKeychainSyncStateChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v5;

  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v5)
      _os_log_send_and_compose_impl();
    WiFiCloudSyncEngineCheckKeychainSyncState(a4);
  }
  else if (v5)
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineKeychainChangedNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v5;

  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v5)
      _os_log_send_and_compose_impl();
    *(_BYTE *)(a4 + 232) = 1;
    __WiFiCloudSyncEngineCheckWaitingForPasswordList(a4, *(void **)(a4 + 48));
  }
  else if (v5)
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineCheckWaitingForPasswordList(uint64_t a1, void *a2)
{
  double Current;
  const __CFArray *v5;
  double v6;
  __CFRunLoopTimer *v7;
  CFIndex Count;
  CFIndex v9;
  void *v10;
  uint64_t v11;
  void *ValueAtIndex;
  const void *NetworkFromCloudFormatCallback;
  CFDateRef v14;
  CFDateRef v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  double v25;
  double v26;
  const __CFAllocator *v27;
  __CFRunLoopTimer *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  __CFRunLoop *v33;
  uint64_t v34;
  const void *v35;
  NSObject *v36;
  double v37;
  _QWORD handler[6];
  _QWORD block[6];
  _QWORD v40[6];
  _QWORD v41[6];
  int v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BYTE v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2560;
    goto LABEL_37;
  }
  v5 = *(const __CFArray **)(a1 + 144);
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2561;
    goto LABEL_37;
  }
  if (!*(_QWORD *)(a1 + 240))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2562;
    goto LABEL_37;
  }
  if (!*(_QWORD *)(a1 + 104))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2563;
    goto LABEL_37;
  }
  if (!*(_QWORD *)(a1 + 72))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2566;
    goto LABEL_37;
  }
  v6 = Current;
  if (*(_QWORD *)(a1 + 16))
  {
    if (*(_QWORD *)(a1 + 24))
    {
      v7 = *(__CFRunLoopTimer **)(a1 + 248);
      if (v7)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          return;
        v42 = 136316418;
        v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        v44 = 2080;
        v45 = "WiFiCloudSyncEngine.m";
        v46 = 1024;
        v47 = 2570;
        v48 = 1024;
        *(_DWORD *)v49 = 5;
        *(_WORD *)&v49[4] = 2048;
        *(_QWORD *)&v49[6] = 0x4024000000000000;
        *(_WORD *)&v49[14] = 2048;
        *(double *)&v49[16] = CFRunLoopTimerGetNextFireDate(v7) - v6;
        goto LABEL_37;
      }
    }
  }
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 256))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v37 = *(double *)(a1 + 264) - v6;
    v42 = 136316418;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2573;
    v48 = 1024;
    *(_DWORD *)v49 = 5;
    *(_WORD *)&v49[4] = 2048;
    *(_QWORD *)&v49[6] = 0x4024000000000000;
    *(_WORD *)&v49[14] = 2048;
    *(double *)&v49[16] = v37;
    goto LABEL_37;
  }
  Count = CFArrayGetCount(v5);
  if (Count)
  {
    v9 = Count;
    if (*(_QWORD *)(a1 + 152) < Count)
    {
      v10 = (void *)MEMORY[0x2199D8164]();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 152);
        v42 = 136316162;
        v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        v44 = 2080;
        v45 = "WiFiCloudSyncEngine.m";
        v46 = 1024;
        v47 = 2605;
        v48 = 2048;
        *(_QWORD *)v49 = v9;
        *(_WORD *)&v49[8] = 2048;
        *(_QWORD *)&v49[10] = v11;
        _os_log_send_and_compose_impl();
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), *(_QWORD *)(a1 + 152));
      NetworkFromCloudFormatCallback = (const void *)__WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(a1, a2, ValueAtIndex);
      if (NetworkFromCloudFormatCallback)
      {
        v14 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
        if (v14)
        {
          v15 = v14;
          if (CFArrayGetCount(*(CFArrayRef *)(a1 + 240)) == 5)
            CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 240), 0);
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 240), v15);
          CFRelease(v15);
        }
        v16 = (*(uint64_t (**)(const void *, _QWORD))(a1 + 88))(NetworkFromCloudFormatCallback, *(_QWORD *)(a1 + 136));
        v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v17)
          {
            v18 = *(_QWORD *)(a1 + 152);
            v42 = 136315906;
            v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            v44 = 2080;
            v45 = "WiFiCloudSyncEngine.m";
            v46 = 1024;
            v47 = 2635;
            v48 = 2048;
            *(_QWORD *)v49 = v18;
            _os_log_send_and_compose_impl();
          }
          (*(void (**)(const void *, _QWORD))(a1 + 72))(NetworkFromCloudFormatCallback, *(_QWORD *)(a1 + 136));
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), *(_QWORD *)(a1 + 152));
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v42 = 136315650;
            v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            v44 = 2080;
            v45 = "WiFiCloudSyncEngine.m";
            v46 = 1024;
            v47 = 2642;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          if (v17)
          {
            v21 = *(_QWORD *)(a1 + 152);
            v42 = 136315906;
            v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            v44 = 2080;
            v45 = "WiFiCloudSyncEngine.m";
            v46 = 1024;
            v47 = 2630;
            v48 = 2048;
            *(_QWORD *)v49 = v21;
            _os_log_send_and_compose_impl();
          }
          ++*(_QWORD *)(a1 + 152);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v42 = 136315906;
          v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
          v44 = 2080;
          v45 = "WiFiCloudSyncEngine.m";
          v46 = 1024;
          v47 = 2611;
          v48 = 2112;
          *(_QWORD *)v49 = ValueAtIndex;
          _os_log_send_and_compose_impl();
        }
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), *(_QWORD *)(a1 + 152));
      }
      objc_autoreleasePoolPop(v10);
LABEL_42:
      v22 = (void *)MEMORY[0x2199D8164](v20);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 240)) == 5
        && (v23 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 240), 0)) != 0
        && (v25 = MEMORY[0x2199D7F0C](v23, v24), v6 > v25)
        && v6 - v25 <= 10.0)
      {
        v26 = v25 - v6 + 12.0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v42 = 136316418;
          v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
          v44 = 2080;
          v45 = "WiFiCloudSyncEngine.m";
          v46 = 1024;
          v47 = 2685;
          v48 = 1024;
          *(_DWORD *)v49 = 5;
          *(_WORD *)&v49[4] = 2048;
          *(_QWORD *)&v49[6] = 0x4024000000000000;
          *(_WORD *)&v49[14] = 2048;
          *(double *)&v49[16] = v26;
          _os_log_send_and_compose_impl();
        }
        if (*(_QWORD *)(a1 + 16) && *(_QWORD *)(a1 + 24))
        {
          v27 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_40;
          block[3] = &unk_24D23E600;
          block[4] = a2;
          block[5] = a1;
          v28 = CFRunLoopTimerCreateWithHandler(v27, v6 + v26, 0.0, 0, 0, block);
          *(_QWORD *)(a1 + 248) = v28;
          CFRunLoopAddTimer(*(CFRunLoopRef *)(a1 + 16), v28, *(CFRunLoopMode *)(a1 + 24));
        }
        v29 = *(NSObject **)(a1 + 32);
        if (v29)
        {
          v30 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v29);
          *(_QWORD *)(a1 + 256) = v30;
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2_42;
          handler[3] = &unk_24D23E530;
          handler[4] = a2;
          handler[5] = a1;
          dispatch_source_set_event_handler(v30, handler);
          v31 = *(NSObject **)(a1 + 256);
          v32 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
          dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0);
          *(double *)(a1 + 264) = v6 + v26;
          dispatch_activate(*(dispatch_object_t *)(a1 + 256));
        }
      }
      else
      {
        v33 = *(__CFRunLoop **)(a1 + 16);
        v34 = MEMORY[0x24BDAC760];
        if (v33)
        {
          v35 = *(const void **)(a1 + 24);
          if (v35)
          {
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke;
            v41[3] = &unk_24D23E530;
            v41[4] = a2;
            v41[5] = a1;
            CFRunLoopPerformBlock(v33, v35, v41);
            CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
          }
        }
        v36 = *(NSObject **)(a1 + 32);
        if (v36)
        {
          v40[0] = v34;
          v40[1] = 3221225472;
          v40[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2;
          v40[3] = &unk_24D23E530;
          v40[4] = a2;
          v40[5] = a1;
          dispatch_async(v36, v40);
        }
      }
      objc_autoreleasePoolPop(v22);
      if (NetworkFromCloudFormatCallback)
        CFRelease(NetworkFromCloudFormatCallback);
      return;
    }
    v19 = *(unsigned __int8 *)(a1 + 232);
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if ((_DWORD)v20)
      {
        v42 = 136315906;
        v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        v44 = 2080;
        v45 = "WiFiCloudSyncEngine.m";
        v46 = 1024;
        v47 = 2591;
        v48 = 2048;
        *(_QWORD *)v49 = v9;
        v20 = _os_log_send_and_compose_impl();
      }
      NetworkFromCloudFormatCallback = 0;
      *(_QWORD *)(a1 + 152) = 0;
      *(_BYTE *)(a1 + 232) = 0;
      goto LABEL_42;
    }
    if (!(_DWORD)v20)
      return;
    v42 = 136315906;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2598;
    v48 = 2048;
    *(_QWORD *)v49 = v9;
LABEL_37:
    _os_log_send_and_compose_impl();
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v42 = 136315650;
    v43 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    v44 = 2080;
    v45 = "WiFiCloudSyncEngine.m";
    v46 = 1024;
    v47 = 2580;
    _os_log_send_and_compose_impl();
  }
  __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
}

uint64_t __WiFiCloudSyncEngineStopKeychainChangedNotifications(uint64_t a1)
{
  __CFRunLoop *v2;
  const __CFString *v3;
  __CFRunLoopSource *v4;
  int v5;
  uint64_t result;

  if (a1)
  {
    v2 = *(__CFRunLoop **)(a1 + 16);
    if (v2 && (v3 = *(const __CFString **)(a1 + 24)) != 0)
    {
      v4 = *(__CFRunLoopSource **)(a1 + 208);
      if (!v4)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)result)
          return _os_log_send_and_compose_impl();
        return result;
      }
      CFRunLoopRemoveSource(v2, v4, v3);
    }
    else if (!*(_QWORD *)(a1 + 32))
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
        return _os_log_send_and_compose_impl();
      return result;
    }
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_10;
    v5 = *(_DWORD *)(a1 + 192);
    if (v5)
    {
      notify_cancel(v5);
LABEL_10:
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (!(_DWORD)result)
        return result;
      return _os_log_send_and_compose_impl();
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

void __WiFiCloudSyncEngineProcessCloudChangeEvent(NSObject **a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD block[14];

  block[13] = *MEMORY[0x24BDAC8D0];
  if (a1 && a3)
  {
    v6 = objc_msgSend(a3, "count");
    CFRetain(a1);
    dispatch_semaphore_wait(a1[35], 0xFFFFFFFFFFFFFFFFLL);
    v7 = a1[34];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ____WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke;
    block[3] = &unk_24D23E628;
    block[4] = a3;
    block[5] = a2;
    block[6] = v6;
    block[7] = a1;
    dispatch_async(v7, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __WiFiCloudSyncEngineProcessCloudNetworkChangeEvent(uint64_t a1, void *a2)
{
  uint64_t result;

  if (!a1)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    return _os_log_send_and_compose_impl();
  }
  if (a2)
    return objc_msgSend(a2, "readStoreValueForKey:");
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
    return _os_log_send_and_compose_impl();
  return result;
}

id __WiFiCloudSyncEngineTranslateFromLegacyFormat(void *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("SSID_STR")), CFSTR("SSID"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BSSID")), CFSTR("BSSID"));
  v3 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("WEP")), "BOOLValue");
  v4 = MEMORY[0x24BDBD1C8];
  if (v3)
    v5 = MEMORY[0x24BDBD1C8];
  else
    v5 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("isWEP"));
  if (objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("WPA_IE")))
    v6 = v4;
  else
    v6 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("isWPA"));
  if (objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RSN_IE")))
    v7 = v4;
  else
    v7 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("isWPA2"));
  if (objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("WPA3_RSN_IE")))
    v8 = v4;
  else
    v8 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("isWPA3"));
  if ((objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isWEP")), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isWPA")), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isWPA2")), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isWPA3")), "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isOpen"));
  }
  if ((objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isOpen")), "BOOLValue") & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_EAP")), "BOOLValue"))v9 = CFSTR("isEAP");
    else
      v9 = CFSTR("isPSK");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v9);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("UserDirected")), CFSTR("isHidden"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_CAPTIVE")), CFSTR("isCaptive"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_WHITELISTING_CAPTIVE")), CFSTR("isWhitelistedCaptive"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_EXPIRABLE")), "BOOLValue"))v10 = v4;
  else
    v10 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("isExpirable"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_CUSTOMIZED")), "BOOLValue"))v11 = v4;
  else
    v11 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("isCustom"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_CONFIGURED")), "BOOLValue"))v12 = v4;
  else
    v12 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("isProfileBased"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_APPBASED")), "BOOLValue"))v13 = v4;
  else
    v13 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("isAppBased"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_NETWORK_CARPLAY_ONLY")), "BOOLValue"))v14 = v4;
  else
    v14 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("isCarPlayOnly"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("AP_MODE")), "intValue") == 1)
    v15 = v4;
  else
    v15 = 0;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("isIBSS"));
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("enabled")), "BOOLValue"))
    v16 = 0;
  else
    v16 = v4;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("isAutoJoinDisabled"));
  v17 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("LOW_DATA_MODE"));
  if (v17)
  {
    v18 = v17;
    if (objc_msgSend(v17, "integerValue") == 1)
    {
      v19 = MEMORY[0x24BDBD1C8];
    }
    else
    {
      if (objc_msgSend(v18, "integerValue") != 2)
        goto LABEL_50;
      v19 = MEMORY[0x24BDBD1C0];
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("lowDataMode"));
  }
LABEL_50:
  v20 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("AddedAt"));
  if (!v20)
    v20 = objc_msgSend(MEMORY[0x24BDBCE60], "date");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("addedAt"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("UserJoinedAt")), CFSTR("lastJoinedByUserAt"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("lastJoinedBySystemAtWeek")), CFSTR("lastJoinedBySystemAtWeek"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("UserPreferredTimestamp")), CFSTR("preferredOrderTimestamp"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("minVersion")), CFSTR("minVersion"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("NOT_SYNCABLE")), CFSTR("NOT_SYNCABLE"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_PRIVACY_PROXY_ENABLED")), CFSTR("isPrivacyProxyEnabled"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_MOVING")), CFSTR("isMoving"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("IS_PUBLIC")), CFSTR("isPublic"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("was6GHzOnlyAtWeek")), CFSTR("was6GHzOnlyAtWeek"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("seamlessSSIDList")), CFSTR("seamlessSSIDList"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("privateMacPref")), CFSTR("privateMacPref"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("prvateMacPrefTimestamp")), CFSTR("prvateMacPrefTimestamp"));
  return (id)objc_msgSend(v2, "copy");
}

uint64_t __WiFiCloudSyncEngineAddVersionsToCloudNetwork(void *a1)
{
  uint64_t result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  const __CFData *CFProperty;
  const __CFData *v12;
  id v13;
  id v14;
  uint64_t v15;

  if (a1)
  {
    result = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("addedByVersion"));
    if (!result)
    {
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
      v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D23F168), "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")), "lowercaseString");
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProductVersion")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D23F168), "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")), "lowercaseString");
      v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProductName")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D23F168), "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")), "lowercaseString");
      v7 = *MEMORY[0x24BDD8B20];
      v8 = IOServiceMatching("IOPlatformExpertDevice");
      MatchingService = IOServiceGetMatchingService(v7, v8);
      if (MatchingService)
      {
        v10 = MatchingService;
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("model"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        if (CFProperty)
        {
          v12 = CFProperty;
          v13 = objc_alloc(MEMORY[0x24BDD17C8]);
          v14 = (id)objc_msgSend(v13, "initWithFormat:", CFSTR("%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", CFDataGetBytePtr(v12), 4));
          CFRelease(v12);
        }
        else
        {
          v14 = 0;
        }
        IOObjectRelease(v10);
      }
      else
      {
        v14 = 0;
      }
      v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D23F168), "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")), "lowercaseString");
      return objc_msgSend(a1, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@.%@.%ld"), v6, v5, v4, v15, 2), CFSTR("addedByVersion"));
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
      return _os_log_send_and_compose_impl();
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t result;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;

  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NOT_SYNCABLE"));
      if (v4 && objc_msgSend(v4, "BOOLValue"))
      {
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v19)
          goto LABEL_51;
      }
      else
      {
        v5 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isEAP"));
        if (v5 && objc_msgSend(v5, "BOOLValue"))
        {
          v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (v20)
            goto LABEL_51;
        }
        else
        {
          v6 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isCustom"));
          if (v6 && objc_msgSend(v6, "BOOLValue"))
          {
            v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
            result = 0;
            if (v21)
              goto LABEL_51;
          }
          else
          {
            v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isProfileBased"));
            if (v7 && objc_msgSend(v7, "BOOLValue"))
            {
              v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
              result = 0;
              if (v22)
                goto LABEL_51;
            }
            else
            {
              v8 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isIBSS"));
              if (v8 && objc_msgSend(v8, "BOOLValue"))
              {
                v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                result = 0;
                if (v23)
                  goto LABEL_51;
              }
              else
              {
                v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isExpirable"));
                if (v9 && objc_msgSend(v9, "BOOLValue"))
                {
                  v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                  result = 0;
                  if (v24)
                    goto LABEL_51;
                }
                else
                {
                  v10 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isAutoJoinDisabled"));
                  if (v10 && objc_msgSend(v10, "BOOLValue"))
                  {
                    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                    result = 0;
                    if (v25)
                      goto LABEL_51;
                  }
                  else
                  {
                    v11 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isCarPlayOnly"));
                    if (v11 && objc_msgSend(v11, "BOOLValue"))
                    {
                      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                      result = 0;
                      if (v26)
                        goto LABEL_51;
                    }
                    else if (__WiFiCloudSyncEngineIsNetworkHidden(a1, a2))
                    {
                      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                      result = 0;
                      if (v18)
                        goto LABEL_51;
                    }
                    else
                    {
                      v12 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isOpen"));
                      if (v12 && objc_msgSend(v12, "BOOLValue"))
                      {
                        v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                        result = 0;
                        if (v27)
                          goto LABEL_51;
                      }
                      else
                      {
                        v13 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("isCaptive"));
                        if (v13 && !objc_msgSend(v13, "BOOLValue"))
                          return 1;
                        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
                        result = 0;
                        if (v15)
                        {
LABEL_51:
                          _os_log_send_and_compose_impl();
                          return 0;
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
    }
    else
    {
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v17)
        goto LABEL_51;
    }
  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v16)
      goto LABEL_51;
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineIsNetworkHidden(void *a1, void *a2)
{
  const __CFString *v4;
  void *v5;

  if (!a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return 0;
LABEL_13:
    _os_log_send_and_compose_impl();
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return 0;
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "isKVSEncrypted"))
    v4 = CFSTR("isHidden");
  else
    v4 = CFSTR("UserDirected");
  v5 = (void *)objc_msgSend(a2, "objectForKey:", v4);
  if (v5)
    return objc_msgSend(v5, "BOOLValue");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    goto LABEL_13;
  return 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
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

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC398](allocator, flags, order, block, fireDate, interval);
}

CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBC3A0](timer);
  return result;
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x24BDAF178](name, notify_port, *(_QWORD *)&flags, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

