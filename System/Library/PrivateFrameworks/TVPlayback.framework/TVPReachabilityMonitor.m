@implementation TVPReachabilityMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_2);
  return (id)sharedInstance___sharedManager;
}

void __40__TVPReachabilityMonitor_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TVPReachabilityMonitor _init]([TVPReachabilityMonitor alloc], "_init");
  v1 = (void *)sharedInstance___sharedManager;
  sharedInstance___sharedManager = (uint64_t)v0;

}

- (TVPReachabilityMonitor)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("TVPReachabilityMonitorInitException"), CFSTR("-init is not supported. Use +sharedManager."));

  return 0;
}

- (id)_init
{
  TVPReachabilityMonitor *v2;
  void *v3;
  void *v4;
  objc_super v6;
  sockaddr address;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)TVPReachabilityMonitor;
  v2 = -[TVPReachabilityMonitor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addNetworkReachableObserver:selector:", v2, sel__reachabilityDidChange_);

    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addWiFiObserver:selector:", v2, sel__wifiDidChange_);

    address = (sockaddr)xmmword_228AB2CB0;
    v2->_reachability = SCNetworkReachabilityCreateWithAddress(0, &address);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWiFiObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TVPReachabilityMonitor;
  -[TVPReachabilityMonitor dealloc](&v5, sel_dealloc);
}

- (void)_reachabilityDidChange:(id)a3
{
  TVPReachabilityMonitor *v4;
  TVPReachabilityMonitor *v5;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  SCNetworkReachabilityGetFlags(self->_reachability, &flags);
  v4 = self;
  objc_sync_enter(v4);
  if ((flags & 0x40000) != 0)
  {
    v4->_networkType = 2;
    objc_sync_exit(v4);
  }
  else
  {
    v4->_networkType = ((unint64_t)flags >> 1) & 1;
    objc_sync_exit(v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (TVPReachabilityMonitor *)objc_claimAutoreleasedReturnValue();
    -[TVPReachabilityMonitor postNotificationName:object:](v5, "postNotificationName:object:", CFSTR("TVPReachabilityMonitorReachabilityDidChange"), v4);
    v4 = v5;
  }

}

- (void)_wifiDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TVPReachabilityMonitorWifiDidChange"), self);

}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

- (BOOL)isWifiEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiEnabled");

  return v3;
}

- (unint64_t)networkType
{
  return self->_networkType;
}

@end
