@implementation TLContentProtectionStateObserver

+ (TLContentProtectionStateObserver)sharedContentProtectionStateObserver
{
  if (sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstanceOnceToken != -1)
    dispatch_once(&sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstanceOnceToken, &__block_literal_global_11);
  return (TLContentProtectionStateObserver *)(id)sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstance;
}

void __72__TLContentProtectionStateObserver_sharedContentProtectionStateObserver__block_invoke()
{
  TLContentProtectionStateObserver *v0;
  void *v1;

  v0 = objc_alloc_init(TLContentProtectionStateObserver);
  v1 = (void *)sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstance;
  sharedContentProtectionStateObserver__TLContentProtectionStateObserverSharedInstance = (uint64_t)v0;

}

- (TLContentProtectionStateObserver)init
{
  TLContentProtectionStateObserver *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *accessQueueLabel;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  NSObject *v11;
  _QWORD block[4];
  TLContentProtectionStateObserver *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TLContentProtectionStateObserver;
  v2 = -[TLContentProtectionStateObserver init](&v15, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@-%@"), v6, v4, CFSTR("AccessQueue"));
    v7 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v7;

    v9 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = v2->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__TLContentProtectionStateObserver_init__block_invoke;
    block[3] = &unk_1E952A748;
    v14 = v2;
    dispatch_sync(v11, block);

  }
  return v2;
}

uint64_t __40__TLContentProtectionStateObserver_init__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = -1;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = -1;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 48) = -1;
  return result;
}

- (void)dealloc
{
  OS_dispatch_queue *accessQueue;
  NSObject *v4;
  objc_super v5;

  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  -[TLContentProtectionStateObserver _cancelFirstUnlockNotifyToken](self, "_cancelFirstUnlockNotifyToken");
  dispatch_sync(v4, &__block_literal_global_6);

  v5.receiver = self;
  v5.super_class = (Class)TLContentProtectionStateObserver;
  -[TLContentProtectionStateObserver dealloc](&v5, sel_dealloc);
}

- (id)performBlockAfterProtectedContentUnlocked:(id)a3
{
  id v4;
  NSObject *accessQueue;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TLContentProtectionStateObserver_performBlockAfterProtectedContentUnlocked___block_invoke;
  block[3] = &unk_1E952B9E0;
  v12 = &v13;
  block[4] = self;
  v6 = (void (**)(_QWORD))v4;
  v11 = v6;
  dispatch_sync(accessQueue, block);
  v7 = (void *)v14[5];
  if (!v7)
  {
    v6[2](v6);
    v7 = (void *)v14[5];
  }
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __78__TLContentProtectionStateObserver_performBlockAfterProtectedContentUnlocked___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_performBlockAfterProtectedContentUnlocked:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_performBlockAfterProtectedContentUnlocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *blocksScheduledForProtectedContentUnlockedEvent;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[TLContentProtectionStateObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  -[TLContentProtectionStateObserver _loadContentProtectionStatusIfNeeded](self, "_loadContentProtectionStatusIfNeeded");
  if (self->_contentProtectionStatus == 1
    && (-[TLContentProtectionStateObserver _loadUnlockedSinceBootStatusIfNeeded](self, "_loadUnlockedSinceBootStatusIfNeeded"), self->_unlockedSinceBootStatus != 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    if (!blocksScheduledForProtectedContentUnlockedEvent)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_blocksScheduledForProtectedContentUnlockedEvent;
      self->_blocksScheduledForProtectedContentUnlockedEvent = v8;

      blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    }
    v10 = (void *)objc_msgSend(v4, "copy");
    v11 = (void *)MEMORY[0x1D824F08C]();
    -[NSMutableDictionary setObject:forKey:](blocksScheduledForProtectedContentUnlockedEvent, "setObject:forKey:", v11, v5);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__TLContentProtectionStateObserver_cancelBlockScheduledForProtectedContentUnlockedEventWithToken___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __98__TLContentProtectionStateObserver_cancelBlockScheduledForProtectedContentUnlockedEventWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelBlockScheduledForProtectedContentUnlockedEventWithToken:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelBlockScheduledForProtectedContentUnlockedEventWithToken:(id)a3
{
  id v4;

  v4 = a3;
  -[TLContentProtectionStateObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  -[NSMutableDictionary removeObjectForKey:](self->_blocksScheduledForProtectedContentUnlockedEvent, "removeObjectForKey:", v4);

}

- (void)_assertRunningOnAccessQueue
{
  NSObject *accessQueue;
  const char *label;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (strcmp(label, -[NSString UTF8String](self->_accessQueueLabel, "UTF8String")))
    {
      TLLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLContentProtectionStateObserver.m");
        v7 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v7, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 136381443;
          v13 = "-[TLContentProtectionStateObserver _assertRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 155;
          v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }

      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TLAttentionAwarenessEffectProcessor _assertRunningOnAccessQueue].cold.1();

    }
  }
}

- (void)_assertNotRunningOnAccessQueue
{
  NSObject *accessQueue;
  const char *label;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_not_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (!strcmp(label, -[NSString UTF8String](self->_accessQueueLabel, "UTF8String")))
    {
      TLLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLContentProtectionStateObserver.m");
        v7 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v7, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 136381443;
          v13 = "-[TLContentProtectionStateObserver _assertNotRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 163;
          v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }

      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TLAttentionAwarenessEffectProcessor _assertNotRunningOnAccessQueue].cold.1();

    }
  }
}

- (void)_cancelFirstUnlockNotifyToken
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_0(&dword_1D33D5000, v0, v1, "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.");
  OUTLINED_FUNCTION_6_1();
}

- (void)_registerFirstUnlockNotifyToken
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_0(&dword_1D33D5000, v0, v1, "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.");
  OUTLINED_FUNCTION_6_1();
}

void __67__TLContentProtectionStateObserver__registerFirstUnlockNotifyToken__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleFirstUnlockNotification");
    WeakRetained = v2;
  }

}

- (void)_handleFirstUnlockNotification
{
  NSObject *v3;
  int v4;
  TLContentProtectionStateObserver *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[TLContentProtectionStateObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  TLLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2082;
    v7 = "com.apple.mobile.keybagd.first_unlock";
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Notify block fired for topic named \"%{public}s\"; updating unlocked since boot status.",
      (uint8_t *)&v4,
      0x16u);
  }

  -[TLContentProtectionStateObserver _updateUnlockedSinceBootStatus](self, "_updateUnlockedSinceBootStatus");
}

- (void)_updateUnlockedSinceBootStatus
{
  int64_t v3;
  void *v4;
  void *v5;
  NSMutableDictionary *blocksScheduledForProtectedContentUnlockedEvent;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  -[TLContentProtectionStateObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  v3 = -[TLContentProtectionStateObserver _queryCurrentUnlockedSinceBootStatus](self, "_queryCurrentUnlockedSinceBootStatus");
  self->_unlockedSinceBootStatus = v3;
  if (v3 == 1)
  {
    -[TLContentProtectionStateObserver _cancelFirstUnlockNotifyToken](self, "_cancelFirstUnlockNotifyToken");
    -[NSMutableDictionary allValues](self->_blocksScheduledForProtectedContentUnlockedEvent, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    blocksScheduledForProtectedContentUnlockedEvent = self->_blocksScheduledForProtectedContentUnlockedEvent;
    self->_blocksScheduledForProtectedContentUnlockedEvent = 0;

    if (objc_msgSend(v5, "count"))
    {
      dispatch_get_global_queue(0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__TLContentProtectionStateObserver__updateUnlockedSinceBootStatus__block_invoke;
      block[3] = &unk_1E952A748;
      v9 = v5;
      dispatch_async(v7, block);

    }
  }
}

void __66__TLContentProtectionStateObserver__updateUnlockedSinceBootStatus__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_loadUnlockedSinceBootStatusIfNeeded
{
  -[TLContentProtectionStateObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  if (self->_unlockedSinceBootStatus == -1)
  {
    -[TLContentProtectionStateObserver _registerFirstUnlockNotifyToken](self, "_registerFirstUnlockNotifyToken");
    -[TLContentProtectionStateObserver _updateUnlockedSinceBootStatus](self, "_updateUnlockedSinceBootStatus");
  }
}

- (void)_loadContentProtectionStatusIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_2(&dword_1D33D5000, v0, v1, "%{public}@: MKBDeviceFormattedForContentProtection() returned unexpected result: %d; sticking to unlockedSinceBootSt"
    "atus = %{public}@.");
  OUTLINED_FUNCTION_6_1();
}

- (int64_t)_queryCurrentUnlockedSinceBootStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  const __CFString *v8;
  int64_t v9;
  NSObject *v10;
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v12 = 0;
  *(_QWORD *)&v12[8] = v12;
  *(_QWORD *)&v12[16] = 0x2020000000;
  v3 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  *(_QWORD *)&v12[24] = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v4 = (void *)MobileKeyBagLibrary();
    v3 = dlsym(v4, "MKBDeviceUnlockedSinceBoot");
    *(_QWORD *)(*(_QWORD *)&v12[8] + 24) = v3;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(v12, 8);
  if (!v3)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  v6 = ((uint64_t (*)(uint64_t))v3)(v5);
  v7 = v6;
  if (!v6)
  {
    v9 = 0;
    v8 = CFSTR("no");
LABEL_8:
    TLLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138543874;
      *(_QWORD *)&v12[4] = self;
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = v7;
      *(_WORD *)&v12[18] = 2114;
      *(_QWORD *)&v12[20] = v8;
      _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: MKBDeviceUnlockedSinceBoot() returned %d; converted to unlockedSinceBootStatus = %{public}@.",
        v12,
        0x1Cu);
    }
    goto LABEL_13;
  }
  if (v6 == 1)
  {
    v8 = CFSTR("yes");
    v9 = 1;
    goto LABEL_8;
  }
  TLLogGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[TLContentProtectionStateObserver _queryCurrentUnlockedSinceBootStatus].cold.2();
  v9 = -1;
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksScheduledForProtectedContentUnlockedEvent, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_queryCurrentUnlockedSinceBootStatus
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_2(&dword_1D33D5000, v0, v1, "%{public}@: MKBDeviceUnlockedSinceBoot() returned unexpected result: %d; sticking to unlockedSinceBootStatus = %{public}@.");
  OUTLINED_FUNCTION_6_1();
}

@end
