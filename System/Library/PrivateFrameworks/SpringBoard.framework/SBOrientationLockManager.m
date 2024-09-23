@implementation SBOrientationLockManager

+ (SBOrientationLockManager)sharedInstance
{
  void *v2;
  SBOrientationLockManager *v3;
  void *v4;

  v2 = (void *)sharedInstance___instance_4;
  if (!sharedInstance___instance_4)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBOrientationLockManager);
    v4 = (void *)sharedInstance___instance_4;
    sharedInstance___instance_4 = (uint64_t)v3;

    kdebug_trace();
    BKSHIDServicesUnlockOrientation();
    v2 = (void *)sharedInstance___instance_4;
  }
  return (SBOrientationLockManager *)v2;
}

- (BOOL)isUserLocked
{
  return self->_userLockedOrientation != 0;
}

- (int64_t)userLockOrientation
{
  return self->_userLockedOrientation;
}

- (void)restoreStateFromPrefs
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotationDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lastLockedOrientation");

  if (v5)
  {
    if (v5 != self->_userLockedOrientation)
      -[SBOrientationLockManager lock:](self, "lock:", v5);
  }
}

- (SBOrientationLockManager)init
{
  SBOrientationLockManager *v2;
  NSMutableSet *v3;
  NSMutableSet *lockOverrideReasons;
  uint64_t v5;
  NSMutableDictionary *shimmedDeviceOrientationAssertions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBOrientationLockManager;
  v2 = -[SBOrientationLockManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lockOverrideReasons = v2->_lockOverrideReasons;
    v2->_lockOverrideReasons = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    shimmedDeviceOrientationAssertions = v2->_shimmedDeviceOrientationAssertions;
    v2->_shimmedDeviceOrientationAssertions = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked"))
    BKSHIDServicesUnlockOrientation();
  self->_runLoopObserver = 0;
  v3.receiver = self;
  v3.super_class = (Class)SBOrientationLockManager;
  -[SBOrientationLockManager dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;

  v3 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  if (__sb__runningInSpringBoard())
  {
    v4 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 1;

  }
  if (v4)
    v6 = v3;
  else
    v6 = 1;
  -[SBOrientationLockManager lock:](self, "lock:", v6);
}

- (void)lock:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", MEMORY[0x1E0C809B0], 3221225472, __33__SBOrientationLockManager_lock___block_invoke, &unk_1E8E9DE88, self, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0DAC368], self);

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rotationDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "lastLockedOrientation") != a3)
    objc_msgSend(v7, "setLastLockedOrientation:", self->_userLockedOrientation);

}

void __33__SBOrientationLockManager_lock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2 != *(_QWORD *)(a1 + 40))
  {
    BKLogOrientationGlobal();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Enabling global orientation lock for user", v5, 2u);
    }

    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v1 + 8) = v2;
}

- (void)unlock
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SBOrientationLockManager_unlock__block_invoke;
  v6[3] = &unk_1E8E9DED8;
  v6[4] = self;
  -[SBOrientationLockManager _updateLockStateWithChanges:](self, "_updateLockStateWithChanges:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0DAC368], self);

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rotationDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastLockedOrientation:", 0);

}

void __34__SBOrientationLockManager_unlock__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    BKLogOrientationGlobal();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Disabling global orientation lock for user", v4, 2u);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v1 + 8) = 0;
}

- (BOOL)isEffectivelyLocked
{
  return -[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled")
      || self->_userLockedOrientation != 0;
}

- (int64_t)effectiveLockedOrientation
{
  if (-[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked"))
    return self->_previousLockedOrientation;
  else
    return 0;
}

- (int64_t)deviceOrientationAsFarAsAppsAreConcerned
{
  int64_t result;
  void *v3;
  int64_t v4;

  result = self->_userLockedOrientation;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "orientation");

    return v4;
  }
  return result;
}

- (void)_addLockOverrideReason:(id)a3 orientation:(int64_t)a4 force:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[NSMutableSet containsObject:](self->_lockOverrideReasons, "containsObject:", v6) & 1) == 0)
  {
    BKLogOrientationGlobal();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Enabling global orientation lock override for reason: %{public}@, new orientation: %{public}@, forced %{public}@", (uint8_t *)&v10, 0x20u);

    }
  }
  -[NSMutableSet addObject:](self->_lockOverrideReasons, "addObject:", v6);

}

- (void)_removeLockOverrideReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_lockOverrideReasons, "containsObject:", v4))
  {
    BKLogOrientationGlobal();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Disabling global orientation lock override for reason: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSMutableSet removeObject:](self->_lockOverrideReasons, "removeObject:", v4);

}

- (void)setLockOverrideEnabled:(BOOL)a3 forReason:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBOrientationLockManager_setLockOverrideEnabled_forReason___block_invoke;
  v8[3] = &unk_1E8E9EE00;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SBOrientationLockManager _updateLockStateWithChanges:](self, "_updateLockStateWithChanges:", v8);

}

uint64_t __61__SBOrientationLockManager_setLockOverrideEnabled_forReason___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_addLockOverrideReason:orientation:force:", v4, 0, 0);
  else
    return objc_msgSend(v3, "_removeLockOverrideReason:", v4);
}

- (void)enableLockOverrideForReason:(id)a3 suggestOrientation:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SBOrientationLockManager_enableLockOverrideForReason_suggestOrientation___block_invoke;
  v8[3] = &unk_1E8EA0AF0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", a4, 0, v8);

}

uint64_t __75__SBOrientationLockManager_enableLockOverrideForReason_suggestOrientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLockOverrideReason:orientation:force:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)enableLockOverrideForReason:(id)a3 forceOrientation:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBOrientationLockManager_enableLockOverrideForReason_forceOrientation___block_invoke;
  v8[3] = &unk_1E8EA0AF0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", a4, 1, v8);

}

uint64_t __73__SBOrientationLockManager_enableLockOverrideForReason_forceOrientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLockOverrideReason:orientation:force:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)_beginShimmingForReason:(id)a3
{
  void *v4;
  NSMutableDictionary *shimmedDeviceOrientationAssertions;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_shimmedDeviceOrientationAssertions, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    shimmedDeviceOrientationAssertions = self->_shimmedDeviceOrientationAssertions;
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](shimmedDeviceOrientationAssertions, "setObject:forKey:", v6, v7);

  }
}

- (void)_endShimmingForReason:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_shimmedDeviceOrientationAssertions, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_shimmedDeviceOrientationAssertions, "removeObjectForKey:", v6);
  }

}

- (BOOL)lockOverrideEnabled
{
  return -[NSMutableSet count](self->_lockOverrideReasons, "count") != 0;
}

- (void)updateLockOverrideForCurrentDeviceOrientation
{
  if (-[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled"))
  {
    BKSHIDServicesUnlockOrientation();
    -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", BKHIDServicesGetNonFlatDeviceOrientation(), 1, 0);
  }
}

- (void)_updateLockStateWithChanges:(id)a3
{
  -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", 0, 0, a3);
}

- (void)_updateLockStateWithOrientation:(int64_t)a3 forceUpdateHID:(BOOL)a4 changes:(id)a5
{
  _BOOL4 v5;
  void (**v7)(_QWORD);
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  _BOOL4 v13;
  int v14;
  int64_t previousLockedOrientation;
  int64_t userLockedOrientation;
  _BOOL4 v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  __CFString *v26;
  _BOOL4 v27;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v5 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a5;
  v8 = -[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked");
  v9 = -[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled");
  if (v7)
    v7[2](v7);
  v10 = -[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked");
  v11 = -[SBOrientationLockManager isUserLocked](self, "isUserLocked");
  v12 = -[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled");
  v13 = 0;
  v14 = v8 ^ v10;
  v27 = v8;
  if (v11 && !v12)
  {
    previousLockedOrientation = self->_previousLockedOrientation;
    userLockedOrientation = self->_userLockedOrientation;
    v17 = !a3 && v9;
    v13 = previousLockedOrientation != userLockedOrientation;
    if (previousLockedOrientation != userLockedOrientation && v17)
    {
      BKLogOrientationDevice();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:].cold.1((uint64_t)&self->_userLockedOrientation, (uint64_t)&self->_previousLockedOrientation, v18);

      a3 = self->_userLockedOrientation;
      v13 = 1;
    }
  }
  v19 = (v10 && v5) | v14 | v13;
  BKLogOrientationDevice();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBOrientationLockManager isUserLocked](self, "isUserLocked");
    NSStringFromBOOL();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeviceOrientationDescription();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled");
    if (v25)
    {
      -[NSMutableSet description](self->_lockOverrideReasons, "description");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = CFSTR("NO");
    }
    *(_DWORD *)buf = 138544386;
    v30 = v21;
    v31 = 2114;
    v32 = v22;
    v33 = 2114;
    v34 = v23;
    v35 = 2114;
    v36 = v24;
    v37 = 2114;
    v38 = v26;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "SB orientation locked: %{public}@; user lock: %{public}@, was stale: %{public}@, orientation: %{public}@ overrides: %{public}@, ",
      buf,
      0x34u);
    if (v25)

  }
  if (v19)
    -[SBOrientationLockManager _setupRunLoopObserverIfNecessaryForOrientation:andInitialLockState:](self, "_setupRunLoopObserverIfNecessaryForOrientation:andInitialLockState:", a3, v27);

}

- (void)_setupRunLoopObserverIfNecessaryForOrientation:(int64_t)a3 andInitialLockState:(BOOL)a4
{
  __CFRunLoop *Main;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11[2];
  BOOL v12;
  id location;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBOrientationLockManager _setupRunLoopObserverIfNecessaryForOrientation:andInitialLockState:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBOrientationLockManager.m"), 271, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_runLoopObserver)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__SBOrientationLockManager__setupRunLoopObserverIfNecessaryForOrientation_andInitialLockState___block_invoke;
    block[3] = &unk_1E8EADC38;
    objc_copyWeak(v11, &location);
    v12 = a4;
    v11[1] = (id)a3;
    block[4] = self;
    self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, 0x7FFFFFFFLL, block);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __95__SBOrientationLockManager__setupRunLoopObserverIfNecessaryForOrientation_andInitialLockState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "isEffectivelyLocked");
  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "orientation");

  }
  if (*(unsigned __int8 *)(a1 + 56) == v3 && v4 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      BKSHIDServicesUnlockOrientation();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    }
    if (v3)
    {
      objc_msgSend(WeakRetained, "isUserLocked");
      BKSHIDServicesLockOrientation();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v4;
    }
    v7 = 1;
  }
  BKLogOrientationGlobal();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v3)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (v7)
      v9 = CFSTR("YES");
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SB orientation lock change handler fired! is locked: %{public}@; performed update: %{public}@",
      (uint8_t *)&v11,
      0x16u);
  }

  objc_msgSend(WeakRetained, "_handler_runLoopObserverDispose");
}

- (void)_handler_runLoopObserverDispose
{
  CFRunLoopObserverInvalidate(self->_runLoopObserver);
  CFRelease(self->_runLoopObserver);
  self->_runLoopObserver = 0;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBOrientationLockManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  int64_t userLockedOrientation;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked"), CFSTR("effectivelyLocked"));
  userLockedOrientation = self->_userLockedOrientation;
  if (userLockedOrientation != -[SBOrientationLockManager effectiveLockedOrientation](self, "effectiveLockedOrientation"))
  {
    -[SBOrientationLockManager effectiveLockedOrientation](self, "effectiveLockedOrientation");
    BSInterfaceOrientationDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("effectiveLockedOrientation"));

  }
  if (self->_userLockedOrientation)
  {
    BSInterfaceOrientationDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("userLockedInterfaceOrientation"));

  }
  if (-[SBOrientationLockManager lockOverrideEnabled](self, "lockOverrideEnabled"))
  {
    -[NSMutableSet allObjects](self->_lockOverrideReasons, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("overrideReasons"));

  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBOrientationLockManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shimmedDeviceOrientationAssertions, 0);
  objc_storeStrong((id *)&self->_lockOverrideReasons, 0);
}

- (void)_updateLockStateWithOrientation:(uint64_t)a1 forceUpdateHID:(uint64_t)a2 changes:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BSDeviceOrientationDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeviceOrientationDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Restoring user locked orientation: %{public}@, was locked to: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
