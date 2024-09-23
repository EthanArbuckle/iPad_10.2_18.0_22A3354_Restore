@implementation SBApplicationInfo

- (BOOL)wantsFullScreen
{
  return self->_wantsFullScreen;
}

- (BOOL)shouldLaunchSuspendedAlways
{
  return self->_alwaysLaunchesSuspended;
}

- (BOOL)wantsLaunchWithoutPNG
{
  return self->_wantsLaunchWithoutPNG;
}

- (BOOL)shouldLaunchWithLiveContentASAP
{
  return self->_shouldLaunchWithLiveContentASAP;
}

- (int64_t)defaultStatusBarStyle
{
  return self->_defaultStatusBarStyle;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  objc_super v3;

  if (!self->_isOkemoLinked)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationInfo;
  return -[SBApplicationInfo statusBarHiddenWhenVerticallyCompact](&v3, sel_statusBarHiddenWhenVerticallyCompact);
}

- (BOOL)triggersStoreKitMessaging
{
  return self->_triggersStoreKitMessaging;
}

- (BOOL)requiresAuthorizationForAutoUpdates
{
  return self->_requiresAuthorizationForAutoUpdates;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)dynamicApplicationShortcutItemsVersion
{
  return self->_dynamicApplicationShortcutItemsVersion;
}

- (NSArray)staticApplicationShortcutItems
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = self;
  -[SBApplicationInfo _synchronize:](self, "_synchronize:", v4);
  return self->_staticApplicationShortcutItems;
}

- (BOOL)isCloudDemoted
{
  return self->_cloudDemoted;
}

- (BOOL)isSystemApplication
{
  return (unint64_t)-[SBApplicationInfo type](self, "type") < 2;
}

- (BOOL)usesSplashBoard
{
  return self->_usesSplashBoard;
}

- (BOOL)disablesClassicMode
{
  return self->_disablesClassicMode;
}

- (BOOL)isInternalApplication
{
  return -[SBApplicationInfo type](self, "type") == 0;
}

- (BOOL)wantsExclusiveForeground
{
  return self->_wantsExclusiveForeground;
}

- (BOOL)isIdentifiedGame
{
  return self->_identifiedGame;
}

- (BOOL)isArcadeApplication
{
  return self->_arcadeApplication;
}

- (NSArray)domainsToPreheat
{
  return self->_domainsToPreheat;
}

- (BOOL)isAppClip
{
  return self->_appClip;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (BOOL)hasHiddenTag
{
  return self->_hasHiddenTag;
}

- (BOOL)isAppleApplication
{
  int v3;
  void *v4;
  char v5;

  if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
  {
    LOBYTE(v3) = 1;
  }
  else if (!-[SBApplicationInfo isProvisioningProfileValidated](self, "isProvisioningProfileValidated")
         || (v3 = -[SBApplicationInfo isBeta](self, "isBeta")) != 0)
  {
    -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple."));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)disablesSnapshots
{
  return self->_disablesSnapshots;
}

- (int)networkUsageTypes
{
  return self->_networkUsageTypes;
}

- (BOOL)supportsLegacyVOIPBackgroundMode
{
  return -[SBApplicationInfo voipClass](self, "voipClass") == 1;
}

- (unint64_t)voipClass
{
  return self->_voipClass;
}

- (BOOL)supports64Bit
{
  return self->_supports64Bit;
}

- (unint64_t)uninstallCapability
{
  return self->_uninstallCapability;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)isRegionallyRestricted
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  BOOL v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_eligibilityDomains;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "unsignedLongLongValue", (_QWORD)v8);
        v12 = 0;
        if (os_eligibility_get_domain_answer())
          v6 = 0;
        else
          v6 = v12 == 4;
        if (!v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v3);
  }
LABEL_13:

  return v3;
}

- (BOOL)isSydneyLinked
{
  return self->_isSydneyLinked;
}

- (BOOL)isAzulBLinked
{
  return self->_isAzulBLinked;
}

- (NSURL)restorationArchiveContainerURL
{
  return self->_restorationArchiveContainerURL;
}

- (BOOL)preventsLaunchInterfaceSplitting
{
  return self->_preventsLaunchInterfaceSplitting;
}

- (BOOL)isAzulLinked
{
  return self->_isAzulLinked;
}

- (BOOL)isPeaceBLinked
{
  return self->_isPeaceBLinked;
}

- (BOOL)requiresHiDPI
{
  return self->_requiresHiDPI;
}

- (BOOL)shouldSkipCrossfadeToLive
{
  return self->_shouldSkipCrossfadeToLive;
}

- (BOOL)alwaysDeliversOpenURLActionsUsingWorkspace
{
  return self->_alwaysDeliversOpenURLActionsUsingWorkspace;
}

- (id)dataContainerURL
{
  NSURL *dataContainerURLOverride;
  objc_super v4;

  dataContainerURLOverride = self->_dataContainerURLOverride;
  if (dataContainerURLOverride)
    return dataContainerURLOverride;
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationInfo;
  -[SBApplicationInfo dataContainerURL](&v4, sel_dataContainerURL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)backgroundStyleForRequestedBackgroundStyle:(int64_t)a3
{
  if (-[SBApplicationInfo canChangeBackgroundStyle](self, "canChangeBackgroundStyle"))
    return a3;
  else
    return -[SBApplicationInfo backgroundStyle](self, "backgroundStyle");
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (int64_t)backgroundStyle
{
  objc_super v3;

  if (!self->_allowNonDefaultBackgroundStyle)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationInfo;
  return -[SBApplicationInfo backgroundStyle](&v3, sel_backgroundStyle);
}

void __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 679))
  {
    if (objc_msgSend(*(id *)(v1 + 448), "count"))
    {
      v3 = objc_alloc(MEMORY[0x1E0D01700]);
      objc_msgSend(*v2, "bundleURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

      if (v5)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v6 = *((id *)*v2 + 56);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v17;
          v10 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(v6);
              v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              v14[0] = v10;
              v14[1] = 3221225472;
              v14[2] = __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_2;
              v14[3] = &unk_1E8EA4198;
              v15 = v5;
              objc_msgSend(v12, "_localizeWithHandler:", v14);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v8);
        }

        *((_BYTE *)*v2 + 679) = 1;
      }
      else
      {
        SBLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_cold_1(v2, v13);

      }
    }
    else
    {
      *((_BYTE *)*v2 + 679) = 1;
    }
  }
}

- (NSUserDefaults)userDefaults
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SBApplicationInfo_userDefaults__block_invoke;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = self;
  -[SBApplicationInfo _synchronize:](self, "_synchronize:", v4);
  return self->_lazy_userDefaults;
}

void __33__SBApplicationInfo_userDefaults__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
    objc_msgSend(*(id *)(a1 + 32), "preferenceDomain");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "initWithSuiteName:", v6);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 528);
    *(_QWORD *)(v4 + 528) = v3;

  }
}

id __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", v3, 0, CFSTR("InfoPlist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", v3, 0, CFSTR("InfoPlist-OrbHW"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

- (BOOL)supportsAudioBackgroundMode
{
  return -[SBApplicationInfo supportsBackgroundMode:](self, "supportsBackgroundMode:", *MEMORY[0x1E0CEB370]);
}

- (BOOL)supportsRemoteNotificationBackgroundMode
{
  return -[SBApplicationInfo supportsBackgroundMode:](self, "supportsBackgroundMode:", *MEMORY[0x1E0CEB380]);
}

- (BOOL)supportsFetchBackgroundMode
{
  return -[SBApplicationInfo supportsBackgroundMode:](self, "supportsBackgroundMode:", *MEMORY[0x1E0CEB378]);
}

- (BOOL)supportsNewsstandContentBackgroundMode
{
  return -[SBApplicationInfo supportsBackgroundMode:](self, "supportsBackgroundMode:", CFSTR("newsstand-content"));
}

- (BOOL)suppressUserNotificationPermissionAlert
{
  return -[SBApplicationInfo type](self, "type") == 1;
}

- (void)_loadFromProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *installInstanceID;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *displayName;
  uint64_t v22;
  NSString *v23;
  NSString *launchInterfaceFileName;
  void *v25;
  BOOL *p_usesSplashBoard;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *launchImageInfo;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSSet *v47;
  NSSet *urlSchemes;
  void *v49;
  NSString *v50;
  NSString *applicationShortcutWidgetBundleIdentifier;
  void *v52;
  void *v53;
  NSArray *v54;
  NSArray *staticApplicationShortcutItems;
  void *v56;
  int v57;
  unint64_t v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  char v65;
  void *v66;
  char v67;
  void *v68;
  unint64_t supportedTypes;
  void *v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  NSSet *v78;
  NSSet *ignoredBackgroundActivityIdentifiers;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  CRCarPlayAppDeclaration *v87;
  CRCarPlayAppDeclaration *carPlayDeclaration;
  void *v89;
  NSArray *v90;
  NSArray *domainsToPreheat;
  void *v92;
  id v93;
  void *v94;
  NSURL *v95;
  NSURL *documentInboxURL;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  NSObject *v103;
  unint64_t allowedNKNotificationsPerDay;
  id v105;
  BOOL v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  const __CFString *v118;
  NSArray *v119;
  NSArray *iTunesCategoriesOrderedByRelevancy;
  void *v121;
  NSString *v122;
  NSString *vendorName;
  void *v124;
  void *v125;
  void *v126;
  const __CFString *v127;
  void *v128;
  int v129;
  NSSet *v130;
  NSSet *eligibilityDomains;
  void *v132;
  int v133;
  NSSet *v134;
  NSSet *v135;
  NSSet *v136;
  _BYTE *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  objc_super v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  objc_super v150;
  objc_super v151;
  uint8_t buf[4];
  unint64_t v153;
  __int16 v154;
  id v155;
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_loadFromProxy__onceToken != -1)
    dispatch_once(&_loadFromProxy__onceToken, &__block_literal_global_46);
  v151.receiver = self;
  v151.super_class = (Class)SBApplicationInfo;
  -[SBApplicationInfo _loadFromProxy:](&v151, sel__loadFromProxy_, v4);
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsForInfoDictionaryKeys:", _loadFromProxy____infoKeys);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementValuesForKeys:", _loadFromProxy____entitlementKeys);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSBundleInfo bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  installInstanceID = self->_installInstanceID;
  self->_installInstanceID = v9;

  self->_isNewsstand = objc_msgSend(v6, "BOOLForKey:", CFSTR("UINewsstandApp"));
  v141 = v5;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.webapp")))
    self->_representsWebApplication = 1;
  -[SBApplicationInfo dataContainerURL](self, "dataContainerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v7;
  if (!v11)
  {
    if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
    {
      v12 = (void *)MEMORY[0x1E0C99E98];
      BSCurrentUserDirectory();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLWithPath:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  objc_storeStrong((id *)&self->_restorationArchiveContainerURL, v11);
  self->_isOkemoLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("8.0"));
  self->_isMonarchLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("9.0"));
  self->_isTigrisLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("11.0"));
  self->_isPeaceLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("12.0"));
  self->_isPeaceBLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("12.1"));
  self->_isYukonLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("13.0"));
  self->_isYukonELinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("13.2"));
  self->_isAzulLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("14.0"));
  self->_isAzulHWLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("14.1"));
  self->_isAzulBLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("14.2"));
  self->_isSkyLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("15.0"));
  self->_isSydneyLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("16.0"));
  self->_isCrystalLinked = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("18.0"));
  if ((objc_msgSend(v6, "BOOLForKey:", CFSTR("SBIsLaunchableDuringSetup")) & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v7, "BOOLForKey:", CFSTR("com.apple.private.shortcuts.IntentsAvailableDuringBuddy"));
  v140 = v11;
  self->_isLaunchableDuringSetup = v14;
  self->_isLicensedToDevice = objc_msgSend(v4, "hasMIDBasedSINF");
  v150.receiver = self;
  v150.super_class = (Class)SBApplicationInfo;
  -[FBSBundleInfo displayName](&v150, sel_displayName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v6;
  if (!objc_msgSend(v15, "length"))
  {
    -[FBSBundleInfo bundleURL](self, "bundleURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByDeletingPathExtension");
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = v143;
    v15 = (void *)v19;
  }
  v139 = v15;
  v20 = (NSString *)objc_msgSend(v15, "copy");
  displayName = self->_displayName;
  self->_displayName = v20;

  self->_preventsLaunchInterfaceSplitting = objc_msgSend(v6, "BOOLForKey:", CFSTR("SBPreventsDefaultLaunchImageSplitting"));
  v22 = *MEMORY[0x1E0DA8FE0];
  objc_msgSend(v6, "stringForKey:", *MEMORY[0x1E0DA8FE0]);
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  launchInterfaceFileName = self->_launchInterfaceFileName;
  self->_launchInterfaceFileName = v23;

  objc_msgSend(v6, "objectForKey:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    p_usesSplashBoard = &self->_usesSplashBoard;
    self->_usesSplashBoard = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DA8FE8]);
    v27 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      p_usesSplashBoard = &self->_usesSplashBoard;
      self->_usesSplashBoard = 1;
    }
    else
    {
      objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0DA8FD0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        p_usesSplashBoard = &self->_usesSplashBoard;
        self->_usesSplashBoard = 1;
      }
      else
      {
        objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0DA8FD8]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        p_usesSplashBoard = &self->_usesSplashBoard;
        self->_usesSplashBoard = v30 != 0;

      }
    }

    v6 = v143;
  }

  if (!*p_usesSplashBoard)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("UILaunchImages"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationLaunchImageParameters launchImageParametersFromLaunchImagesInfo:withBundleIdentifier:isMonarchLinked:](SBApplicationLaunchImageParameters, "launchImageParametersFromLaunchImagesInfo:withBundleIdentifier:isMonarchLinked:", v31, v141, self->_isMonarchLinked);
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    launchImageInfo = self->_launchImageInfo;
    self->_launchImageInfo = v32;

  }
  objc_msgSend(v7, "numberForKey:", CFSTR("com.apple.springboard.disablecompatibilitymode.late2022"), p_usesSplashBoard);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "BOOLValue"))
  {
    self->_disablesClassicMode = 1;
  }
  else
  {
    objc_msgSend(v7, "numberForKey:", CFSTR("com.apple.springboard.disablecompatibilitymode.forever"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    self->_disablesClassicMode = objc_msgSend(v35, "BOOLValue");

  }
  self->_statusBarIsLegacy = -[SBApplicationInfo builtOnOrAfterSDKVersion:](self, "builtOnOrAfterSDKVersion:", CFSTR("7.0")) ^ 1;
  objc_msgSend(v6, "arrayForKey:", *MEMORY[0x1E0C9AB38]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bs_objectsOfClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v142 = v37;
  if (objc_msgSend(v37, "count"))
  {
    v138 = v4;
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
    if (v39)
    {
      v40 = v39;
      v41 = 0;
      v42 = *(_QWORD *)v147;
      v43 = *MEMORY[0x1E0C9AB30];
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v147 != v42)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * i), "bs_safeArrayForKey:", v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "bs_objectsOfClass:", objc_opt_class());
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v46, "count"))
          {
            if (v41)
            {
              objc_msgSend(v41, "addObjectsFromArray:", v46);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v46);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
      }
      while (v40);
    }
    else
    {
      v41 = 0;
    }

    v47 = (NSSet *)objc_msgSend(v41, "copy");
    urlSchemes = self->_urlSchemes;
    self->_urlSchemes = v47;

    v4 = v138;
    v6 = v143;
  }
  objc_msgSend(v6, "stringForKey:", CFSTR("UIApplicationShortcutWidget"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (NSString *)objc_msgSend(v49, "copy");
  applicationShortcutWidgetBundleIdentifier = self->_applicationShortcutWidgetBundleIdentifier;
  self->_applicationShortcutWidgetBundleIdentifier = v50;

  v52 = (void *)MEMORY[0x1E0DAADA0];
  objc_msgSend(v6, "objectForKey:", CFSTR("UIApplicationShortcutItems"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_staticApplicationShortcutItemsFromInfoPlistEntry:", v53);
  v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
  staticApplicationShortcutItems = self->_staticApplicationShortcutItems;
  self->_staticApplicationShortcutItems = v54;

  objc_msgSend(v6, "numberForKey:", CFSTR("UIApplicationShortcutItemsVersion"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dynamicApplicationShortcutItemsVersion = objc_msgSend(v56, "unsignedIntegerValue");

  if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
  {
    v57 = objc_msgSend(v4, "isDeletable");
    v58 = 2;
    if (!v57)
      v58 = 0;
  }
  else
  {
    v58 = 1;
  }
  self->_uninstallCapability = v58;
  self->_visibilityOverride = +[SBApplicationInfo _visibilityOverrideFromInfo:entitlements:]((uint64_t)SBApplicationInfo, v6, v144);
  -[SBApplicationInfo tags](self, "tags");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = self->_uninstallCapability == 2 || self->_visibilityOverride != 0;
  -[SBApplicationInfo _configureTags:hasVisibilityOverride:](self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationInfo _overrideTags:](self, "_overrideTags:", v61);

  -[SBApplicationInfo tags](self, "tags");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasHiddenTag = objc_msgSend(v62, "containsObject:", CFSTR("hidden"));

  v63 = -[SBApplicationInfo isSystemApplication](self, "isSystemApplication");
  if (v63)
    LOBYTE(v63) = objc_msgSend(v6, "BOOLForKey:", CFSTR("SBDisableSnapshots"));
  self->_disablesSnapshots = v63;
  v64 = -[SBApplicationInfo isSystemApplication](self, "isSystemApplication");
  if (v64)
    LOBYTE(v64) = objc_msgSend(v6, "BOOLForKey:", CFSTR("SBPrefersSavedSnapshots"));
  self->_prefersSavedSnapshots = v64;
  self->_wantsLaunchWithoutPNG = objc_msgSend(v6, "BOOLForKey:", CFSTR("SBWantsLiveResume"));
  self->_supportedTypes |= +[SBApplicationInfo _calculateApplicationSupportedTypesFromProxy:]((uint64_t)SBApplicationInfo, v4);
  self->_defaultStatusBarStyle = -[SBApplicationInfo requestedStatusBarStyle](self, "requestedStatusBarStyle");
  if ((unint64_t)objc_msgSend(MEMORY[0x1E0D23070], "_applicationTypeForProxy:", v4) > 1)
  {
    objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.springboard.appbackgroundstyle"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "BOOLValue");

    self->_canChangeBackgroundStyle = v67;
    self->_allowNonDefaultBackgroundStyle = v67;
    objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.openURL-source"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v68, "BOOLValue");

  }
  else
  {
    v65 = 1;
    self->_canChangeBackgroundStyle = 1;
    self->_allowNonDefaultBackgroundStyle = 1;
  }
  self->_alwaysReceivesOpenURLSource = v65;
  supportedTypes = self->_supportedTypes;
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isMedusaCapable");

  LOBYTE(v72) = 1;
  if (v71 && (supportedTypes & 2) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "applicationDefaults");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "forcesMedusaAdoption");

    if (v75)
    {
      self->_wantsFullScreen = 0;
      goto LABEL_67;
    }
    if (self->_isMonarchLinked && *v137 && (objc_msgSend(v143, "BOOLForKey:", CFSTR("UIRequiresFullScreen")) & 1) == 0)
      v72 = -[SBApplicationInfo supportsAllInterfaceOrientations](self, "supportsAllInterfaceOrientations") ^ 1;
    else
      LOBYTE(v72) = 1;
  }
  self->_wantsFullScreen = v72;
LABEL_67:
  if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
  {
    v76 = (void *)MEMORY[0x1E0CEA2F8];
    objc_msgSend(v143, "objectForKey:", *MEMORY[0x1E0CEBBF0]);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "_statusBarStyleOverridesForArray:", v77);

    STUIBackgroundActivityIdentifiersForStyleOverrides();
    v78 = (NSSet *)objc_claimAutoreleasedReturnValue();
    ignoredBackgroundActivityIdentifiers = self->_ignoredBackgroundActivityIdentifiers;
    self->_ignoredBackgroundActivityIdentifiers = v78;

  }
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "applicationDefaults");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "ignoresDeclaredNetworkUsage");

  v83 = v143;
  if ((v82 & 1) == 0)
  {
    objc_msgSend(v143, "numberForKey:", CFSTR("SBUsesNetwork"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    self->_networkUsageTypes = objc_msgSend(v84, "unsignedIntValue");

  }
  if (objc_msgSend(v143, "BOOLForKey:", CFSTR("UIRequiresPersistentWiFi")))
    self->_networkUsageTypes |= 2u;
  if (!-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
  {
    self->_isGameCenterEnabled = objc_msgSend(v4, "isGameCenterEnabled");
    self->_wasGameCenterEverEnabled = objc_msgSend(v4, "gameCenterEverEnabled");
  }
  objc_msgSend(v143, "objectForKey:", *MEMORY[0x1E0CEB268]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v86 = objc_msgSend(v85, "containsObject:", CFSTR("hidpi"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_81;
      v86 = objc_msgSend(v85, "bs_BOOLForKey:", CFSTR("hidpi"));
    }
    self->_requiresHiDPI = v86;
  }
LABEL_81:
  self->_voipClass = -[SBApplicationInfo _calculateVoipClassWithEntitlements:]((uint64_t)self, v144);
  objc_msgSend(MEMORY[0x1E0D0D348], "declarationForBundleIdentifier:info:entitlements:", v141, v143, v144);
  v87 = (CRCarPlayAppDeclaration *)objc_claimAutoreleasedReturnValue();
  carPlayDeclaration = self->_carPlayDeclaration;
  self->_carPlayDeclaration = v87;

  if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
    self->_alwaysLaunchesSuspended = objc_msgSend(v143, "BOOLForKey:", CFSTR("SBLaunchSuspendedAlways"));
  self->_systemAppSupportsLocalNotifications = objc_msgSend(v143, "BOOLForKey:", CFSTR("SBAppUsesLocalNotifications"));
  if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
  {
    objc_msgSend(v143, "arrayForKey:", CFSTR("SBDomainsToPreheat"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bs_objectsOfClass:", objc_opt_class());
    v90 = (NSArray *)objc_claimAutoreleasedReturnValue();
    domainsToPreheat = self->_domainsToPreheat;
    self->_domainsToPreheat = v90;

  }
  objc_msgSend(v143, "stringForKey:", *MEMORY[0x1E0CEBDE8]);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = v92;

LABEL_88:
    self->_whitePointAdaptivityStyle = _UIWhitePointAdaptivityStyleFromString();

    goto LABEL_89;
  }
  objc_msgSend(v143, "stringForKey:", *MEMORY[0x1E0CEC330]);
  v93 = (id)objc_claimAutoreleasedReturnValue();

  if (v93)
    goto LABEL_88;
  self->_whitePointAdaptivityStyle = 0;
LABEL_89:
  -[SBApplicationInfo dataContainerURL](self, "dataContainerURL");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "URLByAppendingPathComponent:", CFSTR("Documents/Inbox/"));
  v95 = (NSURL *)objc_claimAutoreleasedReturnValue();
  documentInboxURL = self->_documentInboxURL;
  self->_documentInboxURL = v95;

  objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.springboard.disallowNotificationCenter"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  self->_disallowsNotificationCenter = objc_msgSend(v97, "BOOLValue");

  objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.springboard.disallowControlCenter"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  self->_disallowsControlCenter = objc_msgSend(v98, "BOOLValue");

  objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.springboard.deliveropenurlusingworkspace"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  self->_alwaysDeliversOpenURLActionsUsingWorkspace = objc_msgSend(v99, "BOOLValue");

  if (-[SBApplicationInfo isNewsstand](self, "isNewsstand"))
  {
    objc_msgSend(v144, "stringForKey:", CFSTR("com.apple.newsstand.content-notification-daily-limit"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (v100)
    {
      v102 = objc_msgSend(v100, "integerValue");
      self->_allowedNKNotificationsPerDay = v102 & ~(v102 >> 63);
      SBLogCommon();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        allowedNKNotificationsPerDay = self->_allowedNKNotificationsPerDay;
        -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
        v105 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v153 = allowedNKNotificationsPerDay;
        v154 = 2114;
        v155 = v105;
        _os_log_impl(&dword_1D0540000, v103, OS_LOG_TYPE_INFO, "NKThrottle: setting _allowedContentNotificationsPerDay=%lu for app=%{public}@", buf, 0x16u);

      }
      v83 = v143;
    }
    else
    {
      self->_allowedNKNotificationsPerDay = 1;
    }

  }
  else
  {
    self->_allowedNKNotificationsPerDay = 0;
  }
  v106 = -[SBApplicationInfo type](self, "type") != 1
      || -[SBApplicationInfo systemAppSupportsLocalNotifications](self, "systemAppSupportsLocalNotifications");
  self->_usesRLNDataProvider = v106;
  if (objc_msgSend(v83, "BOOLForKey:", CFSTR("SBShouldLaunchLiveImmediately")))
  {
    self->_shouldSkipCrossfadeToLive = 1;
  }
  else
  {
    -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldSkipCrossfadeToLive = objc_msgSend(v107, "isEqualToString:", CFSTR("com.apple.camera"));

  }
  objc_msgSend(v4, "installType");
  self->_cloudDemoted = FBSInstallTypeIsCloudDemoted();
  self->_supports64Bit = objc_msgSend(v4, "compatibilityState") != 2;
  v145.receiver = self;
  v145.super_class = (Class)SBApplicationInfo;
  self->_supportsMultiwindow = -[SBApplicationInfo supportsMultiwindow](&v145, sel_supportsMultiwindow);
  objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.on-demand-install-capable"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "BOOLValue");

  if (v109)
  {
    self->_supportsMultiwindow = 0;
    self->_appClip = 1;
  }
  self->_wantsExclusiveForeground = objc_msgSend(v83, "BOOLForKey:", CFSTR("SBWantsExclusiveForeground"));
  objc_msgSend(v4, "diskUsage");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "staticUsage");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  self->_applicationSizeInBytes = objc_msgSend(v111, "unsignedLongLongValue");

  self->_arcadeApplication = objc_msgSend(v4, "isArcadeApp");
  v112 = (void *)objc_opt_new();
  v113 = v112;
  if (self->_arcadeApplication)
  {
    objc_msgSend(v112, "addObject:", CFSTR(" Arcade"));
  }
  else
  {
    objc_msgSend(v4, "genre");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      objc_msgSend(v4, "genre");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "addObject:", v115);

    }
    objc_msgSend(v4, "subgenres");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (v116)
    {
      objc_msgSend(v4, "subgenres");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "addObjectsFromArray:", v117);

    }
  }
  if (!objc_msgSend(v113, "count"))
  {
    objc_msgSend(v113, "removeAllObjects");
    if (-[SBApplicationInfo isSystemApplication](self, "isSystemApplication"))
    {
      v118 = CFSTR(" System");
    }
    else if (-[SBApplicationInfo isInternalApplication](self, "isInternalApplication"))
    {
      v118 = CFSTR(" Internal");
    }
    else
    {
      v118 = CFSTR("Other");
    }
    objc_msgSend(v113, "addObject:", v118);
  }
  v119 = (NSArray *)objc_msgSend(v113, "copy");
  iTunesCategoriesOrderedByRelevancy = self->_iTunesCategoriesOrderedByRelevancy;
  self->_iTunesCategoriesOrderedByRelevancy = v119;

  self->_identifiedGame = objc_msgSend(MEMORY[0x1E0D25CB8], "applicationIsIdentifiedGame:info:entitlements:", v4, v83, v144);
  objc_msgSend(v4, "vendorName");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (NSString *)objc_msgSend(v121, "copy");
  vendorName = self->_vendorName;
  self->_vendorName = v122;

  objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.storekit.external-purchase-link"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v124, "BOOLValue"))
  {
    self->_triggersStoreKitMessaging = 1;
  }
  else
  {
    objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.storekit.external-purchase"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    self->_triggersStoreKitMessaging = objc_msgSend(v125, "BOOLValue");

  }
  self->_requiresAuthorizationForAutoUpdates = objc_msgSend(v83, "BOOLForKey:", CFSTR("NSAppNeedsAutoUpdateConsent"));
  objc_msgSend(v83, "objectForKey:", CFSTR("NSAllowMicModeControlWithoutSensorsActive"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
    v127 = CFSTR("NSAllowMicModeControlWithoutSensorsActive");
  else
    v127 = CFSTR("NSAlwaysAllowMicrophoneModeControl");
  self->_supportsInactiveMicModeSelection = objc_msgSend(v83, "BOOLForKey:", v127);
  if ((objc_msgSend(v141, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) == 0
    && (objc_msgSend(v141, "isEqualToString:", CFSTR("com.apple.SafariViewService")) & 1) == 0)
  {
    objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.web-browser-engine.host"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "BOOLValue");

    if (v129)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E91D0380);
      v130 = (NSSet *)objc_claimAutoreleasedReturnValue();
      eligibilityDomains = self->_eligibilityDomains;
      self->_eligibilityDomains = v130;

    }
    objc_msgSend(v144, "numberForKey:", CFSTR("com.apple.developer.embedded-web-browser-engine"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "BOOLValue");

    if (v133)
    {
      v134 = self->_eligibilityDomains;
      if (v134)
        -[NSSet setByAddingObject:](v134, "setByAddingObject:", &unk_1E91D0398);
      else
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E91D0398);
      v135 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v136 = self->_eligibilityDomains;
      self->_eligibilityDomains = v135;

    }
  }

}

void __36__SBApplicationInfo__loadFromProxy___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIsLaunchableDuringSetup"), *MEMORY[0x1E0DA8FE0], *MEMORY[0x1E0DA8FE8], *MEMORY[0x1E0DA8FD0], *MEMORY[0x1E0DA8FD8], CFSTR("UILaunchImages"), *MEMORY[0x1E0C9AB38], CFSTR("UIApplicationShortcutWidget"), CFSTR("UIApplicationShortcutItems"), CFSTR("UIApplicationShortcutItemsVersion"), CFSTR("SBIconVisibilitySetByAppPreference"), CFSTR("SBIconVisibilityDefaultVisible"), CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"), CFSTR("SBIconVisibilityDefaultVisiblePlatforms"), CFSTR("SBIconVisibilityDefaultVisibleFeatureFlag"), CFSTR("SBDisableSnapshots"), CFSTR("SBPrefersSavedSnapshots"),
    CFSTR("SBWantsLiveResume"),
    CFSTR("UIRequiresFullScreen"),
    *MEMORY[0x1E0CEBBF0],
    CFSTR("SBUsesNetwork"),
    CFSTR("UIRequiresPersistentWiFi"),
    CFSTR("SBPreventsDefaultLaunchImageSplitting"),
    *MEMORY[0x1E0CEB268],
    CFSTR("UIApplicationShouldDisableScreenJail"),
    CFSTR("SBLaunchSuspendedAlways"),
    CFSTR("SBRequiresPasscodeBeforeFirstUnlock"),
    CFSTR("SBAppUsesLocalNotifications"),
    CFSTR("SBDomainsToPreheat"),
    CFSTR("SBShouldLaunchLiveImmediately"),
    *MEMORY[0x1E0CEBDE8],
    *MEMORY[0x1E0CEC330],
    CFSTR("UINewsstandApp"),
    CFSTR("SBWantsExclusiveForeground"),
    CFSTR("UIApplicationInterfaceManifest"),
    *MEMORY[0x1E0CEB2D0],
    CFSTR("AVInitialRouteSharingPolicy"),
    CFSTR("CFBundleAlternateNames"),
    CFSTR("NSAppNeedsAutoUpdateConsent"),
    CFSTR("LSApplicationCategoryType"),
    CFSTR("NSAllowMicModeControlWithoutSensorsActive"),
    CFSTR("NSAlwaysAllowMicrophoneModeControl"),
    0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D348], "requiredInfoKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "unionSet:", v1);

  v2 = objc_msgSend(v0, "copy");
  v3 = (void *)_loadFromProxy____infoKeys;
  _loadFromProxy____infoKeys = v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("com.apple.springboard.allowIconVisibilityChanges"), CFSTR("com.apple.developer.legacyvoip"), CFSTR("com.apple.springboard.disallowNotificationCenter"), CFSTR("com.apple.springboard.disallowControlCenter"), CFSTR("com.apple.newsstand.content-notification-daily-limit"), CFSTR("com.apple.springboard.appbackgroundstyle"), CFSTR("com.apple.springboard.disablecompatibilitymode.late2022"), CFSTR("com.apple.springboard.disablecompatibilitymode.forever"), CFSTR("com.apple.developer.openURL-source"), CFSTR("com.apple.developer.on-demand-install-capable"), CFSTR("com.apple.springboard.deliveropenurlusingworkspace"), CFSTR("com.apple.developer.storekit.external-purchase"), CFSTR("com.apple.developer.storekit.external-purchase-link"), CFSTR("com.apple.developer.sustained-execution"), CFSTR("com.apple.developer.kernel.increased-memory-limit"), CFSTR("com.apple.developer.kernel.increased-debugging-memory-limit"), CFSTR("com.apple.private.shortcuts.IntentsAvailableDuringBuddy"),
    CFSTR("com.apple.developer.web-browser-engine.host"),
    CFSTR("com.apple.developer.embedded-web-browser-engine"),
    0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0D348], "requiredEntitlementKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v4);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)_loadFromProxy____entitlementKeys;
  _loadFromProxy____entitlementKeys = v5;

}

+ (uint64_t)_visibilityOverrideFromInfo:(void *)a3 entitlements:
{
  id v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  id v29;
  void *v30;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInternalInstall");
  v8 = objc_msgSend(v6, "isCarrierInstall");
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("SBIconVisibilitySetByAppPreference"))
    && (((v7 | v8) & 1) != 0
     || objc_msgSend(v5, "BOOLForKey:", CFSTR("com.apple.springboard.allowIconVisibilityChanges"))))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("SBIconVisibilityDefaultVisible"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v4, "BOOLForKey:", CFSTR("SBIconVisibilityDefaultVisible")))
        v10 = 1;
      else
        v10 = 2;
    }
    else
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayForKey:withValuesOfClass:", CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = CFSTR("user");
        if (v8)
          v14 = CFSTR("carrier");
        if (v7)
          v15 = CFSTR("internal");
        else
          v15 = v14;
        v16 = objc_msgSend(v13, "containsObject:", v15);
        v17 = v16 ^ 1;
      }
      else
      {
        v17 = 0;
        v16 = 0;
      }
      objc_opt_self();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayForKey:withValuesOfClass:", CFSTR("SBIconVisibilityDefaultVisiblePlatforms"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v6, "deviceClass");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "containsObject:", v20);
        v17 |= v21 ^ 1;
        v16 |= v21;

      }
      objc_msgSend(v4, "stringForKey:", CFSTR("SBIconVisibilityDefaultVisibleFeatureFlag"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("/"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count") == 2)
        {
          objc_msgSend(v24, "objectAtIndex:", 0);
          v30 = v13;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndex:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_retainAutorelease(v25);
          objc_msgSend(v29, "UTF8String");
          v27 = objc_retainAutorelease(v26);
          objc_msgSend(v27, "UTF8String");
          v13 = v30;
          v28 = _os_feature_enabled_impl();
          v17 |= v28 ^ 1;
          v16 |= v28;

        }
      }
      if ((v16 & (v17 ^ 1)) != 0)
        v10 = 1;
      else
        v10 = 2;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_configureTags:(char)a3 hasVisibilityOverride:
{
  id v5;
  __CFString *v6;
  __CFString **v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if ((a3 & 1) != 0)
    {
LABEL_3:
      v6 = 0;
      goto LABEL_7;
    }
    if ((objc_msgSend(a1, "isInternalApplication") & 1) != 0)
    {
      v7 = SBInternalAppTag;
    }
    else
    {
      if (!objc_msgSend(a1, "isSystemApplication"))
        goto LABEL_3;
      +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultIconStateDisplayIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_3;
      v7 = &SBNonDefaultSystemAppTag;
    }
    v6 = *v7;
LABEL_7:
    if (objc_msgSend(a1, "isAppleApplication"))
    {
      if (objc_msgSend(v5, "count"))
        v8 = v5;
      else
        v8 = 0;
      v9 = v8;
      a1 = v9;
      if (!v6)
        goto LABEL_20;
      if (v9)
      {
        objc_msgSend(v9, "arrayByAddingObject:", v6);
        v10 = objc_claimAutoreleasedReturnValue();

        a1 = (void *)v10;
LABEL_20:

        goto LABEL_21;
      }
    }
    else if (!v6)
    {
      a1 = 0;
      goto LABEL_20;
    }
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

+ (uint64_t)_calculateApplicationSupportedTypesFromProxy:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      v3 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      goto LABEL_3;
  }
  objc_msgSend(v2, "deviceFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v3 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("2")) & 1) != 0)
            v13 = 2;
          else
            v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("1"));
          v3 |= v13;

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

LABEL_20:
  return v3;
}

- (BOOL)_supportsApplicationType:(_BOOL8)result
{
  if (result)
    return (*(_QWORD *)(result + 640) & a2) != 0;
  return result;
}

- (uint64_t)_calculateVoipClassWithEntitlements:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend((id)a1, "supportsBackgroundMode:", *MEMORY[0x1E0CEB388]))
    {
      if (objc_msgSend((id)a1, "builtOnOrAfterSDKVersion:", CFSTR("10.0")))
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.developer.legacyvoip"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
          v5 = 1;
        else
          v5 = 2;
      }
      else
      {
        v5 = 1;
      }
      if (objc_msgSend((id)a1, "builtOnOrAfterSDKVersion:", CFSTR("15.0")))
        a1 = 2;
      else
        a1 = v5;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (NSString)installInstanceID
{
  return self->_installInstanceID;
}

- (BOOL)isMonarchLinked
{
  return self->_isMonarchLinked;
}

- (BOOL)isTigrisLinked
{
  return self->_isTigrisLinked;
}

- (BOOL)isPeaceLinked
{
  return self->_isPeaceLinked;
}

- (BOOL)isYukonLinked
{
  return self->_isYukonLinked;
}

- (BOOL)isYukonELinked
{
  return self->_isYukonELinked;
}

- (BOOL)isAzulHWLinked
{
  return self->_isAzulHWLinked;
}

- (BOOL)isSkyLinked
{
  return self->_isSkyLinked;
}

- (BOOL)isCrystalLinked
{
  return self->_isCrystalLinked;
}

- (BOOL)representsWebApplication
{
  return self->_representsWebApplication;
}

- (NSString)applicationShortcutWidgetBundleIdentifier
{
  return self->_applicationShortcutWidgetBundleIdentifier;
}

- (unint64_t)visibilityOverride
{
  return self->_visibilityOverride;
}

- (BOOL)isLaunchableDuringSetup
{
  return self->_isLaunchableDuringSetup;
}

- (BOOL)prefersSavedSnapshots
{
  return self->_prefersSavedSnapshots;
}

- (NSSet)ignoredBackgroundActivityIdentifiers
{
  return self->_ignoredBackgroundActivityIdentifiers;
}

- (BOOL)isGameCenterEnabled
{
  return self->_isGameCenterEnabled;
}

- (BOOL)wasGameCenterEverEnabled
{
  return self->_wasGameCenterEverEnabled;
}

- (BOOL)systemAppSupportsLocalNotifications
{
  return self->_systemAppSupportsLocalNotifications;
}

- (CRCarPlayAppDeclaration)carPlayDeclaration
{
  return self->_carPlayDeclaration;
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (BOOL)isStatusBarLegacy
{
  return self->_statusBarIsLegacy;
}

- (NSArray)launchImageInfo
{
  return self->_launchImageInfo;
}

- (NSString)launchInterfaceFileName
{
  return self->_launchInterfaceFileName;
}

- (NSSet)urlSchemes
{
  return self->_urlSchemes;
}

- (NSURL)documentInboxURL
{
  return self->_documentInboxURL;
}

- (BOOL)disallowsNotificationCenter
{
  return self->_disallowsNotificationCenter;
}

- (BOOL)disallowsControlCenter
{
  return self->_disallowsControlCenter;
}

- (unint64_t)allowedNKNotificationsPerDay
{
  return self->_allowedNKNotificationsPerDay;
}

- (BOOL)usesRLNDataProvider
{
  return self->_usesRLNDataProvider;
}

- (BOOL)isNewsstand
{
  return self->_isNewsstand;
}

- (BOOL)alwaysReceivesOpenURLSource
{
  return self->_alwaysReceivesOpenURLSource;
}

- (BOOL)isLicensedToDevice
{
  return self->_isLicensedToDevice;
}

- (unint64_t)applicationSizeInBytes
{
  return self->_applicationSizeInBytes;
}

- (NSArray)iTunesCategoriesOrderedByRelevancy
{
  return self->_iTunesCategoriesOrderedByRelevancy;
}

- (XBSnapshotContainerIdentity)manifestContainerIdentity
{
  return self->_manifestContainerIdentity;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (BOOL)supportsInactiveMicModeSelection
{
  return self->_supportsInactiveMicModeSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_manifestContainerIdentity, 0);
  objc_storeStrong((id *)&self->_iTunesCategoriesOrderedByRelevancy, 0);
  objc_storeStrong((id *)&self->_documentInboxURL, 0);
  objc_storeStrong((id *)&self->_eligibilityDomains, 0);
  objc_storeStrong((id *)&self->_ignoredBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_installInstanceID, 0);
  objc_storeStrong((id *)&self->_lazy_userDefaults, 0);
  objc_storeStrong((id *)&self->_dataContainerURLOverride, 0);
  objc_storeStrong((id *)&self->_restorationArchiveContainerURL, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_storeStrong((id *)&self->_urlSchemes, 0);
  objc_storeStrong((id *)&self->_launchInterfaceFileName, 0);
  objc_storeStrong((id *)&self->_launchImageInfo, 0);
  objc_storeStrong((id *)&self->_domainsToPreheat, 0);
  objc_storeStrong((id *)&self->_carPlayDeclaration, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_staticApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_applicationShortcutWidgetBundleIdentifier, 0);
}

void __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unable to localize staticApplicationShortcutItems for %@ because we failed to create a bundle for %@", (uint8_t *)&v6, 0x16u);

}

@end
