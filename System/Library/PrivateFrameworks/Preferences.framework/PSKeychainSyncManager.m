@implementation PSKeychainSyncManager

+ (id)sharedManager
{
  void *v2;
  PSKeychainSyncManager *v3;
  void *v4;

  v2 = (void *)sharedManager__instance;
  if (!sharedManager__instance)
  {
    v3 = objc_alloc_init(PSKeychainSyncManager);
    v4 = (void *)sharedManager__instance;
    sharedManager__instance = (uint64_t)v3;

    v2 = (void *)sharedManager__instance;
  }
  return v2;
}

- (PSKeychainSyncManager)init
{
  PSKeychainSyncManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncManager;
  v2 = -[PSKeychainSyncManager init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_clearKeychainSyncCache, CFSTR("ClearKeychainSyncSettingsCache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (void)getStatusWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke;
    block[3] = &unk_1E4A65708;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

void __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke(uint64_t a1)
{
  int Status;
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  int v9;
  id v10;

  v10 = 0;
  Status = PSKeychainSyncGetStatus(&v10);
  v3 = v10;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4A66D20;
  v4 = *(id *)(a1 + 32);
  v9 = Status;
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)showEnableSyncFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isNetworkReachable");

  if ((v12 & 1) != 0)
  {
    self->_flow = 1;
    -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", v10);
    -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v9);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke;
    v14[3] = &unk_1E4A66D98;
    v14[4] = self;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v16, v14);

  }
  else
  {
    -[PSKeychainSyncManager showNetworkReachabilityError](self, "showNetworkReachabilityError");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 1, v13);

    }
  }

}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;

  if (a2)
  {
    v3 = PSKeychainSyncCircleExists();
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "joinCircleWithCompletion:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(v4, "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
      if (PSIsKeychainSecureBackupEnabled(0))
      {
        v5 = (void *)MEMORY[0x1E0CEA2E8];
        PS_LocalizedStringForKeychainSync(CFSTR("ENABLE_IS_RECOVERY"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PS_LocalizedStringForKeychainSync(CFSTR("ENABLE_IS_RECOVERY_DESCRIPTION"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("RESTORE_WITH_SECURITY_CODE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_2;
        v32[3] = &unk_1E4A66D48;
        v12 = *(void **)(a1 + 40);
        v32[4] = *(_QWORD *)(a1 + 32);
        v33 = v12;
        v34 = *(id *)(a1 + 48);
        objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v13);

        v14 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v11;
        v29[1] = 3221225472;
        v29[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_3;
        v29[3] = &unk_1E4A66D48;
        v29[4] = *(_QWORD *)(a1 + 32);
        v30 = *(id *)(a1 + 48);
        v31 = *(id *)(a1 + 40);
        objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v16);

        v17 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_5;
        v28[3] = &unk_1E4A65BF8;
        v28[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v19);

        objc_msgSend(*(id *)(a1 + 32), "showAlert:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isPasscodeSet");

        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 32), "showPinChoiceAlert");
        }
        else
        {
          v22 = *(void **)(a1 + 40);
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setProperty:forKey:", v24, CFSTR("customControllerClass"));

          v25 = objc_opt_new();
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(void **)(v26 + 32);
          *(_QWORD *)(v26 + 32) = v25;

          objc_msgSend(*(id *)(a1 + 32), "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setShowsAdvancedSettings:", 1);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setMode:", 1);
          objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), 1, 0);
        }
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  }
}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  objc_msgSend(v1, "completion");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showRecoveryFlowWithSpecifier:overController:completion:", v2, v3, v4);

}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_4;
  v4[3] = &unk_1E4A66D70;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_showResetFlowOverController:withEnableBackupText:withCompletion:", v3, 1, v4);

}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showEnableSyncFlowWithSpecifier:overController:completion:", v4, v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", 0, a3);
  }
}

uint64_t __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
}

- (void)showEnableEscrowFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  self->_flow = 2;
  -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", a5);
  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PSKeychainSyncManager_showEnableEscrowFlowWithSpecifier_overController_completion___block_invoke;
  v12[3] = &unk_1E4A66D70;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v10, v12);

}

uint64_t __85__PSKeychainSyncManager_showEnableEscrowFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v3, "_preSetupCancelledWithCurrentStatus");
  objc_msgSend(v3, "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPasscodeSet");

  if (v5)
    return objc_msgSend(*(id *)(a1 + 32), "showPinChoiceAlert");
  v7 = objc_opt_new();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_msgSend(*(id *)(a1 + 32), "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setShowsAdvancedSettings:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setMode:", 1);
  return objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), 1, 0);
}

- (void)showRecoveryFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isNetworkReachable");

  if ((v12 & 1) != 0)
  {
    self->_flow = 4;
    -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", v10);
    -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v9);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__PSKeychainSyncManager_showRecoveryFlowWithSpecifier_overController_completion___block_invoke;
    v14[3] = &unk_1E4A66D70;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v16, v14);

  }
  else
  {
    -[PSKeychainSyncManager showNetworkReachabilityError](self, "showNetworkReachabilityError");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 1, v13);

    }
  }

}

void __81__PSKeychainSyncManager_showRecoveryFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_alloc_init((Class)getSecureBackupClass());
    v25 = 0;
    v4 = (id)objc_msgSend(v3, "getAccountInfoWithInfo:results:", 0, &v25);
    v5 = v25;
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Starting recovery flow, accountInfo = %@", buf, 0xCu);
    }

    getkSecureBackupMetadataKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    getkSecureBackupUsesComplexPassphraseKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    getkSecureBackupUsesRandomPassphraseKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    getkSecureBackupUsesNumericPassphraseKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
    {
      getkSecureBackupNumericPassphraseLengthKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

    }
    else
    {
      v20 = 4;
    }
    v21 = objc_opt_new();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 56);
    *(_QWORD *)(v22 + 56) = v21;

    objc_msgSend(*(id *)(a1 + 32), "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    if (v14)
      v24 = 2;
    else
      v24 = v11 & ~v17;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setMode:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setNumberOfPasscodeFields:", v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setSecurityCodeType:", v24);
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "_registerForCircleChangeNotifications");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  }
}

- (void)showRecoveryFlowWithNavigationController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNetworkReachable");

  if ((v9 & 1) != 0)
  {
    self->_flow = 4;
    -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", v7);
    -[PSKeychainSyncManager setBuddyNavigationController:](self, "setBuddyNavigationController:", v6);
    objc_msgSend(v6, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__PSKeychainSyncManager_showRecoveryFlowWithNavigationController_completion___block_invoke;
    v12[3] = &unk_1E4A66DC0;
    v12[4] = self;
    -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v10, v12);

  }
  else
  {
    -[PSKeychainSyncManager showNetworkReachabilityError](self, "showNetworkReachabilityError");
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 4, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 1, v11);

    }
  }

}

void __77__PSKeychainSyncManager_showRecoveryFlowWithNavigationController_completion___block_invoke(uint64_t a1, int a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PSKeychainSyncSecurityCodeController *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  if (a2)
  {
    v3 = objc_alloc_init((Class)getSecureBackupClass());
    v24 = 0;
    v4 = (id)objc_msgSend(v3, "getAccountInfoWithInfo:results:", 0, &v24);
    v5 = v24;
    getkSecureBackupMetadataKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    getkSecureBackupUsesComplexPassphraseKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    getkSecureBackupUsesRandomPassphraseKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    getkSecureBackupUsesNumericPassphraseKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      getkSecureBackupNumericPassphraseLengthKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

    }
    else
    {
      v19 = 4;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 4;
    v20 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 56);
    *(_QWORD *)(v21 + 56) = v20;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setMode:", 2);
    if (v13)
      v23 = 2;
    else
      v23 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setSecurityCodeType:", v23);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setNumberOfPasscodeFields:", v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");
    objc_msgSend(*(id *)(a1 + 32), "showController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(a1 + 32), "_registerForCircleChangeNotifications");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  }
}

- (void)showChangeSecurityCodeFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  self->_flow = 3;
  -[PSKeychainSyncManager setChangeSecurityCodeCompletion:](self, "setChangeSecurityCodeCompletion:", a5);
  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PSKeychainSyncManager_showChangeSecurityCodeFlowWithSpecifier_overController_completion___block_invoke;
  v12[3] = &unk_1E4A66D70;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v10, v12);

}

uint64_t __91__PSKeychainSyncManager_showChangeSecurityCodeFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  v3 = objc_opt_new();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  objc_msgSend(*(id *)(a1 + 32), "makeSettingsSetupControllerWithSpecifier:parent:initialController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setSecurityCodeType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setShowsAdvancedSettings:", 1);
  return objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), 1, 0);
}

- (void)showEnableFlowWithNavigationController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNetworkReachable");

  if ((v9 & 1) != 0)
  {
    if (PSKeychainSyncCircleExists())
    {
      if (v7)
        v7[2](v7, 2, 0);
    }
    else
    {
      self->_flow = 1;
      -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", v7);
      -[PSKeychainSyncManager setBuddyNavigationController:](self, "setBuddyNavigationController:", v6);
      objc_msgSend(v6, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__PSKeychainSyncManager_showEnableFlowWithNavigationController_completion___block_invoke;
      v12[3] = &unk_1E4A65AA0;
      v12[4] = self;
      v13 = v6;
      -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v11, v12);

    }
  }
  else
  {
    -[PSKeychainSyncManager showNetworkReachabilityError](self, "showNetworkReachabilityError");
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 4, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 1, v10);

    }
  }

}

uint64_t __75__PSKeychainSyncManager_showEnableFlowWithNavigationController_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeSet");

  if (v4)
    return objc_msgSend(*(id *)(a1 + 32), "showPinChoiceAlert");
  v6 = objc_opt_new();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setShowsAdvancedSettings:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "pushViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 1);
}

- (void)_showResetFlowOverController:(id)a3 withEnableBackupText:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;

  self->_flow = 5;
  v8 = a5;
  v9 = a3;
  -[PSKeychainSyncManager setResetPromptControllerHost:](self, "setResetPromptControllerHost:", v9);
  -[PSKeychainSyncManager setResetCompletion:](self, "setResetCompletion:", v8);

  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v9);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke;
  v10[3] = &unk_1E4A66DE8;
  v11 = a4;
  v10[4] = self;
  -[PSKeychainSyncManager promptForPasswordIfNeededForWritingOverController:withCompletion:](self, "promptForPasswordIfNeededForWritingOverController:withCompletion:", v9, v10);

}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke(uint64_t a1, int a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if (a2)
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("REPLACE_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY");
    else
      v3 = CFSTR("REPLACE_ICLOUD_KEYCHAIN_DETAILS");
    PS_LocalizedStringForKeychainSync(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CEA2E8];
    PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN_QUESTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_2;
    v16[3] = &unk_1E4A65BF8;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    v12 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("RESET"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_3;
    v15[3] = &unk_1E4A65BF8;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    objc_msgSend(*(id *)(a1 + 32), "showAlert:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
  }
}

uint64_t __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preSetupCancelledWithCurrentStatus");
}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startNavigationSpinnerInViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(*(id *)(a1 + 32), "setResetPromptControllerHost:", 0);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_4;
  block[3] = &unk_1E4A654F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v10 = 0;
  v3 = objc_msgSend(v2, "_resetCircleAndDisableBackupWithError:", &v10);
  v4 = v10;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_5;
  v7[3] = &unk_1E4A65540;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_5(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[21];
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(v2[21], *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "setResetCompletion:", 0);
}

- (void)showResetAndJoinFlowOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke;
  v10[3] = &unk_1E4A66CD0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PSKeychainSyncManager _showResetFlowOverController:withEnableBackupText:withCompletion:](self, "_showResetFlowOverController:withEnableBackupText:withCompletion:", v9, 0, v10);

}

void __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "startNavigationSpinnerInViewController:", *(_QWORD *)(a1 + 40));
    v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke_2;
    v8[3] = &unk_1E4A66E10;
    v8[4] = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "joinCircleWithCompletion:", v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }

}

void __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  if ((_DWORD)a2 == 2)
    objc_msgSend(*(id *)(a1 + 32), "showResetAcknowledgementIfNeededWithCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCircleWasReset:", 0);

}

- (void)disableKeychainSyncOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", v6);
  if (PSKeychainSyncIsUsingICDP())
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PSKeychainSyncManager_disableKeychainSyncOverController_withCompletion___block_invoke;
    v8[3] = &unk_1E4A66CD0;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    -[PSKeychainSyncManager _promptUserToDeleteSafariSavedContentWithCompletion:](self, "_promptUserToDeleteSafariSavedContentWithCompletion:", v8);

  }
  else
  {
    PSKeychainSyncGetStatus(0);
    -[PSKeychainSyncManager _disableKeychainSyncOverController:deletingSafariPasswords:withCompletion:](self, "_disableKeychainSyncOverController:deletingSafariPasswords:withCompletion:", v6, 0, v7);
  }

}

uint64_t __74__PSKeychainSyncManager_disableKeychainSyncOverController_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableCDPKeychainSyncOverController:deletingSafariPasswords:withCompletion:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (void)_promptUserToDeleteSafariSavedContentWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)_disableCDPKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id CDPKeychainSyncClass;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PSKeychainSyncManager *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  CDPKeychainSyncClass = getCDPKeychainSyncClass();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke;
  v13[3] = &unk_1E4A66E38;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(CDPKeychainSyncClass, "setUserVisibleKeychainSyncEnabled:withCompletion:", 0, v13);

}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  char v29;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getCDPStateErrorDomain();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v5, "code");

    if (v8 == -5600)
    {
      PS_LocalizedStringForKeychainSync(CFSTR("TURN_OFF_KEYCHAIN_OLDER_PEERS_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(CFSTR("TURN_OFF_KEYCHAIN_OLDER_PEERS_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("TURN_OFF_KEYCHAIN_OLDER_PEERS_CONTINUE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2;
      v25 = &unk_1E4A66E88;
      v14 = *(id *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(void **)(a1 + 48);
      v26 = v14;
      v27 = v15;
      v29 = *(_BYTE *)(a1 + 56);
      v28 = v16;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v17, v22, v23, v24, v25);

      v18 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("TURN_OFF_KEYCHAIN_OLDER_PEERS_CANCEL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v20);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);
      goto LABEL_10;
    }
  }
  else
  {

  }
  if ((_DWORD)a2 && *(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 40), "_deleteSafariAutoFillPasswords");
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, a2, v5);
LABEL_10:

}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  char v12;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  objc_msgSend(v3, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v5);

  objc_msgSend(v4, "setAuthenticationType:", 2);
  objc_msgSend(v4, "setIsUsernameEditable:", 0);
  objc_msgSend(v4, "setPresentingViewController:", *(_QWORD *)(a1 + 32));
  v6 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_3;
  v9[3] = &unk_1E4A66E60;
  v8 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v12 = *(_BYTE *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v6, "authenticateWithContext:completion:", v4, v9);

}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id CDPKeychainSyncClass;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)getCDPContextClass()), "initWithAuthenticationResults:", v5);
    CDPKeychainSyncClass = getCDPKeychainSyncClass();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_4;
    v11[3] = &unk_1E4A66E38;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v14 = *(_BYTE *)(a1 + 56);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(CDPKeychainSyncClass, "removeNonViewAwarePeersFromCircleWithContext:completion:", v7, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
  }

}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_disableCDPKeychainSyncOverController:deletingSafariPasswords:withCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_disableKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "aa_primaryAppleAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  objc_msgSend(v11, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsername:", v13);

  objc_msgSend(v12, "setAuthenticationType:", 2);
  objc_msgSend(v12, "setIsUsernameEditable:", 0);
  objc_msgSend(v12, "setPresentingViewController:", v9);

  v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke;
  v16[3] = &unk_1E4A66ED8;
  v16[4] = self;
  v17 = v8;
  v18 = a4;
  v15 = v8;
  objc_msgSend(v14, "authenticateWithContext:completion:", v12, v16);

}

void __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _Unwind_Exception *v24;
  _QWORD v25[5];
  id v26;
  char v27;
  CFTypeRef cf;
  CFTypeRef v29;
  CFTypeRef *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    NSLog(CFSTR("Credential renew failed! - %@"), v6);
    v22 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

    }
    goto LABEL_26;
  }
  cf = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v8 = (id *)getAKAuthenticationUsernameKeySymbolLoc_ptr;
  v32 = getAKAuthenticationUsernameKeySymbolLoc_ptr;
  if (!getAKAuthenticationUsernameKeySymbolLoc_ptr)
  {
    v9 = (void *)AuthKitLibrary_0();
    v8 = (id *)dlsym(v9, "AKAuthenticationUsernameKey");
    v30[3] = v8;
    getAKAuthenticationUsernameKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v29, 8);
  if (!v8)
  {
    PSPNCreateFormattedStringWithCountry_cold_1();
LABEL_28:
    PSPNCreateFormattedStringWithCountry_cold_1();
    goto LABEL_29;
  }
  v10 = *v8;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v12 = (id *)getAKAuthenticationRawPasswordKeySymbolLoc_ptr;
  v32 = getAKAuthenticationRawPasswordKeySymbolLoc_ptr;
  if (!getAKAuthenticationRawPasswordKeySymbolLoc_ptr)
  {
    v13 = (void *)AuthKitLibrary_0();
    v12 = (id *)dlsym(v13, "AKAuthenticationRawPasswordKey");
    v30[3] = v12;
    getAKAuthenticationRawPasswordKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v29, 8);
  if (!v12)
    goto LABEL_28;
  v14 = *v12;
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v16 = (_QWORD *)getAKAuthenticationDSIDKeySymbolLoc_ptr;
  v32 = getAKAuthenticationDSIDKeySymbolLoc_ptr;
  if (!getAKAuthenticationDSIDKeySymbolLoc_ptr)
  {
    v17 = (void *)AuthKitLibrary_0();
    v16 = dlsym(v17, "AKAuthenticationDSIDKey");
    v30[3] = v16;
    getAKAuthenticationDSIDKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v29, 8);
  if (!v16)
  {
LABEL_29:
    v24 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v24);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = SOSCCSetUserCredentialsAndDSID();

  if ((v19 & 1) == 0)
    NSLog(CFSTR("Calling SOSCCSetUserCredentialsAndDSID failed after authentication - %@"), cf);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v29 = 0;
  if ((SOSCCRemoveThisDeviceFromCircle() & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "_errorRequiresPasswordPrompt:", v29))
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_deleteSafariAutoFillPasswords");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(CFSTR("SOSCCRemoveThisDeviceFromCircle returned an error that indicates the users password is needed. Prompting..."));
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2;
    v25[3] = &unk_1E4A66EB0;
    v20 = *(void **)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v27 = *(_BYTE *)(a1 + 48);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v21;
    objc_msgSend(v20, "promptForPasswordOverController:withCompletion:", 0, v25);

  }
  if (v29)
    CFRelease(v29);
LABEL_26:

}

void __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5 || !a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
  else if (SOSCCRemoveThisDeviceFromCircle())
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_deleteSafariAutoFillPasswords");
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    NSLog(CFSTR("Error leaving circle: %@"), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CFRelease(0);
  }

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("ClearKeychainSyncSettingsCache"), 0);
  PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
  -[NSTimer invalidate](self->_joinAfterRecoveryTimeoutTimer, "invalidate");
  -[NSTimer invalidate](self->_credentialExpirationTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncManager;
  -[PSKeychainSyncManager dealloc](&v4, sel_dealloc);
}

- (id)navigationController
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy");
  v4 = 200;
  if (v3)
    v4 = 208;
  return *(id *)((char *)&self->super.isa + v4);
}

- (void)setCompletion:(id)a3
{
  void *v4;
  id completion;

  if (self->_completion != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    completion = self->_completion;
    self->_completion = v4;

  }
}

- (void)_cleanupAppleIDCredentials
{
  NSString *appleIDUsername;
  NSString *appleIDRawPassword;
  NSString *appleIDPasswordOrEquivalentToken;
  NSTimer *credentialExpirationTimer;

  appleIDUsername = self->_appleIDUsername;
  self->_appleIDUsername = 0;

  appleIDRawPassword = self->_appleIDRawPassword;
  self->_appleIDRawPassword = 0;

  appleIDPasswordOrEquivalentToken = self->_appleIDPasswordOrEquivalentToken;
  self->_appleIDPasswordOrEquivalentToken = 0;

  -[NSTimer invalidate](self->_credentialExpirationTimer, "invalidate");
  credentialExpirationTimer = self->_credentialExpirationTimer;
  self->_credentialExpirationTimer = 0;

  NSLog(CFSTR("Cleared credential cache"));
}

- (void)setAppleIDRawPassword:(id)a3 equivalentToken:(id)a4
{
  id v7;
  BOOL v8;
  NSTimer *v9;
  NSTimer *credentialExpirationTimer;
  id v11;

  v11 = a3;
  v7 = a4;
  if (*(_OWORD *)&self->_appleIDRawPassword != __PAIR128__((unint64_t)v7, (unint64_t)v11))
  {
    objc_storeStrong((id *)&self->_appleIDRawPassword, a3);
    objc_storeStrong((id *)&self->_appleIDPasswordOrEquivalentToken, a4);
    -[NSTimer invalidate](self->_credentialExpirationTimer, "invalidate");
    v8 = -[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy");
    if (self->_appleIDRawPassword)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__cleanupAppleIDCredentials, 0, 0, 600.0);
        v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        credentialExpirationTimer = self->_credentialExpirationTimer;
        self->_credentialExpirationTimer = v9;

      }
    }
  }

}

- (BOOL)_registerUserCredentialsName:(id)a3 rawPassword:(id)a4 error:(id *)a5
{
  id v6;

  v6 = a3;
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  LOBYTE(a4) = SOSCCSetUserCredentials();

  return (char)a4;
}

- (void)promptForPasswordOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  PSKeychainSyncManager *v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNetworkReachable");

  if ((v9 & 1) != 0)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v37[5], "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PSKeychainSyncManager appleIDRawPassword](self, "appleIDRawPassword");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(v10, "_aa_rawPassword");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v13;

      -[PSKeychainSyncManager appleIDPasswordOrEquivalentToken](self, "appleIDPasswordOrEquivalentToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v10, "aa_password");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      if (v15)
      {
        if (v6)
          -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v6);
        dispatch_get_global_queue(0, 0);
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke;
        block[3] = &unk_1E4A66F28;
        block[4] = self;
        v30 = v10;
        v31 = v15;
        v32 = v6;
        v33 = v19;
        v34 = v7;
        v35 = &v36;
        dispatch_async(v20, block);

      }
      else if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
      {
        NSLog(CFSTR("Tried to display an auth dialog in Buddy."));
      }
      else
      {
        if (v6)
          -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v6);
        v42 = *MEMORY[0x1E0C8F330];
        v43[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v37[5];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_3;
        v23[3] = &unk_1E4A66FA0;
        v24 = v10;
        v25 = self;
        v26 = v6;
        v27 = v7;
        v28 = &v36;
        objc_msgSend(v22, "renewCredentialsForAccount:options:completion:", v24, v21, v23);

      }
    }
    else
    {
      if (!v7)
      {
LABEL_24:

        _Block_object_dispose(&v36, 8);
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 3, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);
    }

    goto LABEL_24;
  }
  -[PSKeychainSyncManager showNetworkReachabilityError](self, "showNetworkReachabilityError");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
LABEL_25:

}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v22 = 0;
  v5 = objc_msgSend(v2, "_registerUserCredentialsName:rawPassword:error:", v3, v4, &v22);
  v6 = v22;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_2;
  v12[3] = &unk_1E4A66F00;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v21 = v5;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v18 = v6;
  v19 = v10;
  v20 = *(_QWORD *)(a1 + 80);
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "stopNavigationSpinner");
  v2 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 48), "username");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAppleIDUsername:", v3);

    objc_msgSend(*(id *)(a1 + 40), "setAppleIDRawPassword:equivalentToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_showGenericFlowErrorAlert");
  }
  v4 = *(_QWORD *)(a1 + 80);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 72));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_4;
  block[3] = &unk_1E4A66F78;
  v20 = a2;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v17 = v5;
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v18 = v10;
  v19 = v11;
  v12 = v5;
  dispatch_async(v6, block);

}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;

  if (*(_QWORD *)(a1 + 80))
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "aa_password");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v4 = objc_msgSend(v6, "_registerUserCredentialsName:rawPassword:error:", v7, v2, &v27);
      v5 = v27;

      goto LABEL_6;
    }
    NSLog(CFSTR("Got a nil password from account"));
  }
  v4 = 0;
  v5 = 0;
LABEL_6:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_5;
  v15[3] = &unk_1E4A66F50;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v16 = v8;
  v17 = v9;
  v25 = *(_QWORD *)(a1 + 80);
  v18 = *(id *)(a1 + 56);
  v19 = v5;
  v20 = v2;
  v21 = v3;
  v26 = v4;
  v22 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v23 = v10;
  v24 = v11;
  v12 = v3;
  v13 = v2;
  v14 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "stopNavigationSpinner");
  v2 = *(_QWORD *)(a1 + 104);
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    v6 = 0;
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (!v3)
      v3 = *(void **)(a1 + 56);
    v10 = v3;
    if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 72) && *(_BYTE *)(a1 + 112))
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 80), "username");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAppleIDUsername:", v5);

      objc_msgSend(*(id *)(a1 + 40), "setAppleIDRawPassword:equivalentToken:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_showGenericFlowErrorAlert");
    }
    v6 = (uint64_t)v10;
  }
  v11 = (id)v6;
  v7 = *(_QWORD *)(a1 + 88);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 112), v11);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)promptForPasswordIfNeededForWritingOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (SOSCCCanAuthenticate())
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    -[PSKeychainSyncManager promptForPasswordOverController:withCompletion:](self, "promptForPasswordOverController:withCompletion:", v6, v7);

  }
}

- (void)promptForPasswordIfNeededOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke;
  block[3] = &unk_1E4A65780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint64_t v10;

  v10 = 0;
  SOSCCThisDeviceIsInCircle();
  if (objc_msgSend(*(id *)(a1 + 32), "_errorRequiresPasswordPrompt:", 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_2;
    block[3] = &unk_1E4A65780;
    v2 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v2;
    v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v3 = v8;
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_3;
    v4[3] = &unk_1E4A65820;
    v6 = *(id *)(a1 + 48);
    v5 = 0;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    v3 = v6;
  }

}

uint64_t __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "promptForPasswordOverController:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)promptForPasswordIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager promptForPasswordIfNeededOverController:withCompletion:](self, "promptForPasswordIfNeededOverController:withCompletion:", v5, v4);

}

- (void)promptForPasswordIfCredentialsNotCachedOverController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PSKeychainSyncManager appleIDUsername](self, "appleIDUsername");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager appleIDRawPassword](self, "appleIDRawPassword");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v10 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
    objc_msgSend(v10, "setUsername:", v8);
    objc_msgSend(v10, "_setPassword:", v9);
    objc_msgSend(v10, "setAuthenticationType:", 1);
    v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke;
    v12[3] = &unk_1E4A66FF0;
    v12[4] = self;
    v13 = v9;
    v14 = v7;
    objc_msgSend(v11, "authenticateWithContext:completion:", v10, v12);

  }
  else
  {
    -[PSKeychainSyncManager promptForPasswordOverController:withCompletion:](self, "promptForPasswordOverController:withCompletion:", v6, v7);
  }

}

void __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke_2;
  block[3] = &unk_1E4A66FC8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v9 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v3 = (_QWORD *)getAKAuthenticationPasswordKeySymbolLoc_ptr;
    v12 = getAKAuthenticationPasswordKeySymbolLoc_ptr;
    if (!getAKAuthenticationPasswordKeySymbolLoc_ptr)
    {
      v4 = (void *)AuthKitLibrary_0();
      v3 = dlsym(v4, "AKAuthenticationPasswordKey");
      v10[3] = (uint64_t)v3;
      getAKAuthenticationPasswordKeySymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v9, 8);
    if (!v3)
    {
      v8 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
      _Block_object_dispose(&v9, 8);
      _Unwind_Resume(v8);
    }
    objc_msgSend(v2, "objectForKey:", *v3, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAppleIDRawPassword:equivalentToken:", *(_QWORD *)(a1 + 48), v5);
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 56));
  }
}

- (BOOL)_errorRequiresPasswordPrompt:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD6818]))
    v5 = objc_msgSend(v3, "code") == 1 || objc_msgSend(v3, "code") == 2;
  else
    v5 = 0;

  return v5;
}

- (void)makeSettingsSetupControllerWithSpecifier:(id)a3 parent:(id)a4 initialController:(id)a5
{
  id v8;
  id v9;
  KeychainSyncSetupController *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[KeychainSyncSetupController initWithManager:]([KeychainSyncSetupController alloc], "initWithManager:", self);
  -[PSKeychainSyncManager setSettingsSetupController:](self, "setSettingsSetupController:", v10);

  -[PSRootController setSpecifier:](self->_settingsSetupController, "setSpecifier:", v9);
  -[PSSetupController setParentController:](self->_settingsSetupController, "setParentController:", v8);

  objc_msgSend(v12, "setParentController:", self->_settingsSetupController);
  objc_msgSend(v12, "setRootController:", self->_settingsSetupController);
  objc_msgSend(v12, "setSpecifier:", v9);

  v11 = v12;
  if (v12)
  {
    -[PSRootController showController:](self->_settingsSetupController, "showController:", v12);
    v11 = v12;
  }

}

- (void)_registerForCircleChangeNotifications
{
  const char *v2;
  _QWORD handler[5];

  if (!self->_circleNotificationToken)
  {
    v2 = (const char *)*MEMORY[0x1E0CD6810];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__PSKeychainSyncManager__registerForCircleChangeNotifications__block_invoke;
    handler[3] = &unk_1E4A67018;
    handler[4] = self;
    notify_register_dispatch(v2, &self->_circleNotificationToken, MEMORY[0x1E0C80D38], handler);
  }
}

uint64_t __62__PSKeychainSyncManager__registerForCircleChangeNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCircleChangedNotification");
}

- (void)_registerForCircleChangeNotificationsWithCompletion:(id)a3
{
  -[PSKeychainSyncManager setCircleJoinCompletion:](self, "setCircleJoinCompletion:", a3);
  -[PSKeychainSyncManager _registerForCircleChangeNotifications](self, "_registerForCircleChangeNotifications");
}

- (void)showPinChoiceAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("USE_DEVICE_PASSCODE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("USE_DEVICE_PASSCODE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke;
  v15[3] = &unk_1E4A65BF8;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("CREATE_DIFFERENT_CODE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke_2;
  v14[3] = &unk_1E4A65BF8;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  -[PSKeychainSyncManager showAlert:](self, "showAlert:", v6);
}

uint64_t __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pinChoiceAlertDidChooseToUseDevicePasscode:", 1);
}

uint64_t __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pinChoiceAlertDidChooseToUseDevicePasscode:", 0);
}

- (void)setStagedSecurityCode:(id)a3 type:(int)a4
{
  NSString *v7;
  NSString *v8;

  v7 = (NSString *)a3;
  if (self->_stagedSecurityCode != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_stagedSecurityCode, a3);
    v7 = v8;
    self->_stagedSecurityCodeType = a4;
  }

}

- (id)preferencesApp
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PreferencesAppController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)startNavigationSpinnerInViewController:(id)a3
{
  id v4;
  void *v5;
  UIView *spinningView;
  UIView *v7;
  UIView *v8;
  void *v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    spinningView = self->_spinningView;
    v21 = v4;
    if (spinningView)
    {
      objc_msgSend(v4, "view");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();

      v5 = v21;
      if (spinningView != v7)
        goto LABEL_10;
      v8 = self->_spinningView;
      ++self->_spinnerCount;
      if (v8)
        goto LABEL_10;
    }
    else
    {
      ++self->_spinnerCount;
    }
    objc_msgSend(v5, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    v11 = self->_spinningView;
    self->_spinningView = v10;

    +[PSNavBarSpinnerManager sharedSpinnerManager](PSNavBarSpinnerManager, "sharedSpinnerManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startAnimatingInNavItem:forIdentifier:", v13, CFSTR("KeychainSync"));

    -[UIView setUserInteractionEnabled:](self->_spinningView, "setUserInteractionEnabled:", 0);
    v14 = -[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy");
    v5 = v21;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      v5 = v21;
      if (v16 == 1)
      {
        -[PSKeychainSyncManager preferencesApp](self, "preferencesApp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rootController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "rootListController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUserInteractionEnabled:", 0);

        v5 = v21;
      }
    }
  }
LABEL_10:

}

- (void)stopNavigationSpinner
{
  unsigned int v3;
  void *v4;
  UIView *spinningView;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_spinningView)
  {
    v3 = self->_spinnerCount - 1;
    self->_spinnerCount = v3;
    if (!v3)
    {
      +[PSNavBarSpinnerManager sharedSpinnerManager](PSNavBarSpinnerManager, "sharedSpinnerManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopAnimatingForIdentifier:", CFSTR("KeychainSync"));

      -[UIView setUserInteractionEnabled:](self->_spinningView, "setUserInteractionEnabled:", 1);
      spinningView = self->_spinningView;
      self->_spinningView = 0;

      if (!-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "userInterfaceIdiom");

        if (v7 == 1)
        {
          -[PSKeychainSyncManager preferencesApp](self, "preferencesApp");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "rootController");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "rootListController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setUserInteractionEnabled:", 1);

        }
      }
    }
  }
}

- (BOOL)_changeSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6 username:(id)a7 passwordOrEquivalentToken:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76[2];

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v75 = a7;
  v17 = a8;
  v18 = objc_alloc_init((Class)getSecureBackupClass());
  v76[0] = 0;
  objc_msgSend(v18, "getAccountInfoWithInfo:results:", 0, v76);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v76[0];
  if (!v19)
  {
    v71 = a4;
    getkSecureBackupMetadataKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    v25 = objc_msgSend(v15, "length");
    v68 = v17;
    v69 = v14;
    v74 = v20;
    if (v16 && v25)
    {
      v26 = 0;
      v27 = 0;
    }
    else
    {
      getkSecureBackupSMSTargetInfoKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        getkSecureBackupSMSTargetPhoneNumberKey();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        getkSecureBackupCountryDialCodeKey();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        getkSecureBackupCountryCodeKey_0();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = (void *)v35;
          v15 = (id)v32;
          v17 = v68;
          v26 = v36;
        }
        else
        {
          getkSecureBackupCountryCodeKey_0();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (id)v32;
          v17 = v68;
        }
      }
      else
      {
        v27 = 0;
        v26 = 0;
      }

      if (!v16)
      {
LABEL_16:
        v72 = v26;
        v73 = v27;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71 != 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupUsesComplexPassphraseKey();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v40, v41);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71 == 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupUsesNumericPassphraseKey();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v42, v43);

        if (!v71)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v69, "length"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          getkSecureBackupNumericPassphraseLengthKey();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v44, v45);

        }
        getkSecureBackupIsEnabledKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "BOOLValue");

        v70 = v24;
        if (v48
          && (objc_msgSend(v18, "disableWithInfo:", 0), (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v50 = 0;
          v21 = 0;
          v19 = 0;
          v51 = v49;
          v14 = v69;
          v28 = v75;
          if (!a9)
            goto LABEL_32;
        }
        else
        {
          v66 = v18;
          v67 = v16;
          v52 = (void *)MEMORY[0x1E0C99E08];
          getkSecureBackupPassphraseKey();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          getkSecureBackupAuthenticationAppleID();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          getkSecureBackupAuthenticationPassword();
          v55 = v15;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71 == 2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          getkSecureBackupUsesRandomPassphraseKey();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          getkSecureBackupMetadataKey();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v52;
          v14 = v69;
          objc_msgSend(v60, "dictionaryWithObjectsAndKeys:", v69, v53, v75, v54, v17, v56, v57, v58, v24, v59, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v55;
          if (objc_msgSend(v55, "length"))
          {
            getkSecureBackupSMSTargetPhoneNumberKey();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKey:", v55, v61);

          }
          if (objc_msgSend(v73, "length"))
          {
            getkSecureBackupCountryDialCodeKey();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKey:", v73, v62);

          }
          v16 = v67;
          v17 = v68;
          v28 = v75;
          v18 = v66;
          if (objc_msgSend(v72, "length"))
          {
            getkSecureBackupCountryCodeKey_0();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKey:", v72, v63);

            getkSecureBackupCountryCodeKey_0();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setObject:forKey:", v72, v64);

          }
          objc_msgSend(v66, "enableWithInfo:", v51);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v49 == 0;
          if (!a9)
          {
            v19 = v49;
            goto LABEL_32;
          }
          v50 = v49;
          v19 = v49;
          if (!v49)
          {
LABEL_32:

            v20 = v74;
            goto LABEL_33;
          }
        }
        *a9 = objc_retainAutorelease(v49);
        v19 = v50;
        goto LABEL_32;
      }
    }
    objc_msgSend(v16, "countryCode");
    v38 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "dialingPrefix");
    v39 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v39;
    v26 = (void *)v38;
    goto LABEL_16;
  }
  if (a9)
  {
    v19 = objc_retainAutorelease(v19);
    v21 = 0;
    *a9 = v19;
  }
  else
  {
    v21 = 0;
  }
  v28 = v75;
LABEL_33:

  return v21;
}

- (void)_changeToNewSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v14);

  -[PSKeychainSyncManager appleIDUsername](self, "appleIDUsername");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager appleIDPasswordOrEquivalentToken](self, "appleIDPasswordOrEquivalentToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke;
  block[3] = &unk_1E4A67068;
  block[4] = self;
  v24 = v10;
  v29 = a4;
  v25 = v11;
  v26 = v12;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  dispatch_async(v17, block);

}

void __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  char v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned int *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v20 = 0;
  v9 = objc_msgSend(v2, "_changeSecurityCode:type:smsTarget:smsTargetCountryInfo:username:passwordOrEquivalentToken:error:", v3, v5, v4, v6, v7, v8, &v20);
  v10 = v20;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke_2;
  block[3] = &unk_1E4A67040;
  v11 = *(_QWORD *)(a1 + 32);
  v19 = v9;
  block[4] = v11;
  v14 = v10;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 40);
  v18 = *(_DWORD *)(a1 + 80);
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  if (!*(_BYTE *)(a1 + 76))
  {
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupErrorDomain();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", v3))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "code");

      if (v4 == 29)
      {
        objc_msgSend(*(id *)(a1 + 32), "_showInvalidPhoneNumberAlertWithDigits:countryInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        goto LABEL_7;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_showGenericFlowErrorAlert");
  }
LABEL_7:
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 160);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 76), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setChangeSecurityCodeCompletion:", 0);
    v5 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v5 + 200), "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
}

- (void)promptForDevicePasscodeChangeToPasscode:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  PSKeychainSyncManager *v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(getCDPAccountClass(), "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "primaryAccountSecurityLevel");

  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke;
  block[3] = &unk_1E4A67180;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v22 = v12 == 5;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v13, block);

}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  id v18;
  int8x16_t v19;
  _QWORD block[4];
  int8x16_t v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  BOOL v28;

  if (PSKeychainSyncIsUsingICDP())
  {
    v28 = 0;
    v2 = PSIsUsingPasscode(&v28);
    v3 = 2;
    if (!v28)
      v3 = 3;
    if (v2)
      v4 = v3;
    else
      v4 = 0;
    v5 = objc_alloc_init((Class)getCDPContextClass());
    v6 = (void *)objc_msgSend(objc_alloc((Class)getCDPStateControllerClass()), "initWithContext:", v5);
    v7 = (void *)objc_msgSend(objc_alloc((Class)getCDPUIControllerClass()), "initWithPresentingViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setUiProvider:", v7);

    v8 = *(_QWORD *)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2;
    v26[3] = &unk_1E4A67090;
    v27 = *(id *)(a1 + 56);
    objc_msgSend(v6, "localSecretChangedTo:secretType:completion:", v8, v4, v26);

    return;
  }
  v28 = 0;
  PSKeychainSyncGetCircleMembershipStatus(0, &v28);
  if (!v28)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 48), "_presentAuthControllerWithPresentingVC:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
      return;
    }
    goto LABEL_13;
  }
  PSSecureBackupAccountInfo(0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getkSecureBackupIsEnabledKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v9
    && (getkSecureBackupUsesRandomPassphraseKey(),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKey:", v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "BOOLValue"),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    v25 = 0;
    v16 = v12 & PSIsUsingPasscode(&v25);
    if (v16 == 1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_114;
      block[3] = &unk_1E4A67180;
      v19 = *(int8x16_t *)(a1 + 40);
      v18 = (id)v19.i64[0];
      v21 = vextq_s8(v19, v19, 8uLL);
      v24 = v25;
      v23 = *(id *)(a1 + 56);
      v22 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  if ((v16 & 1) == 0)
  {
LABEL_13:
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, 1, 0);
  }
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject sf_isInternalInstall](v6, "sf_isInternalInstall") & 1) != 0 || PSDiagnosticsAreEnabled())
    {
      _PSLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(v7);

    }
  }
  else
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_2((uint64_t)v5, v6);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_114(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "setStagedSecurityCode:type:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 64) == 0);
  v2 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("USE_NEW_DEVICE_PASSCODE_AS_SECURITY_CODE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(CFSTR("USE_NEW_DEVICE_PASSCODE_AS_SECURITY_CODE_DETAILS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("DONT_CHANGE_SECURITY_CODE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_121;
  v15[3] = &unk_1E4A670B8;
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("USE_SAME_CODE_DEVICE_TO_ICSC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_3;
  v13[3] = &unk_1E4A67158;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_121(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_4;
  v2[3] = &unk_1E4A67130;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "promptForPasswordIfCredentialsNotCachedOverController:withCompletion:", 0, v2);

}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "appleIDUsername");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appleIDPasswordOrEquivalentToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_5;
    v14[3] = &unk_1E4A67108;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    v16 = v8;
    v17 = v10;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v14);

  }
  else
  {
    objc_msgSend(v6, "_cleanup");
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v13 + 16))(v13, 1, 0);
  }

}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "stagedSecurityCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "stagedSecurityCodeType");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  LOBYTE(v2) = objc_msgSend(v2, "_changeSecurityCode:type:smsTarget:smsTargetCountryInfo:username:passwordOrEquivalentToken:error:", v3, v4, 0, 0, v5, v6, &v15);
  v7 = v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_6;
  block[3] = &unk_1E4A670E0;
  v14 = (char)v2;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 56);
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 1, 0);
  }
  else
  {
    NSLog(CFSTR("Error changing security code %@"), *(_QWORD *)(a1 + 32));
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16) = 3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_7;
    v5[3] = &unk_1E4A65708;
    v3 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_showGenericFlowErrorAlertWithDismissalHandler:", v5);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_cleanup");
}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_presentAuthControllerWithPresentingVC:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  objc_msgSend(v8, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsername:", v10);

  objc_msgSend(v9, "setAuthenticationType:", 2);
  objc_msgSend(v9, "setIsUsernameEditable:", 0);
  objc_msgSend(v9, "setPresentingViewController:", v6);

  v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PSKeychainSyncManager__presentAuthControllerWithPresentingVC_completion___block_invoke;
  v13[3] = &unk_1E4A671A8;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "authenticateWithContext:completion:", v9, v13);

}

uint64_t __75__PSKeychainSyncManager__presentAuthControllerWithPresentingVC_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showGenericFlowErrorAlertWithDismissalHandler:(id)a3
{
  id v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = self->_flow - 1;
  if (v5 > 4)
    v6 = CFSTR("GENERIC_KEYCHAIN_ERROR_TITLE");
  else
    v6 = *(&off_1E4A67478 + v5);
  v7 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("OK"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PSKeychainSyncManager__showGenericFlowErrorAlertWithDismissalHandler___block_invoke;
  v14[3] = &unk_1E4A670B8;
  v15 = v4;
  v12 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  -[PSKeychainSyncManager showAlert:](self, "showAlert:", v9);
}

uint64_t __72__PSKeychainSyncManager__showGenericFlowErrorAlertWithDismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showGenericFlowErrorAlert
{
  -[PSKeychainSyncManager _showGenericFlowErrorAlertWithDismissalHandler:](self, "_showGenericFlowErrorAlertWithDismissalHandler:", 0);
}

- (void)_showInvalidPhoneNumberAlertWithDigits:(id)a3 countryInfo:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:countryInfo:](PSKeychainSyncPhoneNumber, "phoneNumberWithDigits:countryInfo:", a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  PS_LocalizedStringForKeychainSync(CFSTR("INVALID_PHONE_NUMBER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "formattedStringWithDialingPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("KEYCHAIN_VERIFICATION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("OK"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  -[PSKeychainSyncManager showAlert:](self, "showAlert:", v11);
}

- (void)showResetAcknowledgementIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[PSKeychainSyncManager circleWasReset](self, "circleWasReset"))
  {
    v5 = (void *)MEMORY[0x1E0CEA2E8];
    PS_LocalizedStringForKeychainSync(CFSTR("RESET_COMPLETED_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("RESET_COMPLETED_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PSKeychainSyncManager_showResetAcknowledgementIfNeededWithCompletion___block_invoke;
    v12[3] = &unk_1E4A670B8;
    v13 = v4;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    -[PSKeychainSyncManager showAlert:](self, "showAlert:", v8);
  }
  else if (v4)
  {
    v4[2](v4);
  }
  -[PSKeychainSyncManager setCircleWasReset:](self, "setCircleWasReset:", 0);

}

uint64_t __72__PSKeychainSyncManager_showResetAcknowledgementIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_resetCircleAndDisableBackupWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = SOSCCResetToEmpty();
  -[PSKeychainSyncManager setCircleWasReset:](self, "setCircleWasReset:", v5);
  v6 = objc_alloc_init((Class)getSecureBackupClass());
  objc_msgSend(v6, "disableWithInfo:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    NSLog(CFSTR("Error disabling backup: %@"), v7);
    LOBYTE(v5) = 0;
  }
  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  return v5;
}

- (void)_resetFromRecoveryFlow
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v4);

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(v5, block);

}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  _QWORD v6[5];
  char v7;

  PSSecureBackupAccountInfo(0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getkSecureBackupIsEnabledKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "_resetCircleAndDisableBackupWithError:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_2;
  v6[3] = &unk_1E4A671F8;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  id *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "stopNavigationSpinner");
    v4 = objc_msgSend(*(id *)(a1 + 32), "isRunningInBuddy");
    v5 = *(id **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 5, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_finishedWithStatus:error:", 1, v7);

    }
    else
    {
      objc_msgSend(v5[25], "rootController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_3;
      v9[3] = &unk_1E4A654F0;
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

    }
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_4;
    v8[3] = &unk_1E4A671D0;
    v8[4] = v3;
    objc_msgSend(v3, "joinCircleWithCompletion:", v8);
  }
}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[25], "specifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showEnableSyncFlowWithSpecifier:overController:completion:", v5, v3, v4);

}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "stopNavigationSpinner");
  objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", a2, v6);

}

- (void)_peerApprovalFromRecoveryFlow
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PSKeychainSyncManager__peerApprovalFromRecoveryFlow__block_invoke;
  v5[3] = &unk_1E4A671D0;
  v5[4] = self;
  -[PSKeychainSyncManager joinCircleWithCompletion:](self, "joinCircleWithCompletion:", v5);
}

void __54__PSKeychainSyncManager__peerApprovalFromRecoveryFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showGenericFlowErrorAlert");
    objc_msgSend(*(id *)(a1 + 32), "keychainSyncControllerCancel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_finishedWithStatus:error:", a2, v7);

  }
}

- (void)_cleanup
{
  KeychainSyncDevicePINController *devicePinController;
  PSKeychainSyncSecurityCodeController *simpleSecurityCodeController;
  PSKeychainSyncSecurityCodeController *complexSecurityCodeController;
  KeychainSyncAdvancedSecurityCodeController *advancedSecurityCodeChoiceController;
  PSKeychainSyncSecurityCodeController *securityCodeRecoveryController;
  KeychainSyncPhoneNumberController *phoneNumberController;
  KeychainSyncSMSVerificationController *smsValidationController;
  NSString *stagedSecurityCode;
  int circleNotificationToken;

  devicePinController = self->_devicePinController;
  self->_devicePinController = 0;

  simpleSecurityCodeController = self->_simpleSecurityCodeController;
  self->_simpleSecurityCodeController = 0;

  complexSecurityCodeController = self->_complexSecurityCodeController;
  self->_complexSecurityCodeController = 0;

  advancedSecurityCodeChoiceController = self->_advancedSecurityCodeChoiceController;
  self->_advancedSecurityCodeChoiceController = 0;

  securityCodeRecoveryController = self->_securityCodeRecoveryController;
  self->_securityCodeRecoveryController = 0;

  phoneNumberController = self->_phoneNumberController;
  self->_phoneNumberController = 0;

  smsValidationController = self->_smsValidationController;
  self->_smsValidationController = 0;

  stagedSecurityCode = self->_stagedSecurityCode;
  self->_stagedSecurityCode = 0;

  circleNotificationToken = self->_circleNotificationToken;
  if (circleNotificationToken)
  {
    notify_cancel(circleNotificationToken);
    self->_circleNotificationToken = 0;
  }
  -[PSKeychainSyncManager setCircleJoinCompletion:](self, "setCircleJoinCompletion:", 0);
  -[PSKeychainSyncManager setHostViewController:](self, "setHostViewController:", 0);
}

- (void)showController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setRootController:", self->_buddyNavigationController);
    -[PSRootController pushViewController:animated:](self->_buddyNavigationController, "pushViewController:animated:", v4, 1);
  }
  else
  {
    -[PSRootController showController:](self->_settingsSetupController, "showController:", v4);
  }

}

- (id)viewControllerForPresentingAlerts
{
  PSRootController *v3;
  void *v4;
  void *v5;

  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
  {
    v3 = self->_buddyNavigationController;
  }
  else
  {
    -[PSKeychainSyncManager navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[PSKeychainSyncManager navigationController](self, "navigationController");
    else
      -[PSKeychainSyncManager hostViewController](self, "hostViewController");
    v3 = (PSRootController *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)showAlert:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSKeychainSyncManager viewControllerForPresentingAlerts](self, "viewControllerForPresentingAlerts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)showNetworkReachabilityError
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  v4 = objc_msgSend(v3, "airplaneMode");

  if ((v4 & 1) != 0)
  {
    SFLocalizableWAPIStringKeyForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PS_LocalizedStringForKeychainSync(CFSTR("NO_NETWORK_REACHABILITY_MESSAGE"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[PSKeychainSyncManager showAlert:](self, "showAlert:", v6);
}

- (void)showContactAppleSupportPane
{
  void *v3;
  void *v4;
  void *v5;
  KeychainSyncAppleSupportController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CEA7B8]);
    objc_msgSend(v11, "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setHidesShadow:", 1);

    objc_msgSend(v11, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.96);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBarTintColor:", v5);

    v6 = -[KeychainSyncAppleSupportController initWithNibName:bundle:]([KeychainSyncAppleSupportController alloc], "initWithNibName:bundle:", 0, 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissAppleSupportPane_);
    -[KeychainSyncAppleSupportController navigationItem](v6, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    objc_msgSend(v11, "pushViewController:animated:", v6, 0);
    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    -[PSKeychainSyncManager navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://apple.com/support/icloud/keychain"));
    v6 = (KeychainSyncAppleSupportController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], 0);
  }

}

- (void)dismissAppleSupportPane:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PSKeychainSyncManager navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PSKeychainSyncManager_dismissAppleSupportPane___block_invoke;
  v5[3] = &unk_1E4A654F0;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __49__PSKeychainSyncManager_dismissAppleSupportPane___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (id)_defaultKeychainViewSet
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CD6840], *MEMORY[0x1E0CD6820], *MEMORY[0x1E0CD6838], *MEMORY[0x1E0CD6830], 0);
}

- (void)joinCircleAfterRecovery:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  uint64_t Status;
  id v8;
  void *v9;
  char v10;
  void (*v11)(_QWORD *, uint64_t, void *);
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD *v20;
  void *v21;
  id v22;

  v4 = a3;
  v6 = a4;
  v22 = 0;
  Status = PSKeychainSyncGetStatus(&v22);
  v8 = v22;
  v9 = v8;
  v10 = (_DWORD)Status != 3 || v4;
  if ((_DWORD)Status == 2 || (v10 & 1) == 0)
  {
    if (v6)
    {
      v11 = (void (*)(_QWORD *, uint64_t, void *))v6[2];
      v12 = v6;
      v13 = Status;
      v14 = 0;
      goto LABEL_12;
    }
  }
  else if (v8)
  {
    NSLog(CFSTR("Error checking circle status %@"), v8);
    if (v6)
    {
      v11 = (void (*)(_QWORD *, uint64_t, void *))v6[2];
      v12 = v6;
      v13 = 0;
LABEL_9:
      v14 = v9;
LABEL_12:
      v11(v12, v13, v14);
    }
  }
  else
  {
    -[PSKeychainSyncManager _registerForCircleChangeNotificationsWithCompletion:](self, "_registerForCircleChangeNotificationsWithCompletion:", v6);
    self->_joiningCircle = 1;
    self->_joiningCircleAfterRecovery = v4;
    v21 = 0;
    if (v4)
      v15 = SOSCCRequestToJoinCircleAfterRestore();
    else
      v15 = SOSCCRequestToJoinCircle();
    v16 = v15;
    -[PSKeychainSyncManager _defaultKeychainViewSet](self, "_defaultKeychainViewSet");
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    SOSCCViewSet();
    v9 = v21;
    if ((v16 & 1) == 0)
    {
      NSLog(CFSTR("request to join circle error: %@"), v21);
      self->_joiningCircle = 0;
    }
    if (-[PSKeychainSyncManager _errorRequiresPasswordPrompt:](self, "_errorRequiresPasswordPrompt:", v9))
    {
      -[PSKeychainSyncManager navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__PSKeychainSyncManager_joinCircleAfterRecovery_withCompletion___block_invoke;
      v19[3] = &unk_1E4A67130;
      v19[4] = self;
      v20 = v6;
      -[PSKeychainSyncManager promptForPasswordOverController:withCompletion:](self, "promptForPasswordOverController:withCompletion:", v18, v19);

      goto LABEL_13;
    }
    if (v6 && v16 != 1)
    {
      v11 = (void (*)(_QWORD *, uint64_t, void *))v6[2];
      v12 = v6;
      v13 = 1;
      goto LABEL_9;
    }
  }
LABEL_13:

}

void __64__PSKeychainSyncManager_joinCircleAfterRecovery_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "joinCircleWithCompletion:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)joinCircleWithCompletion:(id)a3
{
  -[PSKeychainSyncManager joinCircleAfterRecovery:withCompletion:](self, "joinCircleAfterRecovery:withCompletion:", 0, a3);
}

- (void)_recoverWithSecurityCode:(id)a3 verificationCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _Unwind_Exception *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v9);

  v10 = (void *)MEMORY[0x1E0C99D80];
  getkSecureBackupPassphraseKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v12 = (_QWORD *)getkSecureBackupVerificationTokenKeySymbolLoc_ptr;
  v23 = getkSecureBackupVerificationTokenKeySymbolLoc_ptr;
  if (!getkSecureBackupVerificationTokenKeySymbolLoc_ptr)
  {
    v13 = (void *)CloudServicesLibrary_0();
    v12 = dlsym(v13, "kSecureBackupVerificationTokenKey");
    v21[3] = (uint64_t)v12;
    getkSecureBackupVerificationTokenKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v20, 8);
  if (!v12)
  {
    v17 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v17);
  }
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v6, v11, v7, *v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init((Class)getSecureBackupClass());
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke;
  v18[3] = &unk_1E4A65A00;
  v18[4] = self;
  v19 = v7;
  v16 = v7;
  objc_msgSend(v15, "recoverWithInfo:completionBlockWithResults:", v14, v18);

}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
    NSLog(CFSTR("Error recovering keychain: %@"), v4);
  v6 = PSKeychainSyncCircleExists();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_2;
  block[3] = &unk_1E4A67220;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = v5;
  v12 = v7;
  v13 = v8;
  v14 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __CFString *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "stopNavigationSpinner");
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupErrorDomain();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      switch(objc_msgSend(*(id *)(a1 + 32), "code"))
      {
        case 12:
        case 25:
        case 26:
          if (*(_QWORD *)(a1 + 48))
            v7 = CFSTR("INCORRECT_SECURITY_OR_VERIFICATION_CODE");
          else
            v7 = CFSTR("INCORRECT_SECURITY_CODE");
          PS_LocalizedStringForKeychainSync(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(a1 + 48))
            v9 = CFSTR("ENTER_SECURITY_AND_VERIFICATION_CODES_AGAIN");
          else
            v9 = CFSTR("ENTER_SECURITY_CODE_AGAIN");
          PS_LocalizedStringForKeychainSync(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CEA2E0];
          PS_LocalizedStringForKeychainSync(CFSTR("OK"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_3;
          v62[3] = &unk_1E4A65BF8;
          v62[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v62);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addAction:", v14);

          goto LABEL_23;
        case 13:
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("keychainSyncTreatSoftLimitAsHardLimit"));

          if ((v17 & 1) != 0)
            goto LABEL_13;
          v45 = (void *)MEMORY[0x1E0CEA2E8];
          PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE_SOFT_LIMIT_TITLE"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE_SOFT_LIMIT_MESSAGE"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "alertControllerWithTitle:message:preferredStyle:", v46, v47, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = (void *)MEMORY[0x1E0CEA2E0];
          PS_LocalizedStringForKeychainSync(CFSTR("CONTACT_APPLE_SUPPORT"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = MEMORY[0x1E0C809B0];
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_4;
          v61[3] = &unk_1E4A65BF8;
          v61[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v48, "actionWithTitle:style:handler:", v49, 0, v61);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addAction:", v51);

          v52 = (void *)MEMORY[0x1E0CEA2E0];
          PS_LocalizedStringForKeychainSync(CFSTR("SET_UP_LATER"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v50;
          v60[1] = 3221225472;
          v60[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_5;
          v60[3] = &unk_1E4A65BF8;
          v60[4] = *(_QWORD *)(a1 + 40);
          v32 = v60;
          v33 = v52;
          v34 = v31;
          v35 = 0;
          goto LABEL_29;
        case 14:
LABEL_13:
          if (*(_BYTE *)(a1 + 56))
            v18 = CFSTR("SECURITY_CODE_HARD_LIMIT_MESSAGE_WITH_APPROVAL");
          else
            v18 = CFSTR("SECURITY_CODE_HARD_LIMIT_MESSAGE");
          PS_LocalizedStringForKeychainSync(v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE_HARD_LIMIT_TITLE"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(unsigned __int8 *)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, v8, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CEA2E0];
          if (v19)
          {
            PS_LocalizedStringForKeychainSync(CFSTR("APPROVE_FROM_OTHER_DEVICE"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = MEMORY[0x1E0C809B0];
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_6;
            v59[3] = &unk_1E4A65BF8;
            v59[4] = *(_QWORD *)(a1 + 40);
            objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v59);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addAction:", v23);

            v24 = (void *)MEMORY[0x1E0CEA2E0];
            PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = v22;
            v58[1] = 3221225472;
            v58[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_7;
            v58[3] = &unk_1E4A65BF8;
            v58[4] = *(_QWORD *)(a1 + 40);
            v26 = v58;
          }
          else
          {
            PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = MEMORY[0x1E0C809B0];
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_8;
            v57[3] = &unk_1E4A65BF8;
            v57[4] = *(_QWORD *)(a1 + 40);
            objc_msgSend(v20, "actionWithTitle:style:handler:", v36, 1, v57);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addAction:", v38);

            v24 = (void *)MEMORY[0x1E0CEA2E0];
            PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = v37;
            v56[1] = 3221225472;
            v56[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_9;
            v56[3] = &unk_1E4A65BF8;
            v56[4] = *(_QWORD *)(a1 + 40);
            v26 = v56;
          }
          objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v26);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addAction:", v39);

LABEL_23:
          objc_msgSend(*(id *)(a1 + 40), "showAlert:", v11);

          goto LABEL_24;
        case 19:
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "securityCodeType") != 2)
            goto LABEL_20;
          v27 = (void *)MEMORY[0x1E0CEA2E8];
          PS_LocalizedStringForKeychainSync(CFSTR("INCORRECT_SECURITY_CODE"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          PS_LocalizedStringForKeychainSync(CFSTR("ENTER_SECURITY_CODE_AGAIN"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v28, v29, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)MEMORY[0x1E0CEA2E0];
          PS_LocalizedStringForKeychainSync(CFSTR("OK"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_10;
          v55[3] = &unk_1E4A65BF8;
          v55[4] = *(_QWORD *)(a1 + 40);
          v32 = v55;
          v33 = v30;
          v34 = v31;
          v35 = 1;
LABEL_29:
          objc_msgSend(v33, "actionWithTitle:style:handler:", v34, v35, v32);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addAction:", v53);

          objc_msgSend(*(id *)(a1 + 40), "showAlert:", v8);
LABEL_24:

          break;
        default:
          goto LABEL_20;
      }
    }
    else
    {
LABEL_20:
      objc_msgSend(*(id *)(a1 + 40), "_showGenericFlowErrorAlert");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setTextEntryText:", &stru_1E4A69238);
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *(void **)(*(_QWORD *)(a1 + 40) + 56);

    if (v41 != v42)
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (id)objc_msgSend(v43, "popToViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), 1);

    }
  }
  else
  {
    objc_msgSend(v2, "_startCircleJoinAfterRecoveryTimer");
    v15 = *(void **)(a1 + 40);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_11;
    v54[3] = &unk_1E4A671D0;
    v54[4] = v15;
    objc_msgSend(v15, "joinCircleAfterRecovery:withCompletion:", 1, v54);
  }
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popToViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1);

}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showContactAppleSupportPane");
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", 1, 0);
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerApprovalFromRecoveryFlow");
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetFromRecoveryFlow");
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", 1, 0);
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetFromRecoveryFlow");
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_10(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popToViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1);

}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_stopCircleJoinAfterRecoveryTimer");
  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  if ((_DWORD)a2 != 2)
    NSLog(CFSTR("Failed to join circle after recovery, local status = %i, error = %@"), a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", a2, v5);

}

- (void)_circleJoinAfterRecoveryTimerFired:(id)a3
{
  uint64_t Status;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  int v9;
  id v10;

  v10 = 0;
  Status = PSKeychainSyncGetStatus(&v10);
  v5 = v10;
  NSLog(CFSTR("Circle join after recovery timed out! Status was %i"), Status);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PSKeychainSyncManager__circleJoinAfterRecoveryTimerFired___block_invoke;
  v7[3] = &unk_1E4A67248;
  v9 = Status;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PSKeychainSyncManager _showGenericFlowErrorAlertWithDismissalHandler:](self, "_showGenericFlowErrorAlertWithDismissalHandler:", v7);

}

uint64_t __60__PSKeychainSyncManager__circleJoinAfterRecoveryTimerFired___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  if (result)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "setCircleJoinCompletion:", 0);
  }
  return result;
}

- (void)_startCircleJoinAfterRecoveryTimer
{
  NSTimer *v3;
  NSTimer *joinAfterRecoveryTimeoutTimer;

  -[NSTimer invalidate](self->_joinAfterRecoveryTimeoutTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__circleJoinAfterRecoveryTimerFired_, 0, 0, 15.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  joinAfterRecoveryTimeoutTimer = self->_joinAfterRecoveryTimeoutTimer;
  self->_joinAfterRecoveryTimeoutTimer = v3;

}

- (void)_stopCircleJoinAfterRecoveryTimer
{
  NSTimer *joinAfterRecoveryTimeoutTimer;

  -[NSTimer invalidate](self->_joinAfterRecoveryTimeoutTimer, "invalidate");
  joinAfterRecoveryTimeoutTimer = self->_joinAfterRecoveryTimeoutTimer;
  self->_joinAfterRecoveryTimeoutTimer = 0;

}

- (void)handleCircleChangedNotification
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**circleJoinCompletion)(id, uint64_t, _QWORD);

  if (self->_joiningCircle)
  {
    v3 = SOSCCThisDeviceIsInCircle();
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 2)
      {
        v7 = 3;
      }
      else
      {
        if ((_DWORD)v3 == 1)
        {
          if (self->_joiningCircleAfterRecovery)
            SOSCCRequestToJoinCircleAfterRestore();
          else
            SOSCCRequestToJoinCircle();
          -[PSKeychainSyncManager _defaultKeychainViewSet](self, "_defaultKeychainViewSet");
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          SOSCCViewSet();

          goto LABEL_21;
        }
        NSLog(CFSTR("Status no longer pending but not successful, %i"), v3);
        NSLog(CFSTR("Failed request to join circle: %@"), 0);
        v7 = 1;
      }
    }
    else
    {
      v7 = 2;
    }
    circleJoinCompletion = (void (**)(id, uint64_t, _QWORD))self->_circleJoinCompletion;
    if (circleJoinCompletion)
      circleJoinCompletion[2](circleJoinCompletion, v7, 0);
    -[PSKeychainSyncManager setCircleJoinCompletion:](self, "setCircleJoinCompletion:", 0);
    self->_joiningCircle = 0;
    goto LABEL_21;
  }
  if (self->_flow != 4)
    return;
  if (!SOSCCThisDeviceIsInCircle())
  {
    -[PSKeychainSyncManager viewControllerForPresentingAlerts](self, "viewControllerForPresentingAlerts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PSKeychainSyncManager navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    -[PSKeychainSyncSecurityCodeController dismissAlerts](self->_securityCodeRecoveryController, "dismissAlerts");
    -[KeychainSyncSMSVerificationController dismissAlerts](self->_smsValidationController, "dismissAlerts");
    -[PSKeychainSyncManager _finishedWithStatus:error:](self, "_finishedWithStatus:error:", 0, 0);

  }
LABEL_21:

}

- (void)_callCompletionWithStatus:(int)a3 error:(id)a4
{
  id completion;
  id v6;
  id v7;
  void *v8;
  id v9;

  completion = self->_completion;
  if (completion)
  {
    v6 = a4;
    v9 = (id)MEMORY[0x1A8594D10](completion);
    (*((void (**)(void))self->_completion + 2))();

    v7 = (id)MEMORY[0x1A8594D10](self->_completion);
    v8 = v9;
    if (v7 == v9)
    {
      -[PSKeychainSyncManager setCompletion:](self, "setCompletion:", 0);
      v8 = v9;
    }

  }
}

- (void)_finishedWithStatus:(int)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  int v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke;
  v14[3] = &unk_1E4A67248;
  v14[4] = self;
  v16 = a3;
  v8 = v6;
  v15 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x1A8594D10](v14);
  if (!-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
    goto LABEL_6;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences.KeychainSync")) & 1) == 0)
  {

    goto LABEL_6;
  }
  v11 = objc_msgSend(v8, "code");

  if (v11 != 5)
  {
LABEL_6:
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke_2;
    v12[3] = &unk_1E4A65758;
    v12[4] = self;
    v13 = v9;
    -[PSKeychainSyncManager showResetAcknowledgementIfNeededWithCompletion:](self, "showResetAcknowledgementIfNeededWithCompletion:", v12);

    goto LABEL_7;
  }
  v9[2](v9);
LABEL_7:

}

uint64_t __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionWithStatus:error:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke_2(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isRunningInBuddy") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "rootController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_preSetupCancelledWithCurrentStatus
{
  int flow;
  void *v4;
  id changeSecurityCodeCompletion;
  void *v6;
  void *v7;
  void (**resetCompletion)(id, _QWORD, void *);
  void *v9;
  void *v10;
  uint64_t Status;

  -[PSKeychainSyncManager _cleanup](self, "_cleanup");
  flow = self->_flow;
  if (flow == 5)
  {
    if (self->_resetCompletion)
    {
      v4 = (void *)MEMORY[0x1A8594D10]();
      resetCompletion = (void (**)(id, _QWORD, void *))self->_resetCompletion;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      resetCompletion[2](resetCompletion, 0, v9);

      v10 = (void *)MEMORY[0x1A8594D10](self->_resetCompletion);
      if (v10 == v4)
        -[PSKeychainSyncManager setResetCompletion:](self, "setResetCompletion:", 0);
      goto LABEL_10;
    }
  }
  else
  {
    if (flow != 3)
    {
      Status = PSKeychainSyncGetStatus(0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 2, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSKeychainSyncManager _callCompletionWithStatus:error:](self, "_callCompletionWithStatus:error:", Status, v4);
LABEL_10:

      goto LABEL_11;
    }
    if (self->_changeSecurityCodeCompletion)
    {
      v4 = (void *)MEMORY[0x1A8594D10]();
      changeSecurityCodeCompletion = self->_changeSecurityCodeCompletion;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 2, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, uint64_t, void *))changeSecurityCodeCompletion + 2))(changeSecurityCodeCompletion, 0, 0, 0xFFFFFFFFLL, v6);

      v7 = (void *)MEMORY[0x1A8594D10](self->_changeSecurityCodeCompletion);
      if (v7 == v4)
        -[PSKeychainSyncManager setChangeSecurityCodeCompletion:](self, "setChangeSecurityCodeCompletion:", 0);
      goto LABEL_10;
    }
  }
LABEL_11:
  -[PSKeychainSyncManager setCircleWasReset:](self, "setCircleWasReset:", 0);
  self->_flow = 0;
}

- (void)keychainSyncControllerCancel:(id)a3
{
  void *v4;

  if (!-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy", a3))
  {
    -[PSRootController rootController](self->_settingsSetupController, "rootController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[PSKeychainSyncManager _preSetupCancelledWithCurrentStatus](self, "_preSetupCancelledWithCurrentStatus");
}

- (void)_autoVetSMSValidationWithToken:(id)a3
{
  void *v4;
  KeychainSyncSMSVerificationController *v5;
  KeychainSyncSMSVerificationController *smsValidationController;
  id v7;

  v7 = a3;
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (KeychainSyncSMSVerificationController *)objc_claimAutoreleasedReturnValue();
  smsValidationController = self->_smsValidationController;

  if (v5 == smsValidationController)
  {
    NSLog(CFSTR("Auto-Vetting keychain sync recovery with token %@"), v7);
    -[PSKeychainSyncTextEntryController setTextEntryText:](self->_smsValidationController, "setTextEntryText:", v7);
  }
  PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();

}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id *v5;
  PSKeychainSyncSecurityCodeController *v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  PSKeychainSyncSecurityCodeController *v24;
  PSKeychainSyncSecurityCodeController *complexSecurityCodeController;
  uint64_t v26;
  void *v27;
  KeychainSyncAdvancedSecurityCodeController *v28;
  KeychainSyncAdvancedSecurityCodeController *advancedSecurityCodeChoiceController;
  KeychainSyncPhoneNumberController *v30;
  KeychainSyncPhoneNumberController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  KeychainSyncPhoneNumberController *phoneNumberController;
  KeychainSyncPhoneNumberController *v43;
  KeychainSyncPhoneNumberController *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  _Unwind_Exception *v65;
  void *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD block[5];
  PSKeychainSyncSecurityCodeController *v79;
  int v80;
  _QWORD v81[5];
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id location;
  id *p_location;
  uint64_t v91;
  uint64_t v92;

  v9 = (PSKeychainSyncSecurityCodeController *)a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  if (self->_securityCodeRecoveryController == v9)
  {
    if (CFSTR("usePeerApproval") == v10)
    {
      -[PSKeychainSyncManager _peerApprovalFromRecoveryFlow](self, "_peerApprovalFromRecoveryFlow");
      goto LABEL_71;
    }
    if (CFSTR("resetKeychain") == v10)
    {
      -[PSKeychainSyncManager _resetFromRecoveryFlow](self, "_resetFromRecoveryFlow");
      goto LABEL_71;
    }
    if (CFSTR("setUpLater") == v10)
    {
LABEL_29:
      -[PSKeychainSyncManager _finishedWithStatus:error:](self, "_finishedWithStatus:error:", 1, 0);
      goto LABEL_71;
    }
    v75 = v10;
    -[__CFString objectForKey:](v75, "objectForKey:", CFSTR("securityCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncManager setSecurityCodeRecoveryAttempt:](self, "setSecurityCodeRecoveryAttempt:", v13);

    -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", self->_securityCodeRecoveryController);
    v14 = objc_alloc_init((Class)getSecureBackupClass());
    v88 = 0;
    objc_msgSend(v14, "getAccountInfoWithInfo:results:", 0, &v88);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v88;
    if (v15)
    {
      -[PSKeychainSyncManager stopNavigationSpinner](self, "stopNavigationSpinner");
      NSLog(CFSTR("Error loading account info %@"), v15);
      -[PSKeychainSyncManager _showGenericFlowErrorAlert](self, "_showGenericFlowErrorAlert");
LABEL_70:

      goto LABEL_71;
    }
    location = 0;
    p_location = &location;
    v91 = 0x2020000000;
    v46 = (_QWORD *)getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr;
    v92 = getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr;
    if (!getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr)
    {
      v47 = (void *)CloudServicesLibrary_0();
      v46 = dlsym(v47, "kSecureBackupAccountIsHighSecurityKey");
      p_location[3] = v46;
      getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr = (uint64_t)v46;
    }
    _Block_object_dispose(&location, 8);
    if (v46)
    {
      objc_msgSend(v16, "objectForKey:", *v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id *)objc_msgSend(v48, "BOOLValue");

      location = 0;
      p_location = &location;
      v91 = 0x2020000000;
      v49 = (_QWORD *)getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr;
      v92 = getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr;
      if (!getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr)
      {
        v50 = (void *)CloudServicesLibrary_0();
        v49 = dlsym(v50, "kSecureBackupRecoveryRequiresVerificationTokenKey");
        p_location[3] = v49;
        getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr = (uint64_t)v49;
      }
      _Block_object_dispose(&location, 8);
      if (v49)
      {
        objc_msgSend(v16, "objectForKey:", *v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v51, "BOOLValue");

        getkSecureBackupSMSTargetInfoKey();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = (char)v5;
          getkSecureBackupSMSTargetPhoneNumberKey();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKey:", v54);
          v69 = objc_claimAutoreleasedReturnValue();

          getkSecureBackupCountryDialCodeKey();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKey:", v55);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          getkSecureBackupCountryCodeKey_0();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKey:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v57, "length"))
          {
            v72 = v57;
          }
          else
          {
            getkSecureBackupMetadataKey();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v73);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            getkSecureBackupCountryCodeKey_0();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectForKey:");
            v67 = objc_claimAutoreleasedReturnValue();

            v72 = (void *)v67;
          }
          v58 = (void *)v69;
          LOBYTE(v5) = v68;
        }
        else
        {
          v72 = 0;
          v74 = 0;
          v58 = 0;
        }
        if ((v5 & 1) == 0)
        {
          if (v58)
            v60 = v70;
          else
            v60 = 0;
          if (v60 == 1 && v74)
          {
            v71 = v53;
            objc_msgSend(getFTDeviceSupportClass(), "sharedInstance");
            v61 = v58;
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isTelephonyDevice");

            v58 = v61;
            if (v63 && -[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
            {
              objc_initWeak(&location, self);
              v86[0] = MEMORY[0x1E0C809B0];
              v86[1] = 3221225472;
              v86[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke;
              v86[3] = &unk_1E4A67298;
              objc_copyWeak(&v87, &location);
              PSHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(v86);
              objc_destroyWeak(&v87);
              objc_destroyWeak(&location);
            }
            v82[0] = MEMORY[0x1E0C809B0];
            v82[1] = 3221225472;
            v82[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_3;
            v82[3] = &unk_1E4A672E8;
            v82[4] = self;
            v64 = v72;
            v83 = v72;
            v84 = v74;
            v85 = v61;
            objc_msgSend(v14, "startSMSChallengeWithInfo:completionBlockWithResults:", 0, v82);

            v53 = v71;
            goto LABEL_69;
          }
          if (v70 && (!v58 || !v74))
            NSLog(CFSTR("Requires verification token, but SMS target or country code is missing"));
        }
        -[PSKeychainSyncManager stopNavigationSpinner](self, "stopNavigationSpinner");
        -[PSKeychainSyncManager _recoverWithSecurityCode:verificationCode:](self, "_recoverWithSecurityCode:verificationCode:", self->_securityCodeRecoveryAttempt, 0);
        v64 = v72;
LABEL_69:

        goto LABEL_70;
      }
    }
    else
    {
      PSPNCreateFormattedStringWithCountry_cold_1();
    }
    v65 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    objc_destroyWeak(v5);
    objc_destroyWeak(&location);
    _Unwind_Resume(v65);
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_advancedSecurityCodeChoiceController == v9)
  {
    v20 = -[__CFString intValue](v10, "intValue");
    if (v20 == 3)
    {
      -[PSKeychainSyncManager navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v22);

      v12 = objc_alloc_init((Class)getSecureBackupClass());
      objc_msgSend(v12, "disableWithInfo:completionBlock:", 0, &__block_literal_global_16);
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_7;
      v81[3] = &unk_1E4A671D0;
      v81[4] = self;
      -[PSKeychainSyncManager joinCircleWithCompletion:](self, "joinCircleWithCompletion:", v81);
      goto LABEL_41;
    }
    v23 = v20;
    v24 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    complexSecurityCodeController = self->_complexSecurityCodeController;
    self->_complexSecurityCodeController = v24;

    -[PSKeychainSyncViewController setDelegate:](self->_complexSecurityCodeController, "setDelegate:", self);
    -[PSKeychainSyncSecurityCodeController setMode:](self->_complexSecurityCodeController, "setMode:", 1);
    if (v23 == 1)
      v26 = 1;
    else
      v26 = 2;
    -[PSKeychainSyncSecurityCodeController setSecurityCodeType:](self->_complexSecurityCodeController, "setSecurityCodeType:", v26);
    v27 = self->_complexSecurityCodeController;
    goto LABEL_36;
  }
  if (self->_simpleSecurityCodeController == v9 || self->_complexSecurityCodeController == v9)
  {
    if (CFSTR("advancedOptions") != v10)
    {
      -[__CFString objectForKey:](v10, "objectForKey:", CFSTR("securityCodeType"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "intValue");
      -[__CFString objectForKey:](v10, "objectForKey:", CFSTR("securityCode"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSKeychainSyncManager setStagedSecurityCode:type:](self, "setStagedSecurityCode:type:", v18, v17);

      if (self->_flow == 3)
      {
        -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v9);
        dispatch_get_global_queue(0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_8;
        block[3] = &unk_1E4A67248;
        v80 = v17;
        block[4] = self;
        v79 = v9;
        dispatch_async(v19, block);

      }
      else if ((_DWORD)v17 == 2)
      {
        -[PSKeychainSyncManager joinCircleAndEnableSecureBackupWithPhoneNumber:countryInfo:](self, "joinCircleAndEnableSecureBackupWithPhoneNumber:countryInfo:", 0, 0);
      }
      else
      {
        phoneNumberController = self->_phoneNumberController;
        if (!phoneNumberController)
        {
          v43 = objc_alloc_init(KeychainSyncPhoneNumberController);
          v44 = self->_phoneNumberController;
          self->_phoneNumberController = v43;

          phoneNumberController = self->_phoneNumberController;
        }
        -[PSKeychainSyncManager showController:](self, "showController:", phoneNumberController);
      }
      goto LABEL_41;
    }
    v28 = objc_alloc_init(KeychainSyncAdvancedSecurityCodeController);
    advancedSecurityCodeChoiceController = self->_advancedSecurityCodeChoiceController;
    self->_advancedSecurityCodeChoiceController = v28;

    -[PSKeychainSyncViewController setDelegate:](self->_advancedSecurityCodeChoiceController, "setDelegate:", self);
    -[KeychainSyncAdvancedSecurityCodeController setShowsDisableRecoveryOption:](self->_advancedSecurityCodeChoiceController, "setShowsDisableRecoveryOption:", self->_flow == 1);
    v27 = self->_advancedSecurityCodeChoiceController;
LABEL_36:
    -[PSKeychainSyncManager showController:](self, "showController:", v27);
    goto LABEL_71;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_devicePinController == v9)
  {
    LOBYTE(location) = 0;
    PSIsUsingPasscode((BOOL *)&location);
    -[PSKeychainSyncManager setStagedSecurityCode:type:](self, "setStagedSecurityCode:type:", v10, (_BYTE)location == 0);
    if (!self->_phoneNumberController)
    {
      v30 = objc_alloc_init(KeychainSyncPhoneNumberController);
      v31 = self->_phoneNumberController;
      self->_phoneNumberController = v30;

    }
    if (!-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
    {
      -[PSKeychainSyncManager stagedSecurityCode](self, "stagedSecurityCode");
      if (SecPasswordIsPasswordWeak2())
      {
        NSLog(CFSTR("Device PIN is too weak to be an iCloud Security Code"));
        v32 = (void *)MEMORY[0x1E0CEA2E8];
        PS_LocalizedStringForKeychainSync(CFSTR("DEVICE_PASSCODE_TOO_WEAK"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        PS_LocalizedStringForKeychainSync(CFSTR("DEVICE_PASSCODE_TOO_WEAK_DETAILS"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "alertControllerWithTitle:message:preferredStyle:", v33, v34, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = MEMORY[0x1E0C809B0];
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_11;
        v77[3] = &unk_1E4A65BF8;
        v77[4] = self;
        objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 1, v77);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v38);

        v39 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("USE_CODE"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v37;
        v76[1] = 3221225472;
        v76[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_12;
        v76[3] = &unk_1E4A65BF8;
        v76[4] = self;
        objc_msgSend(v39, "actionWithTitle:style:handler:", v40, 0, v76);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v41);

        -[PSKeychainSyncManager showAlert:](self, "showAlert:", v12);
        goto LABEL_41;
      }
    }
    v27 = self->_phoneNumberController;
    goto LABEL_36;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_phoneNumberController == v9)
  {
    -[__CFString objectForKey:](v10, "objectForKey:", CFSTR("phoneNumber"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKey:](v10, "objectForKey:", CFSTR("countryInfo"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncManager keychainSyncPhoneNumberController:didCompleteWithPhoneNumber:countryInfo:](self, "keychainSyncPhoneNumberController:didCompleteWithPhoneNumber:countryInfo:", v9, v12, v45);

    goto LABEL_41;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_smsValidationController == v9)
  {
    if (v10)
    {
      -[PSKeychainSyncManager securityCodeRecoveryAttempt](self, "securityCodeRecoveryAttempt");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PSKeychainSyncManager _recoverWithSecurityCode:verificationCode:](self, "_recoverWithSecurityCode:verificationCode:", v12, v10);
LABEL_41:

      goto LABEL_71;
    }
    goto LABEL_29;
  }
LABEL_71:

}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_2;
  v8[3] = &unk_1E4A67270;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v10);
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_autoVetSMSValidationWithToken:", *(_QWORD *)(a1 + 32));

}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_4;
  v10[3] = &unk_1E4A672C0;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  KeychainSyncSMSVerificationController *v21;
  uint64_t v22;
  void *v23;
  _Unwind_Exception *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getkSecureBackupErrorDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v3))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "code") == 28)
    {

LABEL_8:
      +[KeychainSyncCountryInfo countryInfoForCountryCode:dialingPrefix:](KeychainSyncCountryInfo, "countryInfoForCountryCode:dialingPrefix:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:countryInfo:](PSKeychainSyncPhoneNumber, "phoneNumberWithDigits:countryInfo:", *(_QWORD *)(a1 + 64), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Error sending SMS: %@"), *(_QWORD *)(a1 + 40));
      v7 = (void *)MEMORY[0x1E0CB3940];
      PS_LocalizedStringForKeychainSync(CFSTR("SMS_RETRY_LIMIT_REACHED"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formattedAndObfuscatedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CEA2E8];
      PS_LocalizedStringForKeychainSync(CFSTR("TRY_SETTING_UP_LATER"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("OK"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_5;
      v25[3] = &unk_1E4A65BF8;
      v25[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v16);

      objc_msgSend(*(id *)(a1 + 32), "showAlert:", v13);
      goto LABEL_16;
    }
    v4 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v4 == 27)
      goto LABEL_8;
  }
  else
  {

  }
  if (*(_QWORD *)(a1 + 40))
  {
    NSLog(CFSTR("Error sending SMS: %@"), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_showGenericFlowErrorAlert");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTextEntryText:", &stru_1E4A69238);
    return;
  }
  v17 = *(void **)(a1 + 72);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v18 = (_QWORD *)getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr;
  v29 = getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr)
  {
    v19 = (void *)CloudServicesLibrary_0();
    v18 = dlsym(v19, "kSecureBackupRecoveryVerificationTokenLengthKey");
    v27[3] = (uint64_t)v18;
    getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v26, 8);
  if (!v18)
  {
    v24 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v26, 8);
    _Unwind_Resume(v24);
  }
  objc_msgSend(v17, "objectForKey:", *v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v20 = 0;
  v21 = objc_alloc_init(KeychainSyncSMSVerificationController);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 72);
  *(_QWORD *)(v22 + 72) = v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setKeychainSyncManager:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setPhoneNumber:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDialingPrefix:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setCountryCode:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setNumberOfPasscodeFields:", v20);
  objc_msgSend(*(id *)(a1 + 32), "showController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
LABEL_16:

}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTextEntryText:", &stru_1E4A69238);
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "stopNavigationSpinner");
  objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", a2, v6);

}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  int v18;
  id v19;

  if (*(_DWORD *)(a1 + 48) == 2)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc_init((Class)getSecureBackupClass());
    v19 = 0;
    v5 = (id)objc_msgSend(v4, "getAccountInfoWithInfo:results:", 0, &v19);
    v6 = v19;
    getkSecureBackupSMSTargetInfoKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v2 = 0;
    v3 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      getkSecureBackupSMSTargetPhoneNumberKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      getkSecureBackupCountryDialCodeKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v10);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_9;
  v14[3] = &unk_1E4A67338;
  v18 = *(_DWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v2;
  v17 = v11;
  v12 = v2;
  v13 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_9(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  KeychainSyncPhoneNumberController *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  int v10;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 2)
    goto LABEL_5;
  if (objc_msgSend(*(id *)(a1 + 40), "length") && objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    v2 = *(_DWORD *)(a1 + 64);
LABEL_5:
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_10;
    v8[3] = &unk_1E4A67310;
    v8[4] = v3;
    v10 = v2;
    v9 = v4;
    objc_msgSend(v3, "promptForPasswordIfCredentialsNotCachedOverController:withCompletion:", v9, v8);

    return;
  }
  v5 = objc_alloc_init(KeychainSyncPhoneNumberController);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "showController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!a2)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Preferences.KeychainSync"))
      && objc_msgSend(v9, "code") == 1)
    {

    }
    else
    {
      v7 = *(_DWORD *)(a1 + 48);

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
        objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
        goto LABEL_9;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "rootController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_changeToNewSecurityCode:type:smsTarget:smsTargetCountryInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(unsigned int *)(a1 + 48), 0, 0);
LABEL_9:

}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", 1, 0);
}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_enableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _Unwind_Exception *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  PSKeychainSyncManager *v61;
  id v62;
  id v63;
  BOOL v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E08];
  getkSecureBackupMetadataKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObject:forKey:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupCountryCodeKey_0();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, v13);

  }
  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy")
    && (-[PSKeychainSyncManager stagedSecurityCode](self, "stagedSecurityCode"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "length"),
        v14,
        !v15))
  {
    *(_QWORD *)buf = 0;
    v66 = buf;
    v67 = 0x2020000000;
    v28 = (_QWORD *)getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
    v68 = getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
    if (!getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr)
    {
      v29 = (void *)CloudServicesLibrary_0();
      v28 = dlsym(v29, "kSecureBackupUseCachedPassphraseKey");
      *((_QWORD *)v66 + 3) = v28;
      getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = (uint64_t)v28;
    }
    _Block_object_dispose(buf, 8);
    if (!v28)
    {
      v57 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
      _Block_object_dispose(buf, 8);
      _Unwind_Resume(v57);
    }
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *v28);
    v64 = 0;
    PSIsUsingPasscode(&v64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v64);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesComplexPassphraseKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v30, v31);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesNumericPassphraseKey();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v32, v33);

    if (v64)
    {
      *(_DWORD *)buf = -1;
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "unlockScreenTypeWithOutSimplePasscodeType:", buf);

      if (*(_DWORD *)buf)
        v35 = 6;
      else
        v35 = 4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupNumericPassphraseLengthKey();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v36, v37);

    }
  }
  else
  {
    -[PSKeychainSyncManager stagedSecurityCode](self, "stagedSecurityCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPassphraseKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stagedSecurityCodeType == 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesRandomPassphraseKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v18, v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stagedSecurityCodeType != 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesComplexPassphraseKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v20, v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stagedSecurityCodeType == 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesNumericPassphraseKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v22, v23);

    if (!self->_stagedSecurityCodeType)
    {
      v24 = (void *)MEMORY[0x1E0CB37E8];
      -[PSKeychainSyncManager stagedSecurityCode](self, "stagedSecurityCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "length"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupNumericPassphraseLengthKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v26, v27);

    }
  }
  -[PSKeychainSyncManager appleIDPasswordOrEquivalentToken](self, "appleIDPasswordOrEquivalentToken");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    _PSLoggingFacility();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v39, OS_LOG_TYPE_DEFAULT, "Missing password or password equivalent!", buf, 2u);
    }

  }
  if (v6)
  {
    if (v7)
    {
      -[PSKeychainSyncManager appleIDPasswordOrEquivalentToken](self, "appleIDPasswordOrEquivalentToken");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        getkSecureBackupSMSTargetPhoneNumberKey();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v6, v41);

        objc_msgSend(v7, "dialingPrefix");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupCountryDialCodeKey();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v42, v43);

        objc_msgSend(v7, "countryCode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupCountryCodeKey_0();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v44, v45);

        -[PSKeychainSyncManager appleIDUsername](self, "appleIDUsername");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupAuthenticationAppleID();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v46, v47);

        -[PSKeychainSyncManager appleIDPasswordOrEquivalentToken](self, "appleIDPasswordOrEquivalentToken");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupAuthenticationPassword();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v48, v49);

      }
    }
  }
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v51);

  v52 = objc_alloc_init((Class)getSecureBackupClass());
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke;
  v58[3] = &unk_1E4A67388;
  v59 = v52;
  v60 = v11;
  v61 = self;
  v62 = v6;
  v63 = v7;
  v53 = v7;
  v54 = v6;
  v55 = v11;
  v56 = v52;
  objc_msgSend(v56, "disableWithInfo:completionBlock:", 0, v58);

}

void __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  if (a2)
    NSLog(CFSTR("Failed to disable secure backup before re-enabling: %@"), a2);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2;
  v6[3] = &unk_1E4A67360;
  v5 = *(void **)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 48);
  v7 = v5;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v3, "enableWithInfo:completionBlock:", v4, v6);

}

void __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_3;
  v6[3] = &unk_1E4A65A28;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", 2, 0);
  NSLog(CFSTR("Failed to enable keychain backup: %@"), *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) == 1)
    SOSCCRemoveThisDeviceFromCircle();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getkSecureBackupErrorDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v4 == 29)
      return objc_msgSend(*(id *)(a1 + 32), "_showInvalidPhoneNumberAlertWithDigits:countryInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 32), "_showGenericFlowErrorAlert");
}

- (void)joinCircleAndEnableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PSKeychainSyncManager navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self, "startNavigationSpinnerInViewController:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke;
  v12[3] = &unk_1E4A673B0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PSKeychainSyncManager joinCircleWithCompletion:](self, "joinCircleWithCompletion:", v12);

}

void __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopNavigationSpinner");
  v6 = *(void **)(a1 + 32);
  if ((_DWORD)a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2;
    v10[3] = &unk_1E4A66D70;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v6, "promptForPasswordIfCredentialsNotCachedOverController:withCompletion:", v8, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_showGenericFlowErrorAlert");
    objc_msgSend(*(id *)(a1 + 32), "_finishedWithStatus:error:", a2, v5);
  }

}

uint64_t __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_enableSecureBackupWithPhoneNumber:countryInfo:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  return result;
}

- (void)keychainSyncPhoneNumberController:(id)a3 didCompleteWithPhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PSKeychainSyncManager_keychainSyncPhoneNumberController_didCompleteWithPhoneNumber_countryInfo___block_invoke;
  v12[3] = &unk_1E4A66D70;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PSKeychainSyncManager promptForPasswordIfCredentialsNotCachedOverController:withCompletion:](self, "promptForPasswordIfCredentialsNotCachedOverController:withCompletion:", a3, v12);

}

void __98__PSKeychainSyncManager_keychainSyncPhoneNumberController_didCompleteWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _DWORD *v6;
  int v7;
  void *v8;
  id v9;

  v5 = a3;
  if (a2)
  {
    v6 = *(_DWORD **)(a1 + 32);
    v7 = v6[4];
    v9 = v5;
    if (v7 == 3)
    {
      objc_msgSend(v6, "stagedSecurityCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_changeToNewSecurityCode:type:smsTarget:smsTargetCountryInfo:", v8, objc_msgSend(*(id *)(a1 + 32), "stagedSecurityCodeType"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    }
    else if (v7 == 2)
    {
      objc_msgSend(v6, "_enableSecureBackupWithPhoneNumber:countryInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(v6, "joinCircleAndEnableSecureBackupWithPhoneNumber:countryInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    v5 = v9;
  }

}

- (void)pinChoiceAlertDidChooseToUseDevicePasscode:(BOOL)a3
{
  _BOOL4 v3;
  KeychainSyncPhoneNumberController *phoneNumberController;
  KeychainSyncPhoneNumberController *v6;
  KeychainSyncPhoneNumberController *v7;
  KeychainSyncDevicePINController *devicePinController;
  void *v9;
  PSKeychainSyncSecurityCodeController *v10;
  PSKeychainSyncSecurityCodeController *simpleSecurityCodeController;
  PSKeychainSyncSecurityCodeController *v12;
  void *v13;
  id v14;
  PSKeychainSyncSecurityCodeController *v15;

  v3 = a3;
  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
  {
    if (v3)
    {
      phoneNumberController = self->_phoneNumberController;
      if (!phoneNumberController)
      {
        v6 = objc_alloc_init(KeychainSyncPhoneNumberController);
        v7 = self->_phoneNumberController;
        self->_phoneNumberController = v6;

        phoneNumberController = self->_phoneNumberController;
      }
      -[PSKeychainSyncManager showController:](self, "showController:", phoneNumberController);
      return;
    }
    v10 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    simpleSecurityCodeController = self->_simpleSecurityCodeController;
    self->_simpleSecurityCodeController = v10;

    -[PSKeychainSyncSecurityCodeController setShowsAdvancedSettings:](self->_simpleSecurityCodeController, "setShowsAdvancedSettings:", 1);
    v12 = self->_simpleSecurityCodeController;
    if (!v12)
      return;
  }
  else
  {
    if (v3)
    {
      objc_opt_class();
      v14 = (id)objc_opt_new();
      objc_storeStrong((id *)&self->_devicePinController, v14);
      if (!v14)
        return;
      devicePinController = self->_devicePinController;
      PS_LocalizedStringForKeychainSync(CFSTR("ENTER_YOUR_PASSCODE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[KeychainSyncDevicePINController setEnterPasscodeTitle:](devicePinController, "setEnterPasscodeTitle:", v9);

      goto LABEL_11;
    }
    objc_opt_class();
    v15 = (PSKeychainSyncSecurityCodeController *)objc_opt_new();
    objc_storeStrong((id *)&self->_simpleSecurityCodeController, v15);
    -[PSKeychainSyncSecurityCodeController setShowsAdvancedSettings:](self->_simpleSecurityCodeController, "setShowsAdvancedSettings:", 1);
    v12 = v15;
    if (!v15)
      return;
  }
  v14 = v12;
  -[PSKeychainSyncSecurityCodeController setMode:](v12, "setMode:", 1);
LABEL_11:
  objc_msgSend(v14, "setDelegate:", self);
  if (-[PSKeychainSyncManager isRunningInBuddy](self, "isRunningInBuddy"))
  {
    -[PSKeychainSyncManager showController:](self, "showController:", v14);
  }
  else
  {
    -[PSRootController showController:](self->_settingsSetupController, "showController:", v14);
    -[PSSetupController parentController](self->_settingsSetupController, "parentController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", self->_settingsSetupController, 1, 0);

  }
}

- (NSString)appleIDUsername
{
  return self->_appleIDUsername;
}

- (void)setAppleIDUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)appleIDRawPassword
{
  return self->_appleIDRawPassword;
}

- (void)setAppleIDRawPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)appleIDPasswordOrEquivalentToken
{
  return self->_appleIDPasswordOrEquivalentToken;
}

- (id)completion
{
  return self->_completion;
}

- (id)passwordPromptCompletion
{
  return self->_passwordPromptCompletion;
}

- (void)setPasswordPromptCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)changeSecurityCodeCompletion
{
  return self->_changeSecurityCodeCompletion;
}

- (void)setChangeSecurityCodeCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)resetCompletion
{
  return self->_resetCompletion;
}

- (void)setResetCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)circleJoinCompletion
{
  return self->_circleJoinCompletion;
}

- (void)setCircleJoinCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (UIViewController)resetPromptControllerHost
{
  return self->_resetPromptControllerHost;
}

- (void)setResetPromptControllerHost:(id)a3
{
  objc_storeStrong((id *)&self->_resetPromptControllerHost, a3);
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (PSSetupController)settingsSetupController
{
  return self->_settingsSetupController;
}

- (void)setSettingsSetupController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsSetupController, a3);
}

- (PSRootController)buddyNavigationController
{
  return self->_buddyNavigationController;
}

- (void)setBuddyNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_buddyNavigationController, a3);
}

- (NSString)securityCodeRecoveryAttempt
{
  return self->_securityCodeRecoveryAttempt;
}

- (void)setSecurityCodeRecoveryAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_securityCodeRecoveryAttempt, a3);
}

- (NSString)stagedSecurityCode
{
  return self->_stagedSecurityCode;
}

- (int)stagedSecurityCodeType
{
  return self->_stagedSecurityCodeType;
}

- (BOOL)circleWasReset
{
  return self->_circleWasReset;
}

- (void)setCircleWasReset:(BOOL)a3
{
  self->_circleWasReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedSecurityCode, 0);
  objc_storeStrong((id *)&self->_securityCodeRecoveryAttempt, 0);
  objc_storeStrong((id *)&self->_buddyNavigationController, 0);
  objc_storeStrong((id *)&self->_settingsSetupController, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_resetPromptControllerHost, 0);
  objc_storeStrong(&self->_circleJoinCompletion, 0);
  objc_storeStrong(&self->_resetCompletion, 0);
  objc_storeStrong(&self->_changeSecurityCodeCompletion, 0);
  objc_storeStrong(&self->_passwordPromptCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_appleIDPasswordOrEquivalentToken, 0);
  objc_storeStrong((id *)&self->_appleIDRawPassword, 0);
  objc_storeStrong((id *)&self->_appleIDUsername, 0);
  objc_storeStrong((id *)&self->_joinAfterRecoveryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_credentialExpirationTimer, 0);
  objc_storeStrong((id *)&self->_spinningView, 0);
  objc_storeStrong((id *)&self->_smsValidationController, 0);
  objc_storeStrong((id *)&self->_phoneNumberController, 0);
  objc_storeStrong((id *)&self->_securityCodeRecoveryController, 0);
  objc_storeStrong((id *)&self->_advancedSecurityCodeChoiceController, 0);
  objc_storeStrong((id *)&self->_complexSecurityCodeController, 0);
  objc_storeStrong((id *)&self->_simpleSecurityCodeController, 0);
  objc_storeStrong((id *)&self->_devicePinController, 0);
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3819000, log, OS_LOG_TYPE_DEBUG, "iCDP: Successfully updated local secret after passcode change", v1, 2u);
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "iCDP: Failed to update local secret after passcode change with error %@", (uint8_t *)&v2, 0xCu);
}

@end
