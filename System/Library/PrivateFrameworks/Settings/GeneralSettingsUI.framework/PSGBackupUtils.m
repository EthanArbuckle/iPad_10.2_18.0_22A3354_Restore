@implementation PSGBackupUtils

+ (void)configureAlertMessageOfType:(unint64_t)a3 AndTitleForBackUpDisabledApps:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, void *, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, uint64_t, void *, void *))a5;
  if (objc_msgSend(v11, "backupDisabledAppCount") || objc_msgSend(v11, "includePhoto"))
  {
    objc_msgSend(a1, "alertTitleForBackupDisabledAppsInfo:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "alertBodyForBackupDisabledAppsInfo:ofType:", v11, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 1, v9, v10);

  }
  else
  {
    v8[2](v8, 0, 0, 0);
  }

}

+ (BOOL)shouldIgnoreBundleId:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.youtube"));
}

+ (id)alertBodyForBackupDisabledAppsInfo:(id)a3 ofType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = objc_msgSend(v5, "backupDisabledAppCount");
  v7 = CFSTR("_ERASE");
  if (!a4)
    v7 = CFSTR("_BACKUP");
  v8 = v7;
  objc_msgSend(v5, "backupDisabledAppsForDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "includePhoto");

  if (!v10)
  {
    if (v6 != 2)
    {
      v11 = v6 - 1;
      if (v6 != 1)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        v20 = CFSTR("TWO_MORE_APPS_BACK_UP_DISABLED_MESSAGE");
LABEL_18:
        -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PSG_LocalizedStringForBackupAlert(v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v22 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v22;
        v24 = v11;
        v25 = v11;
        goto LABEL_19;
      }
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(CFSTR("SINGAL_APP_BACK_UP_DISABLED_MESSAGE"), "stringByAppendingString:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForBackupAlert(v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v21 = (void *)v17;
      objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    v18 = CFSTR("TWO_APPS_BACK_UP_DISABLED_MESSAGE");
LABEL_14:
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForBackupAlert(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v6 == 2)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v18 = CFSTR("PHOTO_AND_TWO_APPS_BACK_UP_DISABLED_MESSAGE");
    goto LABEL_14;
  }
  v11 = v6 - 1;
  if (v6 == 1)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(CFSTR("PHOTO_AND_ONE_APP_BACK_UP_DISABLED_MESSAGE"), "stringByAppendingString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_LocalizedStringForBackupAlert(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v22;
LABEL_19:
    objc_msgSend(v19, "localizedStringWithFormat:", v15, v22, v24, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v6)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = CFSTR("PHOTO_AND_MORE_THAN_TWO_APPS_BACK_UP_DISABLED_MESSAGE");
    goto LABEL_18;
  }
  objc_msgSend(CFSTR("PHOTO_BACK_UP_DISABLED_ONLY_MESSAGE"), "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForBackupAlert(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v13;
}

+ (id)alertTitleForBackupDisabledAppsInfo:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "includePhoto"))
  {
    v4 = objc_msgSend(v3, "backupDisabledAppCount");
    if (v4 > 2)
      v5 = CFSTR("PHOTO_AND_OTHER_APPS_BACK_UP_DISABLED_TITLE");
    else
      v5 = off_24F9C8838[v4];
  }
  else
  {
    v5 = CFSTR("APP_BACK_UP_DISABLED_TITLE");
  }
  PSG_LocalizedStringForBackupAlert(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)fetchBackupDisabledAppsWithBackupManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (v6)
  {
    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke;
    v10[3] = &unk_24F9C87F8;
    v11 = v6;
    v14 = a1;
    v12 = v8;
    v13 = v7;
    dispatch_async(v9, v10);

  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }

}

void __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "disabledDomainInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = a1[7];
        objc_msgSend(v10, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v11, "shouldIgnoreBundleId:", v12);

        if ((v11 & 1) == 0)
        {
          if (objc_msgSend(v10, "isCameraRollDomain"))
          {
            v6 |= objc_msgSend(a1[7], "isiCloudPhotosEnabled") ^ 1;
          }
          else if (v7 > 1 || (objc_msgSend(a1[7], "isDomainNameIgnored:", v10) & 1) != 0)
          {
            v7 += objc_msgSend(a1[7], "hasValidDisplayNameOfDomain:", v10);
          }
          else
          {
            objc_msgSend(a1[7], "displayNameForDomainInfo:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v17, "addObject:", v13);
              ++v7;
            }

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    v7 = 0;
  }

  objc_msgSend(a1[5], "setBackupDisabledAppCount:", v7);
  objc_msgSend(a1[5], "setBackupDisabledAppsForDisplay:", v17);
  objc_msgSend(a1[5], "setIncludePhoto:", v6 & 1);
  _PSGLoggingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 1024;
    v28 = v7;
    _os_log_impl(&dword_22E024000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Backup disabled app count: %d", buf, 0x12u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke_43;
  block[3] = &unk_24F9C87D0;
  v20 = a1[6];
  v19 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)displayNameForDomainInfo:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = a3;
  if (objc_msgSend(v4, "isCameraRollDomain"))
  {
    v5 = CFSTR("PHOTO_LIBRARY");
LABEL_7:
    PSG_LocalizedStringForBackupInfo(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v4, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("KeyboardDomain"));

  if (v7)
  {
    v5 = CFSTR("CJ_KEYBOARD_DATA");
    goto LABEL_7;
  }
  objc_msgSend(v4, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HealthDomain"));

  if (v9)
  {
    NSLog(CFSTR("Found health domain"));
    v5 = CFSTR("HEALTH_DATA");
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isAppDomain") & 1) != 0 || objc_msgSend(a1, "isDomainWhitelisted:", v4))
  {
    objc_msgSend(v4, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13
      && (objc_msgSend(v13, "appState"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isInstalled"),
          v15,
          v16))
    {
      objc_msgSend(v14, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

+ (BOOL)hasValidDisplayNameOfDomain:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BooksDomain")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "domainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AppDomain-com.apple.Health"));

    if ((v8 & 1) != 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "isCameraRollDomain") & 1) != 0)
    {
      v6 = 1;
      goto LABEL_8;
    }
    objc_msgSend(v4, "domainName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("KeyboardDomain")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "domainName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HealthDomain")) & 1) != 0
        || (objc_msgSend(v4, "isAppDomain") & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v6 = objc_msgSend(a1, "isDomainWhitelisted:", v4);
      }

    }
  }

LABEL_8:
  return v6;
}

+ (BOOL)isiCloudPhotosEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Media/PhotoData/CPL/initialsync_marker"));

  return v3;
}

+ (id)bundleIdForDomainInfo:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isCameraRollDomain") & 1) != 0)
  {
    v5 = CFSTR("com.apple.camera");
  }
  else
  {
    objc_msgSend(v4, "domainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("KeyboardDomain"));

    if ((v7 & 1) != 0)
    {
      v5 = CFSTR("com.apple.keyboard");
    }
    else
    {
      objc_msgSend(v4, "domainName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HealthDomain"));

      if (v9)
      {
        NSLog(CFSTR("Found health domain"));
        v5 = CFSTR("com.apple.Health");
      }
      else if ((objc_msgSend(v4, "isAppDomain") & 1) != 0 || objc_msgSend(a1, "isDomainWhitelisted:", v4))
      {
        objc_msgSend(v4, "bundleID");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

+ (BOOL)isDomainWhitelisted:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = isDomainWhitelisted__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isDomainWhitelisted__onceToken, &__block_literal_global_6);
  v5 = (void *)isDomainWhitelisted__whitelist;
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __38__PSGBackupUtils_isDomainWhitelisted___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE758C8];
  v4[0] = *MEMORY[0x24BE758D0];
  v4[1] = v0;
  v1 = *MEMORY[0x24BE758C0];
  v4[2] = *MEMORY[0x24BE758B8];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isDomainWhitelisted__whitelist;
  isDomainWhitelisted__whitelist = v2;

}

+ (BOOL)isDomainNameIgnored:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domainName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BooksDomain")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AppDomain-com.apple.Health"));

  return v4;
}

@end
