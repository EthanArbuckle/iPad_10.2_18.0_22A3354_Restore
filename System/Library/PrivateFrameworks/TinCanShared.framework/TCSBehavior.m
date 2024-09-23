@implementation TCSBehavior

- (TCSBehavior)init
{
  TCSBehavior *v2;
  uint64_t v3;
  NSString *regionCode;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TCSBehavior;
  v2 = -[TCSBehavior init](&v11, sel_init);
  if (v2)
  {
    v2->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot = objc_msgSend((id)objc_opt_class(), "_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot");
    v2->_isAppleInternalInstall = objc_msgSend((id)objc_opt_class(), "_isAppleInternalInstall");
    v2->_isM8Device = objc_msgSend((id)objc_opt_class(), "_isM8Device");
    v2->_isRunningInStoreDemoModeOrSimulator = objc_msgSend((id)objc_opt_class(), "_isRunningInStoreDemoModeOrSimulator");
    objc_msgSend((id)objc_opt_class(), "_regionCode");
    v3 = objc_claimAutoreleasedReturnValue();
    regionCode = v2->_regionCode;
    v2->_regionCode = (NSString *)v3;

    if (!v2->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot)
    {
      objc_initWeak(&location, v2);
      v5 = MEMORY[0x24BDAC9B8];
      v6 = MEMORY[0x24BDAC9B8];
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __19__TCSBehavior_init__block_invoke;
      v8[3] = &unk_24CFC2550;
      objc_copyWeak(&v9, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v2->_firstUnlockToken, v5, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __19__TCSBehavior_init__block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[2] == a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleDeviceFirstUnlock");
    WeakRetained = v4;
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_firstUnlockToken);
  v3.receiver = self;
  v3.super_class = (Class)TCSBehavior;
  -[TCSBehavior dealloc](&v3, sel_dealloc);
}

+ (id)sharedBehavior
{
  if (sharedBehavior_onceToken != -1)
    dispatch_once(&sharedBehavior_onceToken, &__block_literal_global_1);
  return (id)sharedBehavior__defaultBehavior;
}

void __29__TCSBehavior_sharedBehavior__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedBehavior__defaultBehavior;
  sharedBehavior__defaultBehavior = v0;

}

+ (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot");

  return v3;
}

+ (BOOL)isAppleInternalInstall
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleInternalInstall");

  return v3;
}

+ (BOOL)isM8Device
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isM8Device");

  return v3;
}

+ (BOOL)isRunningInStoreDemoModeOrSimulator
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningInStoreDemoModeOrSimulator");

  return v3;
}

+ (id)regionCode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  return MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

+ (BOOL)_isAppleInternalInstall
{
  return MGGetBoolAnswer();
}

+ (BOOL)_isM8Device
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 1302273957)
  {
    if (v3 == 1302273958)
      return v2;
    v4 = 2445473385;
  }
  else
  {
    if (v3 == 262180327)
      return v2;
    v4 = 761631964;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

+ (BOOL)_isRunningInStoreDemoModeOrSimulator
{
  return objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");
}

+ (id)_regionCode
{
  return (id)MGGetStringAnswer();
}

- (void)_handleDeviceFirstUnlock
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  self->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot = objc_msgSend((id)objc_opt_class(), "_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot");
  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSBehavior notifying clients of device first unlock.", v5, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TCSFirstUnlockNotification"), self);

}

- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  return self->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
}

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (BOOL)isM8Device
{
  return self->_isM8Device;
}

- (BOOL)isRunningInStoreDemoModeOrSimulator
{
  return self->_isRunningInStoreDemoModeOrSimulator;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
}

@end
