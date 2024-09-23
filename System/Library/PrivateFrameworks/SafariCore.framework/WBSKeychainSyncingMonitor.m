@implementation WBSKeychainSyncingMonitor

void __88__WBSKeychainSyncingMonitor_performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue_task___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

_QWORD *__53__WBSKeychainSyncingMonitor_keychainSyncSettingValue__block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 48) != 0;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 40);
  return result;
}

- (void)_updateAccountOnInternalQueue:(id)a3
{
  id v4;
  NSString *primaryAppleAccountAltDSID;
  ACAccount *primaryAppleAccount;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  ACAccount *v10;

  v4 = a3;
  primaryAppleAccountAltDSID = self->_primaryAppleAccountAltDSID;
  v10 = (ACAccount *)v4;
  primaryAppleAccount = self->_primaryAppleAccount;
  self->_primaryAppleAccount = v10;
  v7 = primaryAppleAccountAltDSID;

  -[ACAccount aa_altDSID](v10, "aa_altDSID");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = self->_primaryAppleAccountAltDSID;
  self->_primaryAppleAccountAltDSID = v8;

  LOBYTE(primaryAppleAccount) = WBSIsEqual(v7, self->_primaryAppleAccountAltDSID);
  if ((primaryAppleAccount & 1) == 0)
    -[WBSKeychainSyncingMonitor _updateKeychainClique](self, "_updateKeychainClique");
  -[WBSKeychainSyncingMonitor _fetchKeychainSyncingStatus](self, "_fetchKeychainSyncingStatus");

}

- (void)_fetchKeychainSyncingStatus
{
  OTClique *v3;
  NSObject *keychainStatusFetchingQueue;
  OTClique *v5;
  _QWORD v6[4];
  OTClique *v7;
  WBSKeychainSyncingMonitor *v8;

  v3 = self->_keychainClique;
  keychainStatusFetchingQueue = self->_keychainStatusFetchingQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke;
  v6[3] = &unk_1E649B6D8;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(keychainStatusFetchingQueue, v6);

}

void __65__WBSKeychainSyncingMonitor__keychainSyncingStatusMayHaveChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", WBSKeychainSyncStatusMayHaveChangedNotification, 0);

}

- (void)performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  NSObject *synchronousGetterQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  synchronousGetterQueue = self->_synchronousGetterQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__WBSKeychainSyncingMonitor_performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue_task___block_invoke;
  v11[3] = &unk_1E649B6B0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(synchronousGetterQueue, v11);

}

+ (WBSKeychainSyncingMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_12);
  return (WBSKeychainSyncingMonitor *)(id)sharedMonitor_sharedMonitor;
}

- (unint64_t)keychainSyncSettingValue
{
  NSObject *internalQueue;
  unint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSKeychainSyncingMonitor_keychainSyncSettingValue__block_invoke;
  block[3] = &unk_1E649C710;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v10;
  dispatch_sync(internalQueue, block);
  if (*((_BYTE *)v7 + 24))
    v3 = v11[3];
  else
    v3 = 1;
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

uint64_t __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountOnInternalQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_keychainSyncingStatusMayHaveChanged
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_13_1);
}

void __42__WBSKeychainSyncingMonitor_sharedMonitor__block_invoke()
{
  WBSKeychainSyncingMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(WBSKeychainSyncingMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

}

- (WBSKeychainSyncingMonitor)init
{
  WBSKeychainSyncingMonitor *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *keychainStatusFetchingQueue;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *synchronousGetterQueue;
  void *v14;
  WBSKeychainSyncingMonitor *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WBSKeychainSyncingMonitor;
  v2 = -[WBSKeychainSyncingMonitor init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor.keychainStatusFetchingQueue", v4);
    keychainStatusFetchingQueue = v2->_keychainStatusFetchingQueue;
    v2->_keychainStatusFetchingQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_initially_inactive(v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainSyncingMonitor.synchronousGetterQueue", v11);
    synchronousGetterQueue = v2->_synchronousGetterQueue;
    v2->_synchronousGetterQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__primaryAppleAccountDidChange, CFSTR("WBSPrimaryAppleAccountDidChangeNotification"), 0);

    -[WBSKeychainSyncingMonitor _primaryAppleAccountDidChange](v2, "_primaryAppleAccountDidChange");
    v15 = v2;

  }
  return v2;
}

- (void)_primaryAppleAccountDidChange
{
  void *v3;
  _QWORD v4[5];

  +[WBSPrimaryAppleAccountObserver sharedObserver](WBSPrimaryAppleAccountObserver, "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke;
  v4[3] = &unk_1E649C780;
  v4[4] = self;
  objc_msgSend(v3, "getPrimaryAppleAccountWithCompletionHandler:", v4);

}

void __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[6];
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  v3 = objc_msgSend(v2, "fetchUserControllableViewsSyncingEnabled:", &v11);
  v4 = v11;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    if (v4)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_cold_1(v7, v5);
    }
    v6 = v5 == 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_10;
  block[3] = &unk_1E649C738;
  block[4] = v8;
  block[5] = v6;
  dispatch_async(v9, block);
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 24));

}

void __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__WBSKeychainSyncingMonitor__primaryAppleAccountDidChange__block_invoke_2;
  v7[3] = &unk_1E649B6D8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_10(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 40))
  {
    *(_QWORD *)(v2 + 40) = v1;
    return objc_msgSend(*(id *)(result + 32), "_keychainSyncingStatusMayHaveChanged");
  }
  return result;
}

- (void)_updateKeychainClique
{
  OTClique *v3;
  OTClique *keychainClique;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
  objc_msgSend(v5, "setContext:", *MEMORY[0x1E0CD5C90]);
  objc_msgSend(v5, "setAltDSID:", self->_primaryAppleAccountAltDSID);
  v3 = (OTClique *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v5);
  keychainClique = self->_keychainClique;
  self->_keychainClique = v3;

}

- (BOOL)isKeychainSyncEnabled
{
  void *v3;
  void *v4;
  NSObject *v5;
  char v6;
  uint8_t v8[16];

  dispatch_sync((dispatch_queue_t)self->_synchronousGetterQueue, &__block_literal_global_16_0);
  if (!+[WBSFeatureAvailability isInternalInstall](WBSFeatureAvailability, "isInternalInstall"))
    return -[WBSKeychainSyncingMonitor keychainSyncSettingValue](self, "keychainSyncSettingValue") == 2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_numberForKey:", CFSTR("iCloudKeychainEnabledOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[WBSKeychainSyncingMonitor keychainSyncSettingValue](self, "keychainSyncSettingValue") == 2;
  v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Overriding iCloud Keychain check due to iCloudKeychainEnabledOverrideDefault", v8, 2u);
  }
  v6 = objc_msgSend(v4, "BOOLValue");

  return v6;
}

- (BOOL)canKeychainSyncBeEnabled
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "BOOLRestrictionForFeature:", *MEMORY[0x1E0D46FB0]) == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountAltDSID, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_keychainClique, 0);
  objc_storeStrong((id *)&self->_synchronousGetterQueue, 0);
  objc_storeStrong((id *)&self->_keychainStatusFetchingQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __56__WBSKeychainSyncingMonitor__fetchKeychainSyncingStatus__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Failed to read keychain sync status with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
