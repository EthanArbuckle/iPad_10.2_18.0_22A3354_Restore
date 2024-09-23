@implementation VTAudioRouteChangeMonitor

- (VTAudioRouteChangeMonitor)init
{
  VTAudioRouteChangeMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTAudioRouteChangeMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_hearstConnection = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[VTAudioRouteChangeMonitor _CMSessionDispatchQueue](self, "_CMSessionDispatchQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__VTAudioRouteChangeMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "VTAudioRouteChangeMonitorDidChangeAudioRoute:", self);

}

- (void)updateExternalRouteConnectionStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[VTAudioRouteChangeMonitor _CMSessionDispatchQueue](self, "_CMSessionDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unint64_t)hearstConnectionStatus
{
  return self->_hearstConnection;
}

- (unint64_t)_updateHearstConnectionStatus
{
  return 2;
}

- (BOOL)_hasInEarDetectSupport:(__CFDictionary *)a3
{
  const void *v4;
  const __CFBoolean *Value;
  BOOL result;

  v4 = (const void *)*MEMORY[0x24BE64B38];
  result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x24BE64B38]))
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value))
      return 1;
  }
  return result;
}

- (BOOL)_isActiveRoute:(__CFDictionary *)a3
{
  const void *v4;
  const __CFBoolean *Value;
  BOOL result;

  v4 = (const void *)*MEMORY[0x24BE64B40];
  result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x24BE64B40]))
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value))
      return 1;
  }
  return result;
}

- (BOOL)_hasDoAPSupport:(__CFDictionary *)a3
{
  const void *v4;
  const __CFBoolean *Value;
  BOOL result;

  v4 = (const void *)*MEMORY[0x24BE64B30];
  result = 0;
  if (CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x24BE64B30]))
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a3, v4);
    if (CFBooleanGetValue(Value))
      return 1;
  }
  return result;
}

- (id)_CMSessionDispatchQueue
{
  if (-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::onceToken != -1)
    dispatch_once(&-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::onceToken, &__block_literal_global_6_4910);
  return (id)-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::gCMSessionQueue;
}

void __52__VTAudioRouteChangeMonitor__CMSessionDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("VT_CMSessionDispatchQueue", 0);
  v1 = (void *)-[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::gCMSessionQueue;
  -[VTAudioRouteChangeMonitor _CMSessionDispatchQueue]::gCMSessionQueue = (uint64_t)v0;

}

uint64_t __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 32), "_updateHearstConnectionStatus");
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    *(_DWORD *)buf = 67240192;
    v8 = v3;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "Hearst connection status = %{public}d", buf, 8u);
  }
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke_4;
  v6[3] = &unk_24C7F46C0;
  v6[4] = v4;
  return objc_msgSend(v4, "enumerateObserversInQueue:", v6);
}

uint64_t __64__VTAudioRouteChangeMonitor_updateExternalRouteConnectionStatus__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __55__VTAudioRouteChangeMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateHearstConnectionStatus");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  if (+[VTAudioRouteChangeMonitor sharedInstance]::onceToken != -1)
    dispatch_once(&+[VTAudioRouteChangeMonitor sharedInstance]::onceToken, &__block_literal_global_4919);
  return (id)+[VTAudioRouteChangeMonitor sharedInstance]::sharedInstance;
}

void __43__VTAudioRouteChangeMonitor_sharedInstance__block_invoke()
{
  VTAudioRouteChangeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTAudioRouteChangeMonitor);
  v1 = (void *)+[VTAudioRouteChangeMonitor sharedInstance]::sharedInstance;
  +[VTAudioRouteChangeMonitor sharedInstance]::sharedInstance = (uint64_t)v0;

}

@end
