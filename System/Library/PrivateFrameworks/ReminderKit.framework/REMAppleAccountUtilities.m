@implementation REMAppleAccountUtilities

+ (id)sharedInstance
{
  NSObject *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__REMAppleAccountUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  if (sharedInstance_sharedInstance)
    return (id)sharedInstance_sharedInstance;
  +[REMLog utility](REMLog, "utility");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    +[REMAppleAccountUtilities sharedInstance].cold.1(v3);

  return (id)sharedInstance_sharedInstance;
}

void __42__REMAppleAccountUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (REMAppleAccountUtilities)init
{
  return (REMAppleAccountUtilities *)-[REMAppleAccountUtilities initForObservingAccountStoreChanges:](self, "initForObservingAccountStoreChanges:", 1);
}

- (id)initForObservingAccountStoreChanges:(BOOL)a3
{
  _BOOL4 v3;
  REMAppleAccountUtilities *v4;
  uint64_t v5;
  ACAccountStore *accountStore;
  void *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAppleAccountUtilities;
  v4 = -[REMAppleAccountUtilities init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = objc_claimAutoreleasedReturnValue();
    accountStore = v4->_accountStore;
    v4->_accountStore = (ACAccountStore *)v5;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_accountStoreDidChange_, *MEMORY[0x1E0C8F010], v4->_accountStore);

    }
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)REMAppleAccountUtilities;
  -[REMAppleAccountUtilities dealloc](&v4, sel_dealloc);
}

- (ACAccount)unsafeUntilSystemReady_primaryICloudACAccount
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[REMAppleAccountUtilities _updateCachedICloudACAccounts](self, "_updateCachedICloudACAccounts");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[REMAppleAccountUtilities accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__REMAppleAccountUtilities_unsafeUntilSystemReady_primaryICloudACAccount__block_invoke;
  v6[3] = &unk_1E67FA0F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (ACAccount *)v4;
}

void __73__REMAppleAccountUtilities_unsafeUntilSystemReady_primaryICloudACAccount__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSArray)unsafeUntilSystemReady_allICloudACAccounts
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[REMAppleAccountUtilities _updateCachedICloudACAccounts](self, "_updateCachedICloudACAccounts");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[REMAppleAccountUtilities accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__REMAppleAccountUtilities_unsafeUntilSystemReady_allICloudACAccounts__block_invoke;
  v6[3] = &unk_1E67F8DA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSArray *)v4;
}

uint64_t __70__REMAppleAccountUtilities_unsafeUntilSystemReady_allICloudACAccounts__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "addObjectsFromArray:");
  return result;
}

- (id)unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[REMAppleAccountUtilities unsafeUntilSystemReady_allICloudACAccounts](self, "unsafeUntilSystemReady_allICloudACAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke;
  v5[3] = &unk_1E67FA120;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if (objc_msgSend(v3, "rem_isEligibleForCloudKitReminders"))
  {
    objc_msgSend(v3, "enabledDataclasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0C8F400]);

    if (v5)
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
      }
      else
      {
        +[REMLog utility](REMLog, "utility");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke_cold_1();

      }
    }
  }

}

- (id)unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  -[REMAppleAccountUtilities unsafeUntilSystemReady_allICloudACAccounts](self, "unsafeUntilSystemReady_allICloudACAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __92__REMAppleAccountUtilities_unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier___block_invoke;
  v14 = &unk_1E67FA148;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);
  v7 = (void *)v18[5];
  if (!v7)
  {
    +[REMLog utility](REMLog, "utility", v11, v12, v13, v14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[REMAppleAccountUtilities unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:].cold.1();

    v7 = (void *)v18[5];
  }
  v9 = v7;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __92__REMAppleAccountUtilities_unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  -[REMAppleAccountUtilities unsafeUntilSystemReady_allICloudACAccounts](self, "unsafeUntilSystemReady_allICloudACAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  v30 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __91__REMAppleAccountUtilities_unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID___block_invoke;
  v22 = &unk_1E67FA148;
  v6 = v4;
  v23 = v6;
  v24 = &v25;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v19);
  if (!v26[5])
  {
    +[REMLog utility](REMLog, "utility", v19, v20, v21, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[REMAppleAccountUtilities unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:].cold.1();

  }
  objc_msgSend((id)v26[5], "dataclassProperties", v19, v20, v21, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend((id)v26[5], "dataclassProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F378]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    REMDynamicCast(v10, (uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_opt_class();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("url"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v14, (uint64_t)v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        v17 = v16;
      else
        v17 = CFSTR("https://p01-caldav.icloud.com:443");

    }
    else
    {
      v17 = CFSTR("https://p01-caldav.icloud.com:443");
    }

  }
  else
  {
    v17 = CFSTR("https://p01-caldav.icloud.com:443");
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __91__REMAppleAccountUtilities_unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)unsafeUntilSystemReady_displayedHostnameOfICloudACAccountWithAccountIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMAppleAccountUtilities unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:](self, "unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_regionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedHostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 toACAccount:(id)a5 inStore:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v9 = a4;
  v10 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  +[REMLog utility](REMLog, "utility");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v30 = v10;
    v31 = 1024;
    v32 = v9;
    v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEBUG, "Trying to set didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%@)", buf, 0x18u);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remindersIsUsingCloudKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remindersDidFinishMigrationToCloudKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "BOOLValue");
  v18 = objc_msgSend(v16, "BOOLValue");
  if (!v15 || !v16 || v17 != v10 || v18 != v9)
  {
    +[REMLog utility](REMLog, "utility");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v30 = v10;
      v31 = 1024;
      v32 = v9;
      v33 = 2112;
      v34 = v23;
      _os_log_debug_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_DEBUG, "Actually setting didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%@)", buf, 0x18u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("remindersIsUsingCloudKit"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("remindersDidFinishMigrationToCloudKit"));

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke;
    v24[3] = &unk_1E67FA170;
    v27 = v10;
    v28 = v9;
    v25 = v11;
    v26 = v13;
    objc_msgSend(v12, "saveAccount:withCompletionHandler:", v25, v24);

  }
  else if (v13)
  {
    (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);
  }

}

void __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[REMLog utility](REMLog, "utility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(unsigned __int8 *)(a1 + 48);
    v9 = *(unsigned __int8 *)(a1 + 49);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109634;
    v12[1] = v8;
    v13 = 1024;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "Saved didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%{public}@)", (uint8_t *)v12, 0x18u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

+ (id)accountDescriptionWithACAccount:(id)a3
{
  return (id)objc_msgSend(a3, "accountDescription");
}

- (id)accessQueue
{
  if (accessQueue_onceToken != -1)
    dispatch_once(&accessQueue_onceToken, &__block_literal_global_26);
  return (id)accessQueue_accessQueue;
}

void __39__REMAppleAccountUtilities_accessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.reminders.apple-account-utilities", v2);
  v1 = (void *)accessQueue_accessQueue;
  accessQueue_accessQueue = (uint64_t)v0;

}

- (void)_updateCachedICloudACAccounts
{
  NSObject *v3;
  _QWORD block[5];

  -[REMAppleAccountUtilities accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke;
  block[3] = &unk_1E67F8A58;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *context;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "cachedICloudACAccountsAreValid") & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1B5E3DEC4]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_debug_primaryICloudACAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_storeStrong(v4 + 2, v3);
      objc_msgSend(v2, "addObject:", v3);
    }
    else
    {
      objc_msgSend(v4, "accountStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aa_primaryAppleAccount");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = v6;

    }
    objc_msgSend(*(id *)(a1 + 32), "_debug_fullICloudACAccount");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v2, "addObject:", v9);
    if (!objc_msgSend(v2, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "accountStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "aa_appleAccounts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObjectsFromArray:", v11);

    }
    if ((unint64_t)objc_msgSend(v2, "count") >= 4
      && +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall"))
    {
      +[REMLog utility](REMLog, "utility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke_cold_1(v2, v12);

    }
    v31 = (void *)v9;
    v32 = v3;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v2);
    v33 = a1;
    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v31, v3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v2;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v46;
      v14 = *MEMORY[0x1E0C8F400];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v46 != v36)
            objc_enumerationMutation(obj);
          v40 = v15;
          v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
          context = (void *)MEMORY[0x1B5E3DEC4]();
          objc_msgSend(v16, "displayAccount");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v38 = v17;
          objc_msgSend(v17, "childAccounts");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v42 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_msgSend(v23, "enabledDataclasses", v31);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "containsObject:", v14);

                if (v25)
                {
                  objc_msgSend(v16, "identifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "identifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v27);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v20);
          }

          objc_autoreleasePoolPop(context);
          v15 = v40 + 1;
        }
        while (v40 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v37);
    }

    v28 = *(_QWORD *)(v33 + 32);
    v29 = *(void **)(v28 + 32);
    *(_QWORD *)(v28 + 32) = v13;
    v30 = v13;

    objc_msgSend(*(id *)(v33 + 32), "setCachedICloudACAccountsAreValid:", 1);
    objc_autoreleasePoolPop(v34);
  }
}

- (void)_invalidateCachedICloudACAccounts
{
  NSObject *v3;
  _QWORD block[5];

  -[REMAppleAccountUtilities accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__REMAppleAccountUtilities__invalidateCachedICloudACAccounts__block_invoke;
  block[3] = &unk_1E67F8A58;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __61__REMAppleAccountUtilities__invalidateCachedICloudACAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "setCachedICloudACAccountsAreValid:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

}

- (id)_cachedDisplayICloudACAccountWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[REMAppleAccountUtilities accessQueue](self, "accessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke;
    block[3] = &unk_1E67F92E8;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);
    objc_msgSend((id)v12[5], "displayAccount");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (id)v12[5];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "cachedICloudACAccountsAreValid") & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = v2;
    -[NSObject identifier](v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v5)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if (v14)
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_17:

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          obj = v7;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                objc_msgSend(v20, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqualToString:", v15);

                if (v22)
                {
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v20);
                  goto LABEL_29;
                }
              }
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_29:

        }
      }

    }
  }
  else
  {
    +[REMLog utility](REMLog, "utility");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke_cold_1(a1, v3);
  }

}

- (NSMutableDictionary)unsafeUntilSystemReady_parentICloudACAccountIdentifierMap
{
  return self->_unsafeUntilSystemReady_parentICloudACAccountIdentifierMap;
}

- (void)setUnsafeUntilSystemReady_parentICloudACAccountIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_parentICloudACAccountIdentifierMap, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (BOOL)cachedICloudACAccountsAreValid
{
  return self->_cachedICloudACAccountsAreValid;
}

- (void)setCachedICloudACAccountsAreValid:(BOOL)a3
{
  self->_cachedICloudACAccountsAreValid = a3;
}

- (ACAccount)_debug_primaryICloudACAccount
{
  return self->__debug_primaryICloudACAccount;
}

- (void)set_debug_primaryICloudACAccount:(id)a3
{
  objc_storeStrong((id *)&self->__debug_primaryICloudACAccount, a3);
}

- (ACAccount)_debug_fullICloudACAccount
{
  return self->__debug_fullICloudACAccount;
}

- (void)set_debug_fullICloudACAccount:(id)a3
{
  objc_storeStrong((id *)&self->__debug_fullICloudACAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debug_fullICloudACAccount, 0);
  objc_storeStrong((id *)&self->__debug_primaryICloudACAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_parentICloudACAccountIdentifierMap, 0);
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_allICloudACAccounts, 0);
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_primaryICloudACAccount, 0);
}

- (void)performBlockInPersonaContextForAccountIdentifier:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE buf[24];
  void *v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  -[REMAppleAccountUtilities _cachedDisplayICloudACAccountWithIdentifier:](self, "_cachedDisplayICloudACAccountWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "accountPropertyForKey:", *MEMORY[0x1E0C8EFC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentPersona");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMLog utility](REMLog, "utility");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v42 = v15;
    LOWORD(v43[0]) = 2112;
    *(_QWORD *)((char *)v43 + 2) = v16;
    _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Looked up account persona {personaIdentifier: %{public}@, accountIdentifier: %{public}@, displayAccountIdentifier: %{public}@, desc: %@}", buf, 0x2Au);

  }
  if (objc_msgSend(v11, "length") || !v11)
  {
    +[REMLog utility](REMLog, "utility");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Adopting persona {personaIdentifier: %{public}@, accountIdentifier: %{public}@}", buf, 0x16u);
    }

    v36 = 0;
    v24 = (void *)objc_msgSend(v13, "copyCurrentPersonaContextWithError:", &v36);
    v25 = v36;
    if (v25)
    {
      +[REMLog utility](REMLog, "utility");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[REMAppleAccountUtilities(DataSeparation) performBlockInPersonaContextForAccountIdentifier:block:].cold.1();

      v7[2](v7, v11, v25);
    }
    else
    {
      v27 = (id)objc_msgSend(v13, "generateAndRestorePersonaContextWithPersonaUniqueString:", v11);
      v7[2](v7, v11, 0);
      v28 = (id)objc_msgSend(v13, "restorePersonaWithSavedPersonaContext:", v24);
    }

  }
  else
  {
    v17 = objc_msgSend(v13, "isProxy");
    +[REMLog utility](REMLog, "utility");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Adopting personal persona (isProxy) {accountIdentifier: %{public}@}", buf, 0xCu);
      }

      v35 = 0;
      v20 = (void *)objc_msgSend(v13, "copyCurrentPersonaContextWithError:", &v35);
      v21 = v35;
      if (v21)
      {
        +[REMLog utility](REMLog, "utility");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[REMAppleAccountUtilities(DataSeparation) performBlockInPersonaContextForAccountIdentifier:block:].cold.1();

        v7[2](v7, v11, v21);
      }
      else
      {
        v37 = 0;
        v38 = &v37;
        v39 = 0x2050000000;
        v29 = (void *)getUMUserPersonaAttributesClass_softClass;
        v40 = getUMUserPersonaAttributesClass_softClass;
        if (!getUMUserPersonaAttributesClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getUMUserPersonaAttributesClass_block_invoke;
          v42 = &unk_1E67FA198;
          v43[0] = &v37;
          __getUMUserPersonaAttributesClass_block_invoke((uint64_t)buf);
          v29 = (void *)v38[3];
        }
        v30 = objc_retainAutorelease(v29);
        _Block_object_dispose(&v37, 8);
        objc_msgSend(v30, "personaAttributesForPersonaType:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "userPersonaUniqueString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v13, "generateAndRestorePersonaContextWithPersonaUniqueString:", v32);

        v7[2](v7, v11, 0);
        v34 = (id)objc_msgSend(v13, "restorePersonaWithSavedPersonaContext:", v20);

      }
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Using default persona {accountIdentifier: %{public}@}", buf, 0xCu);
      }

      v7[2](v7, 0, 0);
    }
  }

}

- (BOOL)isCurrentPersonaDataSeparated
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDataSeparatedPersona");

  return v4;
}

- (id)currentPersonaUserPersonaUniqueString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userPersonaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)sharedInstance
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!sharedInstance) -- Failed to create REMAppleAccountUtilities shared instance", v1, 2u);
}

void __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts encounters an iCloud ACAccount with nil identifier, skipped {account: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier can't find a matching ACAccount with {accountIdentifier: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID failed to match ACAccount with {accountID: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error saving migration state to ACAccount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "REMAppleAccountUtilities found more than 3 AAAccount, revisit this for performance {count: %ld}", v3, 0xCu);
}

void __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Querying -_cachedDisplayICloudACAccountWithIdentifier: when the internal cache is invalid {identifier: %{public}@, callstack: %{public}@}", (uint8_t *)&v5, 0x16u);

}

@end
