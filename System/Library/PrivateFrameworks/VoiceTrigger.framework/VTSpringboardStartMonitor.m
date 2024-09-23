@implementation VTSpringboardStartMonitor

- (VTSpringboardStartMonitor)init
{
  VTSpringboardStartMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTSpringboardStartMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isSpringBoardStarted = 0;
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
    handler[2] = __55__VTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_24C7F4928;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Start monitoring : Springboard start";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      v6 = "Cannot start monitoring Springboard start because it was already started";
LABEL_6:
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_isSpringBoardStarted = -[VTSpringboardStartMonitor _checkSpringBoardStarted](self, "_checkSpringBoardStarted", v7);

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
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Springboard start", v5, 2u);
    }
  }
}

- (void)_didReceiveSpringboardStartedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__VTSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveSpringboardStarted:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__VTSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke;
  v3[3] = &unk_24C7F4950;
  v3[4] = self;
  v4 = a3;
  -[VTEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "VTSpringboardStartMonitor:didReceiveStarted:", self, v4);

}

- (BOOL)isSpringboardStarted
{
  return self->_isSpringBoardStarted;
}

- (BOOL)_checkSpringBoardStarted
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v4;
  int out_token;
  _BYTE state64[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      v2 = 0;
    }
    else
    {
      *(_QWORD *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      notify_cancel(out_token);
      v2 = *(_QWORD *)state64 != 0;
    }
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      *(_DWORD *)state64 = 138543362;
      *(_QWORD *)&state64[4] = v4;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "SpringBoard started = %{public}@", state64, 0xCu);
    }
  }
  return v2;
}

uint64_t __59__VTSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __66__VTSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55__VTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkSpringBoardStarted");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveSpringboardStarted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3000 != -1)
    dispatch_once(&sharedInstance_onceToken_3000, &__block_literal_global_3001);
  return (id)sharedInstance__sharedInstance_3002;
}

void __43__VTSpringboardStartMonitor_sharedInstance__block_invoke()
{
  VTSpringboardStartMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTSpringboardStartMonitor);
  v1 = (void *)sharedInstance__sharedInstance_3002;
  sharedInstance__sharedInstance_3002 = (uint64_t)v0;

}

@end
