@implementation PSSystemPolicyManager

uint64_t __38__PSSystemPolicyManager_hasAnyAppClip__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "appClipMetadata");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") != 0;

  }
  return v3;
}

+ (id)thirdPartyApplicationsIncludingAppClips:(BOOL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PSThirdPartyApp *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "_thirdPartyApplicationProxies", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (a3
          || (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "appClipMetadata"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v12,
              !v12))
        {
          v13 = -[PSThirdPartyApp initWithApplicationRecord:]([PSThirdPartyApp alloc], "initWithApplicationRecord:", v11);
          -[PSThirdPartyApp load](v13, "load");
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)specifiersForThirdPartyApps:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v4)
  {
    v5 = v4;
    v21 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "record");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("Settings.bundle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, a1, 0, 0, objc_opt_class(), 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProperty:forKey:", CFSTR("Root"), CFSTR("File"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProperty:forKey:", v15, CFSTR("useLazyIcons"));

          objc_msgSend(v14, "setProperty:forKey:", v10, CFSTR("appIDForLazyIcon"));
          objc_msgSend(v14, "setProperty:forKey:", v12, CFSTR("AppSettingsBundle"));
          objc_msgSend(v14, "setProperty:forKey:", v10, CFSTR("AppBundleID"));
          objc_msgSend(v14, "setProperty:forKey:", v10, CFSTR("id"));
          objc_msgSend(v14, "setProperty:forKey:", v10, CFSTR("restrictByID"));
          if (!PSIsSpecifierHiddenDueToRestrictions(v14))
            objc_msgSend(v18, "addObject:", v14);

        }
        else
        {
          _PSLoggingFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          objc_msgSend(v8, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v27 = "+[PSSystemPolicyManager specifiersForThirdPartyApps:]";
          v28 = 2112;
          v29 = v13;
          v30 = 2112;
          v31 = v8;
          _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "%s - settingsBundleURL is nil for (%@) %@ ", buf, 0x20u);
        }

LABEL_13:
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

+ (id)_thirdPartyApplicationProxies
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  PSGreenTeaAppListLog(CFSTR("Reading AppList from LSEnumerator"), v3, v4, v5, v6, v7, v8, v9, v33);
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 128);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v14), "compatibilityObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v12);
  }
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFilter:", &__block_literal_global_8);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v21), "compatibilityObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("kInternalPreferencesLoadsAllSettingsBundles"));

  +[PSSystemPolicyManager _populateBBSectionIDs](PSSystemPolicyManager, "_populateBBSectionIDs");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v2;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v30);
        if (v25 && (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v30), "hasSettingsBundle", (_QWORD)v33) & 1) != 0
          || (objc_msgSend(v31, "isManagedAppDistributor", (_QWORD)v33) & 1) != 0
          || +[PSSystemPolicyManager isInstalledByThirdPartyMarketplace:](PSSystemPolicyManager, "isInstalledByThirdPartyMarketplace:", v31)|| +[PSSystemPolicyManager _shouldIncludeProxy:](PSSystemPolicyManager, "_shouldIncludeProxy:", v31))
        {
          objc_msgSend(v23, "addObject:", v31);
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v28);
  }

  return v23;
}

+ (BOOL)isInstalledByThirdPartyMarketplace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "iTunesMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distributorInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distributorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "iTunesMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "distributorInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "distributorIsFirstPartyApple") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)_shouldIncludeProxy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "compatibilityObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA5830]) & 1) != 0)
  {
    v6 = (objc_msgSend(v3, "hasSettingsBundle") & 1) != 0
      || +[PSSystemPolicyManager _systemSettingsNeededForProxy:](PSSystemPolicyManager, "_systemSettingsNeededForProxy:", v3);
  }
  else
  {
    objc_msgSend(v3, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PlaygroundsBeta")) & 1) != 0)
      v6 = (objc_msgSend(v3, "hasSettingsBundle") & 1) != 0
        || +[PSSystemPolicyManager _systemSettingsNeededForProxy:](PSSystemPolicyManager, "_systemSettingsNeededForProxy:", v3);
    else
      v6 = 0;

  }
  return v6;
}

+ (void)_populateBBSectionIDs
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  +[PSNotificationSettingsController sharedInstance](PSNotificationSettingsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSectionInfoIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)gBBSectionIDs;
  gBBSectionIDs = v3;

  objc_sync_exit(obj);
}

+ (id)thirdPartyApplications
{
  return (id)objc_msgSend(a1, "thirdPartyApplicationsIncludingAppClips:", 1);
}

+ (BOOL)hasAnyAppClip
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  PSGreenTeaAppListLog(CFSTR("Reading AppList from LSApplicationRecord"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v12);
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v10 != 0;

  return (char)v9;
}

+ (id)thirdPartyApplicationForBundleID:(id)a3
{
  void *v3;
  PSThirdPartyApp *v4;

  objc_msgSend(a1, "_thirdPartyApplicationProxyForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSThirdPartyApp initWithApplicationRecord:]([PSThirdPartyApp alloc], "initWithApplicationRecord:", v3);
  -[PSThirdPartyApp load](v4, "load");

  return v4;
}

uint64_t __54__PSSystemPolicyManager__thirdPartyApplicationProxies__block_invoke(uint64_t a1, void *a2)
{
  return PSIsWebAppPlaceholder(a2);
}

+ (id)_thirdPartyApplicationProxyForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[PSSystemPolicyManager _populateBBSectionIDs](PSSystemPolicyManager, "_populateBBSectionIDs");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);

  if (v4
    && +[PSSystemPolicyManager _shouldIncludeProxy:](PSSystemPolicyManager, "_shouldIncludeProxy:", v4)
    || (objc_msgSend(v4, "isManagedAppDistributor") & 1) != 0
    || +[PSSystemPolicyManager isInstalledByThirdPartyMarketplace:](PSSystemPolicyManager, "isInstalledByThirdPartyMarketplace:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_systemSettingsNeededForProxy:(id)a3
{
  id v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (+[PSSystemPolicyManager _privacySettingsNeededForProxy:](PSSystemPolicyManager, "_privacySettingsNeededForProxy:", v3)|| +[PSSystemPolicyManager _photosSettingsNeededForProxy:](PSSystemPolicyManager, "_photosSettingsNeededForProxy:", v3)|| +[PSSystemPolicyManager _backgroundAppRefreshSettingsNeededForProxy:](PSSystemPolicyManager, "_backgroundAppRefreshSettingsNeededForProxy:", v3))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PSSystemPolicyManager _cellularDataSettingsNeededForBundleID:](PSSystemPolicyManager, "_cellularDataSettingsNeededForBundleID:", v6))
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[PSSystemPolicyManager _notificationSettingsNeededForBundleID:](PSSystemPolicyManager, "_notificationSettingsNeededForBundleID:", v7))
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[PSSystemPolicyManager _documentSettingsNeededForBundleID:](PSSystemPolicyManager, "_documentSettingsNeededForBundleID:", v8))
        {
          v4 = 1;
        }
        else
        {
          objc_msgSend(v3, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[PSSystemPolicyManager _defaultAppSettingsNeededForBundleID:](PSSystemPolicyManager, "_defaultAppSettingsNeededForBundleID:", v9))
          {
            v4 = 1;
          }
          else
          {
            objc_msgSend(v3, "bundleIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[PSSystemPolicyManager _languageSettingNeededForBundleID:](PSSystemPolicyManager, "_languageSettingNeededForBundleID:", v10))
            {
              v4 = 1;
            }
            else
            {
              objc_msgSend(v3, "bundleIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[PSSystemPolicyManager _familyControlsSettingNeededForBundleID:](PSSystemPolicyManager, "_familyControlsSettingNeededForBundleID:", v11))
              {
                v4 = 1;
              }
              else
              {
                objc_msgSend(v3, "bundleIdentifier");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (+[PSSystemPolicyManager _liveActivitiesSettingsNeededForBundleID:](PSSystemPolicyManager, "_liveActivitiesSettingsNeededForBundleID:", v12))
                {
                  v4 = 1;
                }
                else
                {
                  objc_msgSend(v3, "bundleIdentifier");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (+[PSSystemPolicyManager _tapToPaySettingsNeededForBundleID:](PSSystemPolicyManager, "_tapToPaySettingsNeededForBundleID:"))
                  {
                    v4 = 1;
                  }
                  else
                  {
                    objc_msgSend(v3, "bundleIdentifier");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    v4 = +[PSSystemPolicyManager _pasteboardSettingsNeededForBundleID:](PSSystemPolicyManager, "_pasteboardSettingsNeededForBundleID:", v13);

                  }
                }

              }
            }

          }
        }

      }
    }

  }
  return v4;
}

+ (BOOL)_privacySettingsNeededForProxy:(id)a3
{
  id v3;
  const __CFAllocator *Default;
  const __CFURL *v5;
  CFBundleRef v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  Default = CFAllocatorGetDefault();
  objc_msgSend(v3, "URL");
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = CFBundleCreate(Default, v5);

  if (v6)
  {
    v7 = (void *)TCCAccessCopyInformationForBundle();
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "count");
  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v8)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      objc_msgSend(v3, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_INFO, "privacy == %@ for '%@'", (uint8_t *)&v13, 0x16u);

    }
  }

  return v8 != 0;
}

+ (BOOL)_photosSettingsNeededForProxy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v4);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_backgroundAppRefreshSettingsNeededForProxy:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "UIBackgroundModes", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("remote-notification")))
        {
          objc_msgSend(v9, "isEqualToString:", CFSTR("fetch"));
LABEL_16:
          if (_os_feature_enabled_impl())
          {
            PKLogForCategory(2);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v3, "bundleIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v21 = v14;
              _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_INFO, "backgroundAppRefresh == YES for '%@'", buf, 0xCu);

            }
          }
          v12 = 1;
          goto LABEL_21;
        }
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("newsstand-content"));
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("fetch")) & 1) != 0 || v10)
          goto LABEL_16;
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_INFO, "backgroundAppRefresh == NO for '%@'", buf, 0xCu);

    }
    v12 = 0;
LABEL_21:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_dataUsageWorkspaceInfo
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint64_t v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  v7 = 0;
  v9 = 0u;
  v10 = 0;
  v8 = a1;
  v2 = _CTServerConnectionCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    _CTServerConnectionCopyCellularUsageWorkspaceInfo();
    CFRelease(v3);
  }
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the data usage workspace information", v6, 2u);
  }

  return v11;
}

+ (BOOL)_cellularDataSettingsNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (MGGetBoolAnswer())
  {
    if (_cellularDataSettingsNeededForBundleID__onceToken != -1)
      dispatch_once(&_cellularDataSettingsNeededForBundleID__onceToken, &__block_literal_global_30);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend((id)_cellularDataSettingsNeededForBundleID__workspace, "persistentStoreCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_2;
    v10[3] = &unk_1E4A658F0;
    v5 = v3;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v4, "performBlockAndWait:", v10);

    if (_os_feature_enabled_impl())
    {
      PKLogForCategory(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if (*((_BYTE *)v14 + 24))
          v7 = CFSTR("YES");
        else
          v7 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_INFO, "cellularData == %@ for '%@'", buf, 0x16u);
      }

    }
    v8 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  +[PSSystemPolicyManager _dataUsageWorkspaceInfo](PSSystemPolicyManager, "_dataUsageWorkspaceInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0CA7348]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0CA7350]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = (void *)_cellularDataSettingsNeededForBundleID__workspace;
    _cellularDataSettingsNeededForBundleID__workspace = 0;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v6 = (void *)getAnalyticsWorkspaceClass_softClass;
    v22 = getAnalyticsWorkspaceClass_softClass;
    v7 = MEMORY[0x1E0C809B0];
    if (!getAnalyticsWorkspaceClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getAnalyticsWorkspaceClass_block_invoke;
      v18[3] = &unk_1E4A65650;
      v18[4] = &v19;
      __getAnalyticsWorkspaceClass_block_invoke((uint64_t)v18);
      v6 = (void *)v20[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v19, 8);
    v9 = objc_msgSend([v8 alloc], "initWorkspaceWithName:atPath:useReadOnly:", v1, v3, 1);
    v10 = (void *)_cellularDataSettingsNeededForBundleID__workspace;
    _cellularDataSettingsNeededForBundleID__workspace = v9;

    objc_msgSend((id)_cellularDataSettingsNeededForBundleID__workspace, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_31;
    v11[3] = &unk_1E4A65650;
    v11[4] = &v12;
    objc_msgSend(v5, "performBlockAndWait:", v11);
  }

  objc_storeStrong((id *)&_cellularDataSettingsNeededForBundleID__processAnalytics, (id)v13[5]);
  _Block_object_dispose(&v12, 8);

}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_31(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getProcessAnalyticsClass_softClass;
  v12 = getProcessAnalyticsClass_softClass;
  if (!getProcessAnalyticsClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getProcessAnalyticsClass_block_invoke;
    v8[3] = &unk_1E4A65650;
    v8[4] = &v9;
    __getProcessAnalyticsClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = [v3 alloc];
  v5 = objc_msgSend(v4, "initWithWorkspace:withCache:", _cellularDataSettingsNeededForBundleID__workspace, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_cellularDataSettingsNeededForBundleID__processAnalytics;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleName like %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchEntitiesFreeForm:sortDesc:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v11)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (BOOL)_tapToPaySettingsNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getPRSettingsProviderClass_softClass;
  v11 = getPRSettingsProviderClass_softClass;
  if (!getPRSettingsProviderClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPRSettingsProviderClass_block_invoke;
    v7[3] = &unk_1E4A65650;
    v7[4] = &v8;
    __getPRSettingsProviderClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  LOBYTE(v5) = objc_msgSend(v5, "isProximityReaderSupported:", v3);

  return (char)v5;
}

+ (BOOL)_pasteboardSettingsNeededForBundleID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v10;
  id v11;
  id v12;

  v3 = a3;
  v4 = *MEMORY[0x1E0DB1180];
  v11 = 0;
  v12 = 0;
  v10 = 0;
  PSGetAuthorizationStatesForService(v4, &v12, &v11, &v10);
  v5 = v12;
  v6 = v11;
  v7 = v10;
  if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0 || (objc_msgSend(v6, "containsObject:", v3) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "containsObject:", v3);

  return v8;
}

+ (BOOL)_journalingSuggestionsSettingsNeededForBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  LOBYTE(v4) = objc_msgSend(v5, "supportsJournalingSuggestions");
  return (char)v4;
}

+ (BOOL)_liveActivitiesSettingsNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v7;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v7 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v7);
    v5 = objc_msgSend(v4, "supportsLiveActivities");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_notificationSettingsNeededForBundleID:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = objc_msgSend((id)gBBSectionIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_INFO, "notification == %@ for '%@'", (uint8_t *)&v10, 0x16u);
    }

  }
  return v6;
}

+ (BOOL)_documentSettingsNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UISupportsDocumentBrowser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v7)
        v9 = CFSTR("YES");
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_INFO, "document == %@ for '%@'", (uint8_t *)&v11, 0x16u);
    }

  }
  return v7;
}

+ (BOOL)_defaultAppSettingsNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
  v5 = v10;
  if ((objc_msgSend(v4, "isEligibleWebBrowser") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isEligibleMailClient");
  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_INFO, "defaultApp == %@ for '%@'", buf, 0x16u);
    }

  }
  return v6;
}

+ (BOOL)_languageSettingNeededForBundleID:(id)a3
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  unint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v18 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v18);
  v5 = v18;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      _os_feature_enabled_impl();
    }
    else
    {
      objc_msgSend(v7, "objectForInfoDictionaryKey:", CFSTR("UIPrefersShowingLanguageSettings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (_os_feature_enabled_impl() && (v11 & 1) == 0)
      {
        PKLogForCategory(2);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v3;
          _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_INFO, "language == NO for '%@'", buf, 0xCu);
        }
        v13 = 0;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      if (!v11)
      {
        v13 = 0;
        goto LABEL_17;
      }
    }
    objc_msgSend(v7, "normalizedLocalizations");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject count](v12, "count");
    v13 = v14 > 1;
    if (_os_feature_enabled_impl())
    {
      PKLogForCategory(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = CFSTR("NO");
        if (v14 > 1)
          v16 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = v3;
        _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_INFO, "language == %@ for '%@'", buf, 0x16u);
      }

    }
    goto LABEL_16;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

+ (BOOL)_familyControlsSettingNeededForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[128];
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v4 = (void *)getFOAuthorizationCenterClass_softClass;
  v23 = getFOAuthorizationCenterClass_softClass;
  if (!getFOAuthorizationCenterClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getFOAuthorizationCenterClass_block_invoke;
    v27 = &unk_1E4A65650;
    v28 = &v20;
    __getFOAuthorizationCenterClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v5, "sharedCenter", (_QWORD)v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationRecords");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if (v12)
        {
          if (_os_feature_enabled_impl())
          {
            PKLogForCategory(2);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v3;
              _os_log_impl(&dword_1A3819000, v14, OS_LOG_TYPE_INFO, "familyControls == YES for '%@'", (uint8_t *)&buf, 0xCu);
            }

          }
          v13 = 1;
          goto LABEL_20;
        }
      }
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (_os_feature_enabled_impl())
  {
    PKLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_INFO, "familyControls == NO for '%@'", (uint8_t *)&buf, 0xCu);
    }
    v13 = 0;
LABEL_20:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
