@implementation SCROConnection

+ (void)initialize
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const CFSetCallBacks *v7;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v4 = (void *)_Lock_0;
    _Lock_0 = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v6 = (void *)_ConfigLock;
    _ConfigLock = (uint64_t)v5;

    v7 = (const CFSetCallBacks *)MEMORY[0x24BDBD6B8];
    _PendingConnections = (uint64_t)CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]);
    _ActiveConnections = (uint64_t)CFSetCreateMutable(0, 0, v7);
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__createConnectionRunLoop, a1, 0);
  }
}

+ (void)_createConnectionRunLoop
{
  CFRunLoopSourceRef v3;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v5;
  void *v6;
  void *v7;
  CFRunLoopTimerContext v8;
  CFRunLoopSourceContext context;

  memset(&context, 0, 72);
  context.perform = (void (__cdecl *)(void *))_addConnections;
  v3 = CFRunLoopSourceCreate(0, 0, &context);
  v8.version = 0;
  memset(&v8.retain, 0, 24);
  v8.info = a1;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = CFRunLoopTimerCreate(0, Current + 630720000.0, 630720000.0, 0, 0, (CFRunLoopTimerCallBack)_retryHandler, &v8);
  objc_msgSend((id)_Lock_0, "lock", *(_OWORD *)&v8.version, *(_OWORD *)&v8.retain, v8.copyDescription);
  _RetryState_2 = 0xC1E6CEAF20000000;
  _ShouldLogDeath = 1;
  _ShouldLogRebirth = 0;
  _ConnectionSource = (uint64_t)v3;
  _ConnectionRetryTimer = (uint64_t)v5;
  _ConnectionRunLoop = (uint64_t)CFRunLoopGetCurrent();
  CFRunLoopAddSource((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopSourceRef)_ConnectionSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  CFRunLoopAddTimer((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopTimerRef)_ConnectionRetryTimer, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
  CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
  v6 = (void *)MEMORY[0x212BDDCF0](objc_msgSend((id)_Lock_0, "unlock"));
  objc_msgSend(a1, "_configServer");
  objc_autoreleasePoolPop(v6);
  while (1)
  {
    v7 = (void *)MEMORY[0x212BDDCF0]();
    CFRunLoopRun();
    objc_autoreleasePoolPop(v7);
  }
}

+ (BOOL)inUnitTests
{
  if (inUnitTests_onceToken != -1)
    dispatch_once(&inUnitTests_onceToken, &__block_literal_global_6);
  return inUnitTests_InUnitTests;
}

Class __29__SCROConnection_inUnitTests__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SCROLocalConnection"));
  inUnitTests_InUnitTests = result != 0;
  return result;
}

+ (void)_configServer
{
  const char *v3;

  if (NSClassFromString(CFSTR("SCROLocalConnection")))
    v3 = "com.apple.scrod.unittest";
  else
    v3 = "com.apple.scrod";
  objc_msgSend(a1, "_configServerWithMachServiceName:", v3);
}

+ (void)_configServerWithMachServiceName:(char *)a3
{
  int v5;
  ipc_space_t v6;
  kern_return_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  mach_port_name_t v10;
  mach_port_t v11;
  __CFRunLoopTimer *v12;
  CFAbsoluteTime Current;
  uint64_t v14;
  _QWORD block[5];

  if ((objc_msgSend((id)_ConfigLock, "tryLock") & 1) != 0)
  {
    v5 = 1;
    if ((_IsServerConfigured & 1) == 0 && _ConnectionRunLoop)
    {
      v6 = *MEMORY[0x24BDAEC58];
      HIDWORD(v14) = 0;
      v7 = bootstrap_look_up(*MEMORY[0x24BDAD2F0], a3, (mach_port_t *)&v14 + 1);
      objc_msgSend((id)_Lock_0, "lock");
      _ServerPort = HIDWORD(v14);
      objc_msgSend((id)_Lock_0, "unlock");
      if (v7)
      {
        if (v7 == 1102 && (objc_msgSend((id)objc_opt_class(), "inUnitTests") & 1) == 0)
        {
          _SCROD_LOG();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            +[SCROConnection _configServerWithMachServiceName:].cold.1((uint64_t)a3, v8);

        }
      }
      else
      {
        _DeathSource = MSHCreateMachServerSource();
        if (_DeathSource)
        {
          LODWORD(v14) = 0;
          v10 = _ServerPort;
          v11 = MSHGetMachPortFromSource();
          mach_port_request_notification(v6, v10, 72, 0, v11, 0x15u, (mach_port_t *)&v14);
          CFRunLoopAddSource((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopSourceRef)_DeathSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
          _IsServerConfigured = 1;
          v12 = (__CFRunLoopTimer *)_ConnectionRetryTimer;
          Current = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v12, Current + 630720000.0);
          CFSetApplyFunction((CFSetRef)_ActiveConnections, (CFSetApplierFunction)_startConnection, 0);
          CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
          CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
          if (_ShouldLogRebirth == 1)
          {
            _ShouldLogRebirth = 0;
            fwrite("Screen Reader Output Server: CONNECTED\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
          }
          v5 = 1;
          _ShouldLogDeath = 1;
          goto LABEL_18;
        }
        NSLog(CFSTR("ERROR:  Could not create Death Port for Screen Reader Output Server Source."));
      }
      v5 = 0;
    }
LABEL_18:
    objc_msgSend((id)_ConfigLock, "unlock", v14);
    if (!v5)
      objc_msgSend(a1, "_unconfigServerAndRetry:", 1);
    return;
  }
  if (*(double *)&_RetryState_1 < 10.0)
  {
    v9 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SCROConnection__configServerWithMachServiceName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __51__SCROConnection__configServerWithMachServiceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unconfigServerAndRetry:", 1);
}

+ (void)_unconfigServerAndRetry:(BOOL)a3
{
  _BOOL4 v3;
  double Current;
  unint64_t v5;
  double v6;
  __CFRunLoopTimer *v7;
  CFAbsoluteTime v8;

  v3 = a3;
  objc_msgSend((id)_ConfigLock, "lock");
  if (_IsServerConfigured == 1)
    CFSetApplyFunction((CFSetRef)_ActiveConnections, (CFSetApplierFunction)_stopConnection, 0);
  _IsServerConfigured = 0;
  if (_DeathSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)_DeathSource);
    CFRelease((CFTypeRef)_DeathSource);
    _DeathSource = 0;
  }
  objc_msgSend((id)_Lock_0, "lock");
  if (_ServerPort)
  {
    mach_port_deallocate(*MEMORY[0x24BDAEC58], _ServerPort);
    _ServerPort = 0;
  }
  objc_msgSend((id)_Lock_0, "unlock");
  if (v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)&_RetryState_2 <= 60.0)
    {
      ++_RetryState_0;
      HIDWORD(v5) = -858993459 * _RetryState_0;
      LODWORD(v5) = -858993459 * _RetryState_0;
      if ((v5 >> 1) <= 0x19999999)
      {
        _RetryState_0 = 0;
        v6 = *(double *)&_RetryState_1 + *(double *)&_RetryState_1;
        *(double *)&_RetryState_1 = *(double *)&_RetryState_1 + *(double *)&_RetryState_1;
        goto LABEL_12;
      }
    }
    else
    {
      _RetryState_1 = 0x3F847AE147AE147BLL;
      _RetryState_0 = 1;
    }
    v6 = *(double *)&_RetryState_1;
LABEL_12:
    if (v6 > 20.0)
      _RetryState_1 = 0x4034000000000000;
    _RetryState_2 = *(_QWORD *)&Current;
    v7 = (__CFRunLoopTimer *)_ConnectionRetryTimer;
    v8 = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v7, v8 + *(double *)&_RetryState_1);
    if (_ShouldLogDeath == 1)
    {
      _ShouldLogDeath = 0;
      fwrite("Screen Reader Output Server: NOT AVAILABLE\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    }
  }
  _ShouldLogRebirth = 1;
  objc_msgSend((id)_ConfigLock, "unlock");
}

+ (void)_addConnectionToRunLoop:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_configServer");
  objc_msgSend((id)_Lock_0, "lock");
  CFSetSetValue((CFMutableSetRef)_PendingConnections, v4);

  if (_ConnectionRunLoop)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
    CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
  }
  objc_msgSend((id)_Lock_0, "unlock");
}

- (SCROConnection)initWithHandlerType:(int)a3 delegate:(id)a4
{
  id v6;
  SCROConnection *v7;
  SCROConnection *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCROConnection;
  v7 = -[SCROConnection init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_handlerType = a3;
    objc_storeWeak(&v7->_delegate, v6);
    objc_msgSend((id)objc_opt_class(), "_addConnectionToRunLoop:", v8);
  }

  return v8;
}

- (void)invalidate
{
  __CFRunLoopSource *invalidationSource;
  BOOL v3;

  invalidationSource = self->_invalidationSource;
  if (invalidationSource)
    v3 = _ConnectionRunLoop == 0;
  else
    v3 = 1;
  if (!v3)
  {
    CFRunLoopSourceSignal(invalidationSource);
    CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
  }
}

- (void)_startConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2115BB000, log, OS_LOG_TYPE_ERROR, "Could not connect to Screen Reader Output Server.", v1, 2u);
}

void __34__SCROConnection__startConnection__block_invoke(uint64_t a1)
{
  SCROCallback *v2;

  v2 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 3, *(_QWORD *)(a1 + 32));
  -[SCROCallback postToHandler:](v2, "postToHandler:", *(_QWORD *)(a1 + 40));

}

- (void)_stopConnection
{
  id WeakRetained;
  unsigned __int8 v4;
  SCROCallback *v5;
  __CFRunLoopSource *pingSource;
  __CFRunLoopSource *invalidationSource;
  mach_port_name_t pingPort;
  id v9;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v4 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  v9 = WeakRetained;
  if ((v4 & 1) != 0 && WeakRetained)
  {
    v5 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 4, self);
    -[SCROCallback postToHandler:](v5, "postToHandler:", v9);

  }
  atomic_store(0, (unsigned __int8 *)&self->_isConnectionStarted);
  pingSource = self->_pingSource;
  if (pingSource)
  {
    CFRunLoopSourceInvalidate(pingSource);
    CFRelease(self->_pingSource);
    self->_pingSource = 0;
  }
  invalidationSource = self->_invalidationSource;
  if (invalidationSource)
  {
    CFRunLoopSourceInvalidate(invalidationSource);
    CFRelease(self->_invalidationSource);
    self->_invalidationSource = 0;
  }
  pingPort = self->_pingPort;
  if (pingPort)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], pingPort, 1u, -1);
    self->_pingPort = 0;
  }

}

- (int)sendEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  int v8;
  _BOOL8 v9;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  int v15;
  _DWORD v16[4];
  unsigned int v17;
  _OWORD v18[256];
  _OWORD v19[256];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v19, 0, 512);
  v17 = 0;
  *(_QWORD *)&v16[1] = 0;
  v16[0] = 0;
  memset(v18, 0, 512);
  v15 = 0;
  v13 = 0;
  v14 = 0;
  objc_msgSend(v4, "mainDictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v7 & 1) == 0)
  {
    v8 = 1;
    goto LABEL_6;
  }
  v9 = SCROSerializeWrapper(v5, 4096, v19, &v17, (void **)&v16[1], v16);
  LODWORD(v13) = v9;
  if (v9)
  {
    NSLog(CFSTR("Error while serializing data for sending to screenreader output server: %d"), v9);
LABEL_5:
    v8 = v13;
    goto LABEL_6;
  }
  objc_msgSend((id)_Lock_0, "lock");
  if (_ServerPort)
  {
    v11 = _SCROSendEvent(_ServerPort, 6000, self->_handlerType, (uint64_t)v19, v17, *(uint64_t *)&v16[1], v16[0], (uint64_t)v18, &v15, &v14, (_DWORD *)&v13 + 1, &v13);
    objc_msgSend((id)_Lock_0, "unlock");
    if (v16[0] && *(_QWORD *)&v16[1])
      munmap(*(void **)&v16[1], v16[0]);
    if (!(_DWORD)v11)
    {
      if ((_DWORD)v13)
      {
        NSLog(CFSTR("Error returned from server while sending data to screenreader output server: %d"), v13);
        if (HIDWORD(v13) && v14)
          munmap(v14, HIDWORD(v13));
      }
      else
      {
        if (!(v15 | HIDWORD(v13)))
          goto LABEL_28;
        v12 = SCROUnserializeWrapper((uint64_t)v18, v15, (uint64_t)v14, SHIDWORD(v13));
        LODWORD(v13) = v12;
        if (HIDWORD(v13) && v14)
        {
          munmap(v14, HIDWORD(v13));
          v12 = v13;
        }
        if (!(_DWORD)v12)
        {
LABEL_28:
          v8 = 0;
          goto LABEL_6;
        }
        NSLog(CFSTR("Error while deserializing data returned from screenreader output server: %d"), v12);
      }
      goto LABEL_5;
    }
    NSLog(CFSTR("Error while sending event to screenreader output server: %d"), v11);
    v8 = 1;
    if (HIDWORD(v13) && v14)
      munmap(v14, HIDWORD(v13));
  }
  else
  {
    objc_msgSend((id)_Lock_0, "unlock");
    v8 = 1;
    if (v16[0] && *(_QWORD *)&v16[1])
      munmap(*(void **)&v16[1], v16[0]);
  }
LABEL_6:

  return v8;
}

- (int)registerHandlerCallbackForKey:(int)a3
{
  unsigned __int8 v3;
  uint64_t v6;
  unsigned int v8;

  v8 = 0;
  v3 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v3 & 1) == 0)
    return 1;
  objc_msgSend((id)_Lock_0, "lock");
  if (!_ServerPort)
  {
    objc_msgSend((id)_Lock_0, "unlock");
    return 1;
  }
  v6 = _SCRORegisterForCallback(_ServerPort, 0x1770u, self->_identifier, self->_handlerType, a3, &v8);
  objc_msgSend((id)_Lock_0, "unlock");
  if ((_DWORD)v6)
  {
    NSLog(CFSTR("Error while sending register callback message to screenreader output server: %d"), v6);
    return 1;
  }
  if (!v8)
    return 0;
  NSLog(CFSTR("Error returned from server for register callback: %d"), v8);
  return v8;
}

- (int)setHandlerValue:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  int v9;
  _BOOL8 v10;
  uint64_t v12;
  _DWORD v13[3];
  unsigned int v14;
  unsigned int v15;
  _OWORD v16[256];
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  v15 = 0;
  memset(v16, 0, 512);
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v8 & 1) == 0)
    goto LABEL_2;
  v10 = SCROSerializeWrapper((uint64_t)v6, 4096, v16, &v14, (void **)&v13[1], v13);
  v9 = v10;
  v15 = v10;
  if (v10)
  {
    NSLog(CFSTR("Error while serializing data for sending to screenreader output server: %d"), v10);
    goto LABEL_5;
  }
  objc_msgSend((id)_Lock_0, "lock");
  if (_ServerPort)
  {
    v12 = _SCROSetValueForKey(_ServerPort, 6000, self->_handlerType, v4, (uint64_t)v16, v14, *(uint64_t *)&v13[1], v13[0], (int *)&v15);
    objc_msgSend((id)_Lock_0, "unlock");
    if (v13[0] && *(_QWORD *)&v13[1])
      munmap(*(void **)&v13[1], v13[0]);
    if ((_DWORD)v12)
    {
      NSLog(CFSTR("Error while sending value to screenreader output server: %d"), v12);
LABEL_2:
      v9 = 1;
      goto LABEL_5;
    }
    if (v15)
    {
      NSLog(CFSTR("Error returned from server while sending value to screenreader output server: %d"), v15);
      v9 = v15;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend((id)_Lock_0, "unlock");
    v9 = 1;
    if (v13[0] && *(_QWORD *)&v13[1])
    {
      munmap(*(void **)&v13[1], v13[0]);
      goto LABEL_2;
    }
  }
LABEL_5:

  return v9;
}

- (id)handlerArrayValueForKey:(int)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SCROConnection handlerValueForKey:](self, "handlerValueForKey:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)handlerValueForKey:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  int v11[3];
  int v12;
  unsigned int v13;
  _OWORD v14[256];
  uint64_t v15;

  v4 = MEMORY[0x24BDAC7A8](self, a2, *(_QWORD *)&a3);
  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  memset(v14, 0, 512);
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  v5 = atomic_load((unsigned __int8 *)(v4 + 48));
  if ((v5 & 1) != 0)
  {
    v6 = v3;
    objc_msgSend((id)_Lock_0, "lock");
    if (!_ServerPort)
    {
      objc_msgSend((id)_Lock_0, "unlock");
      return 0;
    }
    v7 = _SCROGetValueForKey(_ServerPort, 6000, *(unsigned int *)(v4 + 36), v6, (uint64_t)v14, (uint64_t)&v12, (uint64_t)&v11[1], (uint64_t)v11, &v13);
    objc_msgSend((id)_Lock_0, "unlock");
    if ((_DWORD)v7)
    {
      NSLog(CFSTR("Error while getting value from screenreader output server: %d"), v7);
      v8 = v11[0];
      if (v11[0] && *(_QWORD *)&v11[1])
LABEL_6:
        munmap(*(void **)&v11[1], v8);
    }
    else if (v13)
    {
      NSLog(CFSTR("Error returned from server while getting value from screenreader output server: %d"), v13);
      v8 = v11[0];
      if (v11[0] && *(_QWORD *)&v11[1])
        goto LABEL_6;
    }
    else if (v12 | v11[0])
    {
      v9 = SCROUnserializeWrapper((uint64_t)v14, v12, *(uint64_t *)&v11[1], v11[0]);
      v13 = v9;
      if (v11[0] && *(_QWORD *)&v11[1])
      {
        munmap(*(void **)&v11[1], v11[0]);
        v9 = v13;
      }
      if ((_DWORD)v9)
        NSLog(CFSTR("Error while deserializing data returned from screenreader output server: %d"), v9);
    }
  }
  return 0;
}

- (id)handlerValueForKey:(int)a3 withObject:(id)a4
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  _BOOL8 v12;
  uint64_t v14;
  size_t v15;
  void *v16;
  _BOOL8 v17;
  int v18[3];
  int v19;
  int v20[3];
  int v21;
  _BOOL4 v22;
  _OWORD __dst[256];
  _OWORD v24[256];
  uint64_t v25;

  v4 = MEMORY[0x24BDAC7A8](self, a2, *(_QWORD *)&a3);
  v6 = v5;
  v7 = v4;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = v8;
  v10 = v9;
  v22 = 0;
  memset(v24, 0, 512);
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  memset(__dst, 0, 512);
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v11 = atomic_load((unsigned __int8 *)(v7 + 48));
  if ((v11 & 1) != 0)
  {
    v12 = SCROSerializeWrapper((uint64_t)v9, 4096, v24, &v21, (void **)&v20[1], v20);
    v22 = v12;
    if (v12)
    {
      NSLog(CFSTR("Error while serializing data for sending to screenreader output server as an argument object: %d"), v12);
      goto LABEL_4;
    }
    objc_msgSend((id)_Lock_0, "lock");
    if (_ServerPort)
    {
      v14 = _SCROGetValueForKeyWithObject(_ServerPort, 6000, *(unsigned int *)(v7 + 36), v6, (int)v24, v21, v20[1], v20[0], __dst, &v19, &v18[1], v18, &v22);
      objc_msgSend((id)_Lock_0, "unlock");
      if (v20[0] && *(_QWORD *)&v20[1])
        munmap(*(void **)&v20[1], v20[0]);
      if ((_DWORD)v14)
      {
        NSLog(CFSTR("Error while getting value (with object arg) from screenreader output server: %d"), v14);
        v15 = v18[0];
        if (v18[0])
        {
          v16 = *(void **)&v18[1];
          if (*(_QWORD *)&v18[1])
LABEL_12:
            munmap(v16, v15);
        }
      }
      else if (v22)
      {
        NSLog(CFSTR("Error returned from server while getting value (with object arg) from screenreader output server: %d"), v22);
        v15 = v18[0];
        if (v18[0])
        {
          v16 = *(void **)&v18[1];
          if (*(_QWORD *)&v18[1])
            goto LABEL_12;
        }
      }
      else if (v19 | v18[0])
      {
        v17 = SCROUnserializeWrapper((uint64_t)__dst, v19, *(uint64_t *)&v18[1], v18[0]);
        v22 = v17;
        if (v18[0] && *(_QWORD *)&v18[1])
        {
          munmap(*(void **)&v18[1], v18[0]);
          v17 = v22;
        }
        if (v17)
          NSLog(CFSTR("Error while deserializing data returned from screenreader output server: %d"), v17);
      }
    }
    else
    {
      objc_msgSend((id)_Lock_0, "unlock");
      if (v20[0] && *(_QWORD *)&v20[1])
        munmap(*(void **)&v20[1], v20[0]);
    }
  }
LABEL_4:

  return 0;
}

- (int)performHandlerActionForKey:(int)a3
{
  unsigned __int8 v3;
  uint64_t v6;
  unsigned int v8;

  v8 = 0;
  v3 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v3 & 1) == 0)
    return 1;
  objc_msgSend((id)_Lock_0, "lock");
  if (!_ServerPort)
  {
    objc_msgSend((id)_Lock_0, "unlock");
    return 1;
  }
  v6 = _SCROPerformAction(_ServerPort, 0x1770u, self->_identifier, self->_handlerType, a3, &v8);
  objc_msgSend((id)_Lock_0, "unlock");
  if ((_DWORD)v6)
  {
    NSLog(CFSTR("Error while sending perform action message to screenreader output server: %d"), v6);
    return 1;
  }
  if (!v8)
    return 0;
  NSLog(CFSTR("Error returned from server for perform action: %d"), v8);
  return v8;
}

- (void)_ping
{
  id WeakRetained;
  unsigned __int8 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v4 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
    if ((v4 & 1) != 0)
    {
      objc_msgSend((id)_Lock_0, "lock");
      if (_ServerPort)
      {
        v5 = _SCROGetCallbacks(_ServerPort, 6000, self->_identifier);
        objc_msgSend((id)_Lock_0, "unlock");
        if ((_DWORD)v5)
          NSLog(CFSTR("Error while getting callback data from screenreader output server: %d"), v5);
      }
      else
      {
        objc_msgSend((id)_Lock_0, "unlock");
      }
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROConnection)initWithCoder:(id)a3
{
  id v4;
  SCROConnection *v5;

  v4 = a3;
  NSLog(CFSTR("Note: Secure coding of SCROConnection is only partial until there is a use case."));
  v5 = -[SCROConnection initWithHandlerType:delegate:](self, "initWithHandlerType:delegate:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("handlerType")), 0);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_handlerType, CFSTR("handlerType"));
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

+ (void)_configServerWithMachServiceName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_2115BB000, a2, OS_LOG_TYPE_ERROR, "Could not find bootstrap server for Screen Reader Output Server. name:%s", (uint8_t *)&v2, 0xCu);
}

@end
