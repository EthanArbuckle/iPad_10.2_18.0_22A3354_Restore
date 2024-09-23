@implementation PKUIForegroundActiveArbiter

- (void)willEnterForegroundPrelude
{
  NSObject *v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willEnterForegroundPrelude.", v7, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_active)
  {
    v4 = 0;
    v5 = 0;
    v6 = 1;
  }
  else
  {
    v6 = 0;
    self->_enteringForegroundExpired = 0;
    v4 = 1;
    v5 = 1;
  }
  self->_foreground = v6;
  self->_enteringForeground = v4;
  -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", v5);
}

- (void)didBecomeActive
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: didBecomeActive.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 1;
  *(_WORD *)&self->_foreground = 1;
  -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", 0);
}

- (void)_updateForegroundActiveWithEnteringForegroundPolicy:(int64_t)a3
{
  unint64_t v4;
  NSObject *enteringForegroundTimeout;
  OS_dispatch_source *v7;
  BOOL v9;
  unint64_t backgroundTaskIdentifier;
  _BOOL4 v11;
  unint64_t v12;
  _BOOL4 foreground;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  NSObject *v22;
  void *v23;
  uint8_t v24[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC4878];
  if ((a3 | 2) == 2)
  {
    enteringForegroundTimeout = self->_enteringForegroundTimeout;
    if (enteringForegroundTimeout)
    {
      dispatch_source_cancel(enteringForegroundTimeout);
      v7 = self->_enteringForegroundTimeout;
      self->_enteringForegroundTimeout = 0;

    }
    v9 = a3 == 2 && self->_enteringForeground;
    self->_enteringForegroundExpired = v9;
    backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    self->_backgroundTaskIdentifier = v4;
  }
  else
  {
    backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
  }
  if (self->_foreground && self->_active || self->_enteringForeground && !self->_enteringForegroundExpired)
  {
    v11 = 1;
    v12 = 256;
    foreground = 1;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    foreground = self->_foreground;
  }
  if (self->_foregroundActiveState.foregroundActive == v11 && self->_foregroundActiveState.foreground == foreground)
  {
    v14 = 0;
  }
  else
  {
    self->_foregroundActiveState.foreground = foreground;
    self->_foregroundActiveState.foregroundActive = v11;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_lock);
  v15 = (void *)MEMORY[0x1A1AE621C]();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    v20 = v12 | foreground;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v12 = v20 | v12 & 0xFFFFFFFFFFFF0000;
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "foregroundActiveArbiter:didUpdateForegroundActiveState:", self, v12);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  objc_autoreleasePoolPop(v15);
  if (backgroundTaskIdentifier != v4)
  {
    PKLogFacilityTypeGetObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: ending background task.", v24, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endBackgroundTask:", backgroundTaskIdentifier);

  }
}

- (void)willEnterForegroundPostlude
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willEnterForegroundPostlude.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_enteringForeground)
    -[PKUIForegroundActiveArbiter _beginEnteringForegroundTimer](self, "_beginEnteringForegroundTimer");
  else
    os_unfair_lock_unlock(&self->_lock);
}

- (void)_beginEnteringForegroundTimer
{
  void *v3;
  NSObject *enteringForegroundTimeout;
  OS_dispatch_source *v5;
  unint64_t backgroundTaskIdentifier;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint8_t v14[8];
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKUIForegroundActiveArbiter__beginEnteringForegroundTimer__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  enteringForegroundTimeout = self->_enteringForegroundTimeout;
  if (enteringForegroundTimeout)
  {
    dispatch_source_cancel(enteringForegroundTimeout);
    v5 = self->_enteringForegroundTimeout;
    self->_enteringForegroundTimeout = 0;

  }
  backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
  v7 = *MEMORY[0x1E0DC4878];
  if (backgroundTaskIdentifier == *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_backgroundTaskIdentifier = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Entering Foreground"), v3);

    backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
  }
  if (backgroundTaskIdentifier == v7)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: expiring entering foreground state (failed to acquire background task).", v14, 2u);
    }

    self->_enteringForegroundExpired = 1;
    -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", 2);
  }
  else
  {
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v11 = self->_enteringForegroundTimeout;
    self->_enteringForegroundTimeout = v10;

    v12 = self->_enteringForegroundTimeout;
    v13 = dispatch_time(0, 2500000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_enteringForegroundTimeout, v3);
    dispatch_resume((dispatch_object_t)self->_enteringForegroundTimeout);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- ($96EE1C12479E9B303E9C2794B92A11A2)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  $77BFE790A1370D46B4241309C9753022 foregroundActiveState;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  foregroundActiveState = self->_foregroundActiveState;
  if (v5)
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  os_unfair_lock_unlock(p_lock);

  return *($96EE1C12479E9B303E9C2794B92A11A2 *)&foregroundActiveState;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_684 != -1)
    dispatch_once(&_MergedGlobals_684, &__block_literal_global_182);
  return (id)qword_1ED06C7F0;
}

- (void)_willAddDeactivationReasonNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unsigned int deactivationReasons;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  os_unfair_lock_lock(&self->_lock);
  deactivationReasons = self->_deactivationReasons;
  v9 = deactivationReasons | (1 << v7);
  if (deactivationReasons == v9)
  {
    v10 = 0;
  }
  else
  {
    self->_deactivationReasons = v9;
    -[NSHashTable allObjects](self->_deactivationObservers, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x1A1AE621C]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "foregroundActiveArbiter:didUpdateDeactivationReasons:", self, self->_deactivationReasons, (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(v11);
}

- (void)_didRemoveDeactivationReasonNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unsigned int deactivationReasons;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  os_unfair_lock_lock(&self->_lock);
  deactivationReasons = self->_deactivationReasons;
  v9 = deactivationReasons & ~(1 << v7);
  if (deactivationReasons == v9)
  {
    v10 = 0;
  }
  else
  {
    self->_deactivationReasons = v9;
    -[NSHashTable allObjects](self->_deactivationObservers, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x1A1AE621C]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "foregroundActiveArbiter:didUpdateDeactivationReasons:", self, self->_deactivationReasons, (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(v11);
}

void __45__PKUIForegroundActiveArbiter_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  if ((PKRunningInRemoteContext() & 1) != 0)
    v0 = 0;
  else
    v0 = -[PKUIForegroundActiveArbiter _init]([PKUIForegroundActiveArbiter alloc], "_init");
  v1 = (void *)qword_1ED06C7F0;
  qword_1ED06C7F0 = (uint64_t)v0;

}

- (id)_init
{
  PKUIForegroundActiveArbiter *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  NSHashTable *deactivationObservers;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKUIForegroundActiveArbiter;
  v2 = -[PKUIForegroundActiveArbiter init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = objc_claimAutoreleasedReturnValue();
    deactivationObservers = v2->_deactivationObservers;
    v2->_deactivationObservers = (NSHashTable *)v5;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__willAddDeactivationReasonNotification_, *MEMORY[0x1E0DC5760], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__didRemoveDeactivationReasonNotification_, *MEMORY[0x1E0DC5718], 0);

  }
  return v2;
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

+ (BOOL)isDeactivedForReasons:(unsigned int)a3
{
  if ((a3 & 0xA05F) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isBackgroundedForReasons:");
}

+ (BOOL)isBackgroundedForReasons:(unsigned int)a3
{
  return (a3 & 0x1800) != 0;
}

- (PKUIForegroundActiveArbiter)init
{

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKUIForegroundActiveArbiter;
  -[PKUIForegroundActiveArbiter dealloc](&v4, sel_dealloc);
}

- (void)didEnterBackground
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: didEnterBackground.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_foreground = 0;
  -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", 0);
}

- (void)willResignActive
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willResignActive.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 0;
  self->_enteringForeground = 0;
  -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", 0);
}

- (void)willTerminate
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willTerminate.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 0;
  *(_WORD *)&self->_foreground = 0;
  -[PKUIForegroundActiveArbiter _updateForegroundActiveWithEnteringForegroundPolicy:](self, "_updateForegroundActiveWithEnteringForegroundPolicy:", 0);
}

uint64_t __60__PKUIForegroundActiveArbiter__beginEnteringForegroundTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: expiring entering foreground state.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateForegroundActiveWithEnteringForegroundPolicy:", 2);
}

- (unsigned)registerDeactivationObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  unsigned int deactivationReasons;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  deactivationReasons = self->_deactivationReasons;
  if (v5)
    -[NSHashTable addObject:](self->_deactivationObservers, "addObject:", v5);
  os_unfair_lock_unlock(p_lock);

  return deactivationReasons;
}

- (void)unregisterDeactivationObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSHashTable removeObject:](self->_deactivationObservers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteringForegroundTimeout, 0);
  objc_storeStrong((id *)&self->_deactivationObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
