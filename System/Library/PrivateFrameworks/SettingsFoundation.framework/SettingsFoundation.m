uint64_t SFPerformSelector(const char *a1, void *a2, uint64_t a3)
{
  return SFPerformSelector2(a1, a2, a3, 0);
}

id SFDeveloperSettingsBundlePath()
{
  void *v0;
  const __CFString *v1;
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SFDeveloperSettingsBundlesDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("/System/Library/PreferenceBundles/")))
  {
    v1 = CFSTR("DeveloperSettings.bundle");
LABEL_5:
    objc_msgSend(v0, "stringByAppendingPathComponent:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v0)
  {
    v1 = CFSTR("Developer Settings.bundle");
    goto LABEL_5;
  }
  v2 = 0;
LABEL_6:
  SFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "NSString * _Nullable SFDeveloperSettingsBundlePath(void)";
    v7 = 2114;
    v8 = v2;
    _os_log_impl(&dword_20AC93000, v3, OS_LOG_TYPE_DEFAULT, "%s: Resolved Developer Settings Path '%{public}@'", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

const __CFString *SFDeveloperSettingsBundlesDirectoryPath()
{
  void *v0;
  const __CFString *v1;
  void *v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = CFSTR("/System/Library/PreferenceBundles/");
  objc_msgSend(CFSTR("/System/Library/PreferenceBundles/"), "stringByAppendingPathComponent:", CFSTR("DeveloperSettings.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "fileExistsAtPath:", v2);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = CFSTR("/System/Developer/Library/PreferenceBundles/");
    v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/System/Developer/Library/PreferenceBundles/"));

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/Developer/Library/PreferenceBundles/"));

      if (v7)
        v1 = CFSTR("/Developer/Library/PreferenceBundles/");
      else
        v1 = 0;
    }
  }
  SFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "NSString * _Nullable SFDeveloperSettingsBundlesDirectoryPath(void)";
    v12 = 2114;
    v13 = v1;
    _os_log_impl(&dword_20AC93000, v8, OS_LOG_TYPE_DEFAULT, "%s: Resolved Developer Settings Directory Path '%{public}@'", (uint8_t *)&v10, 0x16u);
  }

  return v1;
}

id SFRuntimeAbsoluteFilePathForPath(void *a1)
{
  return a1;
}

uint64_t SFPerformSelector2(const char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  uint64_t (*v13)(void *, const char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSString *v20;
  objc_class *v21;
  int v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  v8 = SFLogForCategory(2uLL);
  v9 = os_signpost_id_make_with_pointer(v8, "SFPerformSelector");
  v10 = SFLogForCategory(2uLL);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v10))
    {
      v12 = (objc_class *)objc_opt_class();
      v22 = 138543618;
      v23 = NSStringFromClass(v12);
      v24 = 2114;
      v25 = NSStringFromSelector(a1);
      _os_signpost_emit_with_name_impl(&dword_20AC93000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SFPerformSelector2", "Target: %{public}@, Selector: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
  v13 = (uint64_t (*)(void *, const char *, uint64_t, uint64_t))objc_msgSend(a2, "methodForSelector:", a1);
  v14 = objc_msgSend((id)objc_msgSend(a2, "methodSignatureForSelector:", a1), "methodReturnLength");
  if (a4)
  {
    v15 = v13(a2, a1, a3, a4);
  }
  else if (a3)
  {
    v15 = ((uint64_t (*)(void *, const char *, uint64_t))v13)(a2, a1, a3);
  }
  else
  {
    v15 = ((uint64_t (*)(void *, const char *))v13)(a2, a1);
  }
  v17 = v15;
  v18 = SFLogForCategory(2uLL);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v18))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_20AC93000, v19, OS_SIGNPOST_INTERVAL_END, v9, "SFPerformSelector2", (const char *)&unk_20ACA7BD5, (uint8_t *)&v22, 2u);
    }
  }
  v20 = NSStringFromSelector(a1);
  v21 = (objc_class *)objc_opt_class();
  +[SFSettingsAnalytics trackingPerformSelector:targetString:](SFSettingsAnalytics, "trackingPerformSelector:targetString:", v20, NSStringFromClass(v21));
  if (v14)
    return v17;
  else
    return 0;
}

id SFLogForCategory(unint64_t a1)
{
  if (a1 >= 5)
    SFLogForCategory_cold_1();
  if (SFLogForCategory_loggingToken != -1)
    dispatch_once(&SFLogForCategory_loggingToken, &__block_literal_global_6);
  return (id)SFLogForCategory_logObjects[a1];
}

uint64_t SFAppTintColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

id SFObjectAndOffsetForURLPair(void *a1)
{
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("#"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 2)
  {
    objc_msgSend(v1, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
  }
  else
  {
    v4 = 0;
    LODWORD(v3) = 0;
  }
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v2, CFSTR("object"), v4, CFSTR("offsetItem"), v6, CFSTR("offsetValue"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SF_LocalizedStringForCountryOfOriginAssembledIn(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SFBundleForSettingsFoundationFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("CountryOfOriginAssembledIn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SFBundleForSettingsFoundationFramework()
{
  if (SFBundleForSettingsFoundationFramework_onceToken != -1)
    dispatch_once(&SFBundleForSettingsFoundationFramework_onceToken, &__block_literal_global_0);
  return (id)SFBundleForSettingsFoundationFramework__settingsFoundationFrameworkBundle;
}

id SF_LocalizedStringForCountryOfOriginMadeIn(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SFBundleForSettingsFoundationFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("CountryOfOriginMadeIn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SF_LocalizedStringForSettingsFoundation(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SFBundleForSettingsFoundationFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("SettingsFoundation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SFLocalizableWAPIStringKeyForKey(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;

  v1 = a1;
  if (SFLocalizableWAPIStringKeyForKey___wapiCapabilityToken != -1)
    dispatch_once(&SFLocalizableWAPIStringKeyForKey___wapiCapabilityToken, &__block_literal_global_2);
  v2 = SFLocalizableWAPIStringKeyForKey___wapi | CFPreferencesGetAppBooleanValue(CFSTR("fakeWapi"), CFSTR("com.apple.preferences.cn"), 0);
  SFLocalizableWAPIStringKeyForKey___wapi = v2 != 0;
  if (v2)
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WIFI"), CFSTR("WLAN"));
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  return v1;
}

uint64_t SFProcessIDForProcessNamed(void *a1)
{
  id v1;
  const char *v2;
  char *v3;
  int v4;
  uint64_t v5;
  char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  size_t v14;
  const char *v15;
  size_t size;
  uint8_t buf[4];
  size_t v19;
  int v20[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    v3 = 0;
    *(_OWORD *)v20 = xmmword_20ACA59D8;
    v21 = 0;
    size = 0;
    v4 = -5;
    while (1)
    {
      v5 = sysctl(v20, 3u, 0, &size, 0, 0);
      if ((_DWORD)v5)
      {
        v9 = v5;
        goto LABEL_29;
      }
      v6 = (char *)malloc_type_realloc(v3, size, 0x7B3B72B2uLL);
      if (!v6)
        break;
      v7 = v6;
      v8 = sysctl(v20, 3u, v6, &size, 0, 0);
      if (!(_DWORD)v8)
        goto LABEL_21;
      v9 = v8;
      if (*__error() != 12)
        goto LABEL_27;
      SFLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AC93000, v10, OS_LOG_TYPE_DEFAULT, "sysctl() returned ENOMEM. Process table grew during SFProcessIDForProcessNamed().", buf, 2u);
      }

      if (__CFADD__(v4++, 1))
      {
        SFLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20AC93000, v13, OS_LOG_TYPE_DEFAULT, "SFProcessIDForProcessNamed() was unable to get the full process list even after retries!", buf, 2u);
        }

LABEL_21:
        if (size < 0x288)
        {
LABEL_26:
          v9 = 0xFFFFFFFFLL;
        }
        else
        {
          v14 = size / 0x288;
          v15 = v7 + 243;
          while (1)
          {
            v9 = *(unsigned int *)(v15 - 203);
            if ((int)v9 >= 1 && !strncmp(v2, v15, 0x10uLL))
              break;
            v15 += 648;
            if (!--v14)
              goto LABEL_26;
          }
        }
LABEL_27:
        v3 = (char *)v7;
LABEL_28:
        free(v3);
        goto LABEL_29;
      }
      v3 = (char *)v7;
      if (*__error() != 12)
        goto LABEL_21;
    }
    SFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = size;
      _os_log_impl(&dword_20AC93000, v12, OS_LOG_TYPE_DEFAULT, "Unable to realloc buffer to %lld size", buf, 0xCu);
    }

    v9 = 0xFFFFFFFFLL;
    if (v3)
      goto LABEL_28;
  }
  else
  {
    v9 = 0xFFFFFFFFLL;
  }
LABEL_29:

  return v9;
}

uint64_t SFTerminateProcessNamed(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if ((SFProcessIDForProcessNamed(a1) & 0x80000000) != 0)
  {
    v5 = 3;
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v5 = terminate_with_reason();
  }

  return v5;
}

uint64_t SFKillProcessNamed(void *a1)
{
  return SFTerminateProcessNamed(a1, 0, &stru_24C398458);
}

uint64_t SFIsAppWithBundleIDInstalled(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveBlockedAppBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "containsObject:", v1) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "applicationIsInstalled:", v1);

  }
  return v4;
}

id SFLocalizedStringFromTableInBundleForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFArrayRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v7, "length") || !objc_msgSend(v8, "length") || !objc_msgSend(v10, "length"))
    goto LABEL_9;
  objc_msgSend(v9, "localizations");
  v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
  v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (!-[__CFArray count](v13, "count"))
    goto LABEL_7;
  -[__CFArray objectAtIndex:](v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", v8, CFSTR("strings"), 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  if (!v17)
  {
LABEL_9:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_24C398458, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id _SFBuiltInRegulatoryImage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%uonly_"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SFLogForCategory(3uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    _SFBuiltInRegulatoryImage_cold_2();

  if (!v4)
  {
    v62 = 0;
LABEL_13:
    SFLogForCategory(3uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      _SFBuiltInRegulatoryImage_cold_1();

    objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@%@"), v3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDF6AC8];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingPathComponent:", v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageWithContentsOfFile:", v39);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      SFLogForCategory(3uLL);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
        v65 = 2112;
        v66 = v3;
        v67 = 2112;
        v4 = v62;
        v68 = v62;
        v69 = 2112;
        v70 = v10;
        _os_log_error_impl(&dword_20AC93000, v55, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to resolve to a Built-in Regulatory Image '%{Public}@-%{Public}@' with name '%{Public}@'", buf, 0x2Au);
        v14 = 0;
        v16 = 0;
      }
      else
      {
        v14 = 0;
        v16 = 0;
        v4 = v62;
      }
LABEL_27:

      v14 = v14;
      v54 = v14;
      goto LABEL_28;
    }
    objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@_dark%@"), v3, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDF6AC8];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingPathComponent:", v16);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageWithContentsOfFile:", v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v59 = v16;
      v60 = v8;
      v61 = v3;
      objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
      v58 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
      v43 = (void *)MEMORY[0x24BDF6F30];
      v72[0] = v21;
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v44;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "traitCollectionWithTraitsFromCollections:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "registerImage:withTraitCollection:", v14, v46);

      v47 = (void *)MEMORY[0x24BDF6F30];
      v71[0] = v21;
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "traitCollectionWithTraitsFromCollections:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "registerImage:withTraitCollection:", v20, v50);

      v31 = (void *)v58;
      objc_msgSend(v22, "imageWithTraitCollection:", v58);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage_256;
      _SFBuiltInRegulatoryImage_styleSensitiveImage_256 = v51;

      SFLogForCategory(3uLL);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
        v65 = 2112;
        v66 = v10;
        _os_log_impl(&dword_20AC93000, v53, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
      }

      v35 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage_256;
      goto LABEL_20;
    }
    v4 = v62;
LABEL_25:
    SFLogForCategory(3uLL);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
      v65 = 2112;
      v66 = v10;
      _os_log_impl(&dword_20AC93000, v55, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
    }
    goto LABEL_27;
  }
  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@%@"), v3, v4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithContentsOfFile:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  SFLogForCategory(3uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
    v65 = 2112;
    v66 = v10;
    _os_log_impl(&dword_20AC93000, v15, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looked up '%{Public}@'", buf, 0x16u);
  }

  if (!v14)
  {
    v62 = v4;
    v4 = v10;
    goto LABEL_13;
  }
  v61 = v3;
  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@_dark%@"), v3, v4, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathComponent:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithContentsOfFile:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v3 = v61;
    goto LABEL_25;
  }
  v59 = v16;
  v60 = v8;
  v62 = v4;
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v57 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
  v23 = (void *)MEMORY[0x24BDF6F30];
  v74[0] = v21;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "traitCollectionWithTraitsFromCollections:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerImage:withTraitCollection:", v14, v26);

  v27 = (void *)MEMORY[0x24BDF6F30];
  v73[0] = v21;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "traitCollectionWithTraitsFromCollections:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerImage:withTraitCollection:", v20, v30);

  v31 = (void *)v57;
  objc_msgSend(v22, "imageWithTraitCollection:", v57);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage;
  _SFBuiltInRegulatoryImage_styleSensitiveImage = v32;

  SFLogForCategory(3uLL);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
    v65 = 2112;
    v66 = v10;
    _os_log_impl(&dword_20AC93000, v34, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
  }

  v35 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage;
LABEL_20:
  v54 = v35;

  v3 = v61;
  v4 = v62;
  v16 = v59;
  v8 = v60;
LABEL_28:

  return v54;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id SFTintedImageFromMask(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDF6950];
  v2 = a1;
  objc_msgSend(v1, "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SFTintedImageFromMaskWithColor(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _SFTintedImageFromMaskWithColor(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  float v13;
  float v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x24BDBEFB0];
  v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v4, "scale");
  v12 = v11;
  v17.width = 29.0;
  v17.height = 29.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);
  v13 = (29.0 - v6) * 0.5;
  v14 = (29.0 - v8) * 0.5;
  objc_msgSend(v4, "drawInRect:", floorf(v13), floorf(v14), v6, v8);

  objc_msgSend(v3, "setFill");
  v18.size.width = 29.0;
  v18.size.height = 29.0;
  v18.origin.x = v9;
  v18.origin.y = v10;
  UIRectFillUsingBlendMode(v18, kCGBlendModeSourceIn);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

id SFSelectedTintedImageFromMask(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDF6950];
  v2 = a1;
  objc_msgSend(v1, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SFTintedImageFromMaskWithColor(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL SFDeviceSupportsFall2019OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

BOOL SFDeviceSupportsFall2020OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

BOOL SFDeviceSupportsSpring2021OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

uint64_t SFDeviceSupportsShipsWithoutAdapterRoHSELabel()
{
  void *v0;
  uint64_t v1;

  if (!MGGetBoolAnswer())
    return 0;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "sf_isiPhone"))
    v1 = MGIsDeviceOneOfType() ^ 1;
  else
    v1 = 0;

  return v1;
}

uint64_t SFShouldShowEyesightWarning()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (SFDeviceSupportsFall2019OrLaterELabel() && (MGIsDeviceOneOfType() & 1) == 0)
    v2 = objc_msgSend(&unk_24C39B178, "containsObject:", v1, 0);
  else
    v2 = 0;

  return v2;
}

uint64_t SFShouldShowMonthOfManufacture()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (SFDeviceSupportsFall2019OrLaterELabel() && (MGIsDeviceOneOfType() & 1) == 0)
    v2 = objc_msgSend(&unk_24C39B190, "containsObject:", v1, 0);
  else
    v2 = 0;

  return v2;
}

uint64_t SFShouldShowAlertMark()
{
  void *v0;
  void *v1;
  uint64_t v2;
  __int128 *v4;
  __int128 *v5;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  __int128 *v15;
  __int128 *v16;
  __int128 *v17;
  __int128 *v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  __int128 *v24;
  __int128 *v25;
  __int128 *v26;
  __int128 *v27;
  __int128 *v28;
  __int128 *v29;
  __int128 *v30;
  __int128 *v31;
  __int128 *v32;
  __int128 *v33;
  __int128 *v34;
  __int128 *v35;
  __int128 *v36;
  __int128 *v37;
  __int128 *v38;
  __int128 *v39;
  __int128 *v40;
  __int128 *v41;
  __int128 *v42;
  __int128 *v43;
  __int128 *v44;
  __int128 *v45;
  __int128 *v46;
  __int128 *v47;
  __int128 *v48;
  __int128 *v49;
  __int128 *v50;
  uint64_t v51;
  __int128 v52;
  int v53;
  __int128 v54;
  int v55;
  __int128 v56;
  int v57;
  __int128 v58;
  int v59;
  __int128 v60;
  int v61;
  __int128 v62;
  int v63;
  __int128 v64;
  int v65;
  __int128 v66;
  int v67;
  __int128 v68;
  int v69;
  __int128 v70;
  int v71;
  __int128 v72;
  int v73;
  __int128 v74;
  int v75;
  __int128 v76;
  int v77;
  __int128 v78;
  int v79;
  __int128 v80;
  int v81;
  __int128 v82;
  int v83;
  __int128 v84;
  int v85;
  __int128 v86;
  int v87;
  __int128 v88;
  int v89;
  __int128 v90;
  int v91;
  __int128 v92;
  int v93;
  __int128 v94;
  int v95;
  __int128 v96;
  int v97;
  __int128 v98;
  int v99;
  __int128 v100;
  int v101;
  __int128 v102;
  int v103;
  __int128 v104;
  int v105;
  __int128 v106;
  int v107;
  __int128 v108;
  int v109;
  __int128 v110;
  int v111;
  __int128 v112;
  int v113;
  __int128 v114;
  int v115;
  __int128 v116;
  int v117;
  __int128 v118;
  int v119;
  __int128 v120;
  int v121;
  __int128 v122;
  int v123;
  __int128 v124;
  int v125;
  __int128 v126;
  int v127;
  __int128 v128;
  int v129;
  __int128 v130;
  int v131;
  __int128 v132;
  int v133;
  __int128 v134;
  int v135;
  __int128 v136;
  int v137;
  __int128 v138;
  int v139;
  __int128 v140;
  int v141;
  __int128 v142;
  int v143;
  __int128 v144;
  int v145;
  __int128 v146;
  int v147;
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (SFDeviceSupportsFall2019OrLaterELabel())
    goto LABEL_3;
  v147 = -1418383976;
  v146 = xmmword_20ACA609C;
  v145 = -1213485500;
  v144 = xmmword_20ACA60C4;
  v143 = -232427879;
  v142 = xmmword_20ACA5D04;
  v141 = -427474227;
  v140 = xmmword_20ACA5D18;
  v139 = 1477534141;
  v138 = xmmword_20ACA5D2C;
  v137 = -61007701;
  v136 = xmmword_20ACA5D40;
  v135 = -235416490;
  v134 = xmmword_20ACA5D54;
  v133 = -1403227947;
  v132 = xmmword_20ACA6038;
  v131 = 729118884;
  v130 = xmmword_20ACA604C;
  v129 = 1046806126;
  v128 = xmmword_20ACA6060;
  v127 = -188760945;
  v126 = xmmword_20ACA6074;
  v125 = -489993439;
  v124 = xmmword_20ACA6010;
  v123 = 886875686;
  v122 = xmmword_20ACA6024;
  v121 = -1843102369;
  v120 = xmmword_20ACA5D68;
  v119 = -820493242;
  v118 = xmmword_20ACA5D7C;
  v117 = 1532898719;
  v116 = xmmword_20ACA5D90;
  v115 = -1157300313;
  v114 = xmmword_20ACA5DA4;
  v113 = -2132668294;
  v112 = xmmword_20ACA5DB8;
  v111 = 1278131292;
  v110 = xmmword_20ACA60D8;
  v109 = -1841712216;
  v108 = xmmword_20ACA60EC;
  v107 = 659506830;
  v106 = xmmword_20ACA6100;
  v105 = 213746202;
  v104 = xmmword_20ACA6114;
  v103 = 2030516999;
  v102 = xmmword_20ACA5DCC;
  v101 = -1276010597;
  v100 = xmmword_20ACA5DE0;
  v99 = -762483149;
  v98 = xmmword_20ACA5DF4;
  v97 = -1926937532;
  v96 = xmmword_20ACA5E08;
  v95 = -1902732724;
  v94 = xmmword_20ACA5E1C;
  v93 = -342357580;
  v92 = xmmword_20ACA5E30;
  v91 = 300442574;
  v90 = xmmword_20ACA5E44;
  v89 = -1294188889;
  v88 = xmmword_20ACA5E58;
  v87 = 401945557;
  v86 = xmmword_20ACA5FC0;
  v85 = 338555555;
  v84 = xmmword_20ACA5E6C;
  v83 = -679691073;
  v82 = xmmword_20ACA5E80;
  v81 = 729903963;
  v80 = xmmword_20ACA5E94;
  v79 = 1908474541;
  v78 = xmmword_20ACA5EA8;
  v77 = -414334491;
  v76 = xmmword_20ACA5EBC;
  v75 = -1509831889;
  v74 = xmmword_20ACA5ED0;
  v73 = 289690957;
  v72 = xmmword_20ACA5EE4;
  v71 = 586720268;
  v70 = xmmword_20ACA5EF8;
  v69 = -1282800328;
  v68 = xmmword_20ACA5F0C;
  v67 = 1711910369;
  v66 = xmmword_20ACA5F20;
  v65 = 710807826;
  v64 = xmmword_20ACA5F34;
  v63 = 470738981;
  v62 = xmmword_20ACA5F48;
  v61 = -2085056298;
  v60 = xmmword_20ACA5F5C;
  v59 = 1860682089;
  v58 = xmmword_20ACA5F70;
  v57 = -1742178852;
  v56 = xmmword_20ACA5F84;
  v55 = 2146530832;
  v54 = xmmword_20ACA5F98;
  v53 = -2114570942;
  v52 = xmmword_20ACA6128;
  v50 = &v52;
  v51 = 0;
  v48 = &v56;
  v49 = &v54;
  v46 = &v60;
  v47 = &v58;
  v44 = &v64;
  v45 = &v62;
  v42 = &v68;
  v43 = &v66;
  v40 = &v72;
  v41 = &v70;
  v38 = &v76;
  v39 = &v74;
  v36 = &v80;
  v37 = &v78;
  v34 = &v84;
  v35 = &v82;
  v32 = &v88;
  v33 = &v86;
  v30 = &v92;
  v31 = &v90;
  v28 = &v96;
  v29 = &v94;
  v26 = &v100;
  v27 = &v98;
  v24 = &v104;
  v25 = &v102;
  v22 = &v108;
  v23 = &v106;
  v20 = &v112;
  v21 = &v110;
  v18 = &v116;
  v19 = &v114;
  v16 = &v120;
  v17 = &v118;
  v14 = &v124;
  v15 = &v122;
  v12 = &v128;
  v13 = &v126;
  v10 = &v132;
  v11 = &v130;
  v8 = &v136;
  v9 = &v134;
  v6 = &v140;
  v7 = &v138;
  v4 = &v144;
  v5 = &v142;
  if (MGIsDeviceOneOfType())
LABEL_3:
    v2 = objc_msgSend(&unk_24C39B1A8, "containsObject:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
           v20,
           v21,
           v22,
           v23,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51);
  else
    v2 = 0;

  return v2;
}

uint64_t SFShouldShowIndiaBIS()
{
  void *v0;
  void *v1;
  uint64_t v2;
  __int128 *v4;
  __int128 *v5;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;
  __int128 v19;
  int v20;
  __int128 v21;
  int v22;
  __int128 v23;
  int v24;
  __int128 v25;
  int v26;
  __int128 v27;
  int v28;
  __int128 v29;
  int v30;
  __int128 v31;
  int v32;
  __int128 v33;
  int v34;
  __int128 v35;
  int v36;
  __int128 v37;
  int v38;
  __int128 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 317289457;
  v39 = xmmword_20ACA5FAC;
  v38 = 401945557;
  v37 = xmmword_20ACA5FC0;
  v4 = &v37;
  v5 = 0;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    goto LABEL_4;
  v36 = 1214363620;
  v35 = xmmword_20ACA5FD4;
  v34 = -798153473;
  v33 = xmmword_20ACA5FE8;
  v32 = -776721724;
  v31 = xmmword_20ACA5FFC;
  v30 = -489993439;
  v29 = xmmword_20ACA6010;
  v28 = 886875686;
  v27 = xmmword_20ACA6024;
  v26 = -1403227947;
  v25 = xmmword_20ACA6038;
  v24 = 729118884;
  v23 = xmmword_20ACA604C;
  v22 = 1046806126;
  v21 = xmmword_20ACA6060;
  v20 = -188760945;
  v19 = xmmword_20ACA6074;
  v18 = -1418383976;
  v17 = xmmword_20ACA609C;
  v16 = -1213485500;
  v15 = xmmword_20ACA60C4;
  v13 = &v15;
  v14 = 0;
  v12 = &v17;
  v10 = &v21;
  v11 = &v19;
  v8 = &v25;
  v9 = &v23;
  v6 = &v29;
  v7 = &v27;
  v4 = &v33;
  v5 = &v31;
  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer())
LABEL_4:
    v2 = objc_msgSend(&unk_24C39B1C0, "containsObject:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  else
    v2 = 0;

  return v2;
}

uint64_t SFShouldShowYearOfManufacture()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "yearOfManufacture");

  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer())
  {
    v4 = objc_msgSend(&unk_24C39B1D8, "containsObject:", v1, 0);
    if (v3)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t SFShouldShowCountryOfOrigin()
{
  uint64_t v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v0, "countryOfOriginString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v0) = objc_opt_isKindOfClass();

  return v0 & 1;
}

uint64_t SFShouldShowRoHSCompliance()
{
  void *v0;
  void *v1;
  uint64_t v2;
  __int128 v4;
  int v5;
  __int128 v6;
  int v7;
  __int128 v8;
  int v9;
  __int128 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -350584140;
  v10 = xmmword_20ACA6088;
  v9 = -1418383976;
  v8 = xmmword_20ACA609C;
  v7 = 368778837;
  v6 = xmmword_20ACA60B0;
  v5 = -1213485500;
  v4 = xmmword_20ACA60C4;
  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer())
    v2 = objc_msgSend(&unk_24C39B1F0, "containsObject:", v1, &v8, &v6, &v4, 0);
  else
    v2 = 0;

  return v2;
}

uint64_t SFShouldShowBuiltInApps()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sf_regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(&unk_24C39B208, "containsObject:", v1);
  return v2;
}

id SFLicenseFilePath()
{
  if (SFLicenseFilePath_onceToken != -1)
    dispatch_once(&SFLicenseFilePath_onceToken, &__block_literal_global_4);
  return (id)SFLicenseFilePath___path;
}

__CFString *_SFLicenseFilePathForBundleWithName(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  SFLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      v25 = 2114;
      v26 = v1;
      _os_log_impl(&dword_20AC93000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving license file path for bundle name: '%{public}@'", buf, 0x16u);
    }

    v5 = (void *)MEMORY[0x24BDBCF48];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/SoftwareLicenseAgreements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:](v4, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    SFLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "path");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_20AC93000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: License bundle path URL: '%{public}@'", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SFLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      v25 = 2114;
      v26 = CFSTR("html");
      _os_log_impl(&dword_20AC93000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Looking for license file with file extension: '%{public}@'", buf, 0x16u);
    }

    objc_msgSend(v11, "pathForResource:ofType:", CFSTR("License"), CFSTR("html"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    SFLogForCategory(1uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_20AC93000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: License file resolved to file at path: '%{public}@'", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _SFLicenseFilePathForBundleWithName_cold_1(v4, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

id SFLicenseVersionNumber()
{
  if (SFLicenseVersionNumber_onceToken != -1)
    dispatch_once(&SFLicenseVersionNumber_onceToken, &__block_literal_global_223);
  return (id)SFLicenseVersionNumber___licenseVersion;
}

NSObject *_SFLicenseVersionNumberForBundleWithName(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  SFLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v31 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
      v32 = 2114;
      v33 = v1;
      _os_log_impl(&dword_20AC93000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving license version number for bundle name: '%{public}@'", buf, 0x16u);
    }

    v5 = (void *)MEMORY[0x24BDBCF48];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/SoftwareLicenseAgreements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathForResource:ofType:", CFSTR("License_version"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
    _SFLicenseVersionNumberForBundleWithName_licenseVersionPath = v11;

    SFLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      _SFLicenseVersionNumberForBundleWithName_cold_4((uint64_t)v1, v13, v14);

    if (_SFLicenseVersionNumberForBundleWithName_licenseVersionPath)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", _SFLicenseVersionNumberForBundleWithName_licenseVersionPath, 4, &v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v29;
      if (v16)
      {
        SFLogForCategory(1uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          _SFLicenseVersionNumberForBundleWithName_cold_3((uint64_t)v16, v17, v18);

      }
    }
    else
    {
      SFLogForCategory(1uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        _SFLicenseVersionNumberForBundleWithName_cold_2(v9, v16);
      v15 = 0;
    }

    SFLogForCategory(1uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v31 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
      v32 = 2114;
      v33 = v1;
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_20AC93000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: License version for '%{public}@' resolved to: '%{public}@' .", buf, 0x20u);
    }

    v4 = v15;
    v26 = v4;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _SFLicenseVersionNumberForBundleWithName_cold_1(v4, v19, v20, v21, v22, v23, v24, v25);
    v26 = 0;
  }

  return v26;
}

id SFAudioAccessoryLicenseFilePath()
{
  if (SFAudioAccessoryLicenseFilePath_onceToken != -1)
    dispatch_once(&SFAudioAccessoryLicenseFilePath_onceToken, &__block_literal_global_224);
  return (id)SFAudioAccessoryLicenseFilePath___path;
}

id SFAudioAccessoryLicenseVersionNumber()
{
  if (SFAudioAccessoryLicenseVersionNumber_onceToken != -1)
    dispatch_once(&SFAudioAccessoryLicenseVersionNumber_onceToken, &__block_literal_global_227);
  return (id)SFAudioAccessoryLicenseVersionNumber___licenseVersion;
}

id SFWarrantyFilePath()
{
  if (SFWarrantyFilePath_onceToken != -1)
    dispatch_once(&SFWarrantyFilePath_onceToken, &__block_literal_global_228);
  return (id)SFWarrantyFilePath___path;
}

id _SFWarrantyFilePathForBundleWithName(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v5, "length");
  SFLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      v76 = 2114;
      v77 = v5;
      _os_log_impl(&dword_20AC93000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving warranty file path for bundle name: '%{public}@'", buf, 0x16u);
    }

    v11 = (void *)MEMORY[0x24BDBCF48];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/Warranties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    SFLogForCategory(1uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      v76 = 2114;
      v77 = v16;
      _os_log_impl(&dword_20AC93000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty bundle path URL: '%{public}@'", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SFLogForCategory(1uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      v76 = 2114;
      v77 = v6;
      v78 = 2114;
      v79 = v7;
      _os_log_impl(&dword_20AC93000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: Current countryCode '%{public}@', languageCode '%{public}@'.", buf, 0x20u);
    }

    objc_msgSend(v17, "URLForResource:withExtension:", CFSTR("Warranties"), CFSTR("plist"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(v17, "pathForResource:ofType:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SFLogForCategory(1uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        v76 = 2114;
        v77 = v21;
        _os_log_impl(&dword_20AC93000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using currentLocale) to file at path: '%{public}@'", buf, 0x16u);
      }
    }
    else
    {
      SFLogForCategory(1uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        v76 = 2114;
        v77 = v6;
        v78 = 2114;
        v79 = v7;
        _os_log_impl(&dword_20AC93000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found for '%{public}@-%{public}@' locale in lookup file.", buf, 0x20u);
      }
      v62 = v17;
      v58 = v14;
      v59 = v7;
      v60 = v5;

      objc_msgSend(MEMORY[0x24BE5C368], "preferredLanguagesForRegion:", v6);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v31 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      v61 = v6;
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v70;
        while (2)
        {
          v34 = 0;
          v35 = v20;
          do
          {
            if (*(_QWORD *)v70 != v33)
              objc_enumerationMutation(v22);
            v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v34);
            objc_msgSend(v36, "lowercaseString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v37);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v20, "length"))
            {
              objc_msgSend(v62, "pathForResource:ofType:", v20, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              SFLogForCategory(1uLL);
              v42 = objc_claimAutoreleasedReturnValue();
              v6 = v61;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446978;
                v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
                v76 = 2114;
                v77 = v61;
                v78 = 2114;
                v79 = v36;
                v80 = 2114;
                v81 = v21;
                _os_log_impl(&dword_20AC93000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using countryCode '%{public}@' and fallback languageCode '%{public}@') to file at path: '%{public}@'", buf, 0x2Au);
              }

              v41 = v22;
              goto LABEL_33;
            }
            ++v34;
            v35 = v20;
          }
          while (v32 != v34);
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          v6 = v61;
          if (v32)
            continue;
          break;
        }
      }

      SFLogForCategory(1uLL);
      v38 = objc_claimAutoreleasedReturnValue();
      v17 = v62;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        v76 = 2114;
        v77 = v6;
        _os_log_impl(&dword_20AC93000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found in lookup file for preferred languages of '%{public}@' countryCode.", buf, 0x16u);
      }

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("en"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("en"));
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "pathForResource:ofType:", v40, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SFLogForCategory(1uLL);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          v76 = 2114;
          v77 = v6;
          v78 = 2114;
          v79 = v21;
          _os_log_impl(&dword_20AC93000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using English fallback with countryCode '%{public}@') to file at path: '%{public}@'", buf, 0x20u);
        }
        v20 = (void *)v40;
      }
      else
      {
        SFLogForCategory(1uLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          v76 = 2114;
          v77 = v6;
          _os_log_impl(&dword_20AC93000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found in lookup file for English language of '%{public}@' countryCode.", buf, 0x16u);
        }

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v19, "allKeys");
        v41 = objc_claimAutoreleasedReturnValue();
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v66;
          while (2)
          {
            v48 = 0;
            v49 = v20;
            do
            {
              if (*(_QWORD *)v66 != v47)
                objc_enumerationMutation(v41);
              v50 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v48);
              objc_msgSend(v19, "objectForKeyedSubscript:", v50);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v20, "length"))
              {
                objc_msgSend(v62, "pathForResource:ofType:", v20, 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                SFLogForCategory(1uLL);
                v55 = objc_claimAutoreleasedReturnValue();
                v6 = v61;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446978;
                  v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
                  v76 = 2114;
                  v77 = v61;
                  v78 = 2114;
                  v79 = v50;
                  v80 = 2114;
                  v81 = v21;
                  _os_log_impl(&dword_20AC93000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using countryCode '%{public}@' and mapping file languageCode '%{public}@') to file at path: '%{public}@'", buf, 0x2Au);
                }
                goto LABEL_54;
              }
              ++v48;
              v49 = v20;
            }
            while (v46 != v48);
            v46 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v46)
              continue;
            break;
          }
        }

        SFLogForCategory(1uLL);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          _os_log_impl(&dword_20AC93000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found, falling back to default.", buf, 0xCu);
        }

        v52 = (void *)MEMORY[0x24BDBCF48];
        SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/Notices"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "fileURLWithPath:", v53);
        v41 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), CFSTR("Warranty"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject URLByAppendingPathComponent:](v41, "URLByAppendingPathComponent:", v54);
        v55 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "pathForResource:ofType:", CFSTR("Warranty"), CFSTR("html"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SFLogForCategory(1uLL);
        v57 = objc_claimAutoreleasedReturnValue();
        v6 = v61;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          v76 = 2114;
          v77 = v21;
          _os_log_impl(&dword_20AC93000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved to default file at path: '%{public}@'", buf, 0x16u);
        }

LABEL_54:
LABEL_33:
        v17 = v62;
      }

      v7 = v59;
      v5 = v60;
      v14 = v58;
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _SFWarrantyFilePathForBundleWithName_cold_1(v10, v23, v24, v25, v26, v27, v28, v29);
    v21 = 0;
  }

  return v21;
}

id SFAudioAccessoryWarrantyFilePath()
{
  if (SFAudioAccessoryWarrantyFilePath_onceToken != -1)
    dispatch_once(&SFAudioAccessoryWarrantyFilePath_onceToken, &__block_literal_global_232);
  return (id)SFAudioAccessoryWarrantyFilePath___path;
}

id SFBuiltInRegulatoryImageForModelAndVariant(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  uint8_t buf[4];
  const char *v108;
  __int16 v109;
  uint64_t v110;
  _QWORD v111[2];
  _QWORD v112[4];

  v112[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%uonly_"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SFLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    SFBuiltInRegulatoryImageForModelAndVariant_cold_4();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B482")) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("B532")))
  {
    v18 = 0;
    v14 = 0;
    v38 = 0;
    if (!v4)
    {
LABEL_26:
      SFLogForCategory(1uLL);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        SFBuiltInRegulatoryImageForModelAndVariant_cold_2();

      objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@%@"), v3, v8);
      v64 = objc_claimAutoreleasedReturnValue();

      v65 = v8;
      v66 = (void *)MEMORY[0x24BDF6AC8];
      SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringByAppendingPathComponent:", v64);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "imageWithContentsOfFile:", v68);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        SFLogForCategory(1uLL);
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          SFBuiltInRegulatoryImageForModelAndVariant_cold_1(v88, v89, v90, v91, v92, v93, v94, v95);
        v18 = 0;
        v8 = v65;
        goto LABEL_42;
      }
      v102 = v65;
      objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@_dark%@"), v3, v65);
      v69 = objc_claimAutoreleasedReturnValue();

      v70 = (void *)MEMORY[0x24BDF6AC8];
      SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "stringByAppendingPathComponent:", v69);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "imageWithContentsOfFile:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        v99 = (void *)v69;
        v100 = v4;
        v101 = v3;
        objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v7);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
        v77 = (void *)MEMORY[0x24BDF6F30];
        v104[0] = v75;
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v104[1] = v78;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 2);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "traitCollectionWithTraitsFromCollections:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "registerImage:withTraitCollection:", v18, v80);

        v81 = (void *)MEMORY[0x24BDF6F30];
        v103[0] = v75;
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v103[1] = v82;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 2);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "traitCollectionWithTraitsFromCollections:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "registerImage:withTraitCollection:", v73, v84);

        objc_msgSend(v76, "imageWithTraitCollection:", v74);
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_263;
        SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_263 = v85;

        SFLogForCategory(1uLL);
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__"
                 "strong _Nonnull)";
          v109 = 2112;
          v110 = v64;
          _os_log_impl(&dword_20AC93000, v87, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
        }

        v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_263;
        v14 = (void *)v64;
        goto LABEL_33;
      }
      v38 = (void *)v69;
      v14 = (void *)v64;
      v8 = v102;
LABEL_39:
      SFLogForCategory(1uLL);
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__strong _Nonnull)";
        v109 = 2112;
        v110 = (uint64_t)v14;
        _os_log_impl(&dword_20AC93000, v88, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
      }
      v64 = (uint64_t)v14;
LABEL_42:

      v18 = v18;
      v14 = (void *)v64;
      v37 = v18;
      goto LABEL_43;
    }
LABEL_17:
    v39 = v8;
    v40 = v14;
    objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@%@"), v3, v4, v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x24BDF6AC8];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringByAppendingPathComponent:", v14);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "imageWithContentsOfFile:", v43);
    v44 = objc_claimAutoreleasedReturnValue();

    v98 = (void *)v44;
    if (v44)
    {
      v102 = v39;
      objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@_dark%@"), v3, v4, v39);
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x24BDF6AC8];
      SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringByAppendingPathComponent:", v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "imageWithContentsOfFile:", v48);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v99 = (void *)v45;
        v100 = v4;
        v101 = v3;
        objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v7);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
        v52 = (void *)MEMORY[0x24BDF6F30];
        v106[0] = v50;
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v106[1] = v53;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "traitCollectionWithTraitsFromCollections:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v98;
        objc_msgSend(v51, "registerImage:withTraitCollection:", v98, v55);

        v56 = (void *)MEMORY[0x24BDF6F30];
        v105[0] = v50;
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v105[1] = v57;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "traitCollectionWithTraitsFromCollections:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "registerImage:withTraitCollection:", v23, v59);

        objc_msgSend(v51, "imageWithTraitCollection:", v49);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_258;
        SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_258 = v60;

        SFLogForCategory(1uLL);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__"
                 "strong _Nonnull)";
          v109 = 2112;
          v110 = (uint64_t)v14;
          _os_log_impl(&dword_20AC93000, v62, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
        }

        v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_258;
        goto LABEL_22;
      }
      v38 = (void *)v45;
      v8 = v102;
      v18 = v98;
      goto LABEL_39;
    }
    v8 = v39;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sf_screenClassString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringToIndex:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SFLogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    SFBuiltInRegulatoryImageForModelAndVariant_cold_3();

  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@_%@_LT_@2x"), v3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithContentsOfFile:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v38 = 0;
    goto LABEL_16;
  }
  v101 = v3;
  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@_%@_DK_@2x"), v3, v12);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingPathComponent:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageWithContentsOfFile:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v38 = (void *)v19;
    v3 = v101;
LABEL_16:

    if (!v4)
    {
      if (v18)
        goto LABEL_39;
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  v99 = (void *)v19;
  v100 = v4;
  v102 = v8;
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
  v26 = (void *)MEMORY[0x24BDF6F30];
  v112[0] = v24;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "traitCollectionWithTraitsFromCollections:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerImage:withTraitCollection:", v18, v29);

  v30 = (void *)MEMORY[0x24BDF6F30];
  v111[0] = v24;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "traitCollectionWithTraitsFromCollections:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerImage:withTraitCollection:", v23, v33);

  objc_msgSend(v25, "imageWithTraitCollection:", v97);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage;
  SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage = v34;

  SFLogForCategory(1uLL);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__strong _Nonnull)";
    v109 = 2112;
    v110 = (uint64_t)v14;
    _os_log_impl(&dword_20AC93000, v36, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
  }

  v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage;
LABEL_22:

LABEL_33:
  v4 = v100;
  v3 = v101;
  v8 = v102;
  v38 = v99;
LABEL_43:

  return v37;
}

id SFBuiltInRegulatoryImageForApplePencilModel(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), MGGetSInt32Answer());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), MGGetSInt32Answer());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@x%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@"), v1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    SFLogForCategory(1uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      SFBuiltInRegulatoryImageForApplePencilModel_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
    v13 = 0;
    goto LABEL_12;
  }
  v43 = v5;
  v44 = v8;
  objc_msgSend(CFSTR("RegulatoryInfo-"), "stringByAppendingFormat:", CFSTR("%@-%@_dark"), v1, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithContentsOfFile:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    SFLogForCategory(1uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForApplePencilModel(NSString *__strong _Nonnull)";
      v47 = 2112;
      v8 = v44;
      v48 = v44;
      _os_log_impl(&dword_20AC93000, v32, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
      v5 = v43;
    }
    else
    {
      v5 = v43;
      v8 = v44;
    }
LABEL_12:

    v31 = v12;
    goto LABEL_13;
  }
  v42 = v6;
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
  v20 = (void *)MEMORY[0x24BDF6F30];
  v50[0] = v18;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "traitCollectionWithTraitsFromCollections:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerImage:withTraitCollection:", v12, v23);

  v24 = (void *)MEMORY[0x24BDF6F30];
  v49[0] = v18;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "traitCollectionWithTraitsFromCollections:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerImage:withTraitCollection:", v17, v27);

  objc_msgSend(v19, "imageWithTraitCollection:", v41);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage;
  SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage = v28;

  SFLogForCategory(1uLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForApplePencilModel(NSString *__strong _Nonnull)";
    v47 = 2112;
    v48 = v44;
    _os_log_impl(&dword_20AC93000, v30, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
  }

  v31 = (id)SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage;
  v5 = v43;
  v6 = v42;
  v8 = v44;
LABEL_13:

  return v31;
}

id SFRegulatoryImage()
{
  void *v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "regulatoryImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

BOOL SFIsRegulatoryImageFromLockdown()
{
  uint64_t v0;
  char *v1;
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFData *v28;
  void *v29;
  CGImageSource *v30;
  CGImageSource *v31;
  size_t Count;
  size_t v33;
  CGImageRef ImageAtIndex;
  CGImage *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CGImageRef v70;
  CGImage *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  void *v85;
  CGImage *image;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  NSObject *obj;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint8_t v101[4];
  uint64_t v102;
  uint8_t v103[4];
  uint64_t v104;
  _QWORD v105[2];
  _QWORD v106[2];
  uint8_t v107[4];
  const char *v108;
  __int16 v109;
  void *v110;
  uint8_t buf[4];
  const char *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v100 = 1;
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (char *)v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = chmod(v1, 0x1FFu);
    free(v1);
    if (v3 && *__error() != 1)
    {
      SFLogForCategory(1uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        SFIsRegulatoryImageFromLockdown_cold_9(v4);

    }
    if (v2)
    {
      objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("RegulatoryImages"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("regulatory_images.plist"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      SFLogForCategory(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v112 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
        v113 = 2112;
        v114 = v7;
        _os_log_impl(&dword_20AC93000, v8, OS_LOG_TYPE_DEFAULT, "%{Public}s: Lockdown Regulatory Images at '%@'", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RegulatoryImages"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          SFLogForCategory(1uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            SFIsRegulatoryImageFromLockdown_cold_3(v12, v56, v57, v58, v59, v60, v61, v62);
          v46 = 0;
          goto LABEL_78;
        }
        v12 = MGCopyAnswer();
        v13 = (void *)MGCopyAnswer();
        -[NSObject stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("-%@"), v13);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSObject length](v12, "length");
        SFLogForCategory(1uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            SFIsRegulatoryImageFromLockdown_cold_4(v16, v63, v64, v65, v66, v67, v68, v69);
          goto LABEL_76;
        }
        v91 = v10;
        v92 = v13;
        v89 = v7;
        v90 = v2;
        v17 = v94;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v112 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
          v113 = 2112;
          v114 = v94;
          _os_log_impl(&dword_20AC93000, v16, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looking for Lockdown Regulatory Image '%@'", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scale");
        v20 = v19;

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v93 = v11;
        obj = v11;
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, buf, 16);
        if (!v21)
        {
LABEL_43:

          v2 = v90;
          v10 = v91;
          v13 = v92;
          v11 = v93;
          goto LABEL_74;
        }
        v22 = v21;
        v23 = *(_QWORD *)v97;
LABEL_17:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v97 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v24);
          objc_msgSend(v25, "objectForKey:", CFSTR("ImageId"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          SFLogForCategory(1uLL);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v107 = 136315394;
            v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
            v109 = 2112;
            v110 = v26;
            _os_log_impl(&dword_20AC93000, v27, OS_LOG_TYPE_DEFAULT, "%{Public}s: Candidate Lockdown Regulatory Image '%@'", v107, 0x16u);
          }

          if (-[NSObject caseInsensitiveCompare:](v12, "caseInsensitiveCompare:", v26)
            && objc_msgSend(v17, "caseInsensitiveCompare:", v26))
          {
            goto LABEL_41;
          }
          objc_msgSend(v25, "objectForKey:", CFSTR("ImageData"));
          v28 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("ImageDelta"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "BOOLValue");

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = CGImageSourceCreateWithData(v28, 0);
            if (v30)
            {
              v31 = v30;
              Count = CGImageSourceGetCount(v30);
              if (Count)
              {
                v33 = Count;
                ImageAtIndex = CGImageSourceCreateImageAtIndex(v31, 0, 0);
                v35 = ImageAtIndex;
                if (v33 == 2)
                {
                  v70 = CGImageSourceCreateImageAtIndex(v31, 1uLL, 0);
                  v71 = v70;
                  if (v35 && v70)
                  {
                    v87 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v35, 0, v20);
                    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v71, 0, v20);
                    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v20);
                    image = v71;
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
                    v74 = (void *)MEMORY[0x24BDF6F30];
                    v106[0] = v72;
                    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v106[1] = v75;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "traitCollectionWithTraitsFromCollections:", v76);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "registerImage:withTraitCollection:", v87, v77);

                    v78 = (void *)MEMORY[0x24BDF6F30];
                    v105[0] = v72;
                    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v105[1] = v79;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "traitCollectionWithTraitsFromCollections:", v80);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "registerImage:withTraitCollection:", v88, v81);

                    objc_msgSend(v73, "imageWithTraitCollection:", v85);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    CGImageRelease(v35);
                    CGImageRelease(image);
                    CFRelease(v31);
                    SFLogForCategory(1uLL);
                    v82 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v107 = 136315394;
                      v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                      v109 = 2112;
                      v110 = v26;
                      _os_log_impl(&dword_20AC93000, v82, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched style-sensitive Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                    }

                    v7 = v89;
                    v2 = v90;
                    v10 = v91;
                    v83 = v87;
                  }
                  else
                  {
                    if (v35)
                      CGImageRelease(v35);
                    v10 = v91;
                    if (v71)
                      CGImageRelease(v71);
                    CFRelease(v31);
                    SFLogForCategory(1uLL);
                    v83 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                      SFIsRegulatoryImageFromLockdown_cold_7();
                    v46 = 0;
                    v7 = v89;
                    v2 = v90;
                  }
LABEL_73:

                  v13 = v92;
                  v11 = v93;
                  if (v46)
                    goto LABEL_77;
LABEL_74:
                  SFLogForCategory(1uLL);
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                    SFIsRegulatoryImageFromLockdown_cold_5();
LABEL_76:

                  v46 = 0;
LABEL_77:

LABEL_78:
LABEL_79:

                  goto LABEL_80;
                }
                v17 = v94;
                if (ImageAtIndex)
                {
                  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", ImageAtIndex, 0, v20);
                  CGImageRelease(v35);
                  CFRelease(v31);
                  SFLogForCategory(1uLL);
                  v83 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v107 = 136315394;
                    v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                    v109 = 2112;
                    v110 = v26;
                    _os_log_impl(&dword_20AC93000, v83, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched Lockdown Regulatory Image '%@'", v107, 0x16u);
                  }
                  v2 = v90;
                  v10 = v91;
                  goto LABEL_73;
                }
                SFLogForCategory(1uLL);
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v107 = 136315394;
                  v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                  v109 = 2112;
                  v110 = v26;
                  _os_log_error_impl(&dword_20AC93000, v36, OS_LOG_TYPE_ERROR, "%{Public}s: Failed decoding Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                }
              }
              else
              {
                SFLogForCategory(1uLL);
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v107 = 136315394;
                  v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                  v109 = 2112;
                  v110 = v26;
                  _os_log_error_impl(&dword_20AC93000, v36, OS_LOG_TYPE_ERROR, "%{Public}s: Empty Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                }
                v17 = v94;
              }

              CFRelease(v31);
              goto LABEL_40;
            }
            SFLogForCategory(1uLL);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              SFIsRegulatoryImageFromLockdown_cold_6(v103, &v104, v37);
          }
          else
          {
            SFLogForCategory(1uLL);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              SFIsRegulatoryImageFromLockdown_cold_8(v101, &v102, v37);
          }

LABEL_40:
LABEL_41:

          if (v22 == ++v24)
          {
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, buf, 16);
            if (v22)
              goto LABEL_17;
            goto LABEL_43;
          }
        }
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "fileExistsAtPath:", v7);

      if (v48)
      {
        SFLogForCategory(1uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          SFIsRegulatoryImageFromLockdown_cold_2(v11, v49, v50, v51, v52, v53, v54, v55);
        v46 = 0;
        goto LABEL_79;
      }
      v46 = 0;
LABEL_80:

    }
    else
    {
      v46 = 0;
    }
    v38 = v46;

    v45 = v38;
  }
  else
  {
    SFLogForCategory(1uLL);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      SFIsRegulatoryImageFromLockdown_cold_1((uint64_t)&v100, v38, v39, v40, v41, v42, v43, v44);
    v45 = 0;
  }

  return v45 != 0;
}

id SFIndiaBISNumber()
{
  void *v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "indiaBISRegulatoryNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id SFIndiaBISRegulatoryImage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("IndiaBISMarking"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SFCountryOfOrigin()
{
  void *v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryOfOriginString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id SFAcknowledgementsDocumentFilePath()
{
  if (SFAcknowledgementsDocumentFilePath_onceToken != -1)
    dispatch_once(&SFAcknowledgementsDocumentFilePath_onceToken, &__block_literal_global_278);
  return (id)SFAcknowledgementsDocumentFilePath___path;
}

id SFAudioAccessoryAcknowledgementsDocumentFilePath()
{
  if (SFAudioAccessoryAcknowledgementsDocumentFilePath_onceToken != -1)
    dispatch_once(&SFAudioAccessoryAcknowledgementsDocumentFilePath_onceToken, &__block_literal_global_289);
  return (id)SFAudioAccessoryAcknowledgementsDocumentFilePath___path;
}

id SFRoHSComplianceDocumentFilePath()
{
  if (SFRoHSComplianceDocumentFilePath_onceToken != -1)
    dispatch_once(&SFRoHSComplianceDocumentFilePath_onceToken, &__block_literal_global_292);
  return (id)SFRoHSComplianceDocumentFilePath___path;
}

id SFBuiltInAppsDocumentFilePath()
{
  if (SFBuiltInAppsDocumentFilePath_onceToken != -1)
    dispatch_once(&SFBuiltInAppsDocumentFilePath_onceToken, &__block_literal_global_308);
  return (id)SFBuiltInAppsDocumentFilePath___path;
}

id SFLocalizedMultipickerStringForKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = SFLocalizedMultipickerStringForKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&SFLocalizedMultipickerStringForKey_onceToken, &__block_literal_global_313);
  objc_msgSend((id)SFLocalizedMultipickerStringForKey___multipickerBundle, "localizedStringForKey:value:table:", v2, 0, CFSTR("Multiterms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SFRFExposureDocumentHTMLString()
{
  void *v0;
  __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RF_INTRO"));
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("RF_INTRO_IPHONE")))
  {
    if (SFDeviceSupportsFall2020OrLaterELabel())
    {

      v1 = CFSTR("RF_INTRO_IPHONE_2020");
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MGCopyAnswer();
    v4 = v3;
    if (v3)
    {
      v5 = v3;

      v2 = v5;
    }
    else
    {
      SFLogForCategory(1uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        SFRFExposureDocumentHTMLString_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", v2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    _SFRFExposureDocumentLocalizedStringForKey(v1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v14, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v0, "appendString:", v17);
  }
  else
  {
    if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("RF_INTRO_IPAD"))
      && SFDeviceSupportsSpring2021OrLaterELabel())
    {

      v1 = CFSTR("RF_INTRO_IPAD_2021");
    }
    _SFRFExposureDocumentLocalizedStringForKey(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appendString:", v2);
  }

  _SFRFExposureDocumentLocalizedStringForKey(CFSTR("RF_URL_INFO"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sf_productType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("www.apple.com/legal/rfexposure/%@/%@/"), v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<a href=\"http://%@\">%@</a>"), v23, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "appendFormat:", v18, v24);
  if ((MGGetBoolAnswer() & 1) != 0 || MGGetBoolAnswer())
  {
    if (MGGetBoolAnswer()
      && MGGetBoolAnswer()
      && !SFDeviceSupportsSpring2021OrLaterELabel())
    {
      v25 = CFSTR("CELLULAR_INFO_WPT");
    }
    else if (-[__CFString hasPrefix:](v1, "hasPrefix:", CFSTR("RF_INTRO_IPHONE"))
           && SFDeviceSupportsFall2020OrLaterELabel())
    {
      v25 = CFSTR("CELLULAR_INFO_2020");
    }
    else
    {
      v25 = CFSTR("CELLULAR_INFO");
    }
    _SFRFExposureDocumentLocalizedStringForKey(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appendString:", v26);

  }
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceLayoutDirection");
  v29 = CFSTR("ltr");
  if (v28 == 1)
    v29 = CFSTR("rtl");
  v30 = v29;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<!DOCTYPE html><html dir=\"%@\"><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/><meta charset=\"utf-8\"><title></title><style type=\"text/css\">:root { supported-color-schemes: light dark; } body  { font: -apple-system-body; word-wrap: break-word;-khtml-nbsp-mode: space;-khtml-line-break: after-white-space; color: -apple-system-label; } p.indented { margin-right: 37.0px; }</style></head><body>%@</body></html>"),
    v30,
    v0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id _SFRFExposureDocumentLocalizedStringForKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _SFRFExposureDocumentLocalizedStringForKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_SFRFExposureDocumentLocalizedStringForKey_onceToken, &__block_literal_global_393);
  objc_msgSend((id)_SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle, "localizedStringForKey:value:table:", v2, 0, CFSTR("RFExposure"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

id getSTManagementState()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSTManagementStateClass_softClass;
  v7 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSTManagementStateClass_block_invoke;
    v3[3] = &unk_24C397E80;
    v3[4] = &v4;
    __getSTManagementStateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  return (id)objc_opt_new();
}

void sub_20ACA2BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20ACA308C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSTManagementStateClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("STManagementState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getSTManagementStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void _SFBuiltInRegulatoryImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: No Regulatory Image found using variant, using model instead '%{Public}@'.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _SFBuiltInRegulatoryImage_cold_2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_20AC93000, v2, OS_LOG_TYPE_DEBUG, "%{Public}s: Looking up Built-in Regulatory Image for '%{Public}@-%{Public}@'.", (uint8_t *)v3, 0x20u);
}

void _SFLicenseFilePathForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{public}s: Cannot resolve license file path for an empty bundle name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _SFLicenseVersionNumberForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{public}s: Cannot resolve license version number for an empty bundle name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _SFLicenseVersionNumberForBundleWithName_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136446722;
  v6 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  v7 = 2114;
  v8 = CFSTR("License_version");
  v9 = 2114;
  v10 = v3;
  OUTLINED_FUNCTION_6(&dword_20AC93000, a2, v4, "%{public}s: Cannot resolve '%{public}@' inside bundle '%{public}@'", (uint8_t *)&v5);

}

void _SFLicenseVersionNumberForBundleWithName_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446722;
  v4 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  v5 = 2114;
  v6 = _SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
  v7 = 2114;
  v8 = a1;
  OUTLINED_FUNCTION_6(&dword_20AC93000, a2, a3, "%{public}s: Cannot load contents of %{public}@, error: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void _SFLicenseVersionNumberForBundleWithName_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446722;
  v4 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = _SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
  OUTLINED_FUNCTION_7(&dword_20AC93000, a2, a3, "%{public}s: License version path for '%{public}@' resolved to: '%{public}@' .", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void _SFWarrantyFilePathForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{public}s: Cannot resolve warranty file path for an empty bundle name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: Failed to resolve to a Built-in Regulatory Image", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_20AC93000, v0, OS_LOG_TYPE_DEBUG, "%{Public}s: No Regulatory Image found using variant, using model instead '%{Public}@'.", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_3()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_7(&dword_20AC93000, v2, (uint64_t)v2, "%{Public}s: Looking up Built-in Regulatory Image for variant '%{Public}@' '%{Public}@'.", (uint8_t *)v3);
  OUTLINED_FUNCTION_5();
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_4()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_20AC93000, v1, OS_LOG_TYPE_DEBUG, "%{Public}s: Looking up Built-in Regulatory Image for variant '%{Public}@' @%{Public}dx.", (uint8_t *)v2, 0x1Cu);
  OUTLINED_FUNCTION_5();
}

void SFBuiltInRegulatoryImageForApplePencilModel_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: Failed to resolve to a Built-in Regulatory Image For Apple Pencil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20AC93000, a2, a3, "%{Public}s: Failed to get group path for Lockdown Regulatory Images! error = %llu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: Cannot process Lockdown Regulatory Images container", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: No Lockdown Regulatory Images in container", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: No Lockdown Regulatory Image device model", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: No matching Lockdown Regulatory Image for '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_6(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  OUTLINED_FUNCTION_4(&dword_20AC93000, a3, (uint64_t)a3, "%{Public}s: No Lockdown Regulatory Image source", a1);
}

void SFIsRegulatoryImageFromLockdown_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Failed decoding style-sensitive Lockdown Regulatory Image '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void SFIsRegulatoryImageFromLockdown_cold_8(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  OUTLINED_FUNCTION_4(&dword_20AC93000, a3, (uint64_t)a3, "%{Public}s: Lockdown Regulatory Image not data", a1);
}

void SFIsRegulatoryImageFromLockdown_cold_9(NSObject *a1)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3 = 136315394;
  v4 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_20AC93000, a1, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to set permissions on Lockdown Regulatory Images group path, errno %i", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_5();
}

void SFRFExposureDocumentHTMLString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: kMGQRFExposureSeparationDistance is blank for this device! Please file a bug on Gestalt!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __getSTManagementStateClass_block_invoke_cold_1()
{
  abort_report_np();
  SFLogForCategory_cold_1();
}

void SFLogForCategory_cold_1()
{
  __assert_rtn("SFLogForCategory", "SFLogging.m", 14, "category < SFLoggingCategoryCount");
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t AMFIIsDeveloperModeEnabled()
{
  return MEMORY[0x24BE086B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x24BE04668]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x24BE3D620]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x24BED8460]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

uint64_t SecKeyFromPassphraseDataHMACSHA1()
{
  return MEMORY[0x24BDE8B58]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BDF7CC8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x24BDB01F0]();
}

