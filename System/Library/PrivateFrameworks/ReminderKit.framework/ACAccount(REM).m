@implementation ACAccount(REM)

- (uint64_t)rem_didChooseToMigrate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("remindersIsUsingCloudKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)rem_didFinishMigration
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("remindersDidFinishMigrationToCloudKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)rem_isManagedAppleID
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (!v4)
    return 0;
  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateMAIDAccount");

  if ((v6 & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "aa_isManagedAppleID");
}

- (uint64_t)rem_isPrimaryAppleAccount
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v4)
    return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
  else
    return 0;
}

- (uint64_t)rem_eligibleForAutoCloudKitMigration
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  SEL v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v4)
  {
    +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "forceEligibleForAutoCloudKitMigration");

    v7 = NSSelectorFromString(CFSTR("aa_isRemindersAutoMigratableToCK"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = ((uint64_t (*)(void *, SEL))objc_msgSend(a1, "methodForSelector:", v7))(a1, v7);
    else
      v8 = 0;
    +[REMLog account](REMLog, "account");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v13;
      v16 = 1024;
      v17 = v8;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_DEFAULT, "rem_eligibleForAutoCloudKitMigration: {identifier: %{public}@, aa_isRemindersAutoMigratableToCK: %d, forceEligibleForAutoCloudKitMigration: %d}", (uint8_t *)&v14, 0x18u);

    }
    return v6 | v8;
  }
  else
  {
    +[REMLog account](REMLog, "account");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_DEFAULT, "rem_eligibleForAutoCloudKitMigration: Not an AppleAccount {identifier: %{public}@}", (uint8_t *)&v14, 0xCu);

    }
    return 0;
  }
}

- (uint64_t)rem_isEligibleForCloudKitReminders
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t result;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (!v4)
    return 0;
  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceBasicAAAccountEligibleForCloudKitReminders");

  if (v6 && objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAD8]))
  {
    +[REMLog account](REMLog, "account");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "rem_isEligibleForCloudKitReminders: AAAccount is .basic but forceBasicAAAccountEligibleForCloudKitReminders is turned on, returning YES {identifier: %{public}@}", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    result = objc_msgSend(a1, "isProvisionedForDataclass:", *MEMORY[0x1E0C8EF28]);
    if (!(_DWORD)result)
      return result;
    if ((objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]) & 1) == 0)
      return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE0]);
  }
  return 1;
}

@end
