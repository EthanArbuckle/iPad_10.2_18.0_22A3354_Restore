@implementation VTAssetMonitor

- (VTAssetMonitor)init
{
  VTAssetMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTAssetMonitor;
  result = -[VTEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v3;
  uint8_t v4[8];
  _QWORD handler[5];

  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __44__VTAssetMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_24C7F4928;
    handler[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated", &self->_notifyToken, (dispatch_queue_t)a3, handler);
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring : Asset meta update", v4, 2u);
    }
  }
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
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Asset meta update", v5, 2u);
    }
  }
}

- (void)notifyNewAssetDownloaded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__VTAssetMonitor_notifyNewAssetDownloaded__block_invoke;
  v2[3] = &unk_24C7F46C0;
  v2[4] = self;
  -[VTEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v2);
}

- (void)_didReceiveNewAssetAvailable
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "New asset is available", buf, 2u);
  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__VTAssetMonitor__didReceiveNewAssetAvailable__block_invoke;
  v4[3] = &unk_24C7F46C0;
  v4[4] = self;
  -[VTEventMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[VTEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "VTAssetMonitor:didReceiveNewAssetAvailable:", self, 1);

}

uint64_t __46__VTAssetMonitor__didReceiveNewAssetAvailable__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __42__VTAssetMonitor_notifyNewAssetDownloaded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __44__VTAssetMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewAssetAvailable");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2785 != -1)
    dispatch_once(&sharedInstance_onceToken_2785, &__block_literal_global_2786);
  return (id)sharedInstance__sharedInstance_2787;
}

void __32__VTAssetMonitor_sharedInstance__block_invoke()
{
  VTAssetMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VTAssetMonitor);
  v1 = (void *)sharedInstance__sharedInstance_2787;
  sharedInstance__sharedInstance_2787 = (uint64_t)v0;

}

@end
