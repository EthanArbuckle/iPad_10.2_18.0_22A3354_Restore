@implementation WBSKeychainCredentialNotificationMonitor

- (WBSKeychainCredentialNotificationMonitor)initWithCoalescingInterval:(double)a3
{
  WBSKeychainCredentialNotificationMonitor *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id keybagUnlockStatusChangedToken;
  void *v12;
  WBSKeychainCredentialNotificationMonitor *v13;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  v4 = -[WBSKeychainCredentialNotificationMonitor init](&v20, sel_init);
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainCredentialNotificationMonitor", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke;
    handler[3] = &unk_1E649C678;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.security.view-change.Passwords", &v4->_keychainChangedNotificationToken, v7, handler);

    +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke_3;
    v15[3] = &unk_1E649BB00;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "addKeyBagLockStatusChangedObserverWithHandler:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
    keybagUnlockStatusChangedToken = v4->_keybagUnlockStatusChangedToken;
    v4->_keybagUnlockStatusChangedToken = (id)v10;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_notifyModernKeychainUpdated, CFSTR("com.apple.security.shared-items-changed"), 0);

    v4->_coalescingInterval = a3;
    v13 = v4;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (id)addObserverWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSKeychainCredentialNotificationMonitor_addObserverWithBlock___block_invoke;
  block[3] = &unk_1E649C6A0;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_async(internalQueue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __65__WBSKeychainCredentialNotificationMonitor_addObserverWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v5 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");

}

void __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B2621000, v2, OS_LOG_TYPE_DEFAULT, "Received keychain changed notification", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyModernKeychainUpdated");

}

void __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "keyBagLockStatus");

  if (!v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_notifyKeybagUnlocked");

  }
}

- (WBSKeychainCredentialNotificationMonitor)init
{
  return -[WBSKeychainCredentialNotificationMonitor initWithCoalescingInterval:](self, "initWithCoalescingInterval:", 0.0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  notify_cancel(self->_keychainChangedNotificationToken);
  +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyBagLockStatusChangedObserver:", self->_keybagUnlockStatusChangedToken);

  v4.receiver = self;
  v4.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  -[WBSKeychainCredentialNotificationMonitor dealloc](&v4, sel_dealloc);
}

- (void)removeObserverForToken:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WBSKeychainCredentialNotificationMonitor_removeObserverForToken___block_invoke;
  v7[3] = &unk_1E649A540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __67__WBSKeychainCredentialNotificationMonitor_removeObserverForToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

  }
}

- (void)triggerExternalNotification
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSKeychainCredentialNotificationMonitor_triggerExternalNotification__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __71__WBSKeychainCredentialNotificationMonitor_triggerExternalNotification__block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[6])
  {
    objc_msgSend(v2, "_cancelCoalescingTimer");
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_notifyObservers");
}

- (void)_notifyKeybagUnlocked
{
  NSObject *v3;
  int v4;
  WBSKeychainCredentialNotificationMonitor *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that the keybag was unlocked", (uint8_t *)&v4, 0xCu);
  }
  -[WBSKeychainCredentialNotificationMonitor triggerExternalNotification](self, "triggerExternalNotification");
}

- (void)_notifyKeychainUpdated
{
  NSObject *internalQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke;
  block[3] = &unk_1E649C6C8;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  dispatch_source_t v14;
  id *v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD handler[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v2 + 32) == 0.0)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v23 = v10;
      _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that keychain updated because no coalescing interval is set", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!*(_QWORD *)(v2 + 40)
    || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)),
        v5 = v4,
        v6 = *(double *)(*(_QWORD *)(a1 + 32) + 32),
        v3,
        v5 > v6))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v23 = v8;
      _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that keychain updated because enough time has elapsed", buf, 0xCu);
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_notifyObservers");
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v11 + 48))
  {
    v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v23 = v13;
      _os_log_impl(&dword_1B2621000, v12, OS_LOG_TYPE_INFO, "Notification monitor <%p> not notifying observers immediately that keychain updated because we have a coalescing timer running", buf, 0xCu);
    }
  }
  else
  {
    v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v11 + 8));
    v16 = *(_QWORD *)(a1 + 32);
    v15 = (id *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v14;

    v18 = dispatch_time(0, (uint64_t)(*((double *)*v15 + 4) * 1000000000.0));
    dispatch_source_set_timer(*((dispatch_source_t *)*v15 + 6), v18, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*((double *)*v15 + 4) * 0.1 * 1000000000.0));
    v19 = *((_QWORD *)*v15 + 6);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke_13;
    handler[3] = &unk_1E649BB00;
    objc_copyWeak(&v21, v15 + 1);
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume(*((dispatch_object_t *)*v15 + 6));
    objc_destroyWeak(&v21);
  }
}

void __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 134217984;
      v4 = WeakRetained;
      _os_log_impl(&dword_1B2621000, v2, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers that keychain updated after coalescing interval", (uint8_t *)&v3, 0xCu);
    }
    objc_msgSend(WeakRetained, "_notifyObservers");
    objc_msgSend(WeakRetained, "_cancelCoalescingTimer");
  }

}

- (void)_cancelCoalescingTimer
{
  OS_dispatch_source *coalescingTimer;

  dispatch_source_cancel((dispatch_source_t)self->_coalescingTimer);
  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = 0;

}

- (void)_notifyObservers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSDate *v7;
  NSDate *lastNotificationTime;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_observers, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastNotificationTime = self->_lastNotificationTime;
  self->_lastNotificationTime = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagUnlockStatusChangedToken, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_lastNotificationTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
