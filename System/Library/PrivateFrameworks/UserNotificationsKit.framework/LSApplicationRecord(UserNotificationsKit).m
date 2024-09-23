@implementation LSApplicationRecord(UserNotificationsKit)

- (uint64_t)unkit_isEligibleToDeliverNotifications
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "isLaunchProhibited");
  objc_msgSend(a1, "applicationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isInstalled") || v2)
    v4 = objc_msgSend(a1, "unkit_isWebAppPlaceholder");
  else
    v4 = 1;

  return v4;
}

+ (void)unkit_enumerateApplicationRecordsEligibleToDeliverNotifications:()UserNotificationsKit
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_unkit_enumerateRecordsWithOptions:block:", 0, v4);
  objc_msgSend(a1, "_unkit_enumerateRecordsWithOptions:block:", 64, v4);

}

+ (id)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v5)
  {
    v10 = (void *)NCUILogUtilities;
    if (os_log_type_enabled((os_log_t)NCUILogUtilities, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(UserNotificationsKit) unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:].cold.2((uint64_t)v3, (uint64_t)v7, v10);
  }
  else if ((objc_msgSend(v9, "unkit_isEligibleToDeliverNotifications") & 1) == 0)
  {
    v11 = NCUILogUtilities;
    if (os_log_type_enabled((os_log_t)NCUILogUtilities, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(UserNotificationsKit) unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:].cold.1((uint64_t)v3, v11);

    v9 = 0;
  }

  return v9;
}

+ (void)_unkit_enumerateRecordsWithOptions:()UserNotificationsKit block:
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilter:", &__block_literal_global_2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (void)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2149F4000, a2, OS_LOG_TYPE_ERROR, "Application record for bundle-id '%{public}@' is ineligible to deliver notifications.", (uint8_t *)&v2, 0xCu);
}

+ (void)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit .cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2 != 0;
  v5 = a3;
  MEMORY[0x2199D96A8](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_2149F4000, v5, OS_LOG_TYPE_ERROR, "Error looking up application record for bundle-id '%{public}@'. Bundle record exists: '%{public}@'", (uint8_t *)&v7, 0x16u);

}

@end
