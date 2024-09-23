@implementation VTLanguageCodeUpdateMonitor

- (VTLanguageCodeUpdateMonitor)init
{
  VTLanguageCodeUpdateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTLanguageCodeUpdateMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_opt_class())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback, (CFStringRef)*MEMORY[0x24BE08DE0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Siri language code", v6, 2u);
    }
  }
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_opt_class())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE08DE0], 0);
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Siri language code", v5, 2u);
    }
  }
}

- (void)_didReceiveLanguageCodeUpdate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AFPreferencesMobileUserSessionLanguage();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Siri language changed to : %{public}@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__VTLanguageCodeUpdateMonitor__didReceiveLanguageCodeUpdate__block_invoke;
  v6[3] = &unk_24C7F3A80;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);

}

- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "VTLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:", self, v6);

}

uint64_t __60__VTLanguageCodeUpdateMonitor__didReceiveLanguageCodeUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withLanguageCode:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_439 != -1)
    dispatch_once(&sharedInstance_onceToken_439, &__block_literal_global_440);
  return (id)sharedInstance__sharedInstance;
}

void __45__VTLanguageCodeUpdateMonitor_sharedInstance__block_invoke()
{
  VTLanguageCodeUpdateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTLanguageCodeUpdateMonitor);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
