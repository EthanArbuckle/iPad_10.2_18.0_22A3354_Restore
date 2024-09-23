@implementation SNLPSSUConfig

+ (id)loadAppShortcutAlwaysTriggeredAllowList
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadAppShortcutAlwaysTriggeredAllowListPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  if (objc_msgSend(a1, "isInternalInstall"))
  {
    objc_msgSend(a1, "loadAppShortcutAlwaysTriggeredAllowListUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  return v3;
}

+ (id)loadPlistArrayFromURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", a3);
}

+ (id)loadAppShortcutAlwaysTriggeredAllowListPlist
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("SSUAppShortcutAlwaysTriggeredAllowList"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    SNLPOSLoggerForCategory(8);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = CFSTR("SSUAppShortcutAlwaysTriggeredAllowList");
      _os_log_impl(&dword_1C2196000, v8, OS_LOG_TYPE_ERROR, "Could not load framework plist: %@. Returning no plist allowlist entries.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  objc_msgSend(a1, "loadPlistArrayFromURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SNLPOSLoggerForCategory(8);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = CFSTR("SSUAppShortcutAlwaysTriggeredAllowList");
      _os_log_impl(&dword_1C2196000, v15, OS_LOG_TYPE_ERROR, "Could not load array contents of framework plist: %@. Returning no plist allowlist entries.", buf, 0xCu);
    }

    v8 = 0;
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(const __CFString **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          SNLPOSLoggerForCategory(8);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v22 = v13;
            v23 = 2112;
            v24 = CFSTR("SSUAppShortcutAlwaysTriggeredAllowList");
            _os_log_impl(&dword_1C2196000, v14, OS_LOG_TYPE_ERROR, "Found non-string entry (%@) in framework plist: %@. Skipping.", buf, 0x16u);
          }

        }
      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

LABEL_22:
  return v7;
}

+ (id)loadAppShortcutAlwaysTriggeredAllowListUserDefaults
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SiriNaturalLanguageParsing"));
  v3 = v2;
  if (!v2)
  {
    SNLPOSLoggerForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = CFSTR("com.apple.SiriNaturalLanguageParsing");
      v6 = "User defaults suite not configured: %@. Returning no user defaults.";
      goto LABEL_7;
    }
LABEL_8:

    v4 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v2, "stringArrayForKey:", CFSTR("SSUAppShortcutAlwaysTriggeredAllowList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SNLPOSLoggerForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = CFSTR("SSUAppShortcutAlwaysTriggeredAllowList");
      v6 = "User defaults string array key not configured: %@. Returning no user defaults.";
LABEL_7:
      _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v4;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_2420);
  return isInternalInstall_isInternalBuild;
}

uint64_t __34__SNLPSSUConfig_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalInstall_isInternalBuild = result;
  return result;
}

@end
