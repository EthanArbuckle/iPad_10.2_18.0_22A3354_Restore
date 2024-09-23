@implementation VTSiriEnabledMonitor

- (VTSiriEnabledMonitor)init
{
  VTSiriEnabledMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTSiriEnabledMonitor;
  v2 = -[VTEventMonitor init](&v4, sel_init);
  if (v2)
    v2->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  uint8_t v6[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AssistantPrefsChangedNotification, (CFStringRef)*MEMORY[0x24BE094B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Siri setting switch", v6, 2u);
  }
  self->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  uint8_t v5[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE094B0], 0);
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Siri setting switch", v5, 2u);
  }
}

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_isSiriEnabled = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__VTSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTSiriEnabledMonitor:didReceiveEnabled:", self, v4);

}

- (BOOL)isEnabled
{
  return self->_isSiriEnabled;
}

uint64_t __54__VTSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2065 != -1)
    dispatch_once(&sharedInstance_onceToken_2065, &__block_literal_global_2066);
  return (id)sharedInstance__sharedInstance_2067;
}

void __38__VTSiriEnabledMonitor_sharedInstance__block_invoke()
{
  VTSiriEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTSiriEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance_2067;
  sharedInstance__sharedInstance_2067 = (uint64_t)v0;

}

@end
