@implementation WBUFeatureManager

uint64_t __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAccountOnInternalQueue:", *(_QWORD *)(a1 + 40));
}

void __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke(uint64_t a1, void *a2)
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke_2;
  v7[3] = &unk_24CB8D2C0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __32__WBUFeatureManager_accessLevel__block_invoke()
{
  void *v0;
  int v1;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  accessLevel_accessLevel = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEphemeralMultiUser");

  if (v1)
  {
    accessLevel_accessLevel = 2;
  }
  else if (!accessLevel_accessLevel && objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("SafariDebugOverrideLaunchMode"), (CFStringRef)*MEMORY[0x24BDBD568], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      accessLevel_accessLevel = AppIntegerValue;
  }
}

- (WBUFeatureManager)init
{
  WBUFeatureManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *appleAccountQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *screenTimeQueue;
  void *v9;
  void *v10;
  WBUFeatureManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBUFeatureManager;
  v2 = -[WBUFeatureManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.WebUI.WBUFeatureManagerQueue.AppleAccount", v3);
    appleAccountQueue = v2->_appleAccountQueue;
    v2->_appleAccountQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.WebUI.WBUFeatureManagerQueue.ScreenTime", v6);
    screenTimeQueue = v2->_screenTimeQueue;
    v2->_screenTimeQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__primaryAppleAccountChanged, *MEMORY[0x24BE82F88], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__accountsDidChange, *MEMORY[0x24BDB41E0], 0);

    -[WBUFeatureManager _primaryAppleAccountChanged](v2, "_primaryAppleAccountChanged");
    -[WBUFeatureManager _updateFeatureAvailabilityByAccessLevel](v2, "_updateFeatureAvailabilityByAccessLevel");
    v11 = v2;
  }

  return v2;
}

- (void)_primaryAppleAccountChanged
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE82D70], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__WBUFeatureManager__primaryAppleAccountChanged__block_invoke;
  v4[3] = &unk_24CB8D2E8;
  v4[4] = self;
  objc_msgSend(v3, "getPrimaryAppleAccountWithCompletionHandler:", v4);

}

- (void)_updateFeatureAvailabilityByAccessLevel
{
  BOOL *p_autoFillAvailable;
  uint64_t v4;

  *(_DWORD *)&self->_autoFillAvailable = 16843009;
  p_autoFillAvailable = &self->_autoFillAvailable;
  *(_WORD *)&self->_cloudSyncAvailable = 257;
  v4 = objc_msgSend((id)objc_opt_class(), "accessLevel");
  if (v4 == 1)
  {
    *((_WORD *)p_autoFillAvailable + 2) = 0;
    *(_DWORD *)p_autoFillAvailable = 0;
  }
  else if (v4 == 2)
  {
    self->_offlineReadingListAvailable = 0;
    self->_inMemoryBookmarkChangeTrackingAvailable = 0;
  }
}

- (BOOL)isCloudHistorySyncAvailable
{
  _BOOL4 v3;

  v3 = -[WBUFeatureManager isCloudSyncAvailable](self, "isCloudSyncAvailable");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_opt_class(), "accessLevel") == 2
              || !-[WBUFeatureManager _isUsingManagedAppleID](self, "_isUsingManagedAppleID");
  return v3;
}

- (BOOL)isCloudTabsAvailable
{
  return -[WBUFeatureManager _isCloudTabsAvailableUsingManagedAppleID:](self, "_isCloudTabsAvailableUsingManagedAppleID:", -[WBUFeatureManager _isUsingManagedAppleID](self, "_isUsingManagedAppleID"));
}

- (BOOL)isCloudSyncAvailable
{
  return self->_cloudSyncAvailable;
}

- (void)determineIfPrivateBrowsingIsAvailableWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BEC2728], "sharedWebFilterSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWebFilterEnabled");

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __80__WBUFeatureManager_determineIfPrivateBrowsingIsAvailableWithCompletionHandler___block_invoke;
    v7[3] = &unk_24CB8D248;
    v8 = v4;
    -[WBUFeatureManager determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:](self, "determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:", v7);

  }
}

- (void)determineIfUserIsRestrictedByScreenTimeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *screenTimeQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  screenTimeQueue = self->_screenTimeQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CB8D298;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(screenTimeQueue, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (BOOL)_locallyRestricted
{
  CFAbsoluteTime Current;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *cachedLocallyRestricted;

  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastRestrictedSettingRequestedTime >= 2.0 || (v4 = self->_cachedLocallyRestricted) == 0)
  {
    self->_lastRestrictedSettingRequestedTime = Current;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE85718], "settingEnabled"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    cachedLocallyRestricted = self->_cachedLocallyRestricted;
    self->_cachedLocallyRestricted = v5;

    v4 = self->_cachedLocallyRestricted;
  }
  return -[NSNumber BOOLValue](v4, "BOOLValue");
}

uint64_t __80__WBUFeatureManager_determineIfPrivateBrowsingIsAvailableWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setAccountOnInternalQueue:(id)a3
{
  id v5;
  _BOOL4 v6;
  _QWORD block[5];

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_appleAccountQueue);
  v6 = -[WBUFeatureManager _isCloudTabsAvailableUsingManagedAppleID:](self, "_isCloudTabsAvailableUsingManagedAppleID:", -[ACAccount aa_isManagedAppleID](self->_primaryAppleAccount, "aa_isManagedAppleID"));
  objc_storeStrong((id *)&self->_primaryAppleAccount, a3);
  if (v6 != -[WBUFeatureManager _isCloudTabsAvailableUsingManagedAppleID:](self, "_isCloudTabsAvailableUsingManagedAppleID:", objc_msgSend(v5, "aa_isManagedAppleID")))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__WBUFeatureManager__setAccountOnInternalQueue___block_invoke;
    block[3] = &unk_24CB8D118;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

- (BOOL)_isCloudTabsAvailableUsingManagedAppleID:(BOOL)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "accessLevel");
  return v4 != 1 && (v4 || !a3);
}

+ (int64_t)accessLevel
{
  if (accessLevel_onceToken != -1)
    dispatch_once(&accessLevel_onceToken, &__block_literal_global);
  return accessLevel_accessLevel;
}

uint64_t __43__WBUFeatureManager__isUsingManagedAppleID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "aa_isManagedAppleID");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isUsingManagedAppleID
{
  WBUFeatureManager *v2;
  NSObject *appleAccountQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_appleAccountQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  appleAccountQueue = v2->_appleAccountQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__WBUFeatureManager__isUsingManagedAppleID__block_invoke;
  v5[3] = &unk_24CB8D220;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(appleAccountQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCloudKitBookmarksAvailable
{
  return 1;
}

+ (id)webui_sharedFeatureManager
{
  if (webui_sharedFeatureManager_onceToken != -1)
    dispatch_once(&webui_sharedFeatureManager_onceToken, &__block_literal_global_5);
  return (id)webui_sharedFeatureManager_webuiSharedFeatureManager;
}

void __47__WBUFeatureManager_webui_sharedFeatureManager__block_invoke()
{
  WBUFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBUFeatureManager);
  v1 = (void *)webui_sharedFeatureManager_webuiSharedFeatureManager;
  webui_sharedFeatureManager_webuiSharedFeatureManager = (uint64_t)v0;

}

void __48__WBUFeatureManager__setAccountOnInternalQueue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBUFeatureManagerCloudTabsAvailabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)isCreditCardStorageAvailable
{
  if ((unint64_t)(objc_msgSend((id)objc_opt_class(), "accessLevel") - 1) >= 2)
    return !-[WBUFeatureManager _isUsingManagedAppleID](self, "_isUsingManagedAppleID");
  else
    return 0;
}

void __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[4])
  {
    v3 = objc_alloc_init(MEMORY[0x24BE845E8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(_QWORD **)(a1 + 32);
  }
  if ((objc_msgSend(v2, "_locallyRestricted") & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke_19;
    v8[3] = &unk_24CB8D270;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "shouldRequestMoreTime:", v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXScreenTime();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2112D6000, v7, OS_LOG_TYPE_INFO, "Determined user is not restricted because there is not a Screen Time passcode set", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __82__WBUFeatureManager_determineIfUserIsRestrictedByScreenTimeWithCompletionHandler___block_invoke_19(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  const __CFString *v6;
  void (*v7)(void);
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXScreenTime();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("not");
      if (a2)
        v6 = &stru_24CB8DE28;
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2112D6000, v5, OS_LOG_TYPE_INFO, "Determined user is %{public}@ an iCloud managed child", (uint8_t *)&v8, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

- (BOOL)isAirDropPasswordsAvailable
{
  return objc_msgSend(MEMORY[0x24BE82CC8], "isAirDropPasswordsEnabled");
}

+ (BOOL)shouldOfferVirtualCards
{
  id v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  if (!MGGetBoolAnswer())
    return 1;
  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v7 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v7);
  v4 = v7;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[WBUFeatureManager shouldOfferVirtualCards].cold.1(v5, v4);
  }

  return v3;
}

+ (BOOL)shouldAllowAddingNewPasswords
{
  void *v3;
  char v4;

  if (objc_msgSend(a1, "accessLevel") == 2)
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSupervised"))
  {
    v4 = objc_msgSend(a1, "_hasManagedAutoFillDomains");

    if ((v4 & 1) != 0)
      return 0;
  }
  else
  {

  }
  return 1;
}

+ (BOOL)_hasManagedAutoFillDomains
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValuesForUnionSetting:", *MEMORY[0x24BE63790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCloudAccountHSA2
{
  WBSAppleAccountInformationProvider *v3;
  WBSAppleAccountInformationProvider *accountInformationProvider;

  if (!self->_accountInformationProvider)
  {
    v3 = (WBSAppleAccountInformationProvider *)objc_alloc_init((Class)off_24CB8CC38);
    accountInformationProvider = self->_accountInformationProvider;
    self->_accountInformationProvider = v3;

    -[WBUFeatureManager _accountsDidChange](self, "_accountsDidChange");
  }
  return self->_cloudAccountIsHSA2;
}

- (BOOL)isSafariSyncEnabled
{
  WBSAppleAccountInformationProvider *v3;
  WBSAppleAccountInformationProvider *accountInformationProvider;

  if (!self->_accountInformationProvider)
  {
    v3 = (WBSAppleAccountInformationProvider *)objc_alloc_init((Class)off_24CB8CC38);
    accountInformationProvider = self->_accountInformationProvider;
    self->_accountInformationProvider = v3;

    -[WBUFeatureManager _accountsDidChange](self, "_accountsDidChange");
  }
  return self->_isCloudSyncEnabled;
}

- (void)_accountsDidChange
{
  self->_cloudAccountIsHSA2 = -[WBSAppleAccountInformationProvider appleAccountSecurityState](self->_accountInformationProvider, "appleAccountSecurityState") == 2;
  self->_isCloudSyncEnabled = -[WBSAppleAccountInformationProvider isSafariSyncEnabled](self->_accountInformationProvider, "isSafariSyncEnabled");
}

- (BOOL)isAutoFillAvailable
{
  return self->_autoFillAvailable;
}

- (BOOL)isBookmarksAvailable
{
  return self->_bookmarksAvailable;
}

- (BOOL)isReadingListAvailable
{
  return self->_readingListAvailable;
}

- (BOOL)isOfflineReadingListAvailable
{
  return self->_offlineReadingListAvailable;
}

- (BOOL)isInMemoryBookmarkChangeTrackingAvailable
{
  return self->_inMemoryBookmarkChangeTrackingAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountInformationProvider, 0);
  objc_storeStrong((id *)&self->_cachedLocallyRestricted, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_screenTimeQueue, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_appleAccountQueue, 0);
}

+ (void)shouldOfferVirtualCards
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_2112D6000, v3, OS_LOG_TYPE_ERROR, "Encountered error when determining can evaluate policy: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
