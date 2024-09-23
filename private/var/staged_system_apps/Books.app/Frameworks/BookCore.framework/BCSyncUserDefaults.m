@implementation BCSyncUserDefaults

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v2 = objc_opt_class(a1);
  if (v2 == objc_opt_class(BCSyncUserDefaults))
  {
    v11[0] = CFSTR("BKLibrary.ReadingNow");
    v11[1] = CFSTR("BCSyncICloudDrive");
    v12[0] = &__kCFBooleanTrue;
    v12[1] = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "registerDefaults:", v3);

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v9 = dispatch_queue_create("com.apple.iBooks.BCSyncUserDefaults", v8);
    v10 = (void *)qword_30DC98;
    qword_30DC98 = (uint64_t)v9;

  }
}

+ (BOOL)isSignedIntoICloud
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isUserSignedInToiCloud");

  v4 = BCUbiquityEnabledLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isSignedIntoICloud = %@", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

+ (BOOL)isCloudKitSyncOptedIn
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;

  +[BCSyncUserDefaults waitForPendingSyncIfNeeded](BCSyncUserDefaults, "waitForPendingSyncIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isPrimaryAccountManagedAppleID");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BCSyncCloudKit"));

  return v3 | v5;
}

+ (BOOL)isGlobalICloudDriveSyncOptedIn
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isGlobalICloudDriveSyncOptedIn");

  v4 = BCUbiquityEnabledLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isGlobalICloudDriveSyncOptedIn = %@", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

+ (BOOL)isICloudDriveSyncOptedIn
{
  +[BCSyncUserDefaults waitForPendingSyncIfNeeded](BCSyncUserDefaults, "waitForPendingSyncIfNeeded");
  return +[BCSyncUserDefaults _isICloudDriveSyncOptedIn](BCSyncUserDefaults, "_isICloudDriveSyncOptedIn");
}

+ (BOOL)_isICloudDriveSyncOptedIn
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isPrimaryAccountManagedAppleID");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BCSyncICloudDrive"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BCSyncCloudKit"));

  v8 = BCUbiquityEnabledLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    if (v3)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (v5)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v14 = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    if (v7)
      v10 = CFSTR("YES");
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isICloudDriveSyncOptedIn isPrimaryAccountManagedAppleID = %@ isBCSyncICloudDriveUserDefaults = %@ isBCSyncCloudKitUserDefaults = %@", (uint8_t *)&v14, 0x20u);
  }

  return v3 | v5 & v7;
}

+ (BOOL)archivedICloudDriveSyncOptedInBeforeInitialTCCSync
{
  if (qword_30DCA8 != -1)
    dispatch_once(&qword_30DCA8, &stru_290D28);
  return byte_30DCA0;
}

+ (BOOL)_q_archivedICloudDriveSyncOptedInBeforeInitialTCCSync
{
  if (qword_30DCB8 != -1)
    dispatch_once(&qword_30DCB8, &stru_290D68);
  return byte_30DCB0;
}

+ (BOOL)isICloudDriveEnabledForBooks
{
  void *v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BCICloudIdentityToken tokenForCurrentIdentityIfICloudDriveEnabled](BCICloudIdentityToken, "tokenForCurrentIdentityIfICloudDriveEnabled"));

  v3 = BCUbiquityEnabledLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NO");
    if (v2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: isICloudDriveEnabledForBooks = %@", (uint8_t *)&v7, 0xCu);
  }

  return v2 != 0;
}

+ (BOOL)isCollectionSyncOptedIn
{
  return 1;
}

+ (BOOL)isReadingNowSyncOptedIn
{
  void *v2;
  unsigned __int8 v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  if ((objc_msgSend(v2, "isPrimaryAccountManagedAppleID") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BKLibrary.ReadingNow"));

  }
  return v3;
}

+ (void)waitForPendingSyncIfNeeded
{
  dispatch_sync((dispatch_queue_t)qword_30DC98, &stru_290D88);
}

+ (void)syncDefaultsWithTCC
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = BCUbiquityEnabledLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "BCSyncUserDefaults: syncDefaultsWithTCC", v4, 2u);
  }

  dispatch_async((dispatch_queue_t)qword_30DC98, &stru_290DA8);
}

+ (NSArray)userDefaultsKeysUsedForSyncing
{
  if (qword_30DCD0 != -1)
    dispatch_once(&qword_30DCD0, &stru_290E08);
  return (NSArray *)(id)qword_30DCC8;
}

+ (id)makeOSStateHandler
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D4834;
  v3[3] = &unk_290E28;
  v3[4] = a1;
  return objc_msgSend(objc_alloc((Class)BUOSStateHandler), "initWithTitle:block:", CFSTR("BCSyncUserDefaults"), v3);
}

@end
