@implementation TransparencySettings

+ (BOOL)isAccountsInQA
{
  if (isAccountsInQA_onceToken != -1)
    dispatch_once(&isAccountsInQA_onceToken, &__block_literal_global_6);
  return isAccountsInQA_sIMIsAccountsInQA;
}

void __38__TransparencySettings_isAccountsInQA__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Caches/com.apple.setmme"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isAccountsInQA_sIMIsAccountsInQA = objc_msgSend(v2, "fileExistsAtPath:", v3);

}

+ (id)getIMEnvironmentName
{
  CFPropertyListRef v2;
  void *v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("env"), CFSTR("com.apple.ids"));
  v3 = (void *)getIMEnvironmentName_name;
  getIMEnvironmentName_name = (uint64_t)v2;

  return (id)getIMEnvironmentName_name;
}

+ (unint64_t)getEnvironment
{
  unint64_t v2;
  void *v3;

  if (+[TransparencySettings getBool:](TransparencySettings, "getBool:", CFSTR("useQAConfig")))
    return 2;
  if (+[TransparencySettings getBool:](TransparencySettings, "getBool:", CFSTR("useQA1Config")))
    return 1;
  +[TransparencySettings getIMEnvironmentName](TransparencySettings, "getIMEnvironmentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length")
    && +[TransparencySettings isAccountsInQA](TransparencySettings, "isAccountsInQA")
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ven1-external")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ven2-external")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)getEnvironment
{
  return +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment");
}

- (BOOL)systemFailureFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)getBool:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.transparencyd"), 0) == 1;
}

- (BOOL)getBool:(id)a3
{
  return +[TransparencySettings getBool:](TransparencySettings, "getBool:", a3);
}

+ (BOOL)getBool:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v5 = CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.transparencyd"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v5;
  else
    return a4;
}

- (BOOL)allowsInternalSecurityPolicies
{
  return os_variant_allows_internal_security_policies();
}

+ (double)defaultNetworkTimeout
{
  return 60.0;
}

- (double)defaultNetworkTimeout
{
  double result;

  +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
  return result;
}

+ (double)uiBlockingNetworkTimeout
{
  return 5.0;
}

- (double)uiBlockingNetworkTimeout
{
  double result;

  +[TransparencySettings uiBlockingNetworkTimeout](TransparencySettings, "uiBlockingNetworkTimeout");
  return result;
}

+ (double)backgroundNetworkTimeout
{
  return 300.0;
}

+ (double)defaultQueryCacheTimeout
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideDefaultQueryCacheTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)queryCacheHardTimeout
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideQueryCacheHardTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 604800.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)queryJustMadeTimeout
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideQueryJustMadeTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 3.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)dismissFailureAfterSeenPeriod
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideFailureDismissAfterSeenSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 3600.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)failureIgnorePeriod
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideFailureIgnorePeriod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)defaultSelfFollowupTicketLifetime
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideSelfValidationTicketExpiry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (double)backgroundFollowupDelayPeriod
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideBackgroundFollowupDelayPeriod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 172800.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (unint64_t)backgroundFollowupFailureCount
{
  void *v2;
  unint64_t v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideBackgroundFollowupFailureCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 6;

  return v3;
}

- (double)atBackgroundFollowupDelayPeriod
{
  void *v2;
  double v3;

  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("overrideATBackgroundFollowupDelayPeriod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 604800.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)(unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  }

  return v3;
}

+ (BOOL)enableSelfValidationXPCActivity
{
  void *v2;
  char v3;

  if (!os_variant_allows_internal_security_policies())
    return 1;
  +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", CFSTR("enableSelfValidationXPCActivity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

+ (id)deviceUserAgent
{
  void *v2;

  if (deviceUserAgent_onceToken != -1)
    dispatch_once(&deviceUserAgent_onceToken, &__block_literal_global_77);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("com.apple.Transparency"));
  objc_msgSend(v2, "appendFormat:", CFSTR(" [%@, %@]"), deviceUserAgent_deviceClass, deviceUserAgent_buildVersion);
  return v2;
}

void __39__TransparencySettings_deviceUserAgent__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v5 = v0;
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)deviceUserAgent_buildVersion;
    deviceUserAgent_buildVersion = v1;

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F8]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)deviceUserAgent_deviceClass;
    deviceUserAgent_deviceClass = v3;

    v0 = v5;
  }

}

+ (id)devicePlatform
{
  void *v2;
  void *v3;

  if (devicePlatform_onceToken != -1)
    dispatch_once(&devicePlatform_onceToken, &__block_literal_global_81);
  objc_msgSend((id)devicePlatform_deviceClass, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24DC90470);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __38__TransparencySettings_devicePlatform__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F8]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)devicePlatform_deviceClass;
    devicePlatform_deviceClass = v1;

    v0 = v3;
  }

}

- (id)devicePlatform
{
  return +[TransparencySettings devicePlatform](TransparencySettings, "devicePlatform");
}

+ (id)automatedDeviceGroup
{
  if (automatedDeviceGroup_onceToken != -1)
    dispatch_once(&automatedDeviceGroup_onceToken, &__block_literal_global_86);
  return (id)automatedDeviceGroup_automatedDeviceGroup;
}

void __44__TransparencySettings_automatedDeviceGroup__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE6DFD8], "automatedDeviceGroup");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)automatedDeviceGroup_automatedDeviceGroup;
  automatedDeviceGroup_automatedDeviceGroup = v0;

}

- (id)automatedDeviceGroup
{
  return +[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup");
}

+ (id)getOverride:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.transparencyd"));
}

- (id)getOverride:(id)a3
{
  return +[TransparencySettings getOverride:](TransparencySettings, "getOverride:", a3);
}

+ (id)transparencyVersionStr
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), 102);
}

- (id)transparencyVersionStr
{
  return +[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr");
}

+ (id)jsonArrayFromPlistArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke;
  v8[3] = &unk_24DC8F708;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
LABEL_4:
    v5 = v4;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[TransparencySettings jsonArrayFromPlistArray:](TransparencySettings, "jsonArrayFromPlistArray:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[TransparencySettings jsonDictFromPlistDict:](TransparencySettings, "jsonDictFromPlistDict:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "kt_hexString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "kt_toISO_8601_UTCString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_96);
  v6 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert obj (class: %@) %@, using description", (uint8_t *)&v10, 0x16u);

  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

+ (id)jsonDictFromPlistDict:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__TransparencySettings_jsonDictFromPlistDict___block_invoke;
  v8[3] = &unk_24DC8F730;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __46__TransparencySettings_jsonDictFromPlistDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
LABEL_7:
    v8 = v7;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "kt_hexString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "kt_toISO_8601_UTCString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_100);
  v11 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v14;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert key (class: %@) %@, using description", (uint8_t *)&v19, 0x16u);

  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v6;
LABEL_11:
    v10 = v9;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[TransparencySettings jsonArrayFromPlistArray:](TransparencySettings, "jsonArrayFromPlistArray:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[TransparencySettings jsonDictFromPlistDict:](TransparencySettings, "jsonDictFromPlistDict:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "kt_hexString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "kt_toISO_8601_UTCString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v6, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_102);
  v15 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v18;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_21A250000, v16, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert obj (class: %@) %@, using description", (uint8_t *)&v19, 0x16u);

  }
LABEL_12:
  if (v8 && v10)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v8);

}

void __46__TransparencySettings_jsonDictFromPlistDict___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

void __46__TransparencySettings_jsonDictFromPlistDict___block_invoke_101()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

+ (id)cfPrefsJson
{
  CFDictionaryRef v2;
  void *v3;

  v2 = CFPreferencesCopyMultiple(0, CFSTR("com.apple.transparencyd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  +[TransparencySettings jsonDictFromPlistDict:](TransparencySettings, "jsonDictFromPlistDict:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
