@implementation RTDataProtectionManager

- (RTDataProtectionManager)init
{
  void *v3;
  void *v4;
  RTDataProtectionManager *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[RTDataProtectionManager initWithKeybagMonitor:notificationHelper:](self, "initWithKeybagMonitor:notificationHelper:", v3, v4);

  return v5;
}

- (RTDataProtectionManager)initWithKeybagMonitor:(id)a3 notificationHelper:(id)a4
{
  id v7;
  id v8;
  RTDataProtectionManager *v9;
  RTDataProtectionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTDataProtectionManager;
  v9 = -[RTNotifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationHelper, a4);
    objc_storeStrong((id *)&v10->_keybagMonitor, a3);
    v10->_encryptedDataAvailability = 0;
    v10->_unlockedSinceBoot = 1;
  }

  return v10;
}

+ (id)dataProtectionLockStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E92A60F0[a3];
}

+ (id)encryptedDataAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A6110[a3 - 1];
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.lock_status"), 0);

  -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);

  v5.receiver = self;
  v5.super_class = (Class)RTDataProtectionManager;
  -[RTDataProtectionManager dealloc](&v5, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.lock_status"), 0);

  -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  RTDataProtectionManager *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  const __CFString *v21;
  RTDataProtectionManagerNotificationEncryptedDataAvailability *v22;
  NSObject *p_super;
  NSObject *v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

  if (v9)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) == 1)
    {
      -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:center:key:callback:info:suspensionBehavior:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.lock_status"), onKeybagLockStatusChange, 0, 1);

      -[RTDataProtectionManager keybagMonitor](self, "keybagMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "getDeviceLockState");

      if (v12 < 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v28 = 134217984;
          v29 = (const __CFString *)v12;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Failed to determine lock state, %ld", (uint8_t *)&v28, 0xCu);
        }

        v13 = self;
        v14 = 0;
      }
      else
      {
        v13 = self;
        if (v12 == 2)
        {
          v14 = 3;
        }
        else if (v12 == 1)
        {
          v14 = 1;
        }
        else
        {
          v14 = 2;
        }
      }
      -[RTDataProtectionManager setEncryptedDataAvailability:](v13, "setEncryptedDataAvailability:", v14);
      _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        +[RTDataProtectionManager dataProtectionLockStateToString:](RTDataProtectionManager, "dataProtectionLockStateToString:", v12);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", -[RTDataProtectionManager encryptedDataAvailability](self, "encryptedDataAvailability"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v26;
        v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "lock state, %@, encrypted data availability, %@", (uint8_t *)&v28, 0x16u);

      }
    }
    v22 = -[RTDataProtectionManagerNotificationEncryptedDataAvailability initWithEncryptedDataAvailability:]([RTDataProtectionManagerNotificationEncryptedDataAvailability alloc], "initWithEncryptedDataAvailability:", -[RTDataProtectionManager encryptedDataAvailability](self, "encryptedDataAvailability"));
LABEL_26:
    p_super = &v22->super.super;
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v22, v6);
    goto LABEL_27;
  }
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[__CFString isEqualToString:](v7, "isEqualToString:", v15);

  if (v16)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) == 1)
    {
      -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:center:key:callback:info:suspensionBehavior:", self, CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.apple.mobile.keybagd.first_unlock"), onUnlockedSinceBoot, 0, 1);

    }
    -[RTDataProtectionManager keybagMonitor](self, "keybagMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDataProtectionManager setUnlockedSinceBoot:](self, "setUnlockedSinceBoot:", objc_msgSend(v18, "getUnlockedSinceBoot"));

    _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = -[RTDataProtectionManager unlockedSinceBoot](self, "unlockedSinceBoot");
      v21 = CFSTR("NO");
      if (v20)
        v21 = CFSTR("YES");
      v28 = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "unlocked since boot, %@", (uint8_t *)&v28, 0xCu);
    }

    v22 = -[RTDataProtectionManagerNotificationUnlockedSinceBoot initWithUnlockedSinceBoot:]([RTDataProtectionManagerNotificationUnlockedSinceBoot alloc], "initWithUnlockedSinceBoot:", -[RTDataProtectionManager unlockedSinceBoot](self, "unlockedSinceBoot"));
    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    v28 = 138412290;
    v29 = v7;
    _os_log_error_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v28, 0xCu);
  }
LABEL_27:

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  CFNotificationCenterRef DarwinNotifyCenter;
  const __CFString *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
    {
      -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v10 = CFSTR("com.apple.mobile.keybagd.lock_status");
LABEL_7:
      objc_msgSend(v8, "removeObserver:center:key:info:", self, DarwinNotifyCenter, v10, 0);

    }
  }
  else
  {
    +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqualToString:", v11);

    if (v12)
    {
      if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
      {
        -[RTDataProtectionManager notificationHelper](self, "notificationHelper");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v10 = CFSTR("com.apple.mobile.keybagd.first_unlock");
        goto LABEL_7;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }

}

- (void)handleKeybagLockStatusChange:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__RTDataProtectionManager_handleKeybagLockStatusChange___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __56__RTDataProtectionManager_handleKeybagLockStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  RTDataProtectionManagerNotificationEncryptedDataAvailability *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 2;
  if (v3 == 2)
    v4 = 3;
  if (v3 == 1)
    v5 = 1;
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "setEncryptedDataAvailability:", v5);
  _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    +[RTDataProtectionManager dataProtectionLockStateToString:](RTDataProtectionManager, "dataProtectionLockStateToString:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "received lock state change, %@, encrypted data availability, %@", (uint8_t *)&v10, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability") != v2)
  {
    v9 = -[RTDataProtectionManagerNotificationEncryptedDataAvailability initWithEncryptedDataAvailability:]([RTDataProtectionManagerNotificationEncryptedDataAvailability alloc], "initWithEncryptedDataAvailability:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(a1 + 32), "postNotification:", v9);

  }
}

- (void)handleUnlockedSinceBoot
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTDataProtectionManager_handleUnlockedSinceBoot__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __50__RTDataProtectionManager_handleUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  NSObject *v2;
  RTDataProtectionManagerNotificationUnlockedSinceBoot *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "received unlock since boot notification", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUnlockedSinceBoot:", 1);
  v3 = -[RTDataProtectionManagerNotificationUnlockedSinceBoot initWithUnlockedSinceBoot:]([RTDataProtectionManagerNotificationUnlockedSinceBoot alloc], "initWithUnlockedSinceBoot:", objc_msgSend(*(id *)(a1 + 32), "unlockedSinceBoot"));
  objc_msgSend(*(id *)(a1 + 32), "postNotification:", v3);

}

- (void)fetchLockStateDisabledWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__RTDataProtectionManager_fetchLockStateDisabledWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__RTDataProtectionManager_fetchLockStateDisabledWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "keybagMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getDeviceLockState");

  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 == 3, 0);
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (RTKeybagMonitor)keybagMonitor
{
  return self->_keybagMonitor;
}

- (void)setKeybagMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_keybagMonitor, a3);
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybagMonitor, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
