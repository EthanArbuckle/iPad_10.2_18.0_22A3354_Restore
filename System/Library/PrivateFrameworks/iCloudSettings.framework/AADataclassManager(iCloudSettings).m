@implementation AADataclassManager(iCloudSettings)

- (uint64_t)_isHiddenDataclass:()iCloudSettings
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = _isHiddenDataclass__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isHiddenDataclass__onceToken, &__block_literal_global_1);
  v5 = objc_msgSend((id)_isHiddenDataclass__dataclassesToHide, "containsObject:", v4);

  return v5;
}

- (uint64_t)shouldShowDataclass:()iCloudSettings forAccount:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE04948], "sharedManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:", v6, v7),
        v8,
        (v9 & 1) != 0)
    || (objc_msgSend(a1, "_isHiddenDataclass:", v6) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3EA8])
    && (objc_msgSend(v7, "isProvisionedForDataclass:", *MEMORY[0x24BDB3E40]) & 1) != 0
    || (objc_msgSend(a1, "isAppRestrictedOnThisDevice:", v6) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "isProvisionedForDataclass:", v6);
  }

  return v10;
}

- (uint64_t)appIsNeitherInstalledOrPlaceholder:()iCloudSettings
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BE04948];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appBundleIdentifierForDataclass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInstalled") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "appState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isPlaceholder") ^ 1;

  }
  return v9;
}

- (uint64_t)isAppRestrictedOnThisDevice:()iCloudSettings
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3E18]);

  return 0;
}

@end
