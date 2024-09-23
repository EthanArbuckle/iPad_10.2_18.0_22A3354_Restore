@implementation BAApplicationInfo

+ (BOOL)applicationForIdentifierAllowsBackgroundActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;

  v3 = a3;
  if (qword_1000655C0 != -1)
    dispatch_once(&qword_1000655C0, &stru_100059778);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if (v5)
  {
    v6 = sub_1000128F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because device is in low power mode.", (uint8_t *)&v16, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    if ((-[NSObject isAutomaticAppUpdatesAllowed](v7, "isAutomaticAppUpdatesAllowed") & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000655B8, "objectForKey:", CFSTR("KeepAppsUpToDateAppList")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", v3));
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "BOOLValue") & 1) == 0)
      {
        v13 = sub_1000128F4();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138543362;
          v17 = v3;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because background app refresh for this app is disabled.", (uint8_t *)&v16, 0xCu);
        }

        v8 = 0;
      }
      else
      {
        v8 = 1;
      }

    }
    else
    {
      v12 = sub_1000128F4();
      v9 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Denying background activity for %{public}@ because background app refresh is globally disabled.", (uint8_t *)&v16, 0xCu);
      }
      v8 = 0;
    }

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_1000655D0 != -1)
    dispatch_once(&qword_1000655D0, &stru_100059798);
  return (id)qword_1000655C8;
}

+ (id)extensionPointQueriesWithPostProcessing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_EXQuery extensionPointIdentifierQuery:](_EXQuery, "extensionPointIdentifierQuery:", CFSTR("com.apple.background-asset-downloader-extension")));
  v17 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "setIncludePostprocessing:", v3, (_QWORD)v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)extensionContainingApplicationList
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _UNKNOWN **v8;
  __objc2_meth_list **p_class_meths;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  BAApplicationInfo *v24;
  _UNKNOWN **v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_msgSend((id)objc_opt_class(a1, v3), "extensionPointQueriesWithPostProcessing:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_EXQueryController executeQueries:](_EXQueryController, "executeQueries:"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &APP_SANDBOX_READ_ptr;
    p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
    v10 = *(_QWORD *)v34;
    v31 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      v32 = v7;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "containingBundleRecord"));
        v15 = objc_opt_class(v8[64], v14);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
          if (v17)
          {
            v18 = objc_msgSend(v12, "entitlementNamed:ofClass:", p_class_meths[94], objc_opt_class(NSString, v16));
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            v20 = objc_alloc((Class)NSBundle);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
            v22 = objc_msgSend(v20, "_initUniqueWithURL:", v21);

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "infoDictionary"));
            v24 = -[BAApplicationInfo initWithIdentifier:applicationTeamIdentifier:]([BAApplicationInfo alloc], "initWithIdentifier:applicationTeamIdentifier:", v17, v19);
            if (v24)
            {
              objc_msgSend(v30, "addObject:", v24);
              if (v23)
              {
                v25 = v8;
                v26 = v5;
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[BAApplicationConfigurationOverrides overridesForAppBundleIdentifier:](BAApplicationConfigurationOverrides, "overridesForAppBundleIdentifier:", v17));
                -[BAApplicationInfo updateApplicationWithInfoDictionary:applicationRecord:overrides:](v24, "updateApplicationWithInfoDictionary:applicationRecord:overrides:", v23, v13, v27);

                v5 = v26;
                v8 = v25;
                p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
              }
            }

            v10 = v31;
            v7 = v32;
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  return v30;
}

- (BAApplicationInfo)initWithIdentifier:(id)a3
{
  return -[BAApplicationInfo initWithIdentifier:applicationTeamIdentifier:](self, "initWithIdentifier:applicationTeamIdentifier:", a3, 0);
}

- (BAApplicationInfo)initWithIdentifier:(id)a3 applicationTeamIdentifier:(id)a4
{
  id v6;
  id v7;
  BAApplicationInfo *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *allowedDownloadDomains;
  NSMutableArray *v20;
  NSMutableArray *allowedDownloadDomainWildcards;
  uint64_t v22;
  NSMutableDictionary *blocksAwaitingNetworkConsent;
  void *v24;
  BAApplicationInfo *v25;
  NSObject *v26;
  id v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BAApplicationInfo;
  v8 = -[BAApplicationInfo init](&v29, "init");
  if (!v8)
    goto LABEL_5;
  if (!v6)
  {
    v26 = objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("identifier can not be nil"), 0));
    -[NSObject raise](v26, "raise");
LABEL_9:

    v25 = 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_baassets_validUTI"));
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
  {
    v27 = sub_1000128F4();
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100037950();
    goto LABEL_9;
  }
  v11 = objc_alloc_init((Class)NSRecursiveLock);
  -[BAApplicationInfo setAppInfoRecursiveLock:](v8, "setAppInfoRecursiveLock:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v8, "appInfoRecursiveLock"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ App Info Recursive Lock"), v6));
  objc_msgSend(v12, "setName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v8, "appInfoRecursiveLock"));
  objc_msgSend(v14, "lock");

  -[BAApplicationInfo setApplicationIdentifier:](v8, "setApplicationIdentifier:", v6);
  -[BAApplicationInfo setOptionalAmountDownloaded:](v8, "setOptionalAmountDownloaded:", 0);
  -[BAApplicationInfo setEssentialAmountDownloaded:](v8, "setEssentialAmountDownloaded:", 0);
  -[BAApplicationInfo setOptionalAssetDownloadAllowance:](v8, "setOptionalAssetDownloadAllowance:", 0);
  -[BAApplicationInfo setEssentialAssetDownloadAllowance:](v8, "setEssentialAssetDownloadAllowance:", 0);
  -[BAApplicationInfo setPermittedForInitialBackgroundActivity:](v8, "setPermittedForInitialBackgroundActivity:", 0);
  -[BAApplicationInfo setInitialBackgroundCellularPolicy:](v8, "setInitialBackgroundCellularPolicy:", 0);
  -[BAApplicationInfo setReceivedInstallingNotification:](v8, "setReceivedInstallingNotification:", 0);
  -[BAApplicationInfo setReceivedInstalledNotification:](v8, "setReceivedInstalledNotification:", 0);
  -[BAApplicationInfo setHasLaunchedApplication:](v8, "setHasLaunchedApplication:", 0);
  -[BAApplicationInfo setApplicationTeamIdentifier:](v8, "setApplicationTeamIdentifier:", v7);
  -[BAApplicationInfo setInstallSource:](v8, "setInstallSource:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  -[BAApplicationInfo setExtensionRuntimeEvents:](v8, "setExtensionRuntimeEvents:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  -[BAApplicationInfo setLastPeriodicCheckTime:](v8, "setLastPeriodicCheckTime:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  -[BAApplicationInfo setLastApplicationLaunchTime:](v8, "setLastApplicationLaunchTime:", v17);

  -[BAApplicationInfo setManifestURL:](v8, "setManifestURL:", 0);
  -[BAApplicationInfo setUserForceQuitApp:](v8, "setUserForceQuitApp:", 0);
  v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  allowedDownloadDomains = v8->_allowedDownloadDomains;
  v8->_allowedDownloadDomains = v18;

  v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  allowedDownloadDomainWildcards = v8->_allowedDownloadDomainWildcards;
  v8->_allowedDownloadDomainWildcards = v20;

  v8->_awaitingNetworkConsent = 0;
  v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  blocksAwaitingNetworkConsent = v8->_blocksAwaitingNetworkConsent;
  v8->_blocksAwaitingNetworkConsent = (NSMutableDictionary *)v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v8, "appInfoRecursiveLock"));
  objc_msgSend(v24, "unlock");

LABEL_5:
  v25 = v8;
LABEL_10:

  return v25;
}

- (BAApplicationInfo)initWithCoder:(id)a3
{
  id v4;
  BAApplicationInfo *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *allowedDownloadDomains;
  NSMutableArray *v15;
  NSMutableArray *allowedDownloadDomainWildcards;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSMutableDictionary *blocksAwaitingNetworkConsent;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  BAApplicationInfo *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v64;
  _QWORD v65[2];
  _QWORD v66[2];

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)BAApplicationInfo;
  v5 = -[BAApplicationInfo init](&v64, "init");
  if (!v5)
  {
LABEL_31:
    v41 = v5;
    goto LABEL_32;
  }
  v6 = v4;
  v7 = objc_alloc_init((Class)NSRecursiveLock);
  -[BAApplicationInfo setAppInfoRecursiveLock:](v5, "setAppInfoRecursiveLock:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v5, "appInfoRecursiveLock"));
  objc_msgSend(v8, "lock");

  v10 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), off_1000652F8[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[BAApplicationInfo setApplicationIdentifier:](v5, "setApplicationIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](v5, "applicationIdentifier"));
  if (v12)
  {
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allowedDownloadDomains = v5->_allowedDownloadDomains;
    v5->_allowedDownloadDomains = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allowedDownloadDomainWildcards = v5->_allowedDownloadDomainWildcards;
    v5->_allowedDownloadDomainWildcards = v15;

    -[BAApplicationInfo setPermittedForInitialBackgroundActivity:](v5, "setPermittedForInitialBackgroundActivity:", objc_msgSend(v6, "decodeBoolForKey:", off_100065340[0]));
    -[BAApplicationInfo setInitialBackgroundCellularPolicy:](v5, "setInitialBackgroundCellularPolicy:", objc_msgSend(v6, "decodeIntegerForKey:", off_100065348[0]));
    -[BAApplicationInfo setHasLaunchedApplication:](v5, "setHasLaunchedApplication:", objc_msgSend(v6, "decodeBoolForKey:", off_100065360[0]));
    v18 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v17), off_100065368[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[BAApplicationInfo setLastApplicationLaunchTime:](v5, "setLastApplicationLaunchTime:", v19);

    v21 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v20), off_100065388[0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[BAApplicationInfo setManifestURL:](v5, "setManifestURL:", v22);

    v24 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v23), off_100065300[0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[BAApplicationInfo setApplicationTeamIdentifier:](v5, "setApplicationTeamIdentifier:", v25);

    v27 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v26), off_100065378[0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[BAApplicationInfo setLastPeriodicCheckTime:](v5, "setLastPeriodicCheckTime:", v28);

    v66[0] = objc_opt_class(NSArray, v29);
    v66[1] = objc_opt_class(BAExtensionRuntime, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v31));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v32, CFSTR("extensionRuntimeEvents")));
    v34 = objc_msgSend(v33, "mutableCopy");
    -[BAApplicationInfo setExtensionRuntimeEvents:](v5, "setExtensionRuntimeEvents:", v34);

    v5->_awaitingNetworkConsent = 0;
    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    blocksAwaitingNetworkConsent = v5->_blocksAwaitingNetworkConsent;
    v5->_blocksAwaitingNetworkConsent = (NSMutableDictionary *)v35;

    if (objc_msgSend(v6, "containsValueForKey:", off_100065370[0]))
      -[BAApplicationInfo setUserForceQuitApp:](v5, "setUserForceQuitApp:", objc_msgSend(v6, "decodeBoolForKey:", off_100065370[0]));
    if (objc_msgSend(v6, "containsValueForKey:", off_100065338[0]))
    {
      v38 = objc_opt_class(NSNumber, v37);
      v39 = off_100065338[0];
    }
    else
    {
      if (!objc_msgSend(v6, "containsValueForKey:", off_100065328[0]))
      {
        -[BAApplicationInfo setOptionalAssetDownloadAllowance:](v5, "setOptionalAssetDownloadAllowance:", 0);
LABEL_12:
        if (objc_msgSend(v6, "containsValueForKey:", off_100065330[0]))
        {
          v45 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v44), off_100065330[0]);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          -[BAApplicationInfo setEssentialAssetDownloadAllowance:](v5, "setEssentialAssetDownloadAllowance:", objc_msgSend(v46, "unsignedLongLongValue"));

        }
        if (objc_msgSend(v6, "containsValueForKey:", off_100065320[0]))
        {
          v48 = objc_opt_class(NSNumber, v47);
          v49 = off_100065320[0];
        }
        else
        {
          if (!objc_msgSend(v6, "containsValueForKey:", off_100065310[0]))
          {
            -[BAApplicationInfo setOptionalAmountDownloaded:](v5, "setOptionalAmountDownloaded:", 0);
            goto LABEL_20;
          }
          v48 = objc_opt_class(NSNumber, v50);
          v49 = off_100065310[0];
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClass:forKey:", v48, v49));
        -[BAApplicationInfo setOptionalAmountDownloaded:](v5, "setOptionalAmountDownloaded:", objc_msgSend(v51, "unsignedLongLongValue"));

LABEL_20:
        if (objc_msgSend(v6, "containsValueForKey:", off_100065350[0]))
          v52 = (uint64_t)objc_msgSend(v6, "decodeBoolForKey:", off_100065350[0]);
        else
          v52 = 1;
        -[BAApplicationInfo setReceivedInstallingNotification:](v5, "setReceivedInstallingNotification:", v52);
        if (objc_msgSend(v6, "containsValueForKey:", off_100065358[0]))
          v53 = (uint64_t)objc_msgSend(v6, "decodeBoolForKey:", off_100065358[0]);
        else
          v53 = 1;
        -[BAApplicationInfo setReceivedInstalledNotification:](v5, "setReceivedInstalledNotification:", v53);
        if (objc_msgSend(v6, "containsValueForKey:", off_100065308[0]))
        {
          v55 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v54), off_100065308[0]);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          -[BAApplicationInfo setPersistentIdentifier:](v5, "setPersistentIdentifier:", v56);

        }
        if (objc_msgSend(v6, "containsValueForKey:", off_100065390))
          -[BAApplicationInfo setInstallSource:](v5, "setInstallSource:", objc_msgSend(v6, "decodeIntegerForKey:", off_100065390));
        v65[0] = objc_opt_class(NSArray, v57);
        v65[1] = objc_opt_class(NSString, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v59));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v60, off_100065380[0]));

        -[BAApplicationInfo _populateAllowedDomainInfoWithArray:](v5, "_populateAllowedDomainInfoWithArray:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v5, "appInfoRecursiveLock"));
        objc_msgSend(v62, "unlock");

        goto LABEL_31;
      }
      v38 = objc_opt_class(NSNumber, v42);
      v39 = off_100065328[0];
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClass:forKey:", v38, v39));
    -[BAApplicationInfo setOptionalAssetDownloadAllowance:](v5, "setOptionalAssetDownloadAllowance:", objc_msgSend(v43, "unsignedLongLongValue"));

    goto LABEL_12;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v5, "appInfoRecursiveLock"));
  objc_msgSend(v40, "unlock");

  v41 = 0;
LABEL_32:

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  unint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "lock");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
  objc_msgSend(v27, "encodeObject:forKey:", v5, off_1000652F8[0]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BAApplicationInfo optionalAmountDownloaded](self, "optionalAmountDownloaded")));
  objc_msgSend(v27, "encodeObject:forKey:", v6, off_100065320[0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BAApplicationInfo essentialAmountDownloaded](self, "essentialAmountDownloaded")));
  objc_msgSend(v27, "encodeObject:forKey:", v7, off_100065318[0]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance")));
  objc_msgSend(v27, "encodeObject:forKey:", v8, off_100065338[0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance")));
  objc_msgSend(v27, "encodeObject:forKey:", v9, off_100065330[0]);

  v10 = -[BAApplicationInfo permittedForInitialBackgroundActivity](self, "permittedForInitialBackgroundActivity");
  objc_msgSend(v27, "encodeBool:forKey:", v10, off_100065340[0]);
  v11 = -[BAApplicationInfo initialBackgroundCellularPolicy](self, "initialBackgroundCellularPolicy");
  objc_msgSend(v27, "encodeInteger:forKey:", v11, off_100065348[0]);
  v12 = -[BAApplicationInfo receivedInstallingNotification](self, "receivedInstallingNotification");
  objc_msgSend(v27, "encodeBool:forKey:", v12, off_100065350[0]);
  v13 = -[BAApplicationInfo receivedInstalledNotification](self, "receivedInstalledNotification");
  objc_msgSend(v27, "encodeBool:forKey:", v13, off_100065358[0]);
  v14 = -[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication");
  objc_msgSend(v27, "encodeBool:forKey:", v14, off_100065360[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastApplicationLaunchTime](self, "lastApplicationLaunchTime"));
  objc_msgSend(v27, "encodeObject:forKey:", v15, off_100065368[0]);

  v16 = -[BAApplicationInfo userForceQuitApp](self, "userForceQuitApp");
  objc_msgSend(v27, "encodeBool:forKey:", v16, off_100065370[0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastPeriodicCheckTime](self, "lastPeriodicCheckTime"));
  objc_msgSend(v27, "encodeObject:forKey:", v17, off_100065378[0]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationTeamIdentifier](self, "applicationTeamIdentifier"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationTeamIdentifier](self, "applicationTeamIdentifier"));
    objc_msgSend(v27, "encodeObject:forKey:", v19, off_100065300[0]);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo persistentIdentifier](self, "persistentIdentifier"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo persistentIdentifier](self, "persistentIdentifier"));
    objc_msgSend(v27, "encodeObject:forKey:", v21, off_100065308[0]);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo _serializableAllowedDomainInfo](self, "_serializableAllowedDomainInfo"));
  objc_msgSend(v27, "encodeObject:forKey:", v22, off_100065380[0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo manifestURL](self, "manifestURL"));
  objc_msgSend(v27, "encodeObject:forKey:", v23, off_100065388[0]);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
  objc_msgSend(v27, "encodeObject:forKey:", v24, CFSTR("extensionRuntimeEvents"));

  v25 = -[BAApplicationInfo installSource](self, "installSource");
  objc_msgSend(v27, "encodeInteger:forKey:", v25, off_100065390);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v26, "unlock");

}

- (BOOL)isEqual:(id)a3
{
  BAApplicationInfo *v4;
  uint64_t v5;
  BAApplicationInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = (BAApplicationInfo *)a3;
  v6 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v7 = objc_opt_class(v4, v5);
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](v6, "applicationIdentifier"));
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (int64_t)applicationState
{
  void *v3;
  int64_t applicationState;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  applicationState = self->_applicationState;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return applicationState;
}

- (void)setApplicationState:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_applicationState = a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    -[BAApplicationInfo applicationLaunched](self, "applicationLaunched");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (int64_t)applicationExtensionState
{
  void *v3;
  int64_t applicationExtensionState;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  applicationExtensionState = self->_applicationExtensionState;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return applicationExtensionState;
}

- (void)setApplicationExtensionState:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_applicationExtensionState = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (BOOL)userForceQuitApp
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_userForceQuitApp;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setUserForceQuitApp:(BOOL)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_userForceQuitApp = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (int64_t)installSource
{
  void *v3;
  int64_t installSource;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  installSource = self->_installSource;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return installSource;
}

- (void)setInstallSource:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_installSource = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (void)determineInstallSourceIfUnsetFromAuditToken:(id *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v9[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  if (!self->_installSource)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
    v7 = *(_OWORD *)&a3->var0[4];
    v9[0] = *(_OWORD *)a3->var0;
    v9[1] = v7;
    self->_installSource = +[BAInstallationSourceUtilities installationSourceFromAuditToken:applicationIdentifier:](BAInstallationSourceUtilities, "installationSourceFromAuditToken:applicationIdentifier:", v9, v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v8, "unlock");

}

- (NSMutableArray)allowedDownloadDomains
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = -[NSMutableArray copy](self->_allowedDownloadDomains, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return (NSMutableArray *)v4;
}

- (void)setAllowedDownloadDomains:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *allowedDownloadDomains;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));
  allowedDownloadDomains = self->_allowedDownloadDomains;
  self->_allowedDownloadDomains = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v8, "unlock");

}

- (NSMutableArray)allowedDownloadDomainWildcards
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = -[NSMutableArray copy](self->_allowedDownloadDomainWildcards, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return (NSMutableArray *)v4;
}

- (void)setAllowedDownloadDomainWildcards:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *allowedDownloadDomainWildcards;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));
  allowedDownloadDomainWildcards = self->_allowedDownloadDomainWildcards;
  self->_allowedDownloadDomainWildcards = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v8, "unlock");

}

- (void)applicationPrepareWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  objc_msgSend(v4, "clientType");
  -[BAApplicationInfo setPermittedForInitialBackgroundActivity:](self, "setPermittedForInitialBackgroundActivity:", sub_1000181AC((uint64_t)BAAgentUtilities));
  v6 = objc_msgSend(v4, "cellularPolicy");

  -[BAApplicationInfo setInitialBackgroundCellularPolicy:](self, "setInitialBackgroundCellularPolicy:", v6);
  v7 = sub_1000128F4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
    v10 = -[BAApplicationInfo permittedForInitialBackgroundActivity](self, "permittedForInitialBackgroundActivity");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preparing app using descriptor for: %{public}@. Permitted for initial background activity: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  -[BAApplicationInfo setReceivedInstalledNotification:](self, "setReceivedInstalledNotification:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v12, "unlock");

}

- (BOOL)receivedInstalledNotification
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_receivedInstalledNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setReceivedInstalledNotification:(BOOL)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_receivedInstalledNotification = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (BOOL)receivedInstallingNotification
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_receivedInstallingNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setReceivedInstallingNotification:(BOOL)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  self->_receivedInstallingNotification = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (BOOL)awaitingNetworkConsent
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_awaitingNetworkConsent;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)setAwaitingNetworkConsent:(BOOL)a3
{
  int v3;
  void *v5;
  int awaitingNetworkConsent;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  awaitingNetworkConsent = self->_awaitingNetworkConsent;
  if (awaitingNetworkConsent == v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v12, "unlock");

  }
  else
  {
    v7 = sub_1000128F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v16 = 138543362;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App awaiting network consent: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      v11 = 0;
      self->_awaitingNetworkConsent = v3;
    }
    else
    {
      if (v9)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v16 = 138543362;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App no longer awaiting network consent: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      self->_awaitingNetworkConsent = 0;
      v11 = -[NSMutableDictionary copy](self->_blocksAwaitingNetworkConsent, "copy");
      -[NSMutableDictionary removeAllObjects](self->_blocksAwaitingNetworkConsent, "removeAllObjects");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v14, "unlock");

    if (v11)
    {
      objc_msgSend(v11, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, &stru_1000597D8);

    }
  }
  return awaitingNetworkConsent != v3;
}

- (void)setPersistentIdentifier:(id)a3
{
  NSData *v4;
  void *v5;
  NSData *persistentIdentifier;
  id v7;

  v4 = (NSData *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  persistentIdentifier = self->_persistentIdentifier;
  self->_persistentIdentifier = v4;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v7, "unlock");

}

- (NSData)persistentIdentifier
{
  void *v3;
  NSData *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = self->_persistentIdentifier;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)applicationInstallingWithUpdateInstall:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "lock");

  v6 = sub_1000128F4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
      v12 = 138543362;
      v13 = v9;
      v10 = "Application is updating: %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);

    }
  }
  else if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
    v12 = 138543362;
    v13 = v9;
    v10 = "Application is installing: %{public}@";
    goto LABEL_6;
  }

  -[BAApplicationInfo setReceivedInstallingNotification:](self, "setReceivedInstallingNotification:", 1);
  -[BAApplicationInfo setReceivedInstalledNotification:](self, "setReceivedInstalledNotification:", 0);
  -[BAApplicationInfo setHasLaunchedApplication:](self, "setHasLaunchedApplication:", 0);
  -[BAApplicationInfo setOptionalAmountDownloaded:](self, "setOptionalAmountDownloaded:", 0);
  -[BAApplicationInfo setEssentialAmountDownloaded:](self, "setEssentialAmountDownloaded:", 0);
  -[BAApplicationInfo resetExtensionRuntime](self, "resetExtensionRuntime");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v11, "unlock");

}

- (void)applicationInstalled
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = sub_1000128F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Application installed to final location: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[BAApplicationInfo setReceivedInstallingNotification:](self, "setReceivedInstallingNotification:", 1);
  -[BAApplicationInfo setReceivedInstalledNotification:](self, "setReceivedInstalledNotification:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v7, "unlock");

}

- (void)updateApplicationWithInfoDictionary:(id)a3 applicationRecord:(id)a4 overrides:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BAInitialDownloadRestrictions")));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("BADownloadDomainAllowList")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("BAEssentialDownloadAllowance")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("BADownloadAllowance")));
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v13 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BAManifestURL")));
  if (os_variant_has_internal_content("com.apple.backgroundassets"))
  {
    v49 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "essentialDownloadAllowance"));

    if (v17)
    {
      v18 = sub_1000128F4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v50 = v14;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "essentialDownloadAllowance"));
        *(_DWORD *)buf = 138543618;
        v53 = v20;
        v54 = 2114;
        v55 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Essential download allowance for %{public}@ overridden to %{public}@", buf, 0x16u);

        v14 = v50;
      }

      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "essentialDownloadAllowance"));
      v14 = (void *)v22;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadAllowance"));

    v51 = v14;
    if (v23)
    {
      v24 = sub_1000128F4();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadAllowance"));
        *(_DWORD *)buf = 138543618;
        v53 = v26;
        v54 = 2114;
        v55 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Download allowance for %{public}@ overridden to %{public}@", buf, 0x16u);

        v14 = v51;
      }

      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadAllowance"));
      v15 = (void *)v28;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manifestURL"));

    if (v29)
    {
      v30 = sub_1000128F4();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manifestURL"));
        *(_DWORD *)buf = 138543618;
        v53 = v32;
        v54 = 2114;
        v55 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Manifest URL overridden for %{public}@ to %{public}@", buf, 0x16u);

        v14 = v51;
      }

      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manifestURL"));
      v16 = (void *)v34;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainAllowlist"));

    if (v35)
    {
      v36 = sub_1000128F4();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainAllowlist"));
        v48 = v13;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "componentsJoinedByString:", CFSTR(",")));
        *(_DWORD *)buf = 138543618;
        v53 = v38;
        v54 = 2114;
        v55 = v40;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Domain allowlist for %{public}@ overridden to %{public}@", buf, 0x16u);

        v14 = v51;
        v13 = v48;
      }

      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainAllowlist"));
      v13 = (void *)v41;
    }
    v10 = v49;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v42, "lock");

  -[BAApplicationInfo _populateAllowedDomainInfoWithArray:](self, "_populateAllowedDomainInfoWithArray:", v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentIdentifier"));

  -[BAApplicationInfo setPersistentIdentifier:](self, "setPersistentIdentifier:", v43);
  -[BAApplicationInfo setOptionalAssetDownloadAllowance:](self, "setOptionalAssetDownloadAllowance:", objc_msgSend(v15, "unsignedLongLongValue"));
  -[BAApplicationInfo setEssentialAssetDownloadAllowance:](self, "setEssentialAssetDownloadAllowance:", objc_msgSend(v14, "unsignedLongLongValue"));
  v45 = objc_opt_class(NSString, v44);
  if ((objc_opt_isKindOfClass(v16, v45) & 1) != 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));
    -[BAApplicationInfo setManifestURL:](self, "setManifestURL:", v46);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v47, "unlock");

}

- (id)extensionIdentity
{
  BAApplicationInfo *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BAApplicationInfo *v26;
  id v27;
  id v28;
  uint64_t v29;
  BOOL v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  NSObject *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](v2, "applicationIdentifier"));
  v5 = objc_msgSend(v4, "copy");

  v6 = -[BAApplicationInfo receivedInstalledNotification](v2, "receivedInstalledNotification") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](v2, "appInfoRecursiveLock"));
  objc_msgSend(v7, "unlock");

  v9 = objc_msgSend((id)objc_opt_class(v2, v8), "extensionPointQueriesWithPostProcessing:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_EXQueryController executeQueries:](_EXQueryController, "executeQueries:", v10));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v12)
  {
    v13 = v12;
    v45 = v10;
    v14 = 0;
    v15 = *(_QWORD *)v48;
    while (2)
    {
      v16 = 0;
      v17 = v14;
      v46 = v13;
      do
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleIdentifier", v45));
        v20 = objc_msgSend(v19, "hasPrefix:", v5);

        if (v20)
        {
          v14 = v18;

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo persistentIdentifier](v2, "persistentIdentifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "containingBundleRecord"));
          v23 = v22;
          if (v21)
          {
            if (v22)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "persistentIdentifier"));
              v25 = v15;
              v26 = v2;
              v27 = v5;
              v28 = v11;
              v29 = _LSPersistentIdentifierCompare(v21, v24);

              v30 = v29 == 100;
              v11 = v28;
              v5 = v27;
              v2 = v26;
              v15 = v25;
              v13 = v46;
              if (v30)
              {
                v31 = v14;

                v10 = v45;
                if (!v31)
                  goto LABEL_24;
LABEL_19:
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject containingBundleRecord](v31, "containingBundleRecord"));
                if (v35
                  && (v36 = objc_opt_class(LSApplicationRecord, v34),
                      (objc_opt_isKindOfClass(v35, v36) & 1) != 0))
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bundleIdentifier"));
                  v38 = objc_msgSend(v37, "isEqualToString:", v5);

                  if ((v38 & 1) != 0)
                  {
                    v39 = v31;
LABEL_30:

                    goto LABEL_31;
                  }
                  v44 = sub_100012964();
                  v42 = objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    sub_100037AA8(v35, (uint64_t)v5, v42);
                }
                else
                {
                  v41 = sub_100012964();
                  v42 = objc_claimAutoreleasedReturnValue(v41);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    sub_100037A20(v31, v42);
                }

                v39 = 0;
                goto LABEL_30;
              }
            }
          }

          v17 = v14;
        }
        else
        {
          v14 = v17;
        }
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v13)
        continue;
      break;
    }

    v10 = v45;
    if (v14)
    {
      v31 = v14;
      v32 = sub_100012964();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v5;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Could not find extension identity from persistant identifier, falling back to bundle identifier match. (ID:%{public}@)", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
  else
  {

  }
LABEL_24:
  v40 = sub_100012964();
  v31 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_1000379B8();
  v39 = 0;
LABEL_31:

  return v39;
}

- (id)applicationSecurityGroups
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionIdentity](self, "extensionIdentity"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containingBundleRecord"));
    v6 = objc_opt_class(LSApplicationRecord, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = objc_alloc((Class)LSApplicationExtensionRecord);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
      v21 = 0;
      v9 = objc_msgSend(v7, "initWithURL:requireValid:error:", v8, 0, &v21);

      v11 = objc_opt_class(LSApplicationExtensionRecord, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupContainerURLs"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupContainerURLs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));

        if (v13 && v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));
          v18 = objc_msgSend(v17, "mutableCopy");

          objc_msgSend(v18, "intersectSet:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));

        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
        }

      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
      }

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    }

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v19;
}

- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3
{
  return -[BAApplicationInfo remainingDownloadAllowanceWithNecessity:isManifest:](self, "remainingDownloadAllowanceWithNecessity:isManifest:", a3, 0);
}

- (unint64_t)remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v7, "lock");

  v8 = -[BAApplicationInfo _remainingDownloadAllowanceWithNecessity:isManifest:](self, "_remainingDownloadAllowanceWithNecessity:isManifest:", a3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v9, "unlock");

  return v8;
}

- (unint64_t)_remainingDownloadAllowanceWithNecessity:(int64_t)a3 isManifest:(BOOL)a4
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (a4)
  {
    v5 = -[BAApplicationInfo _remainingDownloadAllowanceWithNecessity:isManifest:](self, "_remainingDownloadAllowanceWithNecessity:isManifest:", 0, 0);
    return -[BAApplicationInfo _remainingDownloadAllowanceWithNecessity:isManifest:](self, "_remainingDownloadAllowanceWithNecessity:isManifest:", 1, 0)+ v5;
  }
  else
  {
    if (a3 == 1)
    {
      v7 = -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance");
      if (v7 < -[BAApplicationInfo essentialAmountDownloaded](self, "essentialAmountDownloaded"))
        -[BAApplicationInfo setEssentialAmountDownloaded:](self, "setEssentialAmountDownloaded:", -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance"));
      v8 = -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance");
      v9 = -[BAApplicationInfo essentialAmountDownloaded](self, "essentialAmountDownloaded");
    }
    else
    {
      v10 = -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance");
      if (v10 < -[BAApplicationInfo optionalAmountDownloaded](self, "optionalAmountDownloaded"))
        -[BAApplicationInfo setOptionalAmountDownloaded:](self, "setOptionalAmountDownloaded:", -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance"));
      v8 = -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance");
      v9 = -[BAApplicationInfo optionalAmountDownloaded](self, "optionalAmountDownloaded");
    }
    return v8 - v9;
  }
}

- (BOOL)_consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v9;

  v5 = a5;
  v9 = -[BAApplicationInfo _remainingDownloadAllowanceWithNecessity:isManifest:](self, "_remainingDownloadAllowanceWithNecessity:isManifest:", a4, 0);
  if (a4 == 1)
  {
    if (v9 > a3)
    {
      -[BAApplicationInfo setEssentialAmountDownloaded:](self, "setEssentialAmountDownloaded:", (char *)-[BAApplicationInfo essentialAmountDownloaded](self, "essentialAmountDownloaded") + a3);
      return 0;
    }
    if (v5)
      return -[BAApplicationInfo _consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:](self, "_consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:", a3, 0, 1);
    -[BAApplicationInfo setEssentialAmountDownloaded:](self, "setEssentialAmountDownloaded:", -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance"));
  }
  else
  {
    if (v9 > a3)
    {
      -[BAApplicationInfo setOptionalAmountDownloaded:](self, "setOptionalAmountDownloaded:", (char *)-[BAApplicationInfo optionalAmountDownloaded](self, "optionalAmountDownloaded") + a3);
      return 0;
    }
    -[BAApplicationInfo setOptionalAmountDownloaded:](self, "setOptionalAmountDownloaded:", -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance"));
  }
  return 1;
}

- (BOOL)consumeAllowanceShouldStopWithAdditionalBytes:(unint64_t)a3 downloadNecessity:(int64_t)a4 isManifest:(BOOL)a5
{
  _BOOL8 v5;
  void *v10;
  BOOL v11;
  void *v12;

  v5 = a5;
  if (-[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication"))
    return 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v10, "lock");

  v11 = -[BAApplicationInfo _consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:](self, "_consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:", a3, a4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v12, "unlock");

  return v11;
}

- (BOOL)initialRestrictionsAreEnforced
{
  return !-[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication")
      && -[BAApplicationInfo permittedForInitialBackgroundActivity](self, "permittedForInitialBackgroundActivity");
}

- (BOOL)allowsBackgroundActivity
{
  unsigned __int8 v2;
  void *v4;
  unsigned int v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v4, "lock");

  v5 = -[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication");
  if ((v5 & 1) != 0
    || !-[BAApplicationInfo permittedForInitialBackgroundActivity](self, "permittedForInitialBackgroundActivity"))
  {
    if (-[BAApplicationInfo userForceQuitApp](self, "userForceQuitApp"))
    {
      v7 = sub_1000128F4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background activity denied for (%{public}@) because the app was terminated by the user.", (uint8_t *)&v15, 0xCu);

      }
      v6 = 0;
      v2 = 0;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
    v2 = 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v10, "unlock");

  if (v6)
  {
    if (v5)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
      v2 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:](BAApplicationInfo, "applicationForIdentifierAllowsBackgroundActivity:", v11);
    }
    else
    {
      v12 = sub_1000128F4();
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
        v15 = 138543362;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Background activity denied for (%{public}@) because the user has not launched the app.", (uint8_t *)&v15, 0xCu);

      }
      v2 = 0;
    }

  }
  return v2 & 1;
}

- (BOOL)shouldDoPeriodicCheck
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastPeriodicCheckTime](self, "lastPeriodicCheckTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastApplicationLaunchTime](self, "lastApplicationLaunchTime"));
  if (!-[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication")
    || !-[BAApplicationInfo allowsBackgroundActivity](self, "allowsBackgroundActivity"))
  {
    goto LABEL_8;
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 <= -604800.0)
  {
    if (v5 > -2419200.0)
    {
      v6 = 604800.0;
      goto LABEL_7;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v6 = 86400.0;
LABEL_7:
  objc_msgSend(v3, "timeIntervalSinceNow");
  v8 = v6 <= -v7;
LABEL_9:

  return v8;
}

- (double)extensionRuntime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "isMoreThan24HoursAgo"))
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          objc_msgSend(v12, "elapsedTime");
          v10 = v10 + v13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
  objc_msgSend(v14, "removeObjectsInArray:", v5);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v15, "unlock");

  return v10;
}

- (void)resetExtensionRuntime
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = sub_1000128F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
    v9 = 138543362;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting extension runtime for: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v8, "unlock");

}

- (BOOL)shouldLaunchExtension
{
  double v2;

  -[BAApplicationInfo extensionRuntime](self, "extensionRuntime");
  return v2 + (double)0xAuLL < 600.0;
}

- (void)willLaunchExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BAExtensionRuntime *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo currentRuntime](self, "currentRuntime"));
  if (v4)
    -[BAApplicationInfo extensionExited](self, "extensionExited");
  v7 = objc_alloc_init(BAExtensionRuntime);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
  objc_msgSend(v5, "addObject:", v7);

  -[BAApplicationInfo setCurrentRuntime:](self, "setCurrentRuntime:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v6, "unlock");

}

- (void)extensionExited
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo currentRuntime](self, "currentRuntime"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo currentRuntime](self, "currentRuntime"));
    objc_msgSend(v5, "extensionExited");

    v6 = sub_1000128F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo currentRuntime](self, "currentRuntime"));
      objc_msgSend(v9, "elapsedTime");
      v12 = 138543618;
      v13 = v8;
      v14 = 2050;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Extension for app identifier %{public}@ ran for %{public}.1f seconds.", (uint8_t *)&v12, 0x16u);

    }
    -[BAApplicationInfo setCurrentRuntime:](self, "setCurrentRuntime:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v11, "unlock");

}

- (void)donePeriodicCheck
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BAApplicationInfo setLastPeriodicCheckTime:](self, "setLastPeriodicCheckTime:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

}

- (void)applicationLaunched
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  if ((self->_applicationState & 0xFFFFFFFFFFFFFFFELL) != 4)
    self->_applicationState = 5;
  -[BAApplicationInfo setHasLaunchedApplication:](self, "setHasLaunchedApplication:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BAApplicationInfo setLastApplicationLaunchTime:](self, "setLastApplicationLaunchTime:", v4);

  -[BAApplicationInfo setUserForceQuitApp:](self, "setUserForceQuitApp:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v5, "unlock");

}

- (void)performAfterNetworkConsentProvided:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v8, "lock");

  if (!self->_awaitingNetworkConsent)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v17, "unlock");

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002DD70;
    block[3] = &unk_100058F48;
    v19 = v6;
    dispatch_async(v7, block);

    v15 = v19;
LABEL_6:

    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo blocksAwaitingNetworkConsent](self, "blocksAwaitingNetworkConsent"));
  v10 = objc_retainBlock(v6);
  objc_msgSend(v9, "setObject:forKey:", v7, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo blocksAwaitingNetworkConsent](self, "blocksAwaitingNetworkConsent"));
  v12 = objc_msgSend(v11, "count");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v13, "unlock");

  if (v12)
  {
    v14 = sub_1000128F4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
      *(_DWORD *)buf = 134218242;
      v21 = v12;
      v22 = 2114;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "There are %lu blocks enqueued awaiting network for identifier: %{public}@", buf, 0x16u);

    }
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_debugConsumeTime:(double)a3
{
  BAExtensionRuntime *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  if (a3 <= 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v9, "lock");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
    objc_msgSend(v10, "removeAllObjects");

    v5 = (BAExtensionRuntime *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    -[BAExtensionRuntime unlock](v5, "unlock");
  }
  else
  {
    v5 = -[BAExtensionRuntime initWithStartDate:]([BAExtensionRuntime alloc], "initWithStartDate:", v11);
    -[BAExtensionRuntime extensionExited](v5, "extensionExited");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v6, "lock");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo extensionRuntimeEvents](self, "extensionRuntimeEvents"));
    objc_msgSend(v7, "addObject:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
    objc_msgSend(v8, "unlock");

  }
}

- (void)_populateAllowedDomainInfoWithArray:(id)a3
{
  id v4;
  NSMutableArray **p_allowedDownloadDomainWildcards;
  NSMutableArray **p_allowedDownloadDomains;
  NSMutableArray *allowedDownloadDomains;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  p_allowedDownloadDomainWildcards = &self->_allowedDownloadDomainWildcards;
  -[NSMutableArray removeAllObjects](self->_allowedDownloadDomainWildcards, "removeAllObjects");
  allowedDownloadDomains = self->_allowedDownloadDomains;
  p_allowedDownloadDomains = &self->_allowedDownloadDomains;
  -[NSMutableArray removeAllObjects](allowedDownloadDomains, "removeAllObjects");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v13, "hasPrefix:", CFSTR("*"), (_QWORD)v18))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_baassets_validUTI"));
          v17 = (id *)p_allowedDownloadDomains;
          if (!v15)
            goto LABEL_12;
LABEL_11:
          objc_msgSend(*v17, "addObject:", v15);
          goto LABEL_12;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_baassets_validUTIWithWildcard"));
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "length");
          v17 = (id *)p_allowedDownloadDomainWildcards;
          if ((unint64_t)v16 > 1)
            goto LABEL_11;
        }
LABEL_12:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (id)_serializableAllowedDomainInfo
{
  return -[NSMutableArray arrayByAddingObjectsFromArray:](self->_allowedDownloadDomains, "arrayByAddingObjectsFromArray:", self->_allowedDownloadDomainWildcards);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v17;
  unint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo applicationIdentifier](self, "applicationIdentifier"));
  v18 = -[BAApplicationInfo optionalAssetDownloadAllowance](self, "optionalAssetDownloadAllowance");
  v17 = -[BAApplicationInfo essentialAssetDownloadAllowance](self, "essentialAssetDownloadAllowance");
  v5 = -[BAApplicationInfo optionalAmountDownloaded](self, "optionalAmountDownloaded");
  v6 = -[BAApplicationInfo essentialAmountDownloaded](self, "essentialAmountDownloaded");
  v7 = CFSTR("YES");
  if (-[BAApplicationInfo receivedInstallingNotification](self, "receivedInstallingNotification"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[BAApplicationInfo receivedInstalledNotification](self, "receivedInstalledNotification"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo _serializableAllowedDomainInfo](self, "_serializableAllowedDomainInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastPeriodicCheckTime](self, "lastPeriodicCheckTime"));
  if (!-[BAApplicationInfo hasLaunchedApplication](self, "hasLaunchedApplication"))
    v7 = CFSTR("NO");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo lastApplicationLaunchTime](self, "lastApplicationLaunchTime"));
  -[BAApplicationInfo extensionRuntime](self, "extensionRuntime");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Application Identifier: %@\nInitial (Optional Download Allowance: %llu\nInitial (Essential Download Allowance: %llu\nAmount Downloaded (Optional): %llu\nAmount Downloaded (Essential): %llu\nReceived Installing Notification: %@\nReceived Installed Notification: %@\nAllowed Domains: %@\nLast Check Time: %@\nApp Has Been Launched: %@\nLast Launch Time: %@\nExtension Runtime In Last 24h: %lf"), v4, v18, v17, v5, v6, v8, v9, v10, v11, v7, v12, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BAApplicationInfo appInfoRecursiveLock](self, "appInfoRecursiveLock"));
  objc_msgSend(v15, "unlock");

  return v14;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)lastPeriodicCheckTime
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastPeriodicCheckTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)lastApplicationLaunchTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastApplicationLaunchTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)hasLaunchedApplication
{
  return self->_hasLaunchedApplication;
}

- (void)setHasLaunchedApplication:(BOOL)a3
{
  self->_hasLaunchedApplication = a3;
}

- (BOOL)permittedForInitialBackgroundActivity
{
  return self->_permittedForInitialBackgroundActivity;
}

- (void)setPermittedForInitialBackgroundActivity:(BOOL)a3
{
  self->_permittedForInitialBackgroundActivity = a3;
}

- (unint64_t)initialBackgroundCellularPolicy
{
  return self->_initialBackgroundCellularPolicy;
}

- (void)setInitialBackgroundCellularPolicy:(unint64_t)a3
{
  self->_initialBackgroundCellularPolicy = a3;
}

- (NSString)applicationTeamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplicationTeamIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)optionalAssetDownloadAllowance
{
  return self->_optionalAssetDownloadAllowance;
}

- (void)setOptionalAssetDownloadAllowance:(unint64_t)a3
{
  self->_optionalAssetDownloadAllowance = a3;
}

- (unint64_t)essentialAssetDownloadAllowance
{
  return self->_essentialAssetDownloadAllowance;
}

- (void)setEssentialAssetDownloadAllowance:(unint64_t)a3
{
  self->_essentialAssetDownloadAllowance = a3;
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setManifestURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unint64_t)optionalAmountDownloaded
{
  return self->_optionalAmountDownloaded;
}

- (void)setOptionalAmountDownloaded:(unint64_t)a3
{
  self->_optionalAmountDownloaded = a3;
}

- (unint64_t)essentialAmountDownloaded
{
  return self->_essentialAmountDownloaded;
}

- (void)setEssentialAmountDownloaded:(unint64_t)a3
{
  self->_essentialAmountDownloaded = a3;
}

- (NSMutableDictionary)blocksAwaitingNetworkConsent
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSRecursiveLock)appInfoRecursiveLock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAppInfoRecursiveLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableArray)extensionRuntimeEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setExtensionRuntimeEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BAExtensionRuntime)currentRuntime
{
  return (BAExtensionRuntime *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCurrentRuntime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRuntime, 0);
  objc_storeStrong((id *)&self->_extensionRuntimeEvents, 0);
  objc_storeStrong((id *)&self->_appInfoRecursiveLock, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingNetworkConsent, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_applicationTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_lastApplicationLaunchTime, 0);
  objc_storeStrong((id *)&self->_lastPeriodicCheckTime, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedDownloadDomainWildcards, 0);
  objc_storeStrong((id *)&self->_allowedDownloadDomains, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

@end
