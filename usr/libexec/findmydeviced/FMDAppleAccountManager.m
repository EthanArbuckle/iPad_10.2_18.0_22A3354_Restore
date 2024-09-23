@implementation FMDAppleAccountManager

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_100306538 != -1)
    dispatch_once(&qword_100306538, &stru_1002C2D50);
  v2 = (void *)qword_100306530;
  if (!qword_100306530)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMDAppleAccountManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_100306530;
  }
  return v2;
}

- (FMDAppleAccountManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1002281F0();

  return 0;
}

- (id)initSingleton
{
  FMDAppleAccountManager *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDAppleAccountManager;
  v2 = -[FMDAppleAccountManager init](&v5, "init");
  if (v2)
  {
    objc_storeStrong((id *)&qword_100306530, v2);
    v3 = objc_alloc_init((Class)ACAccountStore);
    -[FMDAppleAccountManager setAccountStore:](v2, "setAccountStore:", v3);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)qword_100306530;
  qword_100306530 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMDAppleAccountManager;
  -[FMDAppleAccountManager dealloc](&v6, "dealloc");
}

- (void)syncFMIPAccountInfo
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  FMDFMIPAccount *v12;
  void *v13;
  FMDFMIPAccount *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _DWORD v24[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v4 = kAccountDataclassDeviceLocator;
  v5 = objc_msgSend(v3, "isProvisionedForDataclass:", kAccountDataclassDeviceLocator);
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10022821C(v5, v7);

  if ((v5 & 1) == 0)
  {
    v11 = sub_1000031B8();
    v12 = (FMDFMIPAccount *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, &v12->super.super, OS_LOG_TYPE_DEFAULT, "device locator is not provisioned. fmdd may not work", (uint8_t *)v24, 2u);
    }
    goto LABEL_22;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if ((objc_msgSend(v8, "isInternalBuild") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = objc_msgSend(v9, "fileExistsAtPath:", CFSTR("/var/tmp/fmipAccountInfo.plist"));

    if ((v10 & 1) != 0)
      goto LABEL_23;
    if (!v3)
    {
LABEL_12:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v12 = (FMDFMIPAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));

      if (!v3 || -[FMDAccount unregisterState](v12, "unregisterState"))
        goto LABEL_22;
      v14 = objc_alloc_init(FMDFMIPAccount);
      -[FMDFMIPAccount copyInfoFromAccount:](v14, "copyInfoFromAccount:", v12);
      -[FMDFMIPAccount applyPropertiesFromACAccount:](v14, "applyPropertiesFromACAccount:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      objc_msgSend(v15, "updateAccount:", v14);

LABEL_21:
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {

    if (!v3)
      goto LABEL_12;
  }
  if (-[FMDAppleAccountManager isKnownFMIPAccount:](self, "isKnownFMIPAccount:", v3))
    goto LABEL_12;
  v16 = objc_msgSend(v3, "isEnabledForDataclass:", v4);
  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109120;
    v24[1] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "isDeviceLocatorEnabled %d", (uint8_t *)v24, 8u);
  }

  if (v16)
  {
    v19 = sub_1000031B8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "iCloud account has FMIP dataclass enabled but findmydeviced has no record of it. Looks like an upgrade from an older version", (uint8_t *)v24, 2u);
    }

    v12 = objc_alloc_init(FMDFMIPAccount);
    -[FMDFMIPAccount applyPropertiesFromACAccount:](v12, "applyPropertiesFromACAccount:", v3);
    -[FMDFMIPAccount setFmipEnableContext:](v12, "setFmipEnableContext:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDAccount setAccountAddTime:](v12, "setAccountAddTime:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager _currentFMDFMIPAccount](self, "_currentFMDFMIPAccount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dsid"));
    -[FMDFMIPAccount setLastLoggedInDsid:](v12, "setLastLoggedInDsid:", v23);

    v14 = (FMDFMIPAccount *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    -[FMDFMIPAccount addAccount:](v14, "addAccount:", v12);
    goto LABEL_21;
  }
LABEL_23:

}

- (id)iCloudACAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager accountStore](self, "accountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  return v3;
}

- (id)fmipACAccount
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  if (-[FMDAppleAccountManager isKnownFMIPAccount:](self, "isKnownFMIPAccount:", v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)isKnownFMIPAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager _currentFMDFMIPAccount](self, "_currentFMDFMIPAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dsid"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  return v8;
}

- (id)_currentFMDFMIPAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));

  return v3;
}

- (BOOL)populateiCloudAccountInfoIntoAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v6 = v5;
  if (!v5)
  {
    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100228290();
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dsid"));
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {

LABEL_8:
    v13 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1002282BC();
LABEL_10:

    v10 = 0;
    goto LABEL_11;
  }
  v9 = -[FMDAppleAccountManager _isBeneficiaryAccount](self, "_isBeneficiaryAccount");

  if ((v9 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "applyPropertiesFromACAccount:", v6);
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)forceUserAuthForiCloudAccountForApp:(id)a3 message:(id)a4 really:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_personID"));
    *(_DWORD *)buf = 138412290;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "forcing user auth of account %@", buf, 0xCu);

  }
  if (v6)
    objc_msgSend(v13, "aa_setPassword:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v17, "fm_safelyMapKey:toObject:", kACRenewCredentialsShouldForceKey, &__kCFBooleanTrue);
  objc_msgSend(v17, "fm_safelyMapKey:toObject:", kACRenewCredentialsProxiedAppBundleIDKey, v12);

  objc_msgSend(v17, "fm_safelyMapKey:toObject:", CFSTR("AARenewShouldForceInteraction"), &__kCFBooleanTrue);
  objc_msgSend(v17, "fm_safelyMapKey:toObject:", kACRenewCredentialsReasonStringKey, v11);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager accountStore](self, "accountStore"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003DBEC;
  v21[3] = &unk_1002C2D78;
  v22 = v13;
  v23 = v10;
  v19 = v10;
  v20 = v13;
  objc_msgSend(v18, "renewCredentialsForAccount:options:completion:", v20, v17, v21);

}

- (void)fixFMIPAuthTokenShouldForce:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  if (-[FMDAppleAccountManager isKnownFMIPAccount:](self, "isKnownFMIPAccount:", v6))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_fmipAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager accountStore](self, "accountStore"));
    v35 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialForAccount:error:", v7, &v35));
    v10 = v35;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "oauthToken"));
    if (!v11 && v10)
    {
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Token not available due to error : %@", buf, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      if (objc_msgSend(v14, "isEqualToString:", ACErrorKeychainDomain))
      {
        v15 = objc_msgSend(v10, "code");

        if (v15 == (id)-34019)
        {
          v16 = sub_1000031B8();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No token available because keychain upgrade is pending. Will wait for that to complete", buf, 2u);
          }
          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    v31 = v4;
    v32 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "account"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "token"));
    if (!v20)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fmipAuthToken](v17, "fmipAuthToken"));
      if (!v3)
        goto LABEL_17;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "token"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fmipAuthToken](v17, "fmipAuthToken"));
    v23 = objc_msgSend(v21, "isEqualToString:", v22);

    if (v20)
    {

      if ((v23 & 1) != 0)
      {
LABEL_17:
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_personID"));
        v25 = sub_1000031B8();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Requesting renewal of account credentials...", buf, 2u);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager accountStore](self, "accountStore"));
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10003E108;
        v33[3] = &unk_1002C2DA0;
        v34 = v24;
        v28 = v24;
        objc_msgSend(v27, "renewCredentialsForAccount:force:reason:completion:", v6, v31, 0, v33);

LABEL_24:
        v10 = v32;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

      if ((v23 & 1) != 0)
        goto LABEL_17;
    }
    v29 = sub_1000031B8();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Accounts has a different token, trying to use the new token via sync account info.", buf, 2u);
    }

    -[FMDAppleAccountManager syncFMIPAccountInfo](self, "syncFMIPAccountInfo");
    goto LABEL_24;
  }
  v18 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Couldn't find an active FMiP account", buf, 2u);
  }
LABEL_26:

}

- (void)setFMIPDataclass:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v6 = v5;
  if (v5)
  {
    v7 = kAccountDataclassDeviceLocator;
    if (objc_msgSend(v5, "isEnabledForDataclass:", kAccountDataclassDeviceLocator) != v3)
    {
      objc_msgSend(v6, "setEnabled:forDataclass:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager accountStore](self, "accountStore"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10003E2EC;
      v9[3] = &unk_1002C2DC8;
      v10 = v6;
      objc_msgSend(v8, "saveVerifiedAccount:withCompletionHandler:", v10, v9);

    }
  }

}

- (BOOL)_isBeneficiaryAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _DWORD v11[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_altDSID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authKitAccountWithAltDSID:", v3));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v7 = objc_msgSend(v6, "isBeneficiaryForAccount:", v5);

    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "isBeneficiaryAccount %d", (uint8_t *)v11, 8u);
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
