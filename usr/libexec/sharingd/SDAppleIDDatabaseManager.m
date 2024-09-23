@implementation SDAppleIDDatabaseManager

- (SDAppleIDDatabaseManager)init
{
  SDAppleIDDatabaseManager *v2;
  uint64_t v3;
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  uint64_t v5;
  NSMutableDictionary *personInfoCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAppleIDDatabaseManager;
  v2 = -[SDAppleIDDatabaseManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[SDAppleIDAccountInfoStoreFactory platformStore](_TtC16DaemoniOSLibrary32SDAppleIDAccountInfoStoreFactory, "platformStore"));
    accountInfoStore = v2->_accountInfoStore;
    v2->_accountInfoStore = (_TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    personInfoCache = v2->_personInfoCache;
    v2->_personInfoCache = (NSMutableDictionary *)v5;

    -[SDAppleIDDatabaseManager _readPrefs](v2, "_readPrefs");
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_1007C68F0 != -1)
    dispatch_once(&qword_1007C68F0, &stru_100717528);
  return (id)qword_1007C68F8;
}

- (void)_readPrefs
{
  SDAppleIDDatabaseManager *v2;
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SDAppleIDDatabaseManager *v9;
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSSet *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;

  v2 = self;
  accountInfoStore = self->_accountInfoStore;
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 30, "Reading Apple ID account information from %@\n", CFSTR("com.apple.sharingd"));
  v4 = kCFPreferencesCurrentUser;
  v5 = (void *)CFPreferencesCopyValue(CFSTR("AppleIDAgentMetaInfo"), CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  v7 = objc_opt_class(NSData, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v9 = v2;
    v10 = accountInfoStore;
    v11 = objc_opt_class(NSDictionary, v8);
    v13 = objc_opt_class(NSString, v12);
    v15 = objc_opt_class(NSDate, v14);
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v13, v15, objc_opt_class(NSNumber, v16), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v54 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v5, &v54));
    v20 = v54;
    if (v19)
    {
      v51 = v19;
      objc_storeStrong((id *)&v9->_metaInfo, v19);
      accountInfoStore = v10;
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 30, "Apple ID agent meta info retrieved from defaults: %@\n", v9->_metaInfo);
      }
    }
    else
    {
      accountInfoStore = v10;
      if (dword_1007B1AF8 <= 60)
      {
        v2 = v9;
        if (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 60))
          LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 60, "### Failed to unarchive %@ pref value with error %@\n", CFSTR("AppleIDAgentMetaInfo"), v20);
        v51 = 0;
LABEL_18:
        v4 = kCFPreferencesCurrentUser;
        if (!accountInfoStore)
          goto LABEL_21;
        goto LABEL_19;
      }
      v51 = 0;
    }
    v2 = v9;
    goto LABEL_18;
  }
  v18 = 0;
  v20 = 0;
  v51 = 0;
  if (!accountInfoStore)
    goto LABEL_21;
LABEL_19:
  if ((-[SDAppleIDPlatformAccountInfoStore storeExists](v2->_accountInfoStore, "storeExists") & 1) != 0)
  {
    v21 = 0;
    v22 = 0;
LABEL_53:
    if ((-[SDAppleIDPlatformAccountInfoStore storeExists](v2->_accountInfoStore, "storeExists") & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDPlatformAccountInfoStore read](v2->_accountInfoStore, "read"));
      v41 = v40;
      if (v40)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "account"));

        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "account"));
          -[SDAppleIDDatabaseManager _setAccount:](v2, "_setAccount:", v43);

        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "personInfo"));
        v45 = objc_msgSend(v44, "mutableCopy");

        if (v45)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "personInfo"));
          v47 = objc_msgSend(v46, "mutableCopy");
          -[SDAppleIDDatabaseManager setPersonInfoCache:](v2, "setPersonInfoCache:", v47);

        }
      }
      else if (dword_1007B1AF8 <= 90
             && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 90, "Failed reading Apple ID account info");
      }
      -[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded](v2, "_clearLegacyPreferencesIfNeeded");

    }
    else
    {
      if (dword_1007B1AF8 <= 50
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 50)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 50, "Migrating legacy preferences");
      }
      v48 = v2->_accountInfoStore;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](v2, "account"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](v2, "personInfoCache"));
      LODWORD(v48) = -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:](v48, "storeWithAccount:personInfo:", v49, v50);

      if ((_DWORD)v48)
        -[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded](v2, "_clearLegacyPreferencesIfNeeded");
    }
    goto LABEL_70;
  }
LABEL_21:
  if (dword_1007B1AF8 <= 50 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 50)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 50, "Reading legacy preferences for AppleID and Person Info");
  v23 = (void *)CFPreferencesCopyValue(CFSTR("AppleIDAccount"), CFSTR("com.apple.sharingd"), v4, kCFPreferencesCurrentHost);

  v25 = objc_opt_class(NSData, v24);
  if ((objc_opt_isKindOfClass(v23, v25) & 1) == 0)
    goto LABEL_38;

  v53 = 0;
  v27 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(SFAppleIDAccount, v26), v23, &v53);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v20 = v53;
  if (!v22)
  {
    if (dword_1007B1AF8 <= 60
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 60)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 60, "### Failed to unarchive %@ pref value with error %@\n", CFSTR("AppleIDAccount"), v20);
    }
LABEL_38:
    v22 = 0;
    goto LABEL_39;
  }
  -[SDAppleIDDatabaseManager _setAccount:](v2, "_setAccount:", v22);
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](v2, "account"));
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 30, "Apple ID account retrieved from defaults: %@\n", v28);

  }
LABEL_39:
  v5 = (void *)CFPreferencesCopyValue(CFSTR("PersonInfoCache"), CFSTR("com.apple.sharingd"), v4, kCFPreferencesCurrentHost);

  v30 = objc_opt_class(NSData, v29);
  if ((objc_opt_isKindOfClass(v5, v30) & 1) != 0)
  {

    v32 = objc_opt_class(NSDictionary, v31);
    v34 = objc_opt_class(NSString, v33);
    v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, v34, objc_opt_class(SFAppleIDPersonInfo, v35), 0);
    v37 = objc_claimAutoreleasedReturnValue(v36);

    v52 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v37, v5, &v52));
    v20 = v52;
    if (v21)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v21));
      -[SDAppleIDDatabaseManager setPersonInfoCache:](v2, "setPersonInfoCache:", v38);

      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](v2, "personInfoCache"));
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 30, "%d cached person info values retrieved from defaults\n", objc_msgSend(v39, "count"));

      }
    }
    else
    {
      if (dword_1007B1AF8 <= 60
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 60)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _readPrefs]", 60, "### Failed to unarchive %@ pref value with error %@\n", CFSTR("PersonInfoCache"), v20);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
    v37 = (uint64_t)v18;
  }
  v18 = (void *)v37;
  if (accountInfoStore)
    goto LABEL_53;
LABEL_70:

}

- (void)_clearLegacyPreferencesIfNeeded
{
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  unsigned int v3;
  BOOL v4;

  accountInfoStore = self->_accountInfoStore;
  v3 = -[SDAppleIDPlatformAccountInfoStore storeExists](accountInfoStore, "storeExists");
  if (accountInfoStore)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    if (dword_1007B1AF8 <= 50
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 50)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded]", 50, "Clearing legacy preferences");
    }
    CFPreferencesSetValue(CFSTR("AppleIDAccount"), 0, CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSetValue(CFSTR("PersonInfoCache"), 0, CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(CFSTR("com.apple.sharingd"));
  }
}

- (id)_identityForAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleID")),
        v7 = objc_msgSend(v6, "isEqualToString:", v4),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));

  return v9;
}

- (id)_accountForAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleID")),
        v7 = objc_msgSend(v6, "isEqualToString:", v4),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accountForAppleID:(id)a3
{
  id v4;
  SDAppleIDDatabaseManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](v5, "_accountForAppleID:", v4));
  v7 = objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  return v7;
}

- (id)identityForAppleID:(id)a3
{
  id v4;
  SDAppleIDDatabaseManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _identityForAppleID:](v5, "_identityForAppleID:", v4));
  v7 = objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  return v7;
}

- (id)_statusInfo
{
  uint64_t v3;
  void *v4;
  NSNumber *v5;
  void *v6;
  NSNumber *v7;
  void *v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", MKBDeviceUnlockedSinceBoot(v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("DeviceUnlockedSinceBoot"));

    v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PID"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_lastConnectionDate, CFSTR("LastConnectAttempt"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_lastSuccessfulConnectionDate, CFSTR("LastSuccessfulConnect"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("AccountRequiresUserAction"));
    v9 = v4;
  }

  return v4;
}

- (id)statusInfo
{
  SDAppleIDDatabaseManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _statusInfo](v2, "_statusInfo"));
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateAccountInfoPrefs
{
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFPropertyListRef value;

  accountInfoStore = self->_accountInfoStore;
  v4 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  v5 = (void *)v4;
  if (accountInfoStore)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:](accountInfoStore, "storeWithAccount:personInfo:", v5, v6);

    v7 = v5;
  }
  else
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      value = (CFPropertyListRef)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));

    }
    else
    {
      value = 0;
    }

    CFPreferencesSetValue(CFSTR("AppleIDAccount"), value, CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(CFSTR("com.apple.sharingd"));
    if (dword_1007B1AF8 <= 30
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _updateAccountInfoPrefs]", 30, "Updated Apple ID account in the local database\n");
    }
    v7 = (void *)value;
  }

}

- (void)_updateMetaInfoPrefs
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_metaInfo, 1, 0));
  CFPreferencesSetValue(CFSTR("AppleIDAgentMetaInfo"), v2, CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(CFSTR("com.apple.sharingd"));
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _updateMetaInfoPrefs]", 30, "Updated meta info in the local database\n");

}

- (void)_updatePersonInfoCachePrefs
{
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  void *v4;
  void *v5;
  void *value;

  accountInfoStore = self->_accountInfoStore;
  if (accountInfoStore)
  {
    value = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:](accountInfoStore, "storeWithAccount:personInfo:", value, v4);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    value = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0));

    CFPreferencesSetValue(CFSTR("PersonInfoCache"), value, CFSTR("com.apple.sharingd"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(CFSTR("com.apple.sharingd"));
    if (dword_1007B1AF8 <= 30
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs]", 30, "Updated person info cache in the local database\n");
    }
  }

}

- (void)_setAccount:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  v5 = objc_msgSend(v23, "isEqual:", v4);

  v6 = v23;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));
    if (v7 == v9)
    {
      v13 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
      v13 = objc_msgSend(v10, "isEqual:", v12) ^ 1;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "validationRecord"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "validationRecord"));
    if (v14 == v16)
    {
      v20 = 0;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "validationRecord"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "validationRecord"));
      v20 = objc_msgSend(v17, "isEqual:", v19) ^ 1;

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identity"));
    objc_msgSend(v22, "removeFromKeychain");

    -[SDAppleIDDatabaseManager setAccount:](self, "setAccount:", v23);
    -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
    if (v13)
      -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDIdentityDidChangeNotification);
    v6 = v23;
    if (v20)
    {
      -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDValidationRecordDidChangeNotification);
      v6 = v23;
    }
  }

}

- (void)_addAppleID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const __CFString *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v4));
    if (v5)
    {
      v6 = (id)v5;
      v7 = CFSTR("new");
    }
    else
    {
      v6 = objc_msgSend(objc_alloc((Class)SFAppleIDAccount), "initWithAppleID:", v8);
      v7 = CFSTR("updated existing");
    }
    -[SDAppleIDDatabaseManager _setAccount:](self, "_setAccount:", v6);
    if (dword_1007B1AF8 <= 30
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _addAppleID:]", 30, "Added account for Apple ID %{mask} (%@)\n", v8, v7);
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)addAppleID:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _addAppleID:](v4, "_addAppleID:", v5);
  objc_sync_exit(v4);

}

- (void)_removeAppleID:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appleID"));
    v6 = objc_msgSend(v5, "isEqualToString:", v7);

    if (v6)
    {
      -[SDAppleIDDatabaseManager _setAccount:](self, "_setAccount:", 0);
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _removeAppleID:]", 30, "Removed account for Apple ID %{mask} \n", v7);
      }
    }
  }

}

- (void)removeAppleID:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _removeAppleID:](v4, "_removeAppleID:", v5);
  objc_sync_exit(v4);

}

- (void)_addPersonInfoToCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchedValue"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchedValue"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);

      -[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs](self, "_updatePersonInfoCachePrefs");
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchedValue"));
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _addPersonInfoToCache:]", 30, "Added person info for %{mask} to cache\n", v7);

      }
    }
  }

}

- (void)addPersonInfoToCache:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _addPersonInfoToCache:](v4, "_addPersonInfoToCache:", v5);
  objc_sync_exit(v4);

}

- (id)_cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

    if (v6 && (objc_msgSend(v6, "isStale") & 1) == 0)
    {
      v7 = v6;
      v6 = v7;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }

  return v7;
}

- (id)cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4;
  SDAppleIDDatabaseManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _cachedPersonInfoWithEmailOrPhone:](v5, "_cachedPersonInfoWithEmailOrPhone:", v4));
  objc_sync_exit(v5);

  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchedValue"));
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager cachedPersonInfoWithEmailOrPhone:]", 30, "Cached person info object for %{mask} is available\n", v7);

  }
  return v6;
}

- (void)_clearPersonInfoCache
{
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *accountInfoStore;
  void *v4;
  _TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *v5;
  id v6;

  accountInfoStore = self->_accountInfoStore;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
  objc_msgSend(v4, "removeAllObjects");

  if (accountInfoStore)
  {
    v5 = self->_accountInfoStore;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    -[SDAppleIDPlatformAccountInfoStore deletePersonInfoCacheWithAccount:](v5, "deletePersonInfoCacheWithAccount:", v6);

  }
  else
  {
    -[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs](self, "_updatePersonInfoCachePrefs");
  }
}

- (void)clearPersonInfoCache
{
  SDAppleIDDatabaseManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDDatabaseManager _clearPersonInfoCache](obj, "_clearPersonInfoCache");
  objc_sync_exit(obj);

}

- (void)_setLastConnectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectionDate, a3);
}

- (void)setLastConnectionDate:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setLastConnectionDate:](v4, "_setLastConnectionDate:", v5);
  objc_sync_exit(v4);

}

- (void)_setLastSuccessfulConnectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulConnectionDate, a3);
}

- (void)setLastSuccessfulConnectionDate:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setLastSuccessfulConnectionDate:](v4, "_setLastSuccessfulConnectionDate:", v5);
  objc_sync_exit(v4);

}

- (void)_setIdentity:(id)a3 forAppleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!v6)
  {
LABEL_31:
    v9 = 0;
    v14 = 0;
    v8 = 0;
    goto LABEL_26;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v6));
  if (!v7)
  {
    if (dword_1007B1AF8 <= 90
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]", 90, "### No account for %{mask}\n", v6);
    }
    goto LABEL_31;
  }
  v8 = v7;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identity"));
  v10 = v19;
  if (v9 == v19)
  {
    v11 = 0;
  }
  else
  {
    if ((objc_msgSend(v19, "isEqual:", v9) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));
      objc_msgSend(v12, "removeFromKeychain");

      objc_msgSend(v8, "setIdentity:", v19);
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        v13 = "Replaced";
        if (!v9)
          v13 = "Added";
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]", 30, "%s identity object for %{mask}. New identity object is %@\n", v13, v6, v19);
      }
      -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDIdentityDidChangeNotification);
      v11 = 1;
    }
    v10 = v19;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
  if (v14 == (void *)v15)
  {

    if ((v11 & 1) == 0)
      goto LABEL_26;
  }
  else
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
    v18 = objc_msgSend(v14, "isEqual:", v17);

    if ((v18 & 1) != 0)
    {
      if (!v11)
        goto LABEL_26;
    }
    else
    {
      objc_msgSend(v8, "setAltDSID:", v14);
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]", 30, "Updated AltDSDID for %{mask} to %@\n", v6, v14);
      }
    }
  }
  -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_26:

}

- (void)setIdentity:(id)a3 forAppleID:(id)a4
{
  id v6;
  id v7;
  SDAppleIDDatabaseManager *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v9, "copy");
  v8 = self;
  objc_sync_enter(v8);
  -[SDAppleIDDatabaseManager _setIdentity:forAppleID:](v8, "_setIdentity:forAppleID:", v7, v6);
  objc_sync_exit(v8);

}

- (void)_setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  v11 = v6;
  if (!v6)
  {
LABEL_14:
    v10 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v6));
  if (!v7)
  {
    if (dword_1007B1AF8 <= 90
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:]", 90, "### No account for %{mask}\n", v11);
    }
    goto LABEL_14;
  }
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identity"));
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "linkedToCurrentUser") != v4)
    {
      objc_msgSend(v10, "setLinkedToCurrentUser:", v4);
      -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
    }
  }
  else
  {
    if (dword_1007B1AF8 <= 90
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:]", 90, "### No identity for %@\n", 0);
    }
    v10 = 0;
  }
LABEL_6:

}

- (void)setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  _BOOL8 v4;
  SDAppleIDDatabaseManager *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:](v6, "_setIdentityLinkedToCurrentUser:forAppleID:", v4, v7);
  objc_sync_exit(v6);

}

- (void)_setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
LABEL_34:
    v11 = 0;
    goto LABEL_27;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v9));
  if (!v10)
  {
    if (dword_1007B1AF8 <= 90
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]", 90, "### No account for %{mask}\n", v9);
    }
    goto LABEL_34;
  }
  v11 = v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "certificateToken"));
  v13 = v23;
  v14 = v12 != v23;
  if (v12 == v23)
  {
LABEL_16:

    goto LABEL_19;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateToken"));
  v16 = objc_msgSend(v23, "isEqual:", v15);

  if ((v16 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v11, "setCertificateToken:", v23);
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]", 30, "Set Certificate Token %@ for %{mask}\n", v23, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateToken"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "setCertificateTokenCreationDate:", v18);

  }
  else
  {
    objc_msgSend(v11, "setCertificateTokenCreationDate:", 0);
  }

  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateTokenCreationDate"));
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]", 30, "Set Certificate Token Creation Date %@\n", v13);
    goto LABEL_16;
  }
  v14 = 1;
LABEL_19:
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
  if ((id)v19 == v8)
  {

  }
  else
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
    v22 = objc_msgSend(v8, "isEqual:", v21);

    if ((v22 & 1) == 0)
    {
      objc_msgSend(v11, "setPrivateKeyPersistentReference:", v8);
      if (dword_1007B1AF8 <= 30
        && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
      {
        LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]", 30, "Set Private Key Persistent Reference %p for %{mask}\n", v8, v9);
      }
      goto LABEL_26;
    }
  }
  if (v14)
LABEL_26:
    -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_27:

}

- (void)setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  SDAppleIDDatabaseManager *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:](v10, "_setCertificateToken:privateKeyPersistentReference:forAppleID:", v11, v8, v9);
  objc_sync_exit(v10);

}

- (void)_setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
LABEL_28:
    v11 = 0;
    goto LABEL_23;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v9));
  if (!v10)
  {
    if (dword_1007B1AF8 <= 90
      && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 90)))
    {
      LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]", 90, "### No account for %{mask}\n", v9);
    }
    goto LABEL_28;
  }
  v11 = v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactInfo"));
  if (v12 == v20)
  {

    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactInfo"));
  v14 = objc_msgSend(v20, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v11, "setContactInfo:", v20);
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]", 30, "Set Contact Info %@ for %{mask}\n", v20, v9);
  v15 = 1;
LABEL_12:
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
  if ((id)v16 == v8)
  {

LABEL_18:
    if (!v15)
      goto LABEL_23;
    goto LABEL_22;
  }
  v17 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
  v19 = objc_msgSend(v8, "isEqual:", v18);

  if ((v19 & 1) != 0)
    goto LABEL_18;
  objc_msgSend(v11, "setValidationRecord:", v8);
  if (dword_1007B1AF8 <= 30 && (dword_1007B1AF8 != -1 || _LogCategory_Initialize(&dword_1007B1AF8, 30)))
    LogPrintF(&dword_1007B1AF8, "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]", 30, "Set Validation Record %@ for %{mask}\n", v8, v9);
  -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDValidationRecordDidChangeNotification);
LABEL_22:
  -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_23:

}

- (void)setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  SDAppleIDDatabaseManager *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v13, "copy");
  v11 = objc_msgSend(v8, "copy");
  v12 = self;
  objc_sync_enter(v12);
  -[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:](v12, "_setContactInfo:validationRecord:forAppleID:", v10, v11, v9);
  objc_sync_exit(v12);

}

- (void)_setMetaInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metaInfo;
  unsigned __int8 v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  v4 = (NSDictionary *)a3;
  metaInfo = self->_metaInfo;
  if (metaInfo != v4)
  {
    v9 = v4;
    v6 = -[NSDictionary isEqual:](metaInfo, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      v8 = self->_metaInfo;
      self->_metaInfo = v7;

      -[SDAppleIDDatabaseManager _updateMetaInfoPrefs](self, "_updateMetaInfoPrefs");
      v4 = v9;
    }
  }

}

- (void)setMetaInfo:(id)a3
{
  SDAppleIDDatabaseManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setMetaInfo:](v4, "_setMetaInfo:", v5);
  objc_sync_exit(v4);

}

- (NSDictionary)metaInfo
{
  SDAppleIDDatabaseManager *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_metaInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)_postNotificationWithName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  v5 = SFMainQueue(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EDEA8;
  block[3] = &unk_1007146D8;
  v9 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

- (NSDate)lastSuccessfulConnectionDate
{
  return self->_lastSuccessfulConnectionDate;
}

- (SFAppleIDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSMutableDictionary)personInfoCache
{
  return self->_personInfoCache;
}

- (void)setPersonInfoCache:(id)a3
{
  objc_storeStrong((id *)&self->_personInfoCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personInfoCache, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulConnectionDate, 0);
  objc_storeStrong((id *)&self->_lastConnectionDate, 0);
  objc_storeStrong((id *)&self->_accountInfoStore, 0);
  objc_storeStrong((id *)&self->_metaInfo, 0);
}

@end
