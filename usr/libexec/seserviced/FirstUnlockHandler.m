@implementation FirstUnlockHandler

- (FirstUnlockHandler)init
{
  FirstUnlockHandler *v2;
  FirstUnlockHandler *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  FirstUnlockHandler *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FirstUnlockHandler;
  v2 = -[FirstUnlockHandler init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_fired = 0;
    if (+[SESDarwinNotificationMonitor registerDelegate:forEvent:](SESDarwinNotificationMonitor, "registerDelegate:forEvent:", v2, CFSTR("com.apple.mobile.keybagd.first_unlock")))
    {
      -[FirstUnlockHandler onDarwinNotification:]_0((uint64_t)v3);
    }
    global_queue = dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035EF0;
    block[3] = &unk_100302AA0;
    v8 = v3;
    dispatch_async(v5, block);

  }
  return v3;
}

- (void)onDarwinNotification:(uint64_t)a1
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!*(_BYTE *)(a1 + 12))
    {
      *(_BYTE *)(a1 + 12) = 1;
      sub_100035F24(v3, v4);
    }
    os_unfair_lock_unlock(v2);
  }
}

@end
