@implementation REMCloudContainer

+ (BOOL)isSandboxEnvironment
{
  return 0;
}

+ (id)newCloudContainerForAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(a1, "newCloudContainerForAccountID:", v6);
  return v7;
}

+ (id)newCloudContainerForAccountID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  +[REMAppleAccountUtilities sharedInstance](REMAppleAccountUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__REMCloudContainer_newCloudContainerForAccountID___block_invoke;
  v10[3] = &unk_1E67F9518;
  v13 = a1;
  v7 = v4;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v5, "performBlockInPersonaContextForAccountIdentifier:block:", v7, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __51__REMCloudContainer_newCloudContainerForAccountID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 48), "_writeLogCreatingCKContainerWithAccountIdentifier:personaIdentifier:", *(_QWORD *)(a1 + 32), a2);
  v3 = objc_msgSend(*(id *)(a1 + 48), "_newCloudContainerForAccountIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)_newCloudContainerForAccountIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountIdentifier");
  if (objc_msgSend(a1, "isSandboxEnvironment"))
    v5 = 2;
  else
    v5 = 1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.reminders"), v5);
  v7 = objc_alloc_init(MEMORY[0x1E0C94C50]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94B98]), "initWithAccountID:", v4);
  objc_msgSend(v7, "setAccountOverrideInfo:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v6, v7);
  +[REMLog cloudkit](REMLog, "cloudkit");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "Created new CloudKit container {accountIdentifier: %{public}@}", buf, 0xCu);
  }

  objc_msgSend(v9, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.reminders"));
  return v9;
}

+ (void)_writeLogCreatingCKContainerWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[REMAppleAccountUtilities sharedInstance](REMAppleAccountUtilities, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersonaUserPersonaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMLog cloudkit](REMLog, "cloudkit");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 1024;
    v15 = objc_msgSend(v7, "isCurrentPersonaDataSeparated");
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_DEFAULT, "[newCloudContainerForAccountID] Creating CKContainer with {accountIdentifier: %{public}@, account.personaIdentifier: %{public}@, currentPersona.isDataSeparatedPersona: %d, currentPersona.userPersonaUniqueString: %{public}@}", (uint8_t *)&v10, 0x26u);
  }

}

+ (id)newCloudContainerWithPublicCloudDatabase
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  if (objc_msgSend(a1, "isSandboxEnvironment"))
    v2 = 2;
  else
    v2 = 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.reminders.fdb"), v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v3);
  objc_msgSend(v4, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.reminders"));
  +[REMLog cloudkit](REMLog, "cloudkit");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "Created CKContainer with public cloud database", v7, 2u);
  }

  return v4;
}

@end
