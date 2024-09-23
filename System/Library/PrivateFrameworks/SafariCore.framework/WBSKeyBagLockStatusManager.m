@implementation WBSKeyBagLockStatusManager

+ (id)sharedManager
{
  WBSKeyBagLockStatusManager *v2;

  {
    v2 = (WBSKeyBagLockStatusManager *)+[WBSKeyBagLockStatusManager sharedManager]::manager;
  }
  else
  {
    v2 = objc_alloc_init(WBSKeyBagLockStatusManager);
    +[WBSKeyBagLockStatusManager sharedManager]::manager = (uint64_t)v2;
  }
  return v2;
}

- (int64_t)keyBagLockStatus
{
  int v2;

  soft_MKBGetDeviceLockState((const __CFDictionary *)self);
  if (v2 == 1)
    return 2;
  else
    return v2 == 2;
}

- (WBSKeyBagLockStatusManager)init
{
  WBSKeyBagLockStatusManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  objc_super v7[2];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!MobileKeyBagLibraryCore(char **)::frameworkLibrary)
  {
    v7[1] = (objc_super)xmmword_1E649C630;
    v8 = 0;
    MobileKeyBagLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (MobileKeyBagLibraryCore(char **)::frameworkLibrary && getMKBGetDeviceLockStateSymbolLoc())
  {
    v7[0].receiver = self;
    v7[0].super_class = (Class)WBSKeyBagLockStatusManager;
    v3 = -[objc_super init](v7, sel_init);
    if (v3)
    {
      v4 = dispatch_queue_create("com.apple.SafariCore.WBSKeyBagLockStatusManager", 0);
      internalQueue = v3->_internalQueue;
      v3->_internalQueue = (OS_dispatch_queue *)v4;

      self = v3;
      v3 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __76__WBSKeyBagLockStatusManager_addKeyBagLockStatusChangedObserverWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  WBSKeyBagLockStatusChangedHandlerToken *v6;
  uint64_t v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_startObservingKeyBagLockStatusChanges");
  v6 = -[WBSKeyBagLockStatusChangedHandlerToken initWithHandler:]([WBSKeyBagLockStatusChangedHandlerToken alloc], "initWithHandler:", *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)_startObservingKeyBagLockStatusChanges
{
  uint64_t v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  int *p_notifyTokenFirstUnlock;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD handler[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke;
  aBlock[3] = &unk_1E649BB00;
  objc_copyWeak(&v15, &location);
  v4 = _Block_copy(aBlock);
  internalQueue = self->_internalQueue;
  handler[0] = v3;
  handler[1] = 3221225472;
  handler[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_7;
  handler[3] = &unk_1E649C610;
  v6 = v4;
  v13 = v6;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_notifyTokenLockStatusChanged, internalQueue, handler);
  p_notifyTokenFirstUnlock = &self->_notifyTokenFirstUnlock;
  v8 = self->_internalQueue;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2_10;
  v10[3] = &unk_1E649C610;
  v9 = v6;
  v11 = v9;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", p_notifyTokenFirstUnlock, v8, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)addKeyBagLockStatusChangedObserverWithHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSKeyBagLockStatusManager_addKeyBagLockStatusChangedObserverWithHandler___block_invoke;
  block[3] = &unk_1E649C5E8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)dealloc
{
  NSObject *internalQueue;
  objc_super v4;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__WBSKeyBagLockStatusManager_dealloc__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)WBSKeyBagLockStatusManager;
  -[WBSKeyBagLockStatusManager dealloc](&v4, sel_dealloc);
}

_DWORD *__37__WBSKeyBagLockStatusManager_dealloc__block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[4] || result[5])
    return (_DWORD *)objc_msgSend(result, "_stopObservingKeyBagLockStatusChanges");
  return result;
}

- (void)removeKeyBagLockStatusChangedObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSKeyBagLockStatusManager_removeKeyBagLockStatusChangedObserver___block_invoke;
  block[3] = &unk_1E649A540;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __68__WBSKeyBagLockStatusManager_removeKeyBagLockStatusChangedObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
    if (!result)
      return objc_msgSend(*(id *)(a1 + 32), "_stopObservingKeyBagLockStatusChanges");
  }
  return result;
}

- (BOOL)isLockedOrAboutToLock
{
  return -[WBSKeyBagLockStatusManager keyBagLockStatus](self, "keyBagLockStatus") != 0;
}

- (BOOL)isKeyBagEnabled
{
  unsigned int v2;

  soft_MKBGetDeviceLockState((const __CFDictionary *)self);
  return (v2 > 3) | (7u >> (v2 & 0xF)) & 1;
}

void __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD activity_block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    activity_block[1] = 3221225472;
    activity_block[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2;
    activity_block[3] = &unk_1E649A460;
    activity_block[4] = WeakRetained;
    v2 = WeakRetained;
    activity_block[0] = MEMORY[0x1E0C809B0];
    _os_activity_initiate(&dword_1B2621000, "Key Bag: Lock Status Changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    WeakRetained = v2;
  }

}

void __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(void);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_descriptionOfKeyBagLockStatus:", objc_msgSend(*(id *)(a1 + 32), "keyBagLockStatus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1B2621000, v2, OS_LOG_TYPE_DEFAULT, "Lock status of the device has changed to: %{public}@", buf, 0xCu);

  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "handler", (_QWORD)v9);
        v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_stopObservingKeyBagLockStatusChanges
{
  int notifyTokenLockStatusChanged;
  int notifyTokenFirstUnlock;

  notifyTokenLockStatusChanged = self->_notifyTokenLockStatusChanged;
  if (notifyTokenLockStatusChanged)
  {
    notify_cancel(notifyTokenLockStatusChanged);
    self->_notifyTokenLockStatusChanged = 0;
  }
  notifyTokenFirstUnlock = self->_notifyTokenFirstUnlock;
  if (notifyTokenFirstUnlock)
  {
    notify_cancel(notifyTokenFirstUnlock);
    self->_notifyTokenFirstUnlock = 0;
  }
}

- (id)_descriptionOfKeyBagLockStatus:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("locked");
  if (a3 == 1)
    v3 = CFSTR("locking");
  if (a3)
    return (id)v3;
  else
    return CFSTR("unlocked");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
