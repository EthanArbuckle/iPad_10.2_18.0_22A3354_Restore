@implementation TLBacklight

+ (TLBacklight)sharedBacklight
{
  if (sharedBacklight__TLBacklightSharedInstanceOnceToken != -1)
    dispatch_once(&sharedBacklight__TLBacklightSharedInstanceOnceToken, &__block_literal_global_13);
  return (TLBacklight *)(id)sharedBacklight__TLBacklightSharedInstance;
}

void __30__TLBacklight_sharedBacklight__block_invoke()
{
  TLBacklight *v0;
  void *v1;

  v0 = objc_alloc_init(TLBacklight);
  v1 = (void *)sharedBacklight__TLBacklightSharedInstance;
  sharedBacklight__TLBacklightSharedInstance = (uint64_t)v0;

}

- (TLBacklight)init
{
  TLBacklight *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accessQueueLabel;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  _QWORD v13[4];
  TLBacklight *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TLBacklight;
  v2 = -[TLBacklight init](&v15, sel_init);
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

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __19__TLBacklight_init__block_invoke;
    v13[3] = &unk_1E952A748;
    v14 = v2;
    -[TLBacklight _performBlockOnAccessQueue:](v14, "_performBlockOnAccessQueue:", v13);

  }
  return v2;
}

uint64_t __19__TLBacklight_init__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = -1;
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

  dispatch_sync(v4, &__block_literal_global_6_1);
  v5.receiver = self;
  v5.super_class = (Class)TLBacklight;
  -[TLBacklight dealloc](&v5, sel_dealloc);
}

- (int64_t)backlightStatus
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
  v4[2] = __30__TLBacklight_backlightStatus__block_invoke;
  v4[3] = &unk_1E952A6F8;
  v4[4] = self;
  v4[5] = &v5;
  -[TLBacklight _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__TLBacklight_backlightStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)_setBacklightStatus:(int64_t)a3
{
  uint64_t v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__TLBacklight__setBacklightStatus___block_invoke;
  v6[3] = &unk_1E952BAC0;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  -[TLBacklight _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v6);
  v5 = v8[5];
  if (v5)
    -[TLBacklight _notifyObservers:ofUpdatedBacklightStatus:](self, "_notifyObservers:ofUpdatedBacklightStatus:", v5, a3);
  _Block_object_dispose(&v7, 8);

}

void __35__TLBacklight__setBacklightStatus___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = a1[4];
  v2 = a1[6];
  if (*(_QWORD *)(v1 + 40) != v2)
  {
    *(_QWORD *)(v1 + 40) = v2;
    objc_msgSend(*(id *)(a1[4] + 24), "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)_setObservingBacklight:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[TLBacklight _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  if (self->_isObservingBacklight != v3)
  {
    self->_isObservingBacklight = v3;
    if (!v3)
      self->_backlightStatus = -1;
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLBacklight *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__TLBacklight_addObserver___block_invoke;
  v6[3] = &unk_1E952A6A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLBacklight _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v6);

}

uint64_t __27__TLBacklight_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:") & 1) == 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    }
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setObservingBacklight:", 1);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLBacklight *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__TLBacklight_removeObserver___block_invoke;
  v6[3] = &unk_1E952A6A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLBacklight _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v6);

}

uint64_t __30__TLBacklight_removeObserver___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_setObservingBacklight:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count") != 0);
}

- (void)_notifyObservers:(id)a3 ofUpdatedBacklightStatus:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TLBacklight _assertNotRunningOnAccessQueue](self, "_assertNotRunningOnAccessQueue");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "backlightStatusDidChange:", a4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLBacklight.m");
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
          v13 = "-[TLBacklight _assertRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 208;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLBacklight.m");
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
          v13 = "-[TLBacklight _assertNotRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 216;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
