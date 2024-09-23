@implementation VTSiriRestrictionOnLockScreenMonitor

- (VTSiriRestrictionOnLockScreenMonitor)init
{
  VTSiriRestrictionOnLockScreenMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTSiriRestrictionOnLockScreenMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_isRestricted = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BE63CB8], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Setting preference change", v6, 2u);
  }
  self->_isRestricted = -[VTSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen](self, "_checkSiriRestrictedOnLockScreen");
}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x24BE63CB8], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Setting preference change", v5, 2u);
  }
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (BOOL)_checkSiriRestrictedOnLockScreen
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB8], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637E8]);

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3 == 2)
      v5 = CFSTR("YES");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Siri restricted on lock screen : %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3 == 2;
}

- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveRestrictionChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTSiriRestrictionOnLockScreenMonitor:didReceiveRestrictionChanged:", self, v4);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  _BOOL8 v5;

  v5 = -[VTSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen](self, "_checkSiriRestrictedOnLockScreen", a3, a4);
  self->_isRestricted = v5;
  -[VTSiriRestrictionOnLockScreenMonitor _didReceiveRestrictionChanged:](self, "_didReceiveRestrictionChanged:", v5);
}

uint64_t __70__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withRestricted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withRestricted:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3251 != -1)
    dispatch_once(&sharedInstance_onceToken_3251, &__block_literal_global_3252);
  return (id)sharedInstance__sharedInstance_3253;
}

void __54__VTSiriRestrictionOnLockScreenMonitor_sharedInstance__block_invoke()
{
  VTSiriRestrictionOnLockScreenMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTSiriRestrictionOnLockScreenMonitor);
  v1 = (void *)sharedInstance__sharedInstance_3253;
  sharedInstance__sharedInstance_3253 = (uint64_t)v0;

}

@end
