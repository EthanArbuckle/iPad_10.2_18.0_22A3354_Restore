@implementation NSUserDefaults(SafariCoreExtras)

+ (uint64_t)safari_notificationNameForUserDefaultsKey:()SafariCoreExtras
{
  return objc_msgSend(a3, "stringByAppendingString:", CFSTR("_UserDefaultsNotification"));
}

- (WBSUserDefaultObservation)safari_observeValueForKey:()SafariCoreExtras onQueue:notifyForInitialValue:handler:
{
  id v10;
  id v11;
  id v12;
  WBSUserDefaultObservation *v13;
  void *v14;
  WBSUserDefaultObservation *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = [WBSUserDefaultObservation alloc];
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[WBSUserDefaultObservation initWithUserDefaults:keys:queue:notifyForInitialValue:handler:](v13, "initWithUserDefaults:keys:queue:notifyForInitialValue:handler:", a1, v14, v11, a5, v10);
  return v15;
}

+ (id)_safari_browserDefaults
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getpid();
    if (sandbox_container_path_for_pid())
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_mobileSafariContainerDirectoryURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", CFSTR("com.apple.mobilesafari"), v5);
      return v6;
    }
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobilesafari"));
  }
  return v3;
}

+ (id)sf_safariSharedDefaults
{
  if (sf_safariSharedDefaults_onceToken != -1)
    dispatch_once(&sf_safariSharedDefaults_onceToken, &__block_literal_global_29);
  return (id)sf_safariSharedDefaults_safariSharedDefaults;
}

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras defaultValue:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = objc_msgSend(a1, "BOOLForKey:", v6);

  return a4;
}

- (double)safari_doubleForKey:()SafariCoreExtras defaultValue:
{
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "safari_numberForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    a2 = v5;
  }

  return a2;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

+ (id)safari_browserDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NSUserDefaults_SafariCoreExtras__safari_browserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_browserDefaults_onceToken != -1)
    dispatch_once(&safari_browserDefaults_onceToken, block);
  return (id)safari_browserDefaults_userDefaults;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)safari_enableAdvancedPrivacyProtections:()SafariCoreExtras
{
  uint64_t result;

  result = objc_msgSend(a1, "BOOLForKey:", CFSTR("EnableEnhancedPrivacyInPrivateBrowsing"));
  if ((_DWORD)result)
  {
    if ((a3 & 1) == 0)
      return objc_msgSend(a1, "BOOLForKey:", CFSTR("EnableEnhancedPrivacyInRegularBrowsing"));
  }
  return result;
}

+ (id)safari_standardUserDefaultsWithOptimizedKeyValueObserving
{
  if (safari_standardUserDefaultsWithOptimizedKeyValueObserving_onceToken != -1)
    dispatch_once(&safari_standardUserDefaultsWithOptimizedKeyValueObserving_onceToken, &__block_literal_global_9);
  return (id)safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults;
}

- (void)safari_incrementNumberForKey:()SafariCoreExtras
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "setInteger:forKey:", objc_msgSend(a1, "integerForKey:", v4) + 1, v4);

}

- (uint64_t)safari_toggleBoolForKey:()SafariCoreExtras
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "BOOLForKey:", v4) ^ 1;
  objc_msgSend(a1, "setBool:forKey:", v5, v4);

  return v5;
}

+ (id)pm_defaults
{
  if (pm_defaults_onceToken != -1)
    dispatch_once(&pm_defaults_onceToken, &__block_literal_global_4_0);
  return (id)pm_defaults_userDefaults;
}

+ (id)safari_cloudBookmarksDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__NSUserDefaults_SafariCoreExtras__safari_cloudBookmarksDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudBookmarksDefaults_onceToken != -1)
    dispatch_once(&safari_cloudBookmarksDefaults_onceToken, block);
  return (id)safari_cloudBookmarksDefaults_defaults;
}

+ (uint64_t)safari_canonicalApplicationDefaults
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

- (void)safari_setInteger:()SafariCoreExtras andNotifyForKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "setInteger:forKey:", a3, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, a1, v10);
}

- (void)safari_setBool:()SafariCoreExtras andNotifyForKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "setBool:forKey:", a3, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, a1, v10);
}

- (void)safari_setBool:()SafariCoreExtras forKey:andNotifyWithUserInfo:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "setBool:forKey:", a3, v9);
  v13 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, a1, v13);
}

- (void)safari_setObject:()SafariCoreExtras andNotifyForKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "setObject:forKey:", v7, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", v9, a1, v10);
}

- (void)safari_modifyDictionaryForKey:()SafariCoreExtras block:
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "dictionaryForKey:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v13, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v6[2](v6, v11);
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(a1, "setObject:forKey:", v12, v7);

}

- (uint64_t)safari_toggleBoolAndNotifyForKey:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "safari_toggleBoolForKey:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, a1, v9);
  return v5;
}

- (WBSUserDefaultObservation)safari_observeValuesForKeys:()SafariCoreExtras onQueue:notifyForInitialValue:handler:
{
  id v10;
  id v11;
  id v12;
  WBSUserDefaultObservation *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[WBSUserDefaultObservation initWithUserDefaults:keys:queue:notifyForInitialValue:handler:]([WBSUserDefaultObservation alloc], "initWithUserDefaults:keys:queue:notifyForInitialValue:handler:", a1, v12, v11, a5, v10);

  return v13;
}

- (void)safari_addStringValue:()SafariCoreExtras toArrayWithKey:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "safari_browserDefaults");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v14, "arrayForKey:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v7);
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v13, v6);

}

- (void)safari_removeStringValue:()SafariCoreExtras fromArrayWithKey:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a3;
  objc_msgSend(v5, "safari_browserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "arrayForKey:", v14);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeObject:", v6);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v13, v14);

  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", v14);
  }

}

- (void)safari_removeObjectsForKeysWithPrefix:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "dictionaryRepresentation", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", v4))
          objc_msgSend(a1, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

@end
