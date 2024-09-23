@implementation TLSilentModeController

+ (TLSilentModeController)sharedSilentModeController
{
  if (sharedSilentModeController__TLSilentModeControllerSharedInstanceOnceToken != -1)
    dispatch_once(&sharedSilentModeController__TLSilentModeControllerSharedInstanceOnceToken, &__block_literal_global_12);
  return (TLSilentModeController *)(id)sharedSilentModeController__TLSilentModeControllerSharedInstance;
}

void __52__TLSilentModeController_sharedSilentModeController__block_invoke()
{
  TLSilentModeController *v0;
  void *v1;

  v0 = objc_alloc_init(TLSilentModeController);
  v1 = (void *)sharedSilentModeController__TLSilentModeControllerSharedInstance;
  sharedSilentModeController__TLSilentModeControllerSharedInstance = (uint64_t)v0;

}

- (TLSilentModeController)init
{
  TLSilentModeController *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accessQueueLabel;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  uint64_t v12;
  _QWORD v14[4];
  TLSilentModeController *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TLSilentModeController;
  v2 = -[TLSilentModeController init](&v17, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@-%@"), v6, v7, CFSTR("AccessQueue"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v8;

    v10 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v10;

    if (-[TLSilentModeController _registerRingerSwitchChangedNotifyToken](v2, "_registerRingerSwitchChangedNotifyToken"))
    {
      v12 = -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:](v2, "_silentModeStatusForRingerSwitchChangedNotifyToken:", v2->_ringerSwitchChangedNotifyToken);
    }
    else
    {
      v12 = -1;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __30__TLSilentModeController_init__block_invoke;
    v14[3] = &unk_1E952AAA0;
    v15 = v2;
    v16 = v12;
    -[TLSilentModeController _performBlockOnAccessQueue:](v15, "_performBlockOnAccessQueue:", v14);

  }
  return v2;
}

uint64_t __30__TLSilentModeController_init__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
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

  -[TLSilentModeController _cancelRingerSwitchChangedNotifyToken](self, "_cancelRingerSwitchChangedNotifyToken");
  dispatch_sync(v4, &__block_literal_global_6_0);

  v5.receiver = self;
  v5.super_class = (Class)TLSilentModeController;
  -[TLSilentModeController dealloc](&v5, sel_dealloc);
}

- (int64_t)silentModeStatus
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__TLSilentModeController_silentModeStatus__block_invoke;
  v4[3] = &unk_1E952A6F8;
  v4[4] = self;
  v4[5] = &v5;
  -[TLSilentModeController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__TLSilentModeController_silentModeStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)_setSilentModeStatus:(int64_t)a3
{
  -[TLSilentModeController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  if (self->_silentModeStatus != a3)
    self->_silentModeStatus = a3;
}

- (void)_performBlockOnAccessQueue:(id)a3
{
  NSObject *accessQueue;

  accessQueue = self->_accessQueue;
  if (accessQueue)
    dispatch_sync(accessQueue, a3);
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLSilentModeController.m");
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
          v13 = "-[TLSilentModeController _assertRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 114;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLSilentModeController.m");
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
          v13 = "-[TLSilentModeController _assertNotRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 122;
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

- (void)_cancelRingerSwitchChangedNotifyToken
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_0(&dword_1D33D5000, v0, v1, "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.");
  OUTLINED_FUNCTION_6_1();
}

- (BOOL)_registerRingerSwitchChangedNotifyToken
{
  NSObject *accessQueue;
  uint32_t v4;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  self->_ringerSwitchChangedNotifyToken = -1;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__TLSilentModeController__registerRingerSwitchChangedNotifyToken__block_invoke;
  v7[3] = &unk_1E952BA08;
  objc_copyWeak(&v8, &location);
  v4 = notify_register_dispatch("com.apple.springboard.ringerstate", &self->_ringerSwitchChangedNotifyToken, accessQueue, v7);
  if (v4)
  {
    TLLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TLSilentModeController _registerRingerSwitchChangedNotifyToken].cold.1();

  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v4 == 0;
}

void __65__TLSilentModeController__registerRingerSwitchChangedNotifyToken__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSilentModeStatusUsingRingerSwitchChangedNotifyToken:", a2);
    WeakRetained = v4;
  }

}

- (int64_t)_silentModeStatusForRingerSwitchChangedNotifyToken:(int)a3
{
  NSObject *v4;
  int64_t v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t state64;
  uint8_t buf[4];
  TLSilentModeController *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {
    TLLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:].cold.1((uint64_t)self, v6);

    return -1;
  }
  else
  {
    state64 = -1;
    if (notify_get_state(a3, &state64))
    {
      TLLogGeneral();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:].cold.2();
      v5 = -1;
    }
    else
    {
      v7 = -1;
      v8 = CFSTR("unknown");
      v9 = CFSTR("silent");
      if (state64)
        v9 = 0;
      else
        v8 = CFSTR("on");
      if (!state64)
        v7 = 1;
      if (state64 == 1)
        v10 = CFSTR("tone1");
      else
        v10 = v9;
      if (state64 == 1)
        v11 = CFSTR("off");
      else
        v11 = v8;
      if (state64 == 1)
        v5 = 0;
      else
        v5 = v7;
      TLLogGeneral();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v15 = self;
        v16 = 2048;
        v17 = state64;
        v18 = 2114;
        v19 = v10;
        v20 = 2082;
        v21 = "com.apple.springboard.ringerstate";
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved ringerSwitchState = %llu (%{public}@) from notify token for topic named \"%{public}s\"; "
          "converted to silentModeStatus = %{public}@.",
          buf,
          0x34u);
      }
    }

  }
  return v5;
}

- (void)_updateSilentModeStatusUsingRingerSwitchChangedNotifyToken:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  TLSilentModeController *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[TLSilentModeController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  TLLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2082;
    v9 = "com.apple.springboard.ringerstate";
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Notify block fired for topic named \"%{public}s\"; updating silent mode.",
      (uint8_t *)&v6,
      0x16u);
  }

  -[TLSilentModeController _setSilentModeStatus:](self, "_setSilentModeStatus:", -[TLSilentModeController _silentModeStatusForRingerSwitchChangedNotifyToken:](self, "_silentModeStatusForRingerSwitchChangedNotifyToken:", v3));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_registerRingerSwitchChangedNotifyToken
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_0(&dword_1D33D5000, v0, v1, "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.");
  OUTLINED_FUNCTION_6_1();
}

- (void)_silentModeStatusForRingerSwitchChangedNotifyToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2082;
  v5 = "com.apple.springboard.ringerstate";
  _os_log_error_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get state for notify topic named \"%{public}s\" because ringerSwitchChangedNotifyToken = NOTIFY_TOKEN_INVALID.", (uint8_t *)&v2, 0x16u);
}

- (void)_silentModeStatusForRingerSwitchChangedNotifyToken:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_0(&dword_1D33D5000, v0, v1, "%{public}@: Failed to get state for notify topic named \"%{public}s\"; notifyStatus = %lu.");
  OUTLINED_FUNCTION_6_1();
}

@end
