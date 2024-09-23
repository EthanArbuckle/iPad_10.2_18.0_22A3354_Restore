@implementation VTLowPowerModeMonitor

- (VTLowPowerModeMonitor)init
{
  VTLowPowerModeMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTLowPowerModeMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_powerMode = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didReceiveLowPowerModeChanged, *MEMORY[0x24BDD1160], 0);

  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Low power mode", v6, 2u);
  }
  self->_powerMode = -[VTLowPowerModeMonitor _checkPowerMode](self, "_checkPowerMode");
}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD1160], 0);

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Low power mode", v5, 2u);
  }
}

- (void)_didReceiveLowPowerModeChanged
{
  uint64_t v3;

  v3 = -[VTLowPowerModeMonitor _checkPowerMode](self, "_checkPowerMode");
  self->_powerMode = v3;
  -[VTLowPowerModeMonitor _didReceiveLowPowerModeChangedInQueue:](self, "_didReceiveLowPowerModeChangedInQueue:", v3);
}

- (void)_didReceiveLowPowerModeChangedInQueue:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__VTLowPowerModeMonitor__didReceiveLowPowerModeChangedInQueue___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withPowerMode:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTLowPowerModeMonitor:didReceivePowerModeChanged:", self, v4);

}

- (unsigned)powerMode
{
  return self->_powerMode;
}

- (unsigned)_checkPowerMode
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Low power mode : %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)isLowPowerMode
{
  return self->_powerMode == 2;
}

uint64_t __63__VTLowPowerModeMonitor__didReceiveLowPowerModeChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withPowerMode:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2824 != -1)
    dispatch_once(&sharedInstance_onceToken_2824, &__block_literal_global_2825);
  return (id)sharedInstance__sharedInstance_2826;
}

void __39__VTLowPowerModeMonitor_sharedInstance__block_invoke()
{
  VTLowPowerModeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTLowPowerModeMonitor);
  v1 = (void *)sharedInstance__sharedInstance_2826;
  sharedInstance__sharedInstance_2826 = (uint64_t)v0;

}

@end
