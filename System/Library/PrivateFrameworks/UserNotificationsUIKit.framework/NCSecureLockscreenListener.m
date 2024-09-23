@implementation NCSecureLockscreenListener

+ (BOOL)isSensitiveUIEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;

  if (!MEMORY[0x1D17DCDFC]("+[NCSecureLockscreenListener isSensitiveUIEnabled]", a2))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.internal.NotificationsUITool"));

  if ((v5 & 1) != 0)
    return 1;
  objc_msgSend(a1, "_shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_sensitiveUIEnabled");

  return v8;
}

+ (void)addObserver:(id)a3 changeBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (MEMORY[0x1D17DCDFC]("+[NCSecureLockscreenListener addObserver:changeBlock:]"))
  {
    objc_msgSend(a1, "_shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(v6);
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
}

+ (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (MEMORY[0x1D17DCDFC]("+[NCSecureLockscreenListener removeObserver:]"))
  {
    objc_msgSend(a1, "_shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (id)_init
{
  NCSecureLockscreenListener *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 sensitiveUIEnabled;
  void *v6;
  uint64_t v7;
  NSMapTable *observers;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NCSecureLockscreenListener;
  v2 = -[NCSecureLockscreenListener init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_sensitiveUIEnabled = objc_msgSend(v3, "BOOLForKey:", CFSTR("SBSensitiveUIEnabled"));

    v4 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      sensitiveUIEnabled = v2->_sensitiveUIEnabled;
      *(_DWORD *)buf = 138543618;
      v12 = CFSTR("SBSensitiveUIEnabled");
      v13 = 1024;
      v14 = sensitiveUIEnabled;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "Secure Lock Screen: %{public}@ initing to %d", buf, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("SBSensitiveUIEnabled"), 1, 0);

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v7;

  }
  return v2;
}

+ (id)_shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NCSecureLockscreenListener__shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_shared_onceToken_0 != -1)
    dispatch_once(&_shared_onceToken_0, block);
  return (id)_shared_shared_0;
}

void __37__NCSecureLockscreenListener__shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)_shared_shared_0;
  _shared_shared_0 = v1;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL4 sensitiveUIEnabled;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SBSensitiveUIEnabled")))
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v25, "BOOLValue");
    sensitiveUIEnabled = self->_sensitiveUIEnabled;
    self->_sensitiveUIEnabled = v12;
    v14 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v32 = CFSTR("SBSensitiveUIEnabled");
      v33 = 1024;
      v34 = sensitiveUIEnabled;
      v35 = 1024;
      v36 = v12;
      _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "Secure Lock Screen: %{public}@ changed from %d to %d", buf, 0x18u);
    }
    v15 = (void *)MEMORY[0x1D17DD03C]();
    -[NSMapTable objectEnumerator](self->_observers, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v15);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x1D17DD03C]();
          (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v23, v12);
          objc_autoreleasePoolPop(v24);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

  }
}

- (BOOL)_sensitiveUIEnabled
{
  return self->_sensitiveUIEnabled;
}

- (void)_setSensitiveUIEnabled:(BOOL)a3
{
  self->_sensitiveUIEnabled = a3;
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
