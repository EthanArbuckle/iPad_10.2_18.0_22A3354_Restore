@implementation ICStartupController

+ (BOOL)shouldShowWhatsNewScreen
{
  unsigned int v3;

  if ((objc_msgSend(a1, "shouldBypassWelcomeAndWhatsNewScreen") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(a1, "isCurrentStartupVersionNewerThanLastSeenVersion");
    if (v3)
      LOBYTE(v3) = objc_msgSend(a1, "shouldShowWelcomeScreen") ^ 1;
  }
  return v3;
}

+ (BOOL)shouldShowWelcomeScreen
{
  int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;

  if ((objc_msgSend(a1, "shouldBypassWelcomeAndWhatsNewScreen") & 1) != 0)
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", kICEnableForcediCloudMigrationDefaultsKey);

  if (objc_msgSend(a1, "hasShownWelcomeScreen"))
  {
    if (objc_msgSend(a1, "isCurrentStartupVersionNewerThanLastSeenVersion"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
      v7 = objc_msgSend(v6, "primaryICloudAccountEnabled");

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
      v9 = objc_msgSend(v8, "didChooseToMigratePrimaryICloudAccount");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryICloudACAccount"));
      v12 = objc_msgSend(v11, "ic_isNotesMigrated");

      v13 = +[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount");
      v3 = (v9 | ~v7 | v12) & v13 ^ 1;
      v14 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v35 = v7;
        v36 = 1024;
        v37 = v9;
        v38 = 1024;
        v39 = v12;
        v40 = 1024;
        v41 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: primaryiCloudAccountEnabled=%d didChooseToMigratePrimaryiCloudAccount=%d primaryiCloudAccountMigrated=%d didChooseToMigrateLocalAccount=%d", buf, 0x1Au);
      }

      if ((v3 & 1) != 0)
        goto LABEL_30;
    }
    else
    {
      v3 = 0;
    }
    if (((v5 ^ 1) & 1) == 0)
    {
      v15 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: forceUpgrade", buf, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allICloudACAccounts"));

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        v22 = ICACAccountPropertyDidChooseToMigrate;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v22, (_QWORD)v29));
            if (objc_msgSend(v24, "ic_supportsModernNotes"))
            {
              v26 = !objc_msgSend(v24, "ic_isNotesEnabled") || v25 == 0;
              if (!v26 && (objc_msgSend(v25, "BOOLValue") & 1) == 0)
              {

                v3 = 1;
                goto LABEL_29;
              }
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v20)
            continue;
          break;
        }
      }
      v3 = 0;
LABEL_29:

    }
    goto LABEL_30;
  }
  v3 = 1;
LABEL_30:
  v27 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v35 = v3;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: shouldShow=%d", buf, 8u);
  }

  return v3;
}

+ (BOOL)shouldShowWelcomeOrWhatsNewScreen
{
  if ((objc_msgSend(a1, "shouldShowWelcomeScreen") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "shouldShowWhatsNewScreen");
}

+ (BOOL)shouldBypassWelcomeAndWhatsNewScreen
{
  void *v2;
  char *v3;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICLaunchConfiguration currentConfiguration](ICLaunchConfiguration, "currentConfiguration"));
  v3 = (char *)objc_msgSend(v2, "environment");

  if ((unint64_t)(v3 - 1) < 2)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("bypassWhatsNewScreen"));

  return v6;
}

+ (BOOL)consumeShouldResetMigrationStateInternalSetting
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = kICInternalSettingsResetMigrationStateDefaultKey;
  v4 = objc_msgSend(v2, "BOOLForKey:", kICInternalSettingsResetMigrationStateDefaultKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController previousCheckStatusCancellationObject](self, "previousCheckStatusCancellationObject"));
  objc_msgSend(v3, "setValue:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICStartupController;
  -[ICStartupController dealloc](&v5, "dealloc");
}

+ (BOOL)hasSetValueForFirstLaunchMigration
{
  return 0;
}

+ (BOOL)hasShownWelcomeScreen
{
  void *v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  int v7;
  void *v8;
  __int16 v9;
  unsigned int v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hasShowWelcomeScreenDefaultsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", v2);

  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v2;
    v9 = 1024;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@=%d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (void)setHasShownWelcomeScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hasShowWelcomeScreenDefaultsKey"));
  objc_msgSend(v5, "setBool:forKey:", v3, v6);

  objc_msgSend(a1, "setLastShownStartupWelcomeScreenVersionToCurrentVersion");
}

+ (id)hasShowWelcomeScreenDefaultsKey
{
  return _objc_msgSend(a1, "hostedAppKeyWithBaseKey:", CFSTR("hasShownWelcomeScreen"));
}

+ (id)lastShownStartupDefaultsKey
{
  return _objc_msgSend(a1, "hostedAppKeyWithBaseKey:", CFSTR("lastShownStartupVersion-1"));
}

+ (id)hostedAppKeyWithBaseKey:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v4, "ic_hasConnectedHostedWindowScene");

  v6 = v3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("Calculator"), v3));

  }
  return v6;
}

+ (BOOL)shouldBypassICloudAlert
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("bypassICloudAlert"));

  return v3;
}

+ (BOOL)isCurrentStartupVersionNewerThanLastSeenVersion
{
  void *v3;
  void *v4;
  NSObject *v5;
  __int128 v7;
  uint64_t v8;
  uint8_t buf[16];
  uint64_t v10;
  uint8_t v11[16];
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));

  if (objc_msgSend(v4, "userType") == (id)1)
  {
    a1 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)a1, OS_LOG_TYPE_INFO, "isCurrentStartupVersionNewerThanLastSeenVersion: UMUserTypeEphemeral", buf, 2u);
    }

    LOBYTE(a1) = 0;
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    v10 = 0;
    objc_msgSend(a1, "lastShownStartupWelcomeScreenVersion");
    *(_OWORD *)v11 = xmmword_100451940;
    v12 = 0;
    v7 = *(_OWORD *)buf;
    v8 = v10;
    LODWORD(a1) = objc_msgSend(a1, "isOSVersion:newerThanVersion:", v11, &v7);
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v11 = 67109120;
      *(_DWORD *)&v11[4] = (_DWORD)a1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "isCurrentStartupVersionNewerThanLastSeenVersion=%d", v11, 8u);
    }

  }
  return (char)a1;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastShownStartupWelcomeScreenVersion
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  id v23;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lastShownStartupDefaultsKey"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v7 = objc_opt_class(NSArray);
  v8 = ICDynamicCast(v7, v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "count") == (id)3)
  {
    v10 = objc_opt_class(NSNumber);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v12 = ICDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    retstr->var0 = (int64_t)objc_msgSend(v13, "integerValue");

    v14 = objc_opt_class(NSNumber);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
    v16 = ICDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    retstr->var1 = (int64_t)objc_msgSend(v17, "integerValue");

    v18 = objc_opt_class(NSNumber);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 2));
    v20 = ICDynamicCast(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    retstr->var2 = (int64_t)objc_msgSend(v21, "integerValue");

  }
  return result;
}

+ (BOOL)isOSVersion:(id *)a3 newerThanVersion:(id *)a4
{
  BOOL v4;
  int64_t var1;
  int64_t v6;

  v4 = a3->var0 <= a4->var0;
  if (a3->var0 == a4->var0)
  {
    var1 = a3->var1;
    v6 = a4->var1;
    v4 = var1 <= v6;
    if (var1 == v6)
      v4 = a3->var2 <= a4->var2;
  }
  return !v4;
}

+ (void)setLastShownStartupWelcomeScreenVersionToCurrentVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "operatingSystemVersion");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastShownStartupDefaultsKey"));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

}

+ (BOOL)hasAccountForMigration
{
  return +[ICAccount isCloudKitAccountAvailable](ICAccount, "isCloudKitAccountAvailable");
}

+ (BOOL)shouldShowUpdateICloudAccountView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allCloudKitAccountsInContext:](ICAccount, "allCloudKitAccountsInContext:", v3));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "didChooseToMigrate"))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController legacyLocalAccount](ICMigrationController, "legacyLocalAccount"));
  v9 = v4 != 0;
LABEL_11:

  return v9;
}

- (ICStartupController)initWithDelegate:(id)a3
{
  id v4;
  ICStartupController *v5;
  ICStartupController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStartupController;
  v5 = -[ICStartupController init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[ICStartupController setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "migrationStateDidChange:", ICMigrationStateDidChangeNotification, 0);

  }
  return v6;
}

- (void)didContinueFromStartupView
{
  objc_msgSend((id)objc_opt_class(self), "setHasShownWelcomeScreen:", 1);
  -[ICStartupController setUserDidContinue:](self, "setUserDidContinue:", 1);
}

- (void)didUpgradeFromStartupView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  _BOOL4 v56;

  v3 = a3;
  -[ICStartupController didContinueFromStartupView](self, "didContinueFromStartupView");
  if (-[ICStartupController didAddReachabilityObserver](self, "didAddReachabilityObserver"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = kReachabilityChangedNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

    -[ICStartupController setDidAddReachabilityObserver:](self, "setDidAddReachabilityObserver:", 0);
  }
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v56 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User made upgrade choice (%d) from startup view", buf, 8u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController targetAccountID](self, "targetAccountID"));
  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v12 = v11;
  if (v9)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iCloudACAccountWithIdentifier:", v9));

    if (!v13)
      goto LABEL_21;
    objc_msgSend(v10, "addObject:", v13);
  }
  else
  {
    v39 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allICloudACAccounts"));

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v13 = v14;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v49;
      v18 = ICACAccountPropertyDidChooseToMigrate;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v17)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "ic_isNotesEnabled"))
          {
            if (objc_msgSend(v20, "ic_supportsModernNotes"))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v18));
              v22 = objc_msgSend(v21, "BOOLValue");

              if ((v22 & 1) == 0)
                objc_msgSend(v10, "addObject:", v20);
            }
          }
        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v16);
    }

    v3 = v39;
  }

LABEL_21:
  if (v3)
  {
    +[ICMigrationController setDidChooseToMigrateLocalAccount:](ICMigrationController, "setDidChooseToMigrateLocalAccount:", 1);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = v10;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          v28 = v9;
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController legacyAccountForICloudACAccount:](ICMigrationController, "legacyAccountForICloudACAccount:", v29));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));

          v31 = +[ICMigrationController currentMigrationStateForAccountID:](ICMigrationController, "currentMigrationStateForAccountID:", v9);
          if (v30 && (v31 < 2 || (objc_msgSend(v30, "didChooseToMigrate") & 1) == 0))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
            objc_msgSend(v32, "startMigrationForICloudAccountID:", v9);

          }
          +[ICMigrationController migrateLocalAccountIfNecessary](ICMigrationController, "migrateLocalAccountIfNecessary");

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v25);
    }
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v10;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v41;
      do
      {
        v37 = 0;
        v38 = v9;
        do
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v33);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v37), "identifier"));

          +[ICMigrationController setCurrentMigrationState:forAccountID:](ICMigrationController, "setCurrentMigrationState:forAccountID:", 1, v9);
          v37 = (char *)v37 + 1;
          v38 = v9;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v35);
    }
  }

}

- (id)timerRunLoopMode
{
  return NSDefaultRunLoopMode;
}

- (void)checkStatusIfNecessaryWithDeviceCheckIndicator:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id buf[2];

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Check device and migration status.", (uint8_t *)buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController previousCheckStatusCancellationObject](self, "previousCheckStatusCancellationObject"));
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cancelling previous status check.", (uint8_t *)buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController previousCheckStatusCancellationObject](self, "previousCheckStatusCancellationObject"));
    objc_msgSend(v8, "setValue:", 1);

    -[ICStartupController setPreviousCheckStatusCancellationObject:](self, "setPreviousCheckStatusCancellationObject:", 0);
  }
  -[ICStartupController setPrimaryAccountDevices:](self, "setPrimaryAccountDevices:", 0);
  v9 = objc_alloc_init((Class)ICMutableBool);
  -[ICStartupController setPreviousCheckStatusCancellationObject:](self, "setPreviousCheckStatusCancellationObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v11, "invalidate");

    -[ICStartupController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
    -[ICStartupController setDeviceCheckIndicatorAnimationLevel:](self, "setDeviceCheckIndicatorAnimationLevel:", 1);
    -[ICStartupController startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:](self, "startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:", v4);
  }
  else
  {
    -[ICStartupController setDeviceCheckIndicatorAnimationLevel:](self, "setDeviceCheckIndicatorAnimationLevel:", 0);
    -[ICStartupController startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:](self, "startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:", v4);
  }
  objc_initWeak(buf, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryICloudACAccount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "managedObjectContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v14, v16));

    if (v17)
    {
      -[ICStartupController startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:](self, "startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICCompatibilityController sharedController](ICCompatibilityController, "sharedController"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000A3168;
      v26[3] = &unk_100553380;
      v27 = v9;
      objc_copyWeak(&v29, buf);
      v28 = v4;
      objc_msgSend(v18, "devicesForAccount:completionHandler:", v17, v26);

      objc_destroyWeak(&v29);
    }
  }
  else
  {
    v17 = 0;
  }
  if (!+[ICMigrationController currentMigrationStateForAccountID:](ICMigrationController, "currentMigrationStateForAccountID:", v14))
  {
    -[ICStartupController startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:](self, "startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:", v4);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1000A3354;
    v22 = &unk_1005533A8;
    v23 = v9;
    objc_copyWeak(&v25, buf);
    v24 = v4;
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:withCompletionHandler:](ICMigrationUtilities, "fetchAndSetMigrationStateForAccountID:withCompletionHandler:", 0, &v19);

    objc_destroyWeak(&v25);
  }
  -[ICStartupController stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:](self, "stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:", v4, v19, v20, v21, v22);

  objc_destroyWeak(buf);
}

- (void)deviceCheckTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Timeout waiting for device list or migration state", v11, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController previousCheckStatusCancellationObject](self, "previousCheckStatusCancellationObject"));
  objc_msgSend(v6, "setValue:", 1);

  -[ICStartupController setPreviousCheckStatusCancellationObject:](self, "setPreviousCheckStatusCancellationObject:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___ICStartupDeviceCheckIndicator);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100409B04(v4, v10);

    v9 = 0;
  }
  -[ICStartupController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  objc_msgSend(v9, "stopIndicatorAnimation");

}

- (void)startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "deviceCheckTimeout:", v9, 0, 4.0));
    -[ICStartupController setTimeoutTimer:](self, "setTimeoutTimer:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timerRunLoopMode](self, "timerRunLoopMode"));
    objc_msgSend(v6, "addTimer:forMode:", v7, v8);

  }
}

- (void)startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[ICStartupController deviceCheckIndicatorAnimationLevel](self, "deviceCheckIndicatorAnimationLevel"))
    objc_msgSend(v4, "startIndicatorAnimation");
  -[ICStartupController setDeviceCheckIndicatorAnimationLevel:](self, "setDeviceCheckIndicatorAnimationLevel:", (char *)-[ICStartupController deviceCheckIndicatorAnimationLevel](self, "deviceCheckIndicatorAnimationLevel") + 1);
  -[ICStartupController startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:](self, "startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:", v4);

}

- (void)stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[ICStartupController deviceCheckIndicatorAnimationLevel](self, "deviceCheckIndicatorAnimationLevel"))
  {
    -[ICStartupController setDeviceCheckIndicatorAnimationLevel:](self, "setDeviceCheckIndicatorAnimationLevel:", (char *)-[ICStartupController deviceCheckIndicatorAnimationLevel](self, "deviceCheckIndicatorAnimationLevel") - 1);
    if (!-[ICStartupController deviceCheckIndicatorAnimationLevel](self, "deviceCheckIndicatorAnimationLevel"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController timeoutTimer](self, "timeoutTimer"));
        objc_msgSend(v5, "invalidate");

        -[ICStartupController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
        objc_msgSend(v6, "stopIndicatorAnimation");
      }
    }
  }

}

+ (id)copyIMAPAccountAlertMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("This IMAP account is syncing with the Notes app. If you copy your notes to iCloud, this account will stop syncing with the Notes app."), &stru_1005704B8, 0));

  return v3;
}

+ (id)copyExchangeAccountAlertMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("This Exchange account is syncing with the Notes app. If you copy your notes to iCloud, this account will stop syncing with the Notes app."), &stru_1005704B8, 0));

  return v3;
}

+ (id)moveLocalNotesAlertMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("To see these notes on all your devices, move them to iCloud.\n\nOnce these notes are moved to iCloud, this local account will be removed."), &stru_1005704B8, 0));

  return v3;
}

- (void)migrationStateDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  if (-[ICStartupController userDidContinue](self, "userDidContinue")
    && !+[ICStartupController hasAccountForMigration](ICStartupController, "hasAccountForMigration"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController delegate](self, "delegate"));
    objc_msgSend(v12, "startupControllerShouldCloseDeviceListView");

  }
  else if (!-[ICStartupController userDidContinue](self, "userDidContinue"))
  {
    v5 = objc_opt_class(NSNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey")));
    v8 = ICDynamicCast(v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      v10 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Startup migration type might have changed from migration state did change.", v13, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController delegate](self, "delegate"));
      objc_msgSend(v11, "startupMigrationTypeMightHaveChanged");

    }
  }

}

- (void)reachabilityChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!-[ICStartupController userDidContinue](self, "userDidContinue", a3))
  {
    v4 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Startup migration type might have changed from reachability changed.", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController delegate](self, "delegate"));
    objc_msgSend(v5, "startupMigrationTypeMightHaveChanged");

  }
}

+ (id)importantDisclaimerAttributedString
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSAttributedStringDocumentAttributeKey v10;
  NSAttributedStringDocumentType v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WelcomeScreenDisclaimer"), CFSTR("rtf")));

  v4 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", &stru_1005704B8);
  if (v3)
  {
    v5 = objc_alloc((Class)NSAttributedString);
    v10 = NSDocumentTypeDocumentAttribute;
    v11 = NSRTFTextDocumentType;
    v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v7 = objc_msgSend(v5, "initWithURL:options:documentAttributes:error:", v3, v6, 0, 0);

    v4 = (id)v6;
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100409B98(v8);

    v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("Missing RTF file"));
  }

  return v7;
}

- (unint64_t)getStartupMigrationType
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allICloudACAccounts"));

  v5 = -[ICStartupController getStartupMigrationTypeWithAccounts:](self, "getStartupMigrationTypeWithAccounts:", v4);
  return v5;
}

- (unint64_t)getStartupMigrationTypeWithAccounts:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  _BOOL4 v36;
  unsigned __int8 v38;
  _BOOL4 v39;
  unsigned __int8 v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v4 = a3;
  +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary](ICMigrationController, "upgradeEmptyLocalLegacyAccountIfNecessary");
  v40 = objc_msgSend((id)objc_opt_class(self), "hasShownWelcomeScreen");
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "ic_isNotesEnabled")
          && objc_msgSend(v11, "ic_supportsModernNotes"))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    v16 = ICACAccountPropertyDidChooseToMigrate;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));
        if ((objc_msgSend(v18, "ic_isNotesMigrated") & 1) == 0
          && (objc_msgSend(v19, "BOOLValue") & 1) == 0)
        {

          v20 = 0;
          goto LABEL_22;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v14)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_22:

  if (!-[ICStartupController didAddReachabilityObserver](self, "didAddReachabilityObserver"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v22 = kReachabilityChangedNotification;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v21, "addObserver:selector:name:object:", self, "reachabilityChanged:", v22, v23);

    -[ICStartupController setDidAddReachabilityObserver:](self, "setDidAddReachabilityObserver:", 1);
  }
  if (+[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount"))
  {
    v24 = 0;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController legacyLocalAccount](ICMigrationController, "legacyLocalAccount"));
    v26 = ICProtocolCast(&OBJC_PROTOCOL___ICLegacyAccount, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController legacyAccountContext](ICMigrationController, "legacyAccountContext"));
  if (objc_msgSend(v12, "count"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController primaryAccountDevices](self, "primaryAccountDevices"));
    v29 = objc_msgSend(v28, "ic_containsObjectPassingTest:", &stru_1005533E8);

    if (v20)
    {
      if (!v24)
      {
LABEL_33:
        v31 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgraded", buf, 2u);
        }
        v32 = 1;
        goto LABEL_61;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID"));
      if (!objc_msgSend(v27, "nonEmptyNoteExistsForLegacyAccountWithObjectID:", v30)
        || +[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount"))
      {

        goto LABEL_33;
      }
      v38 = +[ICMigrationController didMigrateLocalAccount](ICMigrationController, "didMigrateLocalAccount");

      if ((v38 & 1) != 0)
        goto LABEL_33;
      v31 = os_log_create("com.apple.notes", "Migration");
      v39 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if ((v40 & 1) != 0)
      {
        if (v39)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgradedButLocalAccountNotUpgraded", buf, 2u);
        }
        v32 = 3;
      }
      else if (v39)
      {
        *(_WORD *)buf = 0;
        v32 = 2;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgradedButLocalAccountNotUpgradedAndIsFirstLaunchOnThisDevice", buf, 2u);
      }
      else
      {
        v32 = 2;
      }
    }
    else if (objc_msgSend(v12, "count")
           && (+[ICUtilities isInternetReachable](ICUtilities, "isInternetReachable") & 1) == 0)
    {
      v31 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeICloudAccountButOffline", buf, 2u);
      }
      v32 = 6;
    }
    else if (objc_msgSend(v12, "count")
           && (v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupController primaryAccountDevices](self, "primaryAccountDevices")),
               v35,
               !v35))
    {
      v31 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeICloudAccountAndOnlineButUnableToGetDevices", buf, 2u);
      }
      v32 = 7;
    }
    else
    {
      v31 = os_log_create("com.apple.notes", "Migration");
      v36 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNotesOnOneOrMoreDevicesSomeRequireOSUpdates", buf, 2u);
        }
        v32 = 5;
      }
      else
      {
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAllDevicesUpgradedOrLocalNotesWithNoICloudAccount", buf, 2u);
        }
        v32 = 4;
      }
    }
  }
  else if (v24
         && (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID")),
             v34 = objc_msgSend(v27, "nonEmptyNoteExistsForLegacyAccountWithObjectID:", v33),
             v33,
             (v34 & 1) != 0))
  {
    v31 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNoICloudWithOnlyHTMLLocalAccount", buf, 2u);
    }
    v32 = 8;
  }
  else
  {
    v31 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNoICloudOrLocalAccounts", buf, 2u);
    }
    v32 = 9;
  }
LABEL_61:

  return v32;
}

- (NSArray)primaryAccountDevices
{
  return self->_primaryAccountDevices;
}

- (void)setPrimaryAccountDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)targetAccountID
{
  return self->_targetAccountID;
}

- (void)setTargetAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_targetAccountID, a3);
}

- (BOOL)userDidContinue
{
  return self->_userDidContinue;
}

- (void)setUserDidContinue:(BOOL)a3
{
  self->_userDidContinue = a3;
}

- (unint64_t)deviceCheckIndicatorAnimationLevel
{
  return self->_deviceCheckIndicatorAnimationLevel;
}

- (void)setDeviceCheckIndicatorAnimationLevel:(unint64_t)a3
{
  self->_deviceCheckIndicatorAnimationLevel = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (ICStartupControllerDelegate)delegate
{
  return (ICStartupControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICMutableBool)previousCheckStatusCancellationObject
{
  return self->_previousCheckStatusCancellationObject;
}

- (void)setPreviousCheckStatusCancellationObject:(id)a3
{
  objc_storeStrong((id *)&self->_previousCheckStatusCancellationObject, a3);
}

- (BOOL)didAddReachabilityObserver
{
  return self->_didAddReachabilityObserver;
}

- (void)setDidAddReachabilityObserver:(BOOL)a3
{
  self->_didAddReachabilityObserver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCheckStatusCancellationObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_targetAccountID, 0);
  objc_storeStrong((id *)&self->_primaryAccountDevices, 0);
}

@end
