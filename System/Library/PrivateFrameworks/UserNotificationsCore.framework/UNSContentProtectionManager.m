@implementation UNSContentProtectionManager

- (UNSContentProtectionManager)init
{
  UNSContentProtectionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  UNCKeyedObservable *v7;
  UNCKeyedObservable *observable;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  _QWORD block[4];
  UNSContentProtectionManager *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UNSContentProtectionManager;
  v2 = -[UNSContentProtectionManager init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NotificationContentProtection.observable", v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.NotificationContentProtection.call-out", v5);

    v7 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v4, v6);
    observable = v2->_observable;
    v2->_observable = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.unsusernotificationserver.NotificationContentProtection", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__UNSContentProtectionManager_init__block_invoke;
    block[3] = &unk_251AE02A0;
    v15 = v2;
    dispatch_sync(v12, block);

  }
  return v2;
}

uint64_t __35__UNSContentProtectionManager_init__block_invoke(uint64_t a1)
{
  const char *v2;
  int *v3;
  int *v4;
  NSObject *v5;
  uint64_t result;
  _QWORD handler[4];
  int *v8;

  if (MKBDeviceFormattedForContentProtection())
  {
    v2 = (const char *)*MEMORY[0x24BE67240];
    v3 = *(int **)(a1 + 32);
    v4 = v3 + 5;
    v5 = *((_QWORD *)v3 + 3);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __35__UNSContentProtectionManager_init__block_invoke_2;
    handler[3] = &unk_251AE03A8;
    v8 = v3;
    notify_register_dispatch(v2, v4, v5, handler);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 32), "_queue_keyBagLockState");
  result = MKBDeviceUnlockedSinceBoot();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = (_DWORD)result != 0;
  return result;
}

void __35__UNSContentProtectionManager_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__UNSContentProtectionManager_init__block_invoke_3;
  v2[3] = &unk_251AE02A0;
  v3 = v1;
  objc_msgSend(v3, "_queue_adjustContentProtectionStateWithBlock:", v2);

}

uint64_t __35__UNSContentProtectionManager_init__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_keyBagLockState");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)UNSContentProtectionManager;
  -[UNSContentProtectionManager dealloc](&v3, sel_dealloc);
}

- (void)addContentProtectionObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNSContentProtectionManager *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__UNSContentProtectionManager_addContentProtectionObserver___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __60__UNSContentProtectionManager_addContentProtectionObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF89A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "Added content protection observer %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObserver:forKey:", *(_QWORD *)(a1 + 32), CFSTR("*"));
}

- (void)removeContentProtectionObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UNSContentProtectionManager_removeContentProtectionObserver___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __63__UNSContentProtectionManager_removeContentProtectionObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:forKey:", *(_QWORD *)(a1 + 40), CFSTR("*"));
}

- (int64_t)observedState
{
  NSObject *queue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__UNSContentProtectionManager_observedState__block_invoke;
  v6[3] = &unk_251AE0178;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __44__UNSContentProtectionManager_observedState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_observedState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isProtectedDataAvailable
{
  int64_t v3;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v3 = -[UNSContentProtectionManager observedState](self, "observedState");
  return v3 == 4 || v3 == 1;
}

- (BOOL)deviceUnlockedSinceBoot
{
  UNSContentProtectionManager *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__UNSContentProtectionManager_deviceUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __54__UNSContentProtectionManager_deviceUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (id)classCStrategy
{
  return -[UNSContentProtectionManager contentProtectionStrategyForMinimumProtection:excludedFromBackup:](self, "contentProtectionStrategyForMinimumProtection:excludedFromBackup:", *MEMORY[0x24BDD0CE0], 0);
}

- (id)classDStrategy
{
  return -[UNSContentProtectionManager contentProtectionStrategyForMinimumProtection:excludedFromBackup:](self, "contentProtectionStrategyForMinimumProtection:excludedFromBackup:", *MEMORY[0x24BDD0CF8], 0);
}

- (id)classCStrategyExcludedFromBackup
{
  return -[UNSContentProtectionManager contentProtectionStrategyForMinimumProtection:excludedFromBackup:](self, "contentProtectionStrategyForMinimumProtection:excludedFromBackup:", *MEMORY[0x24BDD0CE0], 1);
}

- (id)classDStrategyExcludedFromBackup
{
  return -[UNSContentProtectionManager contentProtectionStrategyForMinimumProtection:excludedFromBackup:](self, "contentProtectionStrategyForMinimumProtection:excludedFromBackup:", *MEMORY[0x24BDD0CF8], 1);
}

- (id)contentProtectionStrategyForMinimumProtection:(id)a3 excludedFromBackup:(BOOL)a4
{
  UNCAtomicDataContentProtectionStrategy *v5;
  UNCAtomicDataContentProtectionStrategy *v6;

  if ((id)*MEMORY[0x24BDD0CF8] == a3)
    v5 = -[UNCAtomicDataContentProtectionStrategy initWithFileProtectionType:excludeFromBackup:]([UNCAtomicDataContentProtectionStrategy alloc], "initWithFileProtectionType:excludeFromBackup:", a3, a4);
  else
    v5 = -[UNCHybridContentProtectionStrategy initWithFileProtectionType:excludeFromBackup:delegate:]([UNCHybridContentProtectionStrategy alloc], "initWithFileProtectionType:excludeFromBackup:delegate:", a3, a4, self);
  v6 = v5;

  return v6;
}

- (int64_t)_queue_observedState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_contentProtectionState;
}

- (void)_queue_adjustContentProtectionStateWithBlock:(id)a3
{
  NSObject *queue;
  void (**v5)(_QWORD);
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  os_log_t *v9;
  char v10;
  NSObject *v11;
  int v13;
  int v15;
  os_log_t v16;
  _BOOL4 v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  NSObject *v22;
  UNCKeyedObservable *observable;
  NSObject *v24;
  _QWORD v25[4];
  char v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(queue);
  v6 = -[UNSContentProtectionManager _queue_observedState](self, "_queue_observedState");
  v5[2](v5);

  v7 = -[UNSContentProtectionManager _queue_observedState](self, "_queue_observedState");
  v8 = v7;
  v9 = (os_log_t *)MEMORY[0x24BDF89A0];
  if (!self->_unlockedSinceBoot && (v7 == 4 || v7 == 1))
  {
    v11 = *MEMORY[0x24BDF89A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2499A5000, v11, OS_LOG_TYPE_DEFAULT, "First unlock", buf, 2u);
    }
    v10 = 1;
    self->_unlockedSinceBoot = 1;
  }
  else
  {
    v10 = 0;
  }
  v13 = v8 == 4 || v8 == 1;
  v15 = v6 == 4 || v6 == 1;
  v16 = *v9;
  v17 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
  if (v15 == v13)
  {
    if (v17)
    {
      if (v6 > 4)
        v19 = CFSTR("unknown");
      else
        v19 = off_251AE03E8[v6];
      if (v8 > 4)
        v21 = CFSTR("unknown");
      else
        v21 = off_251AE03E8[v8];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2114;
      v30 = v21;
      v24 = v16;
      _os_log_impl(&dword_2499A5000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring no-op keybag transition (%{public}@ -> %{public}@)", buf, 0x16u);

    }
  }
  else
  {
    if (v17)
    {
      if (v6 > 4)
        v18 = CFSTR("unknown");
      else
        v18 = off_251AE03E8[v6];
      if (v8 > 4)
        v20 = CFSTR("unknown");
      else
        v20 = off_251AE03E8[v8];
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2114;
      v30 = v20;
      v22 = v16;
      _os_log_impl(&dword_2499A5000, v22, OS_LOG_TYPE_DEFAULT, "Key bag transitioning from %{public}@ to %{public}@", buf, 0x16u);

    }
    observable = self->_observable;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __76__UNSContentProtectionManager__queue_adjustContentProtectionStateWithBlock___block_invoke;
    v25[3] = &__block_descriptor_33_e40_v16__0___UNCContentProtectionObserver__8l;
    v26 = v10;
    -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", CFSTR("*"), v25);
  }
}

uint64_t __76__UNSContentProtectionManager__queue_adjustContentProtectionStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentProtectionStateChangedForFirstUnlock:", *(unsigned __int8 *)(a1 + 32));
}

- (int64_t)_queue_keyBagLockState
{
  unsigned int v2;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = MKBGetDeviceLockState();
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
