@implementation UNCNotificationSourceDescription(Factory)

+ (const)systemSourcePathExtension
{
  return CFSTR("bundle");
}

+ (id)systemSourceDirectoryURLs
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (UNIsInternalInstall())
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    BSSystemRootDirectory();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v2;
    v8[1] = CFSTR("AppleInternal");
    v8[2] = CFSTR("Library");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "pathWithComponents:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "arrayByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v5;
  }
  objc_msgSend(v0, "bs_map:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)applicationSourceDescriptionWithBundleIdentifier:()Factory
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correspondingApplicationRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unc_isEligibleToDeliverNotifications");

    if (v6)
    {
      objc_msgSend(a1, "applicationSourceDescriptionWithApplication:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)applicationSourceDescriptionWithApplication:()Factory
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  BOOL v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  int v50;
  uint64_t v51;
  unsigned int CanDonateIntent;
  const __CFString *v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  int v71;
  void *v72;
  int v73;
  void *v74;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  int v79;
  id v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  const __CFString *v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  const __CFString *v117;
  __int16 v118;
  uint64_t v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = 0;
    goto LABEL_79;
  }
  v93 = a1;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataContainerURL");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupContainerURLs");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BEBF420]);
  v96 = (void *)v6;
  objc_msgSend(v10, "setBundleIdentifier:", v6);
  v95 = (void *)v7;
  objc_msgSend(v10, "setBundleURL:", v7);
  v92 = (void *)v8;
  objc_msgSend(v10, "setDataContainerURL:", v8);
  v91 = (void *)v9;
  objc_msgSend(v10, "setGroupContainerURLS:", v9);
  objc_msgSend(v5, "appState");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRestricted:", objc_msgSend(v90, "isRestricted"));
  v11 = v5;
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v12, "deviceClass");

  v84 = v7;
  v97 = v11;
  if ((_DWORD)v7 == 4)
  {
    v108 = 0uLL;
    v109 = 0uLL;
    v106 = 0uLL;
    v107 = 0uLL;
    objc_msgSend(v11, "plugInKitPlugins");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
    if (v22)
    {
      v23 = v22;
      v88 = v5;
      v24 = *(_QWORD *)v107;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v107 != v24)
            objc_enumerationMutation(v13);
          v26 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          objc_msgSend(v26, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSExtensionPointIdentifier"), objc_opt_class(), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.watchkit"));

          if (v28)
          {
            v29 = v26;
            v11 = v97;
            v30 = v97;
LABEL_25:

            v5 = v88;
            goto LABEL_26;
          }
        }
        v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
        if (v23)
          continue;
        goto LABEL_21;
      }
    }
LABEL_22:
    v29 = v11;
    goto LABEL_26;
  }
  v104 = 0uLL;
  v105 = 0uLL;
  v102 = 0uLL;
  v103 = 0uLL;
  objc_msgSend(v11, "plugInKitPlugins");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (!v14)
    goto LABEL_22;
  v15 = v14;
  v88 = v5;
  v16 = *(_QWORD *)v103;
  v17 = *MEMORY[0x24BEBF4F8];
  while (2)
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v103 != v16)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
      objc_msgSend(v19, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSExtensionPointIdentifier"), objc_opt_class(), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v17);

      if (v21)
      {
        objc_msgSend(v19, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.filtering"), objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAllowServiceExtensionFiltering:", objc_msgSend(v30, "BOOLValue"));
        v11 = v97;
        v29 = v97;
        goto LABEL_25;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    if (v15)
      continue;
    break;
  }
LABEL_21:
  v11 = v97;
  v29 = v97;
  v5 = v88;
LABEL_26:

  objc_msgSend(v11, "correspondingApplicationRecord");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "localizedName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplayName:", v33);

    objc_msgSend(v32, "appClipMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsAppClip:", v34 != 0);

    objc_msgSend(v32, "appClipMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWantsEphemeralNotifications:", objc_msgSend(v35, "wantsEphemeralNotifications"));

  }
  v89 = v32;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v36 = objc_opt_class();
  objc_msgSend(v29, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.icloud-services"), v36, objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v99;
    while (2)
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v99 != v40)
          objc_enumerationMutation(v37);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * k), "caseInsensitiveCompare:", CFSTR("cloudkit")))
        {
          v42 = 1;
          goto LABEL_38;
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
      if (v39)
        continue;
      break;
    }
    v42 = 0;
LABEL_38:
    v11 = v97;
  }
  else
  {
    v42 = 0;
  }

  objc_msgSend(v10, "setUsesCloudKit:", v42);
  objc_msgSend(v29, "entitlementValueForKey:ofClass:", CFSTR("aps-environment"), objc_opt_class());
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "_validEnvironmentFromEnvironment:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPushEnvironment:");
  objc_msgSend(v29, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.critical-alerts"), objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v84 != 4 || v29 == v11;
  if (!v43 && !v45)
  {
    objc_msgSend(v11, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.critical-alerts"), objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85 = v43;
  objc_msgSend(v10, "setAllowCriticalAlerts:", objc_msgSend(v43, "BOOLValue"));
  objc_msgSend(v29, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.time-sensitive"), objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    v47 = 1;
  else
    v47 = v45;
  if ((v47 & 1) == 0)
  {
    objc_msgSend(v11, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.time-sensitive"), objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v83 = v46;
  v81 = objc_msgSend(v46, "BOOLValue");
  objc_msgSend(v10, "setAllowTimeSensitive:");
  objc_msgSend(v29, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.communication"), objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    v49 = 1;
  else
    v49 = v45;
  if ((v49 & 1) == 0)
  {
    objc_msgSend(v11, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.communication"), objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v82 = v48;
  v50 = objc_msgSend(v48, "BOOLValue");
  v79 = objc_msgSend(v96, "un_isFirstPartyIdentifier");
  v51 = *MEMORY[0x24BDD9A20];
  CanDonateIntent = INBundleProxyCanDonateIntent();
  v53 = (const __CFString *)*MEMORY[0x24BDD9A10];
  v54 = INBundleProxyCanDonateIntent();
  v55 = *MEMORY[0x24BDD9A38];
  v56 = INBundleProxyCanDonateIntent();
  objc_msgSend(v29, "entitlementValueForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v56 & 1) == 0 && (v54 & 1) == 0 && (CanDonateIntent & 1) == 0)
  {
    CanDonateIntent = objc_msgSend(v94, "isEqualToString:", CFSTR("com.apple.internal.suiautomation")) != 0;
    v54 = CanDonateIntent;
    v56 = CanDonateIntent;
  }
  objc_msgSend(v10, "setAllowCalls:", v50 & v56);
  objc_msgSend(v10, "setAllowIntercom:", v50 & v54);
  objc_msgSend(v10, "setAllowMessages:", v50 & CanDonateIntent);
  if ((v56 & 1) == 0 && (v54 & 1) == 0 && (CanDonateIntent & 1) == 0 && ((v50 ^ 1) & 1) == 0)
  {
    v57 = *MEMORY[0x24BDF8990];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v76 = &stru_24D63B158;
      v111 = v96;
      if (v79)
        v76 = v53;
      v112 = 2114;
      v113 = CFSTR("com.apple.developer.usernotifications.communication");
      v114 = 2114;
      v115 = v55;
      v116 = 2114;
      v117 = v76;
      v118 = 2114;
      v119 = v51;
      _os_log_error_impl(&dword_216DCB000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Error: App has '%{public}@' entitlement but does not support donating [%{public}@,%{public}@,%{public}@]. Communication API features will be denied to app.", buf, 0x34u);
    }
  }
  v58 = *MEMORY[0x24BDF75F0];
  v59 = objc_opt_class();
  objc_msgSend(v29, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", v58, v59, objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v58) = objc_msgSend(v60, "containsObject:", *MEMORY[0x24BDF75E8]);
  objc_msgSend(v97, "activityTypes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");

  objc_msgSend(v10, "setActivityTypes:", v62);
  objc_msgSend(v10, "setSupportsContentAvailableRemoteNotifications:", v58 | objc_msgSend(v97, "isNewsstandApp") & objc_msgSend(v60, "containsObject:", CFSTR("newsstand-content")));
  objc_msgSend(v97, "applicationType");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("System"));
  if (v64)
  {
    objc_msgSend(v97, "objectForInfoDictionaryKey:ofClass:", CFSTR("UNUserNotificationCenter"), objc_opt_class());
    v65 = objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDC8]), "initWithURL:", v95);
      objc_msgSend(v10, "setSystemPropertiesFromDictionary:bundle:", v65, v66);

    }
    v77 = v65;
    v80 = v29;
    if (v81)
    {
      objc_msgSend(v10, "defaultSettings", v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setSupportsTimeSensitive:", 1);

    }
    objc_msgSend(v10, "setAllowPrivateProperties:", 1, v77);
    objc_msgSend(v97, "objectForInfoDictionaryKey:ofClass:", CFSTR("SBAppUsesLocalNotifications"), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "un_safeBoolValue");

    objc_msgSend(v97, "objectForInfoDictionaryKey:ofClass:", CFSTR("BBDataProvider"), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "un_safeBoolValue");

    objc_msgSend(v97, "objectForInfoDictionaryKey:ofClass:", CFSTR("UNUserNotificationCenter"), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
      v73 = 1;
    else
      v73 = v69;
    objc_msgSend(v10, "setUseDefaultDataProvider:", v73 & (v71 ^ 1u));

    v74 = v95;
    v29 = v80;
  }
  else
  {
    objc_msgSend(v10, "setUseDefaultDataProvider:", 1);
    v74 = v95;
  }
  objc_msgSend(v10, "setAllowAlternateLaunchBundleIdentifiers:", v64 | objc_msgSend(v89, "isWebApp"));

LABEL_79:
  return v10;
}

+ (id)sourceDescriptionWithBundleIdentifier:()Factory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "systemSourceDescriptionWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "applicationSourceDescriptionWithBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)systemSourceDescriptionWithBundleIdentifier:()Factory
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(a1, "systemSourceDirectoryURLs");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "URLByAppendingPathComponent:", v4, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemSourcePathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathExtension:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBF420], "systemSourceDescriptionWithBundleURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)systemSourceDescriptionWithBundleURL:()Factory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDC8]), "initWithURL:", v3);
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      objc_msgSend(v4, "localizedInfoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x24BDBD1D0], objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x24BDBD298], objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "infoDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bs_safeObjectForKey:ofType:", CFSTR("UNUserNotificationCenter"), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x24BEBF420]);
      objc_msgSend(v14, "setAllowPrivateProperties:", 1);
      objc_msgSend(v14, "setBundleIdentifier:", v6);
      objc_msgSend(v14, "setBundleURL:", v3);
      objc_msgSend(v14, "setDisplayName:", v11);
      objc_msgSend(v14, "setUseDefaultDataProvider:", 1);
      objc_msgSend(v14, "setSystemPropertiesFromDictionary:bundle:", v13, v4);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_validEnvironmentFromEnvironment:()Factory
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (!v3
    || (v5 = (void *)*MEMORY[0x24BE08720], objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x24BE08720]))
    && (v5 = (void *)*MEMORY[0x24BE08718], objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE08718]))
    && (v5 = (void *)*MEMORY[0x24BE08710], objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE08710]))
    && (v5 = (void *)*MEMORY[0x24BE08728], objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x24BE08728])))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)setSystemPropertiesFromDictionary:()Factory bundle:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNUniversalApplicationIdentifier"), objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNIntentsBundleIdentifier"), objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIcons"), objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNDefaultSettings"), objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNDefaultCategories"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBF428], "notificationSourceSettingsDescriptionFromDictionary:", v46);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNDefaultTopics"), objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNCustomSettingsBundle"), objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNCustomSettingsDetailControllerClass"), objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("UNSuppressUserAuthorizationPrompt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v10, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNSuppressDismissalSync"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v11, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNSuppressIconMask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v12, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowUnlimitedContentBody"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v13, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowAlternateLaunchBundleIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v14, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAutomaticallyShowSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v15, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNHideSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNDaemonShouldReceiveBackgroundResponses"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v18, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNDaemonShouldReceiveNotificationSettingsUpdates"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v19, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNDaemonShouldReceiveApplicationEvents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v20, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNRequiresTopics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v21, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowCriticalAlerts"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v22, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowCalls"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v23, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowIntercom"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v24, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNAllowMessages"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v25, "un_safeBoolValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("UNSupportsProvisionalAlerts"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "un_safeBoolValue");
  objc_msgSend(a1, "setDefaultCategoriesFromArray:bundle:", v8, v6);
  objc_msgSend(a1, "setDefaultSettings:", v9);
  objc_msgSend(a1, "setDefaultTopicsFromArray:bundle:", v40, v6);

  objc_msgSend(a1, "setIconFilesFromDictionary:", v43);
  objc_msgSend(a1, "setAutomaticallyShowSettings:", v33);
  objc_msgSend(a1, "setHideSettings:", v17);
  objc_msgSend(a1, "setUniversalApplicationIdentifier:", v47);
  objc_msgSend(a1, "setIntentsBundleIdentifier:", v45);
  objc_msgSend(a1, "setSuppressDismissalSync:", v39);
  objc_msgSend(a1, "setSuppressIconMask:", v38);
  objc_msgSend(a1, "setSuppressUserAuthorizationPrompt:", v41);
  objc_msgSend(a1, "setAllowUnlimitedContentBody:", v37);
  objc_msgSend(a1, "setAllowAlternateLaunchBundleIdentifiers:", v36);
  objc_msgSend(a1, "setDaemonShouldReceiveBackgroundResponses:", v35);
  objc_msgSend(a1, "setDaemonShouldReceiveNotificationSettingsUpdates:", v34);
  objc_msgSend(a1, "setDaemonShouldReceiveApplicationEvents:", v32);
  objc_msgSend(a1, "setRequiresTopics:", v31);
  objc_msgSend(a1, "setCustomSettingsBundle:", v44);
  objc_msgSend(a1, "setCustomSettingsDetailControllerClass:", v42);
  objc_msgSend(a1, "setAllowCriticalAlerts:", v30);
  objc_msgSend(a1, "setAllowCalls:", v29);
  objc_msgSend(a1, "setAllowIntercom:", objc_msgSend(a1, "allowIntercom") | v28);
  objc_msgSend(a1, "setAllowMessages:", objc_msgSend(a1, "allowMessages") | v24);
  objc_msgSend(a1, "setSupportsProvisionalAlerts:", v27);

}

- (void)setIconFilesFromDictionary:()Factory
{
  id v4;
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
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconCarPlay"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconDefault"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconSettings"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconSettingsSheet"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconSubordinate"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLookSmall"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLookLarge"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchListSmall"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchListLarge"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook394h"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook448h"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchList394h"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchList448h"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook430h"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook484h"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook430h"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("UNNotificationIconWatchQuickLook484h"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setDefaultIconFile:", v20);
  objc_msgSend(a1, "setSettingsIconFile:", v19);
  objc_msgSend(a1, "setSettingsSheetIconFile:", v18);
  objc_msgSend(a1, "setSubordinateIconFile:", v17);
  objc_msgSend(a1, "setCarPlayIconFile:", v21);
  objc_msgSend(a1, "setWatchQuickLookSmallIconFile:", v16);
  objc_msgSend(a1, "setWatchQuickLookLargeIconFile:", v15);
  objc_msgSend(a1, "setWatchListSmallIconFile:", v5);
  objc_msgSend(a1, "setWatchListLargeIconFile:", v6);
  objc_msgSend(a1, "setWatchQuickLook394hIconFile:", v7);
  objc_msgSend(a1, "setWatchQuickLook448hIconFile:", v8);
  objc_msgSend(a1, "setWatchList394hIconFile:", v14);
  objc_msgSend(a1, "setWatchList448hIconFile:", v13);
  objc_msgSend(a1, "setWatchQuickLook430hIconFile:", v12);
  objc_msgSend(a1, "setWatchQuickLook484hIconFile:", v11);
  objc_msgSend(a1, "setWatchList430hIconFile:", v10);
  objc_msgSend(a1, "setWatchList484hIconFile:", v9);

}

- (void)setDefaultCategoriesFromArray:()Factory bundle:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__UNCNotificationSourceDescription_Factory__setDefaultCategoriesFromArray_bundle___block_invoke;
    v9[3] = &unk_24D63A6F8;
    v10 = v6;
    objc_msgSend(v8, "bs_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDefaultCategories:", v7);

  }
  else
  {
    objc_msgSend(a1, "setDefaultCategories:", 0);
  }

}

- (void)setDefaultTopicsFromArray:()Factory bundle:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __78__UNCNotificationSourceDescription_Factory__setDefaultTopicsFromArray_bundle___block_invoke;
    v9[3] = &unk_24D63A6F8;
    v10 = v6;
    objc_msgSend(v8, "bs_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDefaultTopics:", v7);

  }
  else
  {
    objc_msgSend(a1, "setDefaultTopics:", 0);
  }

}

@end
