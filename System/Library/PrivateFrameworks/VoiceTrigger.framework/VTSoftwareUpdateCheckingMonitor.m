@implementation VTSoftwareUpdateCheckingMonitor

- (VTSoftwareUpdateCheckingMonitor)init
{
  VTSoftwareUpdateCheckingMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTSoftwareUpdateCheckingMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isSoftwareUpdateCheckingRunning = 0;
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
    handler[2] = __61__VTSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_24C7F4928;
    handler[4] = self;
    notify_register_dispatch("com.apple.duetscheduler.restartCheckNotification", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Start monitoring : Software update checking state";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Cannot start monitoring software update checking state because it was already started";
LABEL_6:
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_isSoftwareUpdateCheckingRunning = -[VTSoftwareUpdateCheckingMonitor _checkSoftwareUpdateCheckingState](self, "_checkSoftwareUpdateCheckingState", v7);

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
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Software update checking state", v5, 2u);
    }
  }
}

- (BOOL)_checkSoftwareUpdateCheckingState
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = -[VTSoftwareUpdateCheckingMonitor _softwareUpdateCheckingState](self, "_softwareUpdateCheckingState");
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (!v2)
      v4 = CFSTR("YES");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Software update checking running : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return v2 == 0;
}

- (unsigned)_softwareUpdateCheckingState
{
  uint64_t v3;
  int out_token;

  out_token = -1;
  notify_register_check("com.apple.duetscheduler.restartCheckNotification", &out_token);
  if (out_token == -1)
    return 2;
  v3 = 0;
  notify_get_state(out_token, &v3);
  notify_cancel(out_token);
  return v3 == 0;
}

- (BOOL)isSoftwareUpdateCheckingRunning
{
  return self->_isSoftwareUpdateCheckingRunning;
}

- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __88__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTSoftwareUpdateCheckingMonitor:didReceiveStateChanged:", self, v4);

}

uint64_t __81__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withSoftwareUpdateCheckingRunning:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__VTSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withSoftwareUpdateCheckingRunning:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __61__VTSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkSoftwareUpdateCheckingState");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveSoftwareUpdateCheckingStateChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5941 != -1)
    dispatch_once(&sharedInstance_onceToken_5941, &__block_literal_global_5942);
  return (id)sharedInstance__sharedInstance_5943;
}

void __49__VTSoftwareUpdateCheckingMonitor_sharedInstance__block_invoke()
{
  VTSoftwareUpdateCheckingMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTSoftwareUpdateCheckingMonitor);
  v1 = (void *)sharedInstance__sharedInstance_5943;
  sharedInstance__sharedInstance_5943 = (uint64_t)v0;

}

@end
