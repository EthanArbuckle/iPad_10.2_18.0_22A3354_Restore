@implementation VTLockScreenMonitor

- (VTLockScreenMonitor)init
{
  VTLockScreenMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTLockScreenMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_lockScreenState = 4;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _QWORD handler[5];

  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __49__VTLockScreenMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_24C7F4928;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Start monitoring : Locked with passcode";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Cannot start monitoring Locked with passcode because it was already started";
LABEL_6:
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_lockScreenState = -[VTLockScreenMonitor _checkLockScreenState](self, "_checkLockScreenState", v7);

}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  uint8_t v5[16];

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Locked with passcode", v5, 2u);
    }
  }
}

- (unsigned)lockScreenState
{
  return self->_lockScreenState;
}

- (unsigned)_checkLockScreenState
{
  unsigned int v3;
  unsigned __int8 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = MKBGetDeviceLockState();
  if (v3 >= 4)
    v4 = 4;
  else
    v4 = v3;
  v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[VTLockScreenMonitor lockScreenStateDescription:](self, "lockScreenStateDescription:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Locked with passcode : %{public}@", (uint8_t *)&v9, 0xCu);

  }
  return v4;
}

- (id)lockScreenStateDescription:(unsigned __int8)a3
{
  if (a3 > 3u)
    return CFSTR("Unknown");
  else
    return off_24C7F4648[a3];
}

- (void)_didReceiveLockScreenStateChangedInQueue:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__VTLockScreenMonitor__didReceiveLockScreenStateChangedInQueue___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveLockScreenStateChanged:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__VTLockScreenMonitor__didReceiveLockScreenStateChanged___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withLockScreenState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTLockScreenMonitor:receivedLockScreenStateChanged:", self, v4);

}

uint64_t __57__VTLockScreenMonitor__didReceiveLockScreenStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withLockScreenState:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __64__VTLockScreenMonitor__didReceiveLockScreenStateChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withLockScreenState:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __49__VTLockScreenMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkLockScreenState");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveLockScreenStateChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4465 != -1)
    dispatch_once(&sharedInstance_onceToken_4465, &__block_literal_global_4466);
  return (id)sharedInstance__sharedInstance_4467;
}

void __37__VTLockScreenMonitor_sharedInstance__block_invoke()
{
  VTLockScreenMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTLockScreenMonitor);
  v1 = (void *)sharedInstance__sharedInstance_4467;
  sharedInstance__sharedInstance_4467 = (uint64_t)v0;

}

@end
