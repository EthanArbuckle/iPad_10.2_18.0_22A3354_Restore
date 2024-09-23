@implementation FMDCompanionRegistryFactory

+ (BOOL)isAutomationActive
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v2, "isInternalBuild"))
    v3 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("FMDAutomationWatchMigrationAutomationActiveKey"), kFMDNotBackedUpPrefDomain);
  else
    v3 = 0;

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAutomationWatchMigration: isAutomationActive: %d", (uint8_t *)v7, 8u);
  }

  return v3;
}

+ (id)companionRegistryWithDelegate:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;

  v3 = a3;
  if (+[FMDCompanionRegistryFactory isAutomationActive](FMDCompanionRegistryFactory, "isAutomationActive"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
    v5 = (objc_class *)objc_msgSend(v4, "automationHelperClassWithName:", CFSTR("FMDCompanionAutomationRegistry"));

  }
  else
  {
    v5 = (objc_class *)FMDNanoRegistry;
  }
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "setDelegate:", v3);

  return v6;
}

+ (BOOL)isBlackMagic
{
  id v3;
  NSObject *v4;
  _DWORD v6[2];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(a1, "isTinkerPaired");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tinker paired: %d", (uint8_t *)v6, 8u);
  }

  return objc_msgSend(a1, "isTinkerPaired");
}

+ (BOOL)isTinkerPaired
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCompanionRegistryFactory companionRegistryWithDelegate:](FMDCompanionRegistryFactory, "companionRegistryWithDelegate:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activePairedDevice"));
  v4 = objc_msgSend(v3, "tinkerPaired");

  return v4;
}

@end
