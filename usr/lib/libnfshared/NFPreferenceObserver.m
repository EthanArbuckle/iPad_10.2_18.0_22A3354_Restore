@implementation NFPreferenceObserver

- (void)dealloc
{
  objc_super v3;

  -[NFPreferenceObserver stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)NFPreferenceObserver;
  -[NFPreferenceObserver dealloc](&v3, sel_dealloc);
}

- (void)start:(id)a3
{
  NFPreferenceObserver *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NFPreferenceObserver setCallback:](v4, "setCallback:", v7);
  objc_sync_exit(v4);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)NFPreferencesChangedHandler, CFSTR("com.apple.stockholm.preferenceschanged"), 0, (CFNotificationSuspensionBehavior)1026);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)NFPreferencesChangedHandler, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, (CFNotificationSuspensionBehavior)1026);

}

- (void)stop
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  NFPreferenceObserver *obj;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.stockholm.preferenceschanged"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0);
  obj = self;
  objc_sync_enter(obj);
  -[NFPreferenceObserver setCallback:](obj, "setCallback:", 0);
  objc_sync_exit(obj);

}

- (void)handlePreferencesOrProfileChanged
{
  void (**callback)(void);
  NFPreferenceObserver *obj;

  obj = self;
  objc_sync_enter(obj);
  callback = (void (**)(void))obj->_callback;
  if (callback)
    callback[2]();
  objc_sync_exit(obj);

}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
