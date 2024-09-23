@implementation ICSAccountSaveErrorHandler

- (ICSAccountSaveErrorHandler)initWithPresenter:(id)a3
{
  id v4;
  ICSAccountSaveErrorHandler *v5;
  ICSAccountSaveErrorHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSAccountSaveErrorHandler;
  v5 = -[ICSAccountSaveErrorHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presenter, v4);

  return v6;
}

- (void)handleAccountSaveError:(id)a3 forAccount:(id)a4 failedDataclasses:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE04810]);

  if (v12)
  {
    v13 = objc_msgSend(v8, "code");
    switch(v13)
    {
      case 2:
        LogSubsystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);

        -[ICSAccountSaveErrorHandler _handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:](self, "_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:", v10);
        break;
      case 1:
        LogSubsystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

        objc_msgSend(v8, "localizedRecoverySuggestion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSAccountSaveErrorHandler _handleManateeErrorForAccount:withDescription:failedDataclasses:](self, "_handleManateeErrorForAccount:withDescription:failedDataclasses:", v9, v22, v10);
        goto LABEL_14;
      case 0:
        LogSubsystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

        objc_msgSend(v8, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSAccountSaveErrorHandler _handleInsufficientStorageWithUserInfo:](self, "_handleInsufficientStorageWithUserInfo:", v22);
LABEL_14:

        break;
      default:
        LogSubsystem();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:].cold.1((uint64_t)v8, v39, v40, v41, v42, v43, v44, v45);

        break;
    }
  }
  objc_msgSend(v9, "reload");

}

- (void)_handleInsufficientStorageWithUserInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICSAccountSaveErrorHandler *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke;
  v6[3] = &unk_251C61060;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  ICSCloudStorageOffersManager *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = objc_alloc_init(ICSCloudStorageOffersManager);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE04818]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)v8[5];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke_27;
  v6[3] = &unk_251C61328;
  v6[4] = &v7;
  objc_msgSend(v3, "presentCloudStorageOffersPageFromNavigationController:requiredStorageThreshold:completionHandler:", v5, v2, v6);

  _Block_object_dispose(&v7, 8);
}

void __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_handleManateeErrorForAccount:(id)a3 withDescription:(id)a4 failedDataclasses:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICSAccountSaveErrorHandler *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__ICSAccountSaveErrorHandler__handleManateeErrorForAccount_withDescription_failedDataclasses___block_invoke;
  block[3] = &unk_251C61350;
  v12 = v8;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __94__ICSAccountSaveErrorHandler__handleManateeErrorForAccount_withDescription_failedDataclasses___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v2;
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v2 = (uint64_t)v8;
    if ((isKindOfClass & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v5, "specifierForID:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v7, "startSpinnerInSpecifier:", v6);

      v2 = (uint64_t)v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_beginManateeUpgradeForAccount:failedDataclassName:", *(_QWORD *)(a1 + 48), v2);

}

- (void)_beginManateeUpgradeForAccount:(id)a3 failedDataclassName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BE1AA20]);
  objc_msgSend(v6, "aa_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAltDSID:", v9);

  objc_msgSend(v10, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
  objc_msgSend(v10, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB3E48]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UPGRADE_ACCOUNT_SECURITY_FEATURE_MESSAGES"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFeatureName:", v12);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(v10, "setPresentingViewController:", WeakRetained);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v10);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke;
  v17[3] = &unk_251C613A0;
  v17[4] = self;
  v18 = v7;
  v19 = v6;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v14, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v17);

}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  char isKindOfClass;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v8, "stopSpinnerInActiveSpecifier");

  }
  if ((a2 & 1) == 0)
  {
    LogSubsystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_cold_1((uint64_t)v5, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(v5, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE1A368]))
      v22 = objc_msgSend(v5, "code") == 5900;
    else
      v22 = 0;

    if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild") && objc_msgSend(v5, "code") != -5307)
    {
      v23 = objc_msgSend(v5, "code") != -5308 || v22;
      if ((v23 & 1) == 0)
        goto LABEL_25;
    }
    else if (!v22)
    {
      goto LABEL_25;
    }
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
    {
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("HSA2_UPGRADE_FAILURE_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 40), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v28, v30, v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("HSA2_UPGRADE_FAILURE_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 40), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v34, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("HSA2_UPGRADE_FAILURE_MESSAGE_NO_FEATURE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v38, v39);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("HSA2_UPGRADE_FAILURE_TITLE_NO_FEATURE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v41 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_53;
    v45[3] = &unk_251C61378;
    v45[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_displayAccountSaveErrorAlertWithTitle:message:alternativeAction:", v37, v9, v44);
    goto LABEL_24;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(v9, "reload");
    objc_msgSend(v9, "setEnabled:forDataclass:", 1, *(_QWORD *)(a1 + 40));
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v12, "accountOperationsHelper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "saveAccount:requireVerification:", v9, 0);

    }
LABEL_24:

  }
LABEL_25:

}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_53()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HSA2_UPGRADE_FAILURE_ARTICLE_PATH"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withCompletionHandler:", v3, 0);

}

- (void)_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "count");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v15, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE_NO_FEATURE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSAccountSaveErrorHandler _displayAccountSaveErrorAlertWithTitle:message:alternativeAction:](self, "_displayAccountSaveErrorAlertWithTitle:message:alternativeAction:", v14, v12, 0);

}

- (void)_displayAccountSaveErrorAlertWithTitle:(id)a3 message:(id)a4 alternativeAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICSAccountSaveErrorHandler *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke;
  v14[3] = &unk_251C613C8;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  _QWORD v17[4];
  id v18;

  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_SAVE_ERROR_INTERNAL_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TAP_TO_RADAR_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke_2;
    v17[3] = &unk_251C61378;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = (id)v6;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:", *(_QWORD *)(a1 + 48), v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  if (v10)
    objc_msgSend(v11, "addAction:", v10);
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v11, "addAction:");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke_2(uint64_t a1)
{
  return +[ICSRadarHelper tapToRadarWithTitle:initialMessage:](ICSRadarHelper, "tapToRadarWithTitle:initialMessage:", *(_QWORD *)(a1 + 32), CFSTR("Error saving account"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Failed to handle error: %@", a5, a6, a7, a8, 2u);
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24B4C1000, a1, a3, "Handling insufficient storage.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24B4C1000, a1, a3, "Handling Manatee repair", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24B4C1000, a1, a3, "Account is on max tier and doesn't have enough storage", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Failed to repair device to device encryption state, error: %@", a5, a6, a7, a8, 2u);
}

@end
