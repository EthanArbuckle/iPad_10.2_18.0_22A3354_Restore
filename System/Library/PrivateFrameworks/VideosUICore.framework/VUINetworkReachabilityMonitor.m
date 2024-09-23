@implementation VUINetworkReachabilityMonitor

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v4, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- network reachability changed", v5, 2u);
  }

  -[VUINetworkReachabilityMonitor _updateNetworkReachability](self, "_updateNetworkReachability");
}

- (void)setNetworkReachable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 networkReachable;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  VUICDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    networkReachable = self->_networkReachable;
    *(_DWORD *)buf = 67109376;
    v14 = networkReachable;
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_1D951F000, v5, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- set network reachable -- before %d -- after %d", buf, 0xEu);
  }

  if (self->_networkReachable != v3)
  {
    self->_networkReachable = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("VUINetworkReachabilityMonitorNetworkReachabilityDidChangeUserInfoKeyNetworkReachable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    VUICDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D951F000, v9, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- Posting NetworkReachabilityDidChangeNotification", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUINetworkReachabilityMonitorNetworkReachabilityDidChangeNotification"), self, v8);

  }
}

- (void)_updateNetworkReachability
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VUINetworkReachabilityMonitor__updateNetworkReachability__block_invoke;
  block[3] = &unk_1E9F2C048;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)isNetworkReachable
{
  return self->_networkReachable;
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1)
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_11);
  return (id)sharedInstance___sharedInstance;
}

void __47__VUINetworkReachabilityMonitor_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUINetworkReachabilityMonitor _init]([VUINetworkReachabilityMonitor alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  VUINetworkReachabilityMonitor *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUINetworkReachabilityMonitor;
  v2 = -[VUINetworkReachabilityMonitor init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerObserver:", v2);

    v2->_networkReachable = objc_msgSend((id)objc_opt_class(), "_isNetworkReachable");
  }
  return v2;
}

+ (BOOL)_isNetworkReachable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRemoteServerLikelyReachable");

  return v3;
}

uint64_t __59__VUINetworkReachabilityMonitor__updateNetworkReachability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNetworkReachable:", objc_msgSend((id)objc_opt_class(), "_isNetworkReachable"));
}

- (VUINetworkReachabilityMonitor)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v4, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- network type changed", v5, 2u);
  }

  -[VUINetworkReachabilityMonitor _updateNetworkReachability](self, "_updateNetworkReachability");
}

- (id)networkTypeChangedNotificationToken
{
  return self->_networkTypeChangedNotificationToken;
}

- (void)setNetworkTypeChangedNotificationToken:(id)a3
{
  objc_storeStrong(&self->_networkTypeChangedNotificationToken, a3);
}

- (id)networkReachabilityChangedNotificationToken
{
  return self->_networkReachabilityChangedNotificationToken;
}

- (void)setNetworkReachabilityChangedNotificationToken:(id)a3
{
  objc_storeStrong(&self->_networkReachabilityChangedNotificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkReachabilityChangedNotificationToken, 0);
  objc_storeStrong(&self->_networkTypeChangedNotificationToken, 0);
}

@end
