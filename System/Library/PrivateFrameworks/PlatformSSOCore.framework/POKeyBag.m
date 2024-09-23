@implementation POKeyBag

- (POKeyBag)init
{
  POKeyBag *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POKeyBag;
  result = -[POKeyBag init](&v3, sel_init);
  if (result)
  {
    result->_firstUnlock = 0;
    result->_notifyToken = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[POKeyBag stopObservingKeyBagLockStatusChanges](self, "stopObservingKeyBagLockStatusChanges");
  v3.receiver = self;
  v3.super_class = (Class)POKeyBag;
  -[POKeyBag dealloc](&v3, sel_dealloc);
}

- (BOOL)isUserKeybagUnlocked
{
  int v2;
  NSObject *v3;

  v2 = MKBGetDeviceLockState();
  PO_LOG_POKeyBag();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POKeyBag isUserKeybagUnlocked].cold.1(v2, v3);

  return v2 == 0;
}

- (void)waitForKeyBagUnlockWithCompletion:(id)a3
{
  POKeyBag *v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[POKeyBag isUserKeybagUnlocked](v4, "isUserKeybagUnlocked"))
    v5[2](v5);
  else
    -[POKeyBag setUnlockCompletion:](v4, "setUnlockCompletion:", v5);
  objc_sync_exit(v4);

}

- (void)waitForKeyBagFirstUnlockOnStartupWithCompletion:(id)a3
{
  POKeyBag *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[POKeyBag firstUnlock](v4, "firstUnlock") || -[POKeyBag isUserKeybagUnlocked](v4, "isUserKeybagUnlocked"))
    v5[2]();
  else
    -[POKeyBag setStartupCompletion:](v4, "setStartupCompletion:", v5);
  objc_sync_exit(v4);

}

- (void)startObservingKeyBagLockStatusChanges
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24440D000, a2, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_2();
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  void (**v11)(void);
  void *v12;
  void (**v13)(void);

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isUserKeybagUnlocked");
  PO_LOG_POKeyBag();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "setFirstUnlock:", 1);
    objc_msgSend(*(id *)(a1 + 32), "startupCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      PO_LOG_POKeyBag();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "startupCompletion");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

      objc_msgSend(*(id *)(a1 + 32), "setStartupCompletion:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "unlockCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      PO_LOG_POKeyBag();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "unlockCompletion");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();

      objc_msgSend(*(id *)(a1 + 32), "setUnlockCompletion:", 0);
    }
  }
  else
  {
    if (v5)
      __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_4();

    objc_msgSend(*(id *)(a1 + 32), "lockHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "lockHandler");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

    }
  }
  objc_sync_exit(v2);

}

- (void)stopObservingKeyBagLockStatusChanges
{
  int notifyToken;

  notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = 0;
  }
}

- (id)lockHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setLockHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)unlockCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUnlockCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)startupCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setStartupCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)firstUnlock
{
  return self->_firstUnlock;
}

- (void)setFirstUnlock:(BOOL)a3
{
  self->_firstUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startupCompletion, 0);
  objc_storeStrong(&self->_unlockCompletion, 0);
  objc_storeStrong(&self->_lockHandler, 0);
}

- (void)isUserKeybagUnlocked
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "unlock state %x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_2();
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "calling completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "calling startup completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "keybag unlocked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "keybag locked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
