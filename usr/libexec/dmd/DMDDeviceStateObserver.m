@implementation DMDDeviceStateObserver

- (DMDDeviceStateObserver)init
{
  DMDDeviceStateObserver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMDDeviceStateObserver;
  result = -[DMDDeviceStateObserver init](&v3, "init");
  if (result)
    result->_isKeychainUnlocked = 1;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];

  v7[0] = CFSTR("hasKeychainUnlockedSinceBoot");
  v7[1] = CFSTR("isKeychainUnlocked");
  v7[2] = CFSTR("isNetworkTethered");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (void)startObservingChanges
{
  const char *v3;
  id v4;
  uint32_t v5;
  uint32_t v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD handler[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)kMobileKeyBagLockStatusNotifyToken;
  v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100038310;
  handler[3] = &unk_1000BAE30;
  objc_copyWeak(&v15, &location);
  LODWORD(v3) = notify_register_dispatch(v3, &self->mKeychainLockStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  if ((_DWORD)v3)
    self->mKeychainLockStateNotificationToken = -1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003838C;
  v12[3] = &unk_1000BAE30;
  objc_copyWeak(&v13, &location);
  v5 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->mKeychainFirstUnlockNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v12);

  if (v5)
    self->mKeychainFirstUnlockNotificationToken = -1;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100038404;
  v10 = &unk_1000BAE30;
  objc_copyWeak(&v11, &location);
  v6 = notify_register_dispatch("com.apple.system.config.network_change", &self->mNetworkChangeNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v7);

  if (v6)
    self->mNetworkChangeNotificationToken = -1;
  -[DMDDeviceStateObserver keybagLockStateDidChange](self, "keybagLockStateDidChange", v7, v8, v9, v10);
  -[DMDDeviceStateObserver networkDidChange](self, "networkDidChange");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)stopObservingChanges
{
  int mKeychainLockStateNotificationToken;
  int mNetworkChangeNotificationToken;

  mKeychainLockStateNotificationToken = self->mKeychainLockStateNotificationToken;
  if (mKeychainLockStateNotificationToken != -1)
  {
    notify_cancel(mKeychainLockStateNotificationToken);
    self->mKeychainLockStateNotificationToken = -1;
  }
  mNetworkChangeNotificationToken = self->mNetworkChangeNotificationToken;
  if (mNetworkChangeNotificationToken != -1)
  {
    notify_cancel(mNetworkChangeNotificationToken);
    self->mNetworkChangeNotificationToken = -1;
  }
}

- (void)keybagLockStateDidChange
{
  int v3;
  _BOOL8 v5;
  _BOOL8 v6;

  v3 = MKBGetDeviceLockState(0, a2);
  v5 = v3 == 3 || v3 == 0;
  v6 = MKBDeviceUnlockedSinceBoot() == 1;
  -[DMDDeviceStateObserver setIsKeychainUnlocked:](self, "setIsKeychainUnlocked:", v5);
  -[DMDDeviceStateObserver setHasKeychainUnlockedSinceBoot:](self, "setHasKeychainUnlockedSinceBoot:", v6);
}

- (void)networkDidChange
{
  -[DMDDeviceStateObserver setIsNetworkTethered:](self, "setIsNetworkTethered:", +[DMDNetworkTetherUtilities isNetworkTethered](DMDNetworkTetherUtilities, "isNetworkTethered"));
}

- (BOOL)hasKeychainUnlockedSinceBoot
{
  return self->_hasKeychainUnlockedSinceBoot;
}

- (void)setHasKeychainUnlockedSinceBoot:(BOOL)a3
{
  self->_hasKeychainUnlockedSinceBoot = a3;
}

- (BOOL)isKeychainUnlocked
{
  return self->_isKeychainUnlocked;
}

- (void)setIsKeychainUnlocked:(BOOL)a3
{
  self->_isKeychainUnlocked = a3;
}

- (BOOL)isNetworkTethered
{
  return self->_isNetworkTethered;
}

- (void)setIsNetworkTethered:(BOOL)a3
{
  self->_isNetworkTethered = a3;
}

@end
