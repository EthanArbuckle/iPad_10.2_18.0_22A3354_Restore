@implementation SBFMobileKeyBag

uint64_t __33__SBFMobileKeyBag_hasPasscodeSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (SBFMobileKeyBagState)extendedState
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  BSDispatchQueueAssertNot();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__SBFMobileKeyBag_extendedState__block_invoke;
  v6[3] = &unk_1E200E200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SBFMobileKeyBagState *)v4;
}

void __32__SBFMobileKeyBag_extendedState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_lockStateExtended:(BOOL)a3
{
  _BOOL8 v3;
  SBFMobileKeyBagState *v5;
  void *v6;
  SBFMobileKeyBagState *v7;

  v3 = a3;
  BSDispatchQueueAssert();
  v5 = [SBFMobileKeyBagState alloc];
  -[SBFMobileKeyBag _queue_keyBagInfo](self, "_queue_keyBagInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBFMobileKeyBagState initWithKeyBagInfo:extended:](v5, "initWithKeyBagInfo:extended:", v6, v3);

  return v7;
}

- (BOOL)hasPasscodeSet
{
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  BSDispatchQueueAssertNot();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SBFMobileKeyBag_hasPasscodeSet__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __62__SBFMobileKeyBag_performAfterFirstUnlockSinceBootUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    v3 = *(void **)(v1 + 40);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v7 = (void *)MEMORY[0x18D774178]();
    objc_msgSend(v3, "addObject:", v7);

  }
}

void __24__SBFMobileKeyBag_state__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SBFMobileKeyBagState)state
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  BSDispatchQueueAssertNot();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SBFMobileKeyBag_state__block_invoke;
  v6[3] = &unk_1E200E200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SBFMobileKeyBagState *)v4;
}

- (void)performAfterFirstUnlockSinceBootUsingBlock:(id)a3
{
  id v5;
  NSObject *queue;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFMobileKeyBag.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  BSDispatchQueueAssertNot();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBFMobileKeyBag_performAfterFirstUnlockSinceBootUsingBlock___block_invoke;
  block[3] = &unk_1E200E2C8;
  v11 = &v12;
  block[4] = self;
  v7 = (void (**)(_QWORD))v5;
  v10 = v7;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v13 + 24))
    v7[2](v7);

  _Block_object_dispose(&v12, 8);
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  return (id)sharedInstance___instance;
}

void __33__SBFMobileKeyBag_sharedInstance__block_invoke()
{
  SBFMobileKeyBag *v0;
  void *v1;

  v0 = objc_alloc_init(SBFMobileKeyBag);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (SBFMobileKeyBag)init
{
  SBFMobileKeyBag *v2;
  uint64_t v3;
  OS_dispatch_queue *calloutQueue;
  uint64_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  SBFMobileKeyBag *v8;
  NSObject *v9;
  _QWORD v11[4];
  SBFMobileKeyBag *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, uint64_t);
  void *v16;
  SBFMobileKeyBag *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBFMobileKeyBag;
  v2 = -[SBFMobileKeyBag init](&v20, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __23__SBFMobileKeyBag_init__block_invoke;
    v16 = &unk_1E200E160;
    objc_copyWeak(&v18, &location);
    v8 = v2;
    v17 = v8;
    v8->_aksEvent = (_AKSEvent *)AKSEventsRegister();
    v9 = v2->_queue;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __23__SBFMobileKeyBag_init__block_invoke_2;
    v11[3] = &unk_1E200E188;
    v12 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __23__SBFMobileKeyBag_init__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  _BYTE *WeakRetained;
  void *v7;
  int v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!a2)
  {
    WeakRetained[49] = 1;
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_firstUnlockOccurred");
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    v9 = WeakRetained;
    v8 = objc_msgSend(*(id *)(a1 + 32), "_shouldHandleKeyBagEventWithHandleState:", a3);
    v7 = v9;
    if (v8)
    {
      objc_msgSend(v9, "_queue_handleKeybagStatusChanged");
LABEL_6:
      v7 = v9;
    }
  }

}

void __23__SBFMobileKeyBag_init__block_invoke_2(uint64_t a1)
{
  uint64_t (*MKBDeviceUnlockedSinceBoot)();
  int v3;
  uint64_t v4;
  BOOL v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_setHasPasscodeIfNecessary:", v7);
  MKBDeviceUnlockedSinceBoot = _get_MKBDeviceUnlockedSinceBoot();
  v3 = MKBDeviceUnlockedSinceBoot();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 48))
    v5 = v3 <= 0;
  else
    v5 = 0;
  v6 = !v5;
  *(_BYTE *)(v4 + 49) = v6;

}

- (void)dealloc
{
  objc_super v3;

  AKSEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)SBFMobileKeyBag;
  -[SBFMobileKeyBag dealloc](&v3, sel_dealloc);
}

- (void)lockSkippingGracePeriod:(BOOL)a3
{
  -[SBFMobileKeyBag lockSkippingGracePeriod:endingContinuityUnlock:](self, "lockSkippingGracePeriod:endingContinuityUnlock:", a3, a3);
}

- (void)lockSkippingGracePeriod:(BOOL)a3 endingContinuityUnlock:(BOOL)a4
{
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SBFMobileKeyBag_lockSkippingGracePeriod_endingContinuityUnlock___block_invoke;
  v8[3] = &unk_1E200E1B0;
  v8[4] = self;
  v9 = a4;
  v10 = a3;
  dispatch_sync(queue, v8);
}

void __66__SBFMobileKeyBag_lockSkippingGracePeriod_endingContinuityUnlock___block_invoke(uint64_t a1)
{
  uint64_t (*MKBLockDevice)(uint64_t);
  NSObject *v3;
  int v4;
  id v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isContinuityUnlocked") && !*(_BYTE *)(a1 + 40))
  {
    SBLogAuthenticationKeybag();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 41);
      *(_DWORD *)buf = 67109120;
      v7 = v4;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Deferring keybag lock because endingContinuityUnlock = NO (skipGracePeriod = %{BOOL}u)", buf, 8u);
    }

  }
  else
  {
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("LockDeviceNow"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    MKBLockDevice = _get_MKBLockDevice();
    MKBLockDevice((uint64_t)v5);

  }
}

- (BOOL)unlockWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  BSDispatchQueueAssertNot();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBFMobileKeyBag_unlockWithOptions_error___block_invoke;
  block[3] = &unk_1E200E1D8;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v19;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __43__SBFMobileKeyBag_unlockWithOptions_error___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  void *v4;
  uint64_t (*MKBUnlockDevice)(uint64_t, uint64_t);
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("SkipSE");
  v2 = objc_msgSend(*(id *)(a1 + 32), "skipSEKeepUserDataOperation");
  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v2)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v11[0] = *v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MKBUnlockDevice = _get_MKBUnlockDevice();
  v6 = MKBUnlockDevice(objc_msgSend(*(id *)(a1 + 32), "passcode"), (uint64_t)v4);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboardfoundation.mkb"), v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)verifyWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  BSDispatchQueueAssertNot();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBFMobileKeyBag_verifyWithOptions_error___block_invoke;
  block[3] = &unk_1E200E1D8;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v19;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __43__SBFMobileKeyBag_verifyWithOptions_error___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("SkipSE");
  v2 = objc_msgSend(*(id *)(a1 + 32), "skipSEKeepUserDataOperation");
  v3 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v2)
    v3 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v10[0] = *v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passcode");
  v5 = MKBVerifyPasswordWithContext();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboardfoundation.mkb"), v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)isContinuityUnlocked
{
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  BSDispatchQueueAssertNot();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SBFMobileKeyBag_isContinuityUnlocked__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __39__SBFMobileKeyBag_isContinuityUnlocked__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isContinuityUnlocked");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)maxUnlockAttempts
{
  uint64_t (*MKBGetDeviceConfigurations)(uint64_t);
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFNumber *Value;
  const __CFNumber *v6;
  CFTypeID v7;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  int64_t valuePtr;

  MKBGetDeviceConfigurations = _get_MKBGetDeviceConfigurations();
  v3 = (const __CFDictionary *)MKBGetDeviceConfigurations(0);
  if (v3)
  {
    v4 = v3;
    Value = (const __CFNumber *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D4E598]);
    if (Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFNumberGetTypeID()))
    {
      valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
      v8 = valuePtr;
      if (valuePtr)
      {
LABEL_10:
        CFRelease(v4);
        return v8;
      }
      SBLogAuthenticationKeybag();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBFMobileKeyBag maxUnlockAttempts].cold.3();
    }
    else
    {
      SBLogAuthenticationKeybag();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBFMobileKeyBag maxUnlockAttempts].cold.2();
    }

    v8 = 10;
    goto LABEL_10;
  }
  SBLogAuthenticationKeybag();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBFMobileKeyBag maxUnlockAttempts].cold.1();

  return 10;
}

- (void)createStashBagWithOptions:(id)a3 completion:(id)a4
{
  -[SBFMobileKeyBag createStashBagWithOptions:completion:completionQueue:](self, "createStashBagWithOptions:completion:completionQueue:", a3, a4, MEMORY[0x1E0C80D38]);
}

- (void)createStashBagWithOptions:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__SBFMobileKeyBag_createStashBagWithOptions_completion_completionQueue___block_invoke;
  v15[3] = &unk_1E200E228;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __72__SBFMobileKeyBag_createStashBagWithOptions_completion_completionQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "passcode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_createStashBag:skipSEKeepUserDataOperation:", v3, objc_msgSend(*(id *)(a1 + 40), "skipSEKeepUserDataOperation"));

  v4 = *(void **)(a1 + 56);
  if (v4)
    dispatch_async(*(dispatch_queue_t *)(a1 + 48), v4);
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBFMobileKeyBag_hasBeenUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E200E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SBFMobileKeyBag_hasBeenUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

- (BOOL)beginRecovery:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  BSDispatchQueueAssertNot();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBFMobileKeyBag_beginRecovery_error___block_invoke;
  block[3] = &unk_1E200E1D8;
  v8 = v6;
  v12 = v8;
  v13 = &v19;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __39__SBFMobileKeyBag_beginRecovery_error___block_invoke(_QWORD *a1)
{
  uint64_t (*MKBKeyBagPerformRecovery)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  MKBKeyBagPerformRecovery = _get_MKBKeyBagPerformRecovery();
  v3 = MKBKeyBagPerformRecovery(a1[4], 0);
  if ((_DWORD)v3 != -13)
  {
    v4 = v3;
    SBLogAuthenticationKeybag();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__SBFMobileKeyBag_beginRecovery_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboardfoundation.mkb"), (int)v4, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)waitForUnlockWithTimeout:(float)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  char v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[5];
  id v19;
  _QWORD v20[4];
  NSObject *v21;

  BSDispatchQueueAssertNot();
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke;
  v20[3] = &unk_1E200E250;
  v7 = v5;
  v21 = v7;
  v8 = (void *)MEMORY[0x18D774178](v20);
  queue = self->_queue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_2;
  block[3] = &unk_1E200E278;
  block[4] = self;
  v10 = v8;
  v19 = v10;
  dispatch_sync(queue, block);
  -[SBFMobileKeyBag state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEffectivelyLocked");

  if ((v12 & 1) == 0)
    dispatch_semaphore_signal(v7);
  v13 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v7, v13);
  v14 = self->_queue;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_3;
  v16[3] = &unk_1E200E278;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  dispatch_sync(v14, v16);

}

intptr_t __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result;

  result = objc_msgSend(a2, "isEffectivelyLocked");
  if ((result & 1) == 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return result;
}

void __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  v6 = (id)MEMORY[0x18D774178](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v6);

}

void __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v2 = (id)MEMORY[0x18D774178](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "removeObject:", v2);

}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFMobileKeyBag.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBFMobileKeyBag_addObserver___block_invoke;
  block[3] = &unk_1E200E2A0;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __31__SBFMobileKeyBag_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFMobileKeyBag.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBFMobileKeyBag_removeObserver___block_invoke;
  block[3] = &unk_1E200E2A0;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __34__SBFMobileKeyBag_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)refreshContinuityUnlockHeartbeat
{
  int v2;
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = aks_oneness_heartbeat();
  v3 = CFSTR("not currently in continuity unlocked state");
  if (!v2)
    v3 = CFSTR("success");
  v4 = v3;
  SBLogAuthenticationKeybag();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed continuity unlock heartbeat with result: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_queue_firstUnlockOccurred
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *queue_performAfterFirstUnlockBlocks;
  NSObject *v6;
  NSObject *calloutQueue;
  NSMutableArray *v8;
  id v9;
  _QWORD block[4];
  id v11;
  SBFMobileKeyBag *v12;
  NSMutableArray *v13;
  uint8_t buf[16];

  BSDispatchQueueAssert();
  v3 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  v4 = self->_queue_performAfterFirstUnlockBlocks;
  queue_performAfterFirstUnlockBlocks = self->_queue_performAfterFirstUnlockBlocks;
  self->_queue_performAfterFirstUnlockBlocks = 0;

  SBLogAuthenticationKeybag();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "First unlock occurred", buf, 2u);
  }

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBFMobileKeyBag__queue_firstUnlockOccurred__block_invoke;
  block[3] = &unk_1E200E2F0;
  v11 = v3;
  v12 = self;
  v13 = v4;
  v8 = v4;
  v9 = v3;
  dispatch_async(calloutQueue, block);

}

void __45__SBFMobileKeyBag__queue_firstUnlockOccurred__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "keybagDidUnlockForTheFirstTime:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(a1 + 48);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)_queue_handleKeybagStatusChanged
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  SBFMobileKeyBag *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v3 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  v4 = (void *)-[NSMutableArray copy](self->_queue_observerStateChangedCallbackBlocks, "copy");
  -[SBFMobileKeyBag _queue_lockStateExtended:](self, "_queue_lockStateExtended:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFMobileKeyBag _queue_setHasPasscodeIfNecessary:](self, "_queue_setHasPasscodeIfNecessary:", v5);
  SBLogAuthenticationKeybag();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "Keybag state changed: %{public}@", buf, 0xCu);

  }
  calloutQueue = self->_calloutQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__SBFMobileKeyBag__queue_handleKeybagStatusChanged__block_invoke;
  v12[3] = &unk_1E200E318;
  v13 = v4;
  v14 = v5;
  v15 = v3;
  v16 = self;
  v9 = v3;
  v10 = v5;
  v11 = v4;
  dispatch_async(calloutQueue, v12);

}

void __51__SBFMobileKeyBag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v38;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v4);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "keybagWillBeginProcessingStateChange:", *(_QWORD *)(a1 + 56));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = *(id *)(a1 + 48);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "keybag:extendedStateDidChange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v15);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = *(id *)(a1 + 48);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v24, "keybagDidFinishProcessingStateChange:", *(_QWORD *)(a1 + 56), (_QWORD)v25);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v21);
  }

}

- (BOOL)_queue_verifyExpectedStashState:(int64_t)a3
{
  uint64_t (*MKBKeyBagKeyStashVerify)();
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  CFTypeID v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t (*MKBGetDeviceLockState)(uint64_t);
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t valuePtr;
  const __CFString *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  MKBKeyBagKeyStashVerify = _get_MKBKeyBagKeyStashVerify();
  v5 = (const __CFDictionary *)MKBKeyBagKeyStashVerify();
  if (v5)
  {
    v6 = v5;
    Value = (const __CFNumber *)CFDictionaryGetValue(v5, CFSTR("StashBagValidOnDisk"));
    if (Value && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFNumberGetTypeID()))
    {
      valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
      v10 = valuePtr == a3;
      if (!v10)
      {
        SBLogAuthenticationKeybag();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v22 = valuePtr;
          _os_log_impl(&dword_18AB69000, v11, OS_LOG_TYPE_DEFAULT, "MKBKeyBagStashVerify() returned unexpected stash state %lld", buf, 0xCu);
        }

        SBLogAuthenticationKeybag();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          MKBGetDeviceLockState = _get_MKBGetDeviceLockState();
          v19 = CFSTR("ExtendedDeviceLockState");
          v20 = *MEMORY[0x1E0C9AE50];
          v14 = MKBGetDeviceLockState(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v14;
          _os_log_impl(&dword_18AB69000, v12, OS_LOG_TYPE_DEFAULT, "keybag extended state = %d", buf, 8u);
        }

      }
    }
    else
    {
      SBLogAuthenticationKeybag();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AB69000, v15, OS_LOG_TYPE_DEFAULT, "MKBKeyBagStashVerify() did not return a stash state", buf, 2u);
      }

      v10 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    SBLogAuthenticationKeybag();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AB69000, v16, OS_LOG_TYPE_DEFAULT, "MKBKeyBagKeyStashVerify() returned NULL", buf, 2u);
    }

    return 0;
  }
  return v10;
}

- (void)_queue_createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*MKBKeyBagKeyStashCommit)();
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];

  v4 = a4;
  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssert();
  v27 = CFSTR("SkipSE");
  v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v4)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v28[0] = *v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _get_MKBKeyBagKeyStashCreateWithOpts();
  v10 = v9((uint64_t)v8, 1, 0, (uint64_t)v6);

  if ((_DWORD)v10)
  {
    SBLogAuthenticationKeybag();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBFMobileKeyBag _queue_createStashBag:skipSEKeepUserDataOperation:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (!-[SBFMobileKeyBag _queue_verifyExpectedStashState:](self, "_queue_verifyExpectedStashState:", 0))
      goto LABEL_12;
    MKBKeyBagKeyStashCommit = _get_MKBKeyBagKeyStashCommit();
    v19 = MKBKeyBagKeyStashCommit();
    if (!(_DWORD)v19)
    {
      -[SBFMobileKeyBag _queue_verifyExpectedStashState:](self, "_queue_verifyExpectedStashState:", 1);
      goto LABEL_12;
    }
    v20 = v19;
    SBLogAuthenticationKeybag();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBFMobileKeyBag _queue_createStashBag:skipSEKeepUserDataOperation:].cold.1(v20, v11, v21, v22, v23, v24, v25, v26);
  }

LABEL_12:
}

- (void)_queue_setHasPasscodeIfNecessary:(id)a3
{
  self->_queue_hasPasscodeSet = objc_msgSend(a3, "lockState") != 3;
}

- (BOOL)_queue_isContinuityUnlocked
{
  __int128 v5;
  __int128 v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  -[SBFMobileKeyBag _queue_aksDeviceState](self, "_queue_aksDeviceState", 0, 0, 0, 0, 0);
  return (*(_QWORD *)((char *)&v5 + 2) >> 4) & 1;
}

- ($5FACF4406A79EE03481B7753C49AE7A4)_queue_aksDeviceState
{
  $5FACF4406A79EE03481B7753C49AE7A4 *result;
  NSObject *v5;

  BSDispatchQueueAssert();
  *(_WORD *)&retstr->var11[8] = 0;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  result = ($5FACF4406A79EE03481B7753C49AE7A4 *)aks_get_extended_device_state();
  if ((_DWORD)result)
  {
    SBLogAuthenticationKeybag();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBFMobileKeyBag _queue_aksDeviceState].cold.1();

  }
  return result;
}

- (id)_queue_keyBagInfo
{
  uint64_t (*MKBGetDeviceLockStateInfo)(uint64_t);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[8];
  _QWORD v21[8];
  __int128 v22;
  _OWORD v23[3];
  __int16 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v24 = 0;
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  -[SBFMobileKeyBag _queue_aksDeviceState](self, "_queue_aksDeviceState");
  MKBGetDeviceLockStateInfo = _get_MKBGetDeviceLockStateInfo();
  v4 = (void *)MKBGetDeviceLockStateInfo(0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0, CFSTR("kSBFKeyBagInfoExtendedLockState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v20[1] = CFSTR("kSBFKeyBagInfoLockState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("kSBFKeyBagInfoKeyBagState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = CFSTR("kSBFKeyBagInfoBackOff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  v20[4] = CFSTR("kSBFKeyBagInfoFailedAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v9;
  v20[5] = CFSTR("kSBFKeyBagInfoPermanentlyBlocked");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5D8]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = MEMORY[0x1E0C9AAA0];
  if (v10)
    v13 = v10;
  else
    v13 = MEMORY[0x1E0C9AAA0];
  v21[5] = v13;
  v20[6] = CFSTR("kSBFKeyBagInfoShouldWipe");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5E0]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = v12;
  v21[6] = v16;
  v20[7] = CFSTR("kSBFKeyBagInfoRecoveryCountdown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)((char *)v23 + 10));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_shouldHandleKeyBagEventWithHandleState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SBOnenessUnlockPrototyping"));

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD650]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == -501;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_performAfterFirstUnlockBlocks, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_observerStateChangedCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)maxUnlockAttempts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_18AB69000, v0, v1, "MKBGetDeviceConfigurations() returned 0 for kMKBConfigMaxUnlockAttempts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __39__SBFMobileKeyBag_beginRecovery_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18AB69000, a2, a3, "MKBKeyBagPerformRecovery() returned %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_queue_createStashBag:(uint64_t)a3 skipSEKeepUserDataOperation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18AB69000, a2, a3, "MKBKeyBagKeyStashCommit() returned %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_queue_createStashBag:(uint64_t)a3 skipSEKeepUserDataOperation:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18AB69000, a2, a3, "MKBKeyBagKeyStashCreate() returned %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_queue_aksDeviceState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_18AB69000, v0, v1, "Failed to get device state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
