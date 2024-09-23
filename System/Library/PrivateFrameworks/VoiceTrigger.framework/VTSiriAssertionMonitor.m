@implementation VTSiriAssertionMonitor

- (VTSiriAssertionMonitor)init
{
  VTSiriAssertionMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTSiriAssertionMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_assertionState = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[VTSiriAssertionMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)VTSiriAssertionMonitor;
  -[VTEventMonitor dealloc](&v3, sel_dealloc);
}

- (void)enableAssertionReceived
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "did receive enable assertion", v4, 2u);
  }
  if (self->_assertionState != 2)
  {
    self->_assertionState = 2;
    -[VTSiriAssertionMonitor _notifyObserver:](self, "_notifyObserver:", -[VTSiriAssertionMonitor isEnabled](self, "isEnabled"));
  }
}

- (void)disableAssertionReceived
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "did receive disable assertion", v4, 2u);
  }
  if (self->_assertionState != 1)
  {
    self->_assertionState = 1;
    -[VTSiriAssertionMonitor _notifyObserver:](self, "_notifyObserver:", -[VTSiriAssertionMonitor isEnabled](self, "isEnabled"));
  }
}

- (void)_notifyObserver:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__VTSiriAssertionMonitor__notifyObserver___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_assertionState == 2;
}

void __42__VTSiriAssertionMonitor__notifyObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "VTSiriAssertionMonitor:didReceiveEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3360 != -1)
    dispatch_once(&sharedInstance_onceToken_3360, &__block_literal_global_3361);
  return (id)sharedInstance__sharedInstance_3362;
}

void __40__VTSiriAssertionMonitor_sharedInstance__block_invoke()
{
  VTSiriAssertionMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTSiriAssertionMonitor);
  v1 = (void *)sharedInstance__sharedInstance_3362;
  sharedInstance__sharedInstance_3362 = (uint64_t)v0;

}

@end
