@implementation WLKReachabilityMonitor

- (void)_wifiDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[WLKReachabilityMonitor isWifiEnabled](self, "isWifiEnabled");
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Wifi did change: %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("WLKReachabilityMonitorWifiDidChange"), self);

}

- (BOOL)isWifiEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiEnabled");

  return v3;
}

- (void)_reachabilityDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[WLKReachabilityMonitor isNetworkReachable](self, "isNetworkReachable");
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Reachability did change: %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("WLKReachabilityMonitorReachabilityDidChange"), self);

}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_2);
  return (id)sharedInstance___sharedManager;
}

void __40__WLKReachabilityMonitor_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKReachabilityMonitor _init]([WLKReachabilityMonitor alloc], "_init");
  v1 = (void *)sharedInstance___sharedManager;
  sharedInstance___sharedManager = (uint64_t)v0;

}

- (id)_init
{
  WLKReachabilityMonitor *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLKReachabilityMonitor;
  v2 = -[WLKReachabilityMonitor init](&v8, sel_init);
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Adding reachability observers", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addNetworkReachableObserver:selector:", v2, sel__reachabilityDidChange_);

    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addWiFiObserver:selector:", v2, sel__wifiDidChange_);

  }
  return v2;
}

- (WLKReachabilityMonitor)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKReachabilityManagerInitException"), CFSTR("-init is not supported. Use +sharedManager."));

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWiFiObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WLKReachabilityMonitor;
  -[WLKReachabilityMonitor dealloc](&v5, sel_dealloc);
}

@end
