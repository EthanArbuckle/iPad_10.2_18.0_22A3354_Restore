@implementation ICQUIDataclassHelper

+ (id)dataclassesToEnableForAccount:(id)a3 excludedApps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  char v16;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "provisionedDataclasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isEnabledForDataclass:", v14, v18) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "canAutoEnableDataclass:forAccount:", v14, v5) & 1) != 0)
          {

          }
          else
          {
            v16 = objc_msgSend(a1, "_isPhotosDataclass:", v14);

            if ((v16 & 1) == 0)
              continue;
          }
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
            objc_msgSend(v18, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v18;
}

+ (id)enabledAppsForAccount:(id)a3 deprioritizedApps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  v6 = a4;
  if (enabledAppsForAccount_deprioritizedApps__onceToken != -1)
    dispatch_once(&enabledAppsForAccount_deprioritizedApps__onceToken, &__block_literal_global_18);
  v7 = (void *)enabledAppsForAccount_deprioritizedApps__settingsApps;
  v8 = MEMORY[0x24BDAC760];
  v9 = (void *)MEMORY[0x24BDD1758];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_2;
  v18[3] = &unk_24E3F53B8;
  v19 = v5;
  v10 = v5;
  objc_msgSend(v9, "predicateWithBlock:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_3;
  v16[3] = &unk_24E3F3E38;
  v17 = v6;
  v14 = v6;
  objc_msgSend(v13, "sortUsingComparator:", v16);

  return v13;
}

void __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB3EC8];
  v10[0] = *MEMORY[0x24BDB3DE0];
  v10[1] = v0;
  v1 = *MEMORY[0x24BDB3E68];
  v10[2] = *MEMORY[0x24BDB3E38];
  v10[3] = v1;
  v2 = *MEMORY[0x24BDB3E18];
  v11 = *MEMORY[0x24BDB3E48];
  v12 = v2;
  v3 = *MEMORY[0x24BDB3DE8];
  v13 = *MEMORY[0x24BDB3DD8];
  v14 = v3;
  v15 = *MEMORY[0x24BDB3E88];
  v16 = v11;
  v4 = *MEMORY[0x24BDB3E60];
  v17 = *MEMORY[0x24BDB3DB0];
  v18 = v4;
  v5 = *MEMORY[0x24BDB3E20];
  v19 = *MEMORY[0x24BDB3EC0];
  v20 = v5;
  v6 = *MEMORY[0x24BDB3EB0];
  v21 = *MEMORY[0x24BDB3E08];
  v22 = v6;
  v7 = *MEMORY[0x24BDB3E10];
  v23 = *MEMORY[0x24BDB3EB8];
  v24 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 18);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)enabledAppsForAccount_deprioritizedApps__settingsApps;
  enabledAppsForAccount_deprioritizedApps__settingsApps = v8;

}

uint64_t __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEnabledForDataclass:", a2);
}

uint64_t __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  int v7;
  unsigned int v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "containsObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);

  if (v7 ^ 1 | v8)
    return (uint64_t)((unint64_t)((v7 ^ 1) & v8) << 63) >> 63;
  else
    return 1;
}

+ (id)unsyncedDataclassesExcludingPhotosForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDB3DE0];
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataclassesToEnableForAccount:excludedApps:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localizedTextForDataclass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3DE0]))
  {
    v4 = (id)*MEMORY[0x24BDB3E40];

  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3DA8]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ICLOUD_BACKUP"), &stru_24E400750, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v6;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3E38]))
  {
    v10 = (void *)MEMORY[0x24BE00EF8];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v5, 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/PreferenceBundles/AccountSettings/AppleAccountSettings.bundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleWithPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ICLOUD_MAIL_LABEL"), &stru_24E400750, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

+ (id)iconForDataclass:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3DE0]))
  {
    v4 = (id)*MEMORY[0x24BDB3E40];

  }
  objc_msgSend(MEMORY[0x24BE75590], "acui_iconForDataclass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)footerTextForSyncWithiCloudSpecifiersFromDataclasses:(id)a3 forAccount:(id)a4
{
  id v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SYNC_WITH_ICLOUD_TWO_APPS_DISABLED"), &stru_24E400750, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    objc_msgSend(v11, "stringWithFormat:", v13, v7, v10, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "count") != 3)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 4)
    {
      v22 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v4, "count") - 2;
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SYNC_WITH_ICLOUD_MORE_THAN_THREE_APPS_DISABLED"), &stru_24E400750, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    goto LABEL_7;
  }
  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SYNC_WITH_ICLOUD_THREE_APPS_DISABLED"), &stru_24E400750, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v21, v7, v10, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_9:

  return v22;
}

+ (void)enableDataclass:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isEnabledForDataclass:", v7))
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[ICQUIDataclassHelper enableDataclass:forAccount:completion:].cold.1((uint64_t)v7, v10);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke;
    block[3] = &unk_24E3F3BD0;
    v11 = &v21;
    v21 = v9;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    objc_msgSend(v8, "setEnabled:forDataclass:", 1, *MEMORY[0x24BDB3E48]);
    objc_msgSend(v8, "accountStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2;
    v16[3] = &unk_24E3F53E0;
    v11 = &v17;
    v17 = v7;
    v14 = v8;
    v18 = v14;
    v19 = v9;
    v15 = v9;
    objc_msgSend(v13, "saveAccount:withCompletionHandler:", v14, v16);

  }
}

uint64_t __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2_cold_1(a1, (uint64_t)v5, v6);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_48;
  block[3] = &unk_24E3F3B90;
  v7 = *(id *)(a1 + 48);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (BOOL)isBackupEnabledForAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEC7350];
  v4 = (void *)MEMORY[0x24BDB4398];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isBackupEnabledForAccount:accountStore:", v5, v6);

  return (char)v3;
}

+ (BOOL)isiCPLEnabledForAccount:(id)a3
{
  return objc_msgSend(MEMORY[0x24BEC7350], "isICPLEnabledForAccount:", a3);
}

+ (BOOL)isSharedPhotoLibraryEnabled
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDE35F0], "systemPhotoLibraryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE35F0]), "initWithPhotoLibraryURL:", v2);
  v4 = objc_alloc_init(MEMORY[0x24BDE3570]);
  objc_msgSend(v4, "setPhotoLibrary:", v3);
  objc_msgSend(MEMORY[0x24BDE35A0], "fetchActiveLibraryScopeWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (BOOL)_isPhotosDataclass:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB3DE0]);
}

+ (void)enableDataclass:(uint64_t)a1 forAccount:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "Dataclass %@ enabled already. Bailing.", (uint8_t *)&v2, 0xCu);
}

void __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Unable to enable dataclass %@ for account %@. Error: %@", (uint8_t *)&v5, 0x20u);
}

@end
