@implementation PUIBankConnectAnalyticsConsentCoordinator

- (PUIBankConnectAnalyticsConsentCoordinator)init
{
  PUIBankConnectAnalyticsConsentCoordinator *v2;
  void *v3;
  objc_class *v4;
  id v5;
  id offlineLabConsentCoordinator;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)PUIBankConnectAnalyticsConsentCoordinator;
  v2 = -[PUIBankConnectAnalyticsConsentCoordinator init](&v10, sel_init);
  if (v2)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v3 = (void *)getFKBankConnectOfflineLabConsentCoordinatorClass_softClass;
    v15 = getFKBankConnectOfflineLabConsentCoordinatorClass_softClass;
    if (!getFKBankConnectOfflineLabConsentCoordinatorClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke;
      v11[3] = &unk_1EA26B260;
      v11[4] = &v12;
      __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v12, 8);
    v5 = objc_alloc_init(v4);
    offlineLabConsentCoordinator = v2->_offlineLabConsentCoordinator;
    v2->_offlineLabConsentCoordinator = v5;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_shouldShare = objc_msgSend(v7, "BOOLForKey:", CFSTR("shouldShareBankConnectData"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_showPreference = objc_msgSend(v8, "BOOLForKey:", CFSTR("showBankConnectPreference"));

  }
  return v2;
}

- (void)updateCachedPermission:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldShare = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("shouldShareBankConnectData"));

}

- (void)updateCachedVisibility:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showPreference = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("showBankConnectPreference"));

}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4;
  id offlineLabConsentCoordinator;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke;
  v7[3] = &unk_1EA26B198;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(offlineLabConsentCoordinator, "loadOfflineLabSharingPreferenceWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD block[4];
  id v7;
  id v8;
  char v9;
  char v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke_2;
  block[3] = &unk_1EA26B170;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v9 = a2;
  v10 = a3;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

uint64_t __70__PUIBankConnectAnalyticsConsentCoordinator_fetchStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  int v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateCachedPermission:", *(unsigned __int8 *)(a1 + 48));

  v4 = objc_loadWeakRetained(v2);
  if ((objc_msgSend(v4, "showPreference") & 1) != 0)
    goto LABEL_4;
  v5 = *(unsigned __int8 *)(a1 + 49);

  if (v5)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "updateCachedVisibility:", *(unsigned __int8 *)(a1 + 49));
LABEL_4:

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForUpdatesWithHandler:(id)a3
{
  id v4;
  id offlineLabConsentCoordinator;
  uint64_t v6;
  int *p_syncedKeychainNotifyToken;
  int syncedKeychainNotifyToken;
  NSObject *v9;
  id v10;
  _QWORD handler[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  -[PUIBankConnectAnalyticsConsentCoordinator setUpdateHandler:](self, "setUpdateHandler:", v4);
  objc_initWeak(&location, self);
  offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke;
  v13[3] = &unk_1EA26B1E8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(offlineLabConsentCoordinator, "loadOfflineLabSharingPreferenceWithCompletion:", v13);
  syncedKeychainNotifyToken = self->_syncedKeychainNotifyToken;
  p_syncedKeychainNotifyToken = &self->_syncedKeychainNotifyToken;
  if (!syncedKeychainNotifyToken)
  {
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    handler[0] = v6;
    handler[1] = 3221225472;
    handler[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_3;
    handler[3] = &unk_1EA26B210;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.security.keychainchanged", p_syncedKeychainNotifyToken, v9, handler);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v5[4];
  id v6;
  char v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_2;
  v5[3] = &unk_1EA26B1C0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  int v7;
  id v8;
  id v9;
  int v10;
  int v11;
  id v12;
  _QWORD *v13;
  void (*v14)(void);
  id v15;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(v5, "shouldShare");
    v7 = *(unsigned __int8 *)(a1 + 40);

    if (v7 != v6)
    {
      v8 = objc_loadWeakRetained(v2);
      objc_msgSend(v8, "updateCachedPermission:", *(unsigned __int8 *)(a1 + 40));

    }
    v9 = objc_loadWeakRetained(v2);
    v10 = objc_msgSend(v9, "showPreference");
    v11 = *(unsigned __int8 *)(a1 + 41);

    if (v11 == v10)
    {
      if (v7 == v6)
        return;
      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "updateHandler");
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v14 = (void (*)(void))v13[2];
    }
    else
    {
      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(v12, "updateCachedVisibility:", *(unsigned __int8 *)(a1 + 41));

      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "updateHandler");
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v14 = (void (*)(void))v13[2];
    }
    v14();

  }
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  id v4;
  char v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;
  char v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "shouldShare");

  v4 = objc_loadWeakRetained(v1);
  v5 = objc_msgSend(v4, "showPreference");

  v6 = objc_loadWeakRetained(v1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_4;
  v7[3] = &unk_1EA26B1C0;
  objc_copyWeak(&v8, v1);
  v9 = v5;
  v10 = v3;
  objc_msgSend(v6, "fetchStateWithCompletion:", v7);

  objc_destroyWeak(&v8);
}

void __75__PUIBankConnectAnalyticsConsentCoordinator_registerForUpdatesWithHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  id v7;
  int v8;
  int v9;
  void (**v10)(void);
  id v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    if (objc_msgSend(v5, "showPreference"))
    {
      v6 = *(unsigned __int8 *)(a1 + 40);

      if (!v6)
        goto LABEL_8;
    }
    else
    {

    }
    v7 = objc_loadWeakRetained(v2);
    v8 = objc_msgSend(v7, "shouldShare");
    v9 = *(unsigned __int8 *)(a1 + 41);

    if (v9 != v8)
    {
LABEL_8:
      v11 = objc_loadWeakRetained(v2);
      objc_msgSend(v11, "updateHandler");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();

    }
  }
}

- (id)privacyBundleIdentifier
{
  return (id)objc_msgSend(self->_offlineLabConsentCoordinator, "offlineLabPrivacyBundleIdentifier");
}

- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  BOOL v8;
  id offlineLabConsentCoordinator;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _PUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[PUIBankConnectAnalyticsConsentCoordinator setAnalyticsConsent:completion:]";
    _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: Saving OfflineLab analytics consent state.", buf, 0xCu);
  }

  v8 = -[PUIBankConnectAnalyticsConsentCoordinator shouldShare](self, "shouldShare");
  -[PUIBankConnectAnalyticsConsentCoordinator updateCachedPermission:](self, "updateCachedPermission:", v4);
  objc_initWeak((id *)buf, self);
  offlineLabConsentCoordinator = self->_offlineLabConsentCoordinator;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke;
  v11[3] = &unk_1EA26B238;
  objc_copyWeak(&v13, (id *)buf);
  v14 = v8;
  v10 = v6;
  v12 = v10;
  objc_msgSend(offlineLabConsentCoordinator, "saveOfflineLabSharingPermission:withCompletion:", v4, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke_cold_1((uint64_t)v3, v4);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "updateCachedPermission:", *(unsigned __int8 *)(a1 + 48));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_syncedKeychainNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)PUIBankConnectAnalyticsConsentCoordinator;
  -[PUIBankConnectAnalyticsConsentCoordinator dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldShare
{
  return self->_shouldShare;
}

- (BOOL)showPreference
{
  return self->_showPreference;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_offlineLabConsentCoordinator, 0);
}

void __76__PUIBankConnectAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[PUIBankConnectAnalyticsConsentCoordinator setAnalyticsConsent:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "%s, Error when saving OfflineLab analytics consent, error: %@", (uint8_t *)&v2, 0x16u);
}

@end
