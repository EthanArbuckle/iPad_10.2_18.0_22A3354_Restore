@implementation FMFAccountManager

- (void)setAccountStateAuthorizedDueTo401
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setAccountStateAuthorizedDueTo401: setting account status to authorized", v5, 2u);
  }

  -[FMFAccountManager setLatest401TS:](self, "setLatest401TS:", 0);
}

- (BOOL)isAccountAuthorized
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  BOOL v17;
  int v19;
  double v20;
  __int16 v21;
  double v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager latest401TS](self, "latest401TS"));

  if (!v3)
  {
    v16 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is authorized due to latest401TS == nil", (uint8_t *)&v19, 2u);
    }
    goto LABEL_11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager latest401TS](self, "latest401TS"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager latest401TS](self, "latest401TS"));
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    -[FMFAccountManager graceInterval401InSec](self, "graceInterval401InSec");
    v10 = v9;
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218240;
      v20 = v8;
      v21 = 2048;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: intervalSinceLast401 is %f, graceInterval401InSec is %f", (uint8_t *)&v19, 0x16u);
    }

    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v8 < v10)
    {
      if (v15)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is unauthorized", (uint8_t *)&v19, 2u);
      }
      v17 = 0;
      goto LABEL_16;
    }
    if (v15)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is authorized", (uint8_t *)&v19, 2u);
    }

    -[FMFAccountManager setLatest401TS:](self, "setLatest401TS:", 0);
    v14 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject postNotificationName:object:](v14, "postNotificationName:object:", off_1000B2FB8, 0);
LABEL_11:
    v17 = 1;
LABEL_16:

    return v17;
  }
  return 1;
}

- (BOOL)hasCredentials
{
  FMFAccountManager *v2;
  FMFAccount *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  __int16 v12;
  FMFAccountManager *v13;
  __int16 v14;
  FMFAccount *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_account;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](v3, "dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount fmfAppToken](v3, "fmfAppToken"));
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138413314;
    v11 = (id)objc_opt_class(v2);
    v12 = 2048;
    v13 = v2;
    v14 = 2112;
    v15 = v3;
    v16 = 1024;
    v17 = v4 != 0;
    v18 = 1024;
    v19 = v5 != 0;
    v8 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> hasCredentials acc:%@, hasDSID: %i, hasFMFAppToken: %i", (uint8_t *)&v10, 0x2Cu);

  }
  objc_sync_exit(v2);

  return v4 != 0 && v5 != 0;
}

+ (id)sharedInstance
{
  if (qword_1000B37D0 != -1)
    dispatch_once(&qword_1000B37D0, &stru_10009A3F8);
  return (id)qword_1000B37C8;
}

- (FMFAccount)account
{
  FMFAccountManager *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[FMFAccount copy](v2->_account, "copy");
  objc_sync_exit(v2);

  return (FMFAccount *)v3;
}

- (void)setRetryAfterRenewCount:(int64_t)a3
{
  self->_retryAfterRenewCount = a3;
}

- (void)setLatest401TS:(id)a3
{
  objc_storeStrong((id *)&self->_latest401TS, a3);
}

- (NSDate)latest401TS
{
  return self->_latest401TS;
}

- (BOOL)hasFirstUnlocked
{
  return (int)MKBDeviceUnlockedSinceBoot(self, a2) > 0;
}

- (void)iCloudAccountChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  FMFAccountManager *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received iCloud account changed notification: %@", buf, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  if ((byte_1000B37D8 & 1) == 0)
  {
    byte_1000B37D8 = 1;
    v8 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003224C;
    block[3] = &unk_1000993C8;
    block[4] = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_sync_exit(v7);

}

- (void)iCloudAccountWasAdded:(id)a3
{
  -[FMFAccountManager forwardSavedMappingPacketsToServer](self, "forwardSavedMappingPacketsToServer", a3);
}

- (void)iCloudAccountRemoved:(id)a3
{
  -[FMFAccountManager setStoredDSID:](self, "setStoredDSID:", 0);
}

- (void)updateAccountInfo
{
  FMFAccountManager *v2;
  ACAccountStore *v3;
  FMFAccountManager *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  FMFAccount *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  FMFAccountManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  FMFAccountManager *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  FMFAccountManager *v30;
  id v31;
  NSObject *v32;
  void *v33;
  FMFAccountManager *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  int v39;
  id *p_account;
  BOOL v41;
  int v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  id v56;
  void *v57;
  void *context;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  FMFAccountManager *v62;
  __int16 v63;
  FMFAccountManager *v64;

  v2 = self;
  objc_sync_enter(v2);
  context = objc_autoreleasePoolPush();
  v3 = objc_opt_new(ACAccountStore);
  v4 = (FMFAccountManager *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v3, "aa_primaryAppleAccount"));

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v60 = (id)objc_opt_class(v2);
    v61 = 2048;
    v62 = v2;
    v63 = 2112;
    v64 = v4;
    v7 = v60;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Updating iCloud Account Info for account: %@", buf, 0x20u);

  }
  if (!v4)
  {
    v11 = 0;
    goto LABEL_24;
  }
  v8 = kAccountDataclassShareLocation;
  if ((-[FMFAccountManager isProvisionedForDataclass:](v4, "isProvisionedForDataclass:", kAccountDataclassShareLocation) & 1) == 0)
  {
    v27 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100064474(v9);
    v11 = 0;
    goto LABEL_23;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[FMFAccountManager dataclassProperties](v4, "dataclassProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v8));
  v11 = objc_alloc_init(FMFAccount);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager username](v4, "username"));
  -[FMFAccount setICloudId:](v11, "setICloudId:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager aa_personID](v4, "aa_personID"));
  -[FMFAccount setDsid:](v11, "setDsid:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager aa_authToken](v4, "aa_authToken"));
  -[FMFAccount setAuthToken:](v11, "setAuthToken:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager aa_authToken](v4, "aa_authToken"));
  v16 = v15 == 0;

  -[FMFAccount setAuthTokenStatus:](v11, "setAuthTokenStatus:", v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("apsEnv")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appHostname")));
  -[FMFAccountManager setAppHostnameFromSettings:](v2, "setAppHostnameFromSettings:", v17);

  v18 = (FMFAccountManager *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager appHostnameFromSettings](v2, "appHostnameFromSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cachedRedirects"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
  if ((objc_msgSend(v21, "containsObject:", v18) & 1) == 0)
  {

    goto LABEL_14;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v18));
  v23 = v22 == 0;

  if (v23)
  {
LABEL_14:
    v28 = sub_100011D0C();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v60 = v20;
      v61 = 2112;
      v62 = 0;
      v63 = 2112;
      v64 = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No cached redirect value found, clearing caches. cachedRedirects: %@, cachedRedirectHost: %@, appHostName: %@", buf, 0x20u);
    }

    v26 = objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    -[NSObject clearRedirectsCache](v26, "clearRedirectsCache");
    v24 = 0;
    goto LABEL_17;
  }
  v24 = (FMFAccountManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v18));
  v25 = sub_100011D0C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v60 = v20;
    v61 = 2112;
    v62 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found cached redirect value, cachedRedirects: %@, cachedRedirectHost: %@", buf, 0x16u);
  }
LABEL_17:

  if (v24)
    v30 = v24;
  else
    v30 = v18;
  -[FMFAccount setFmfAppHostName:](v11, "setFmfAppHostName:", v30);
  v31 = sub_100011D0C();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount fmfAppHostName](v11, "fmfAppHostName"));
    v34 = (FMFAccountManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appHostname")));
    *(_DWORD *)buf = 138412802;
    v60 = v33;
    v61 = 2112;
    v62 = v24;
    v63 = 2112;
    v64 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using host name: %@, cachedRedirectHost(%@), myDataclassProps[appHostname](%@)", buf, 0x20u);

  }
  -[FMFAccount setServerProtocolScheme:](v11, "setServerProtocolScheme:", CFSTR("https"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager apsEnvironmentConstantForiCloudBagKey:](v2, "apsEnvironmentConstantForiCloudBagKey:", v57));
  -[FMFAccount setApsEnvironment:](v11, "setApsEnvironment:", v35);

  v4 = 0;
LABEL_23:

LABEL_24:
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](v11, "dsid"));
  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](v11, "dsid"));
    v38 = -[FMFAccountManager storedDSIDMatchesDSID:](v2, "storedDSIDMatchesDSID:", v37);

    v39 = v38 ^ 1;
  }
  else
  {
    v39 = 1;
  }

  p_account = (id *)&v2->_account;
  if (v11)
    v41 = v2->_account == 0;
  else
    v41 = 0;
  v42 = v41;
  -[FMFAccountManager setAccountStateAuthorizedDueTo401](v2, "setAccountStateAuthorizedDueTo401");
  objc_storeStrong((id *)&v2->_account, v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_account, "dsid"));
  v44 = v43 == 0;

  if (!v44)
    -[FMFAccountManager updateAccountWithFMFTokens](v2, "updateAccountWithFMFTokens");
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_account, "authToken"));
  if (v45)
    goto LABEL_36;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_account, "dsid"));
  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_account, "fmfAppToken"));
    v55 = v54 == 0;

    if (!v55)
    {
      v56 = sub_100011D0C();
      v45 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "iCloud token missing but fmf token eists. Radar with Apple Account logs. (File to PEP AppleAccount.)", buf, 2u);
      }
LABEL_36:

    }
  }
  if (v39)
  {
    v46 = sub_100011D0C();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Sending account was removed notification", buf, 2u);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v48, "postNotificationName:object:", off_1000B2FC0, 0);

  }
  if (v42)
  {
    v49 = sub_100011D0C();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Sending account was added notification", buf, 2u);
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v51, "postNotificationName:object:", off_1000B2FC8, 0);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](v11, "dsid"));
  -[FMFAccountManager updateStoredDSID:](v2, "updateStoredDSID:", v52);

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v2);

}

- (void)updateAccountCredentials:(BOOL)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  ACAccountStore *v10;
  _QWORD v11[5];
  ACAccountStore *v12;
  id v13;
  BOOL v14;
  uint8_t buf[16];

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateAccountCredentials...", buf, 2u);
  }

  if (!-[FMFAccountManager isUpdatingAccountCredentials](self, "isUpdatingAccountCredentials"))
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateAccountCredentials because we are not in the process of updating", buf, 2u);
    }

    -[FMFAccountManager setIsUpdatingAccountCredentials:](self, "setIsUpdatingAccountCredentials:", 1);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100032B30;
    v11[3] = &unk_10009A448;
    v14 = a3;
    v11[4] = self;
    v12 = objc_opt_new(ACAccountStore);
    v13 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v12, "aa_primaryAppleAccount"));
    v9 = v13;
    v10 = v12;
    -[ACAccountStore aa_updatePropertiesForAppleAccount:completion:](v10, "aa_updatePropertiesForAppleAccount:completion:", v9, v11);

  }
}

- (void)renewAccountCredentials:(BOOL)a3
{
  _BOOL8 v3;
  ACAccountStore *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FMFAccountManager *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;

  v3 = a3;
  v5 = objc_opt_new(ACAccountStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v5, "aa_primaryAppleAccount"));
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_fmfAccount"));
    v21 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore credentialForAccount:error:](v5, "credentialForAccount:error:", v8, &v21));
    v10 = v21;
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "credential: %@, error :%@", buf, 0x16u);
    }

    if (!-[FMFAccountManager isRenewingAccountCredentials](self, "isRenewingAccountCredentials"))
    {
      -[FMFAccountManager setIsRenewingAccountCredentials:](self, "setIsRenewingAccountCredentials:", 1);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003306C;
      v18[3] = &unk_10009A470;
      v13 = v7;
      v19 = v13;
      v20 = self;
      v14 = objc_retainBlock(v18);
      v15 = sub_100011D0C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting renewal of account credentials with force: %d", buf, 8u);
      }

      -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](v5, "renewCredentialsForAccount:force:reason:completion:", v13, v3, 0, v14);
    }

  }
  else
  {
    v17 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "credential: no icloudAccount or failed to get one. unable to renew credentials", buf, 2u);
    }
    v10 = 0;
  }

}

- (void)retryAfterCredentialUpdate
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  int64_t v8;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = -[FMFAccountManager retryAfterRenewCount](self, "retryAfterRenewCount");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "retryAfterCredentialUpdate %lu", (uint8_t *)&v7, 0xCu);
  }

  if (-[FMFAccountManager retryAfterRenewCount](self, "retryAfterRenewCount") > 1)
  {
    v6 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not refreshing data because we exceeeded maximum retry count", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    -[FMFAccountManager setRetryAfterRenewCount:](self, "setRetryAfterRenewCount:", (char *)-[FMFAccountManager retryAfterRenewCount](self, "retryAfterRenewCount") + 1);
    -[FMFAccountManager updateAccountInfo](self, "updateAccountInfo");
    v5 = objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    -[NSObject refreshForSession:withReason:withCompletion:](v5, "refreshForSession:withReason:withCompletion:", 0, 12, &stru_10009A490);
  }

}

- (void)updateAccountWithFMFTokens
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager fmfAccountToken](self, "fmfAccountToken"));
  -[FMFAccount setFmfAppToken:](self->_account, "setFmfAppToken:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount fmfAppHostName](self->_account, "fmfAppHostName"));

  if (!v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100064574(self, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager appHostnameFromSettings](self, "appHostnameFromSettings"));
    -[FMFAccount setFmfAppHostName:](self->_account, "setFmfAppHostName:", v7);

  }
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3 == 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating FMF account tokens, is nil: %d", (uint8_t *)v10, 8u);
  }

}

- (id)fmfAccountToken
{
  ACAccountStore *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;

  v2 = objc_opt_new(ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v2, "aa_primaryAppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_fmfAccount"));

  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore credentialForAccount:error:](v2, "credentialForAccount:error:", v4, &v11));
  v6 = v11;
  if (v6)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100064604();

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "credentialItemForKey:", ACFindMyFriendsAppTokenKey));

  return v9;
}

- (id)authTokenFromKeychain
{
  return 0;
}

- (id)apsEnvironmentConstantForiCloudBagKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "compare:options:", CFSTR("production"), 1))
  {
    if (!objc_msgSend(v4, "compare:options:", CFSTR("development"), 1))
    {
      v7 = (id *)&APSEnvironmentDevelopment;
      goto LABEL_9;
    }
    if (!objc_msgSend(v4, "compare:options:", CFSTR("demo"), 1))
    {
      v7 = (id *)&APSEnvironmentDemo;
      goto LABEL_9;
    }
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100064664();

  }
  v7 = (id *)&APSEnvironmentProduction;
LABEL_9:
  v8 = *v7;

  return v8;
}

- (void)storeMappingPacket:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  unsigned int v18;

  v14 = 0;
  v4 = a3;
  v5 = +[KeychainUtil keychainItemForService:withUsername:returningItem:](KeychainUtil, "keychainItemForService:withUsername:returningItem:", CFSTR("fmfd-daemon"), CFSTR("fmfd"), &v14);
  v6 = v14;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received stored packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v6)
  {
    v9 = objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "setObject:forKey:", v4, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager _clearOldMappingPacketsOverLimit:](self, "_clearOldMappingPacketsOverLimit:", v9));
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Storing packets in keychain: %@", buf, 0xCu);
  }

  +[KeychainUtil setKeychainItemForService:withUsername:value:accessibility:](KeychainUtil, "setKeychainItemForService:withUsername:value:accessibility:", CFSTR("fmfd-daemon"), CFSTR("fmfd"), v11, 3);
}

- (id)_clearOldMappingPacketsOverLimit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 >= 6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingSelector:", "compare:"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subarrayWithRange:", 0, (char *)objc_msgSend(v7, "count") - 5));
    objc_msgSend(v3, "removeObjectsForKeys:", v8);

  }
  return v3;
}

- (void)forwardSavedMappingPacketsToServer
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  FMFAccountManager *v18;
  _BYTE *v19;
  id v20;
  uint8_t v21[8];
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forwarding saved mapping packets to server", buf, 2u);
  }

  v22 = 0;
  v5 = +[KeychainUtil keychainItemForService:withUsername:returningItem:](KeychainUtil, "keychainItemForService:withUsername:returningItem:", CFSTR("fmfd-daemon"), CFSTR("fmfd"), &v22);
  v6 = v22;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received stored packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  v9 = objc_msgSend(v6, "count");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v24 = 0;
  if (!v6
    || (v10 = v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys")),
        v12 = v11 == 0,
        v11,
        v12))
  {
    v15 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No saved packets to import.", v21, 2u);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100033B84;
    v16[3] = &unk_10009A508;
    v19 = buf;
    v20 = v10;
    v17 = v6;
    v18 = self;
    objc_msgSend(v13, "refreshForSession:withReason:withCompletion:", 0, 8, v16);

    v14 = v17;
  }

  _Block_object_dispose(buf, 8);
}

- (void)clearSavedMappingPackets
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing stored packets in keychain", v4, 2u);
  }

  +[KeychainUtil removeKeychainItemForService:withUsername:](KeychainUtil, "removeKeychainItemForService:withUsername:", CFSTR("fmfd-daemon"), CFSTR("fmfd"));
}

- (void)storeInvalidMappingPacketsForFutureRemoval:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unsigned int v16;

  v12 = 0;
  v3 = a3;
  v4 = +[KeychainUtil keychainItemForService:withUsername:returningItem:](KeychainUtil, "keychainItemForService:withUsername:returningItem:", CFSTR("fmfd-daemon-invalid-packet-service-name"), CFSTR("fmfd-daemon-invalid-packets-username"), &v12);
  v5 = v12;
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 1024;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received stored invalid packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v5)
  {
    v8 = objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "setObject:forKey:", v3, v9);

  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Storing packets in keychain: %@", buf, 0xCu);
  }

  +[KeychainUtil setKeychainItemForService:withUsername:value:accessibility:](KeychainUtil, "setKeychainItemForService:withUsername:value:accessibility:", CFSTR("fmfd-daemon-invalid-packet-service-name"), CFSTR("fmfd-daemon-invalid-packets-username"), v8, 3);
}

- (void)invalidateSavedInvalidPackets
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  FMFAccountManager *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  unsigned int v32;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating saved mapping packets", buf, 2u);
  }

  v27 = 0;
  v5 = +[KeychainUtil keychainItemForService:withUsername:returningItem:](KeychainUtil, "keychainItemForService:withUsername:returningItem:", CFSTR("fmfd-daemon-invalid-packet-service-name"), CFSTR("fmfd-daemon-invalid-packets-username"), &v27);
  v6 = v27;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 1024;
    v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received stored invalid packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v6 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys")), v9, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "unionSet:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v16));
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10003434C;
      v19[3] = &unk_10009A530;
      v20 = v12;
      v21 = self;
      v22 = v11;
      objc_msgSend(v17, "invalidateMappingPackets:completion:", v22, v19);

    }
  }
  else
  {
    v18 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No saved packets to invalidate.", buf, 2u);
    }
  }

}

- (void)clearSavedInvalidMappingPackets
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing stored invalid packets from keychain", v4, 2u);
  }

  +[KeychainUtil removeKeychainItemForService:withUsername:](KeychainUtil, "removeKeychainItemForService:withUsername:", CFSTR("fmfd-daemon-invalid-packet-service-name"), CFSTR("fmfd-daemon-invalid-packets-username"));
}

- (BOOL)storedDSIDMatchesDSID:(id)a3
{
  unint64_t v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  uint64_t v8;

  v4 = (unint64_t)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccountManager storedDSID](self, "storedDSID"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[FMFAccountManager storedDSID](self, "storedDSID"));
    v7 = (v4 | v8) == 0;

  }
  return v7;
}

- (void)updateStoredDSID:(id)a3
{
  -[FMFAccountManager setStoredDSID:](self, "setStoredDSID:", a3);
}

- (id)storedDSID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("storedDSID")));

  return v3;
}

- (void)setStoredDSID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("storedDSID"));

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "synchronize");

}

- (void)setAccountStateUnauthorizedDueTo401
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setAccountStateUnauthorizedDueTo401: setting account status to unauthorized", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMFAccountManager setLatest401TS:](self, "setLatest401TS:", v5);

}

- (double)graceInterval401InSec
{
  void *v2;
  double v3;
  double v4;
  id v5;
  NSObject *v6;
  int v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v2, "graceInterval401InSec");
  v4 = v3;

  if (v4 <= 0.0)
    v4 = 900.0;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "graceInterval401InSec: %f", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (BOOL)isAccountSignedIn
{
  ACAccountStore *v2;
  void *v3;

  v2 = objc_opt_new(ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v2, "aa_primaryAppleAccount"));

  return v3 != 0;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)appHostnameFromSettings
{
  return self->_appHostnameFromSettings;
}

- (void)setAppHostnameFromSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appHostnameFromSettings, a3);
}

- (int64_t)retryAfterRenewCount
{
  return self->_retryAfterRenewCount;
}

- (BOOL)isRenewingAccountCredentials
{
  return self->_isRenewingAccountCredentials;
}

- (void)setIsRenewingAccountCredentials:(BOOL)a3
{
  self->_isRenewingAccountCredentials = a3;
}

- (BOOL)isUpdatingAccountCredentials
{
  return self->_isUpdatingAccountCredentials;
}

- (void)setIsUpdatingAccountCredentials:(BOOL)a3
{
  self->_isUpdatingAccountCredentials = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latest401TS, 0);
  objc_storeStrong((id *)&self->_appHostnameFromSettings, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
