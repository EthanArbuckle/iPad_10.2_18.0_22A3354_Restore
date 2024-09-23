@implementation HDSPCFUserNotificationCenterManager

+ (id)sharedManager
{
  if (qword_253DE8EE8 != -1)
    dispatch_once(&qword_253DE8EE8, &__block_literal_global_7);
  return (id)_MergedGlobals_14;
}

void __52__HDSPCFUserNotificationCenterManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;

}

- (HDSPCFUserNotificationCenterManager)init
{
  HDSPCFUserNotificationCenterManager *v2;
  HDSPCFUserNotificationCenterManager *v3;
  NSMutableArray *v4;
  NSMutableArray *registrations;
  HDSPCFUserNotificationCenterManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSPCFUserNotificationCenterManager;
  v2 = -[HDSPCFUserNotificationCenterManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_registrationLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    registrations = v3->_registrations;
    v3->_registrations = v4;

    v6 = v3;
  }

  return v3;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_registrationLock;
  void (**v4)(_QWORD);

  p_registrationLock = &self->_registrationLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_registrationLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_registrationLock);
}

- (void)postNotification:(id)a3 fromCenter:(id)a4
{
  id v6;
  id v7;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  _HDSPCFUserNotificationCenterRegistration *v10;
  _HDSPCFUserNotificationCenterRegistration *v11;
  _QWORD v12[5];
  _HDSPCFUserNotificationCenterRegistration *v13;

  v6 = a4;
  v7 = a3;
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, (CFUserNotificationRef)objc_msgSend(v7, "notification"), (CFUserNotificationCallBack)_CFUserNotificationCallback, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  CFRelease(RunLoopSource);
  v10 = objc_alloc_init(_HDSPCFUserNotificationCenterRegistration);
  -[_HDSPCFUserNotificationCenterRegistration setNotification:](v10, "setNotification:", v7);

  -[_HDSPCFUserNotificationCenterRegistration setNotificationCenter:](v10, "setNotificationCenter:", v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPCFUserNotificationCenterManager_postNotification_fromCenter___block_invoke;
  v12[3] = &unk_24D4E3680;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[HDSPCFUserNotificationCenterManager _withLock:](self, "_withLock:", v12);

}

uint64_t __67__HDSPCFUserNotificationCenterManager_postNotification_fromCenter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)cancelNotification:(id)a3 fromCenter:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    CFUserNotificationCancel((CFUserNotificationRef)objc_msgSend(v5, "notification"));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke;
    v7[3] = &unk_24D4E3680;
    v7[4] = self;
    v8 = v6;
    -[HDSPCFUserNotificationCenterManager _withLock:](self, "_withLock:", v7);

  }
}

void __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke_2;
  v5[3] = &unk_24D4E4B60;
  v6 = v2;
  objc_msgSend(v3, "na_firstObjectPassingTest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v4);

}

BOOL __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (os_unfair_lock_s)registrationLock
{
  return self->_registrationLock;
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end
