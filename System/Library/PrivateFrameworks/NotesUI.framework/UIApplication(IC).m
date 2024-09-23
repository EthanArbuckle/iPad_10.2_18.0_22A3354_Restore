@implementation UIApplication(IC)

+ (uint64_t)ic_openBluetoothSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", CFSTR("Bluetooth"), 0);
}

+ (uint64_t)ic_openICloudStorageSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", CFSTR("APPLE_ACCOUNT"), CFSTR("ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE"));
}

+ (uint64_t)ic_openNotificationSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", CFSTR("NOTES"), CFSTR("NOTIFICATIONS"));
}

+ (void)ic_openSettings
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0DC47F8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:options:completionHandler:", v0, MEMORY[0x1E0C9AA70], 0);

}

- (uint64_t)ic_hasConnectedHostedWindowScene
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "connectedScenes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_containsObjectPassingTest:", &__block_literal_global_52);

  return v2;
}

+ (void)ic_openSettingsToRoot:()IC path:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=%@"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("&path=%@"), v11);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

  if ((v10 & 1) == 0)
    objc_msgSend(a1, "ic_openSettings");

}

@end
