@implementation STUILog

+ (NSDictionary)logCategories
{
  if (logCategories_onceToken != -1)
    dispatch_once(&logCategories_onceToken, &__block_literal_global_20);
  return (NSDictionary *)(id)logCategories__logCategories;
}

void __24__STUILog_logCategories__block_invoke()
{
  os_log_t v0;
  os_log_t v1;
  os_log_t v2;
  os_log_t v3;
  os_log_t v4;
  os_log_t v5;
  os_log_t v6;
  os_log_t v7;
  os_log_t v8;
  os_log_t v9;
  uint64_t v10;
  void *v11;
  os_log_t v12;
  os_log_t v13;
  os_log_t v14;
  os_log_t v15;
  _QWORD v16[14];
  _QWORD v17[16];

  v17[14] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("accessList");
  v15 = os_log_create("com.apple.screentime.settingsui", "accessList");
  v17[0] = v15;
  v16[1] = CFSTR("apps");
  v14 = os_log_create("com.apple.screentime.settingsui", "apps");
  v17[1] = v14;
  v16[2] = CFSTR("budgets");
  v13 = os_log_create("com.apple.screentime.settingsui", "budgets");
  v17[2] = v13;
  v16[3] = CFSTR("alwaysAllowed");
  v12 = os_log_create("com.apple.screentime.settingsui", "alwaysAllowed");
  v17[3] = v12;
  v16[4] = CFSTR("communication");
  v0 = os_log_create("com.apple.screentime.settingsui", "communication");
  v17[4] = v0;
  v16[5] = CFSTR("communicationSafety");
  v1 = os_log_create("com.apple.screentime.settingsui", "communicationSafety");
  v17[5] = v1;
  v16[6] = CFSTR("contentPrivacy");
  v2 = os_log_create("com.apple.screentime.settingsui", "contentPrivacy");
  v17[6] = v2;
  v16[7] = CFSTR("persistence");
  v3 = os_log_create("com.apple.screentime.settingsui", "persistence");
  v17[7] = v3;
  v16[8] = CFSTR("usage");
  v4 = os_log_create("com.apple.screentime.settingsui", "usage");
  v17[8] = v4;
  v16[9] = CFSTR("icons");
  v5 = os_log_create("com.apple.screentime.settingsui", "icons");
  v17[9] = v5;
  v16[10] = CFSTR("requests");
  v6 = os_log_create("com.apple.screentime.settingsui", "requests");
  v17[10] = v6;
  v16[11] = CFSTR("users");
  v7 = os_log_create("com.apple.screentime.settingsui", "users");
  v17[11] = v7;
  v16[12] = CFSTR("childSetup");
  v8 = os_log_create("com.apple.screentime.settingsui", "childSetup");
  v17[12] = v8;
  v16[13] = CFSTR("eyeRelief");
  v9 = os_log_create("com.apple.screentime.settingsui", "eyeRelief");
  v17[13] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)logCategories__logCategories;
  logCategories__logCategories = v10;

}

+ (OS_os_log)accessList
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accessList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)apps
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)budgets
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("budgets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)alwaysAllowed
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("alwaysAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)communication
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("communication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationSafety
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("communicationSafety"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)contentPrivacy
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentPrivacy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)persistence
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("persistence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)usage
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("usage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)icons
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)requests
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("requests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)users
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("users"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)childSetup
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("childSetup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

+ (OS_os_log)eyeRelief
{
  void *v2;
  void *v3;

  +[STUILog logCategories](STUILog, "logCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eyeRelief"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_os_log *)v3;
}

@end
