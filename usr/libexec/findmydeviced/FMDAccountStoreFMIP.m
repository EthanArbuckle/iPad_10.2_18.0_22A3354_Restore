@implementation FMDAccountStoreFMIP

- (FMDAccountStoreFMIP)init
{
  FMDAccountStoreFMIP *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMDAccountStoreFMIP;
  v2 = -[FMDAccountStoreFMIP init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)FMDataArchiver);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP accountsFileURL](v2, "accountsFileURL"));
    v5 = objc_msgSend(v3, "initWithFileURL:", v4);
    -[FMDAccountStoreFMIP setBackedUpDataArchiver:](v2, "setBackedUpDataArchiver:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP backedUpDataArchiver](v2, "backedUpDataArchiver"));
    objc_msgSend(v6, "setDataProtectionClass:", 4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP backedUpDataArchiver](v2, "backedUpDataArchiver"));
    objc_msgSend(v7, "setBackedUp:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP backedUpDataArchiver](v2, "backedUpDataArchiver"));
    objc_msgSend(v8, "setCreateDirectories:", 1);

    v9 = objc_alloc((Class)FMDataArchiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP accountsNotBackedUpFileURL](v2, "accountsNotBackedUpFileURL"));
    v11 = objc_msgSend(v9, "initWithFileURL:", v10);
    -[FMDAccountStoreFMIP setNotBackedUpDataArchiver:](v2, "setNotBackedUpDataArchiver:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP notBackedUpDataArchiver](v2, "notBackedUpDataArchiver"));
    objc_msgSend(v12, "setDataProtectionClass:", 4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP notBackedUpDataArchiver](v2, "notBackedUpDataArchiver"));
    objc_msgSend(v13, "setBackedUp:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP notBackedUpDataArchiver](v2, "notBackedUpDataArchiver"));
    objc_msgSend(v14, "setCreateDirectories:", 1);

    v15 = objc_alloc_init((Class)FMStateCapture);
    -[FMDAccountStoreFMIP setStateCapture:](v2, "setStateCapture:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP stateCapture](v2, "stateCapture"));
    objc_msgSend(v16, "setStateCaptureBlock:", &stru_1002C2F80);

  }
  return v2;
}

- (id)loadAccount
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;

  if (-[FMDAccountStoreFMIP initialized](self, "initialized"))
    return (id)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist")));
  if (!v3)
  {
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1002287E0();

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP backedUpDataArchiver](self, "backedUpDataArchiver"));
    v8 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v49 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readDictionaryAndClasses:error:", v9, &v49));
    v10 = v49;

    if (!v3 || v10)
    {
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100228780();

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerGeneral sharedInstance](FMDEventLoggerGeneral, "sharedInstance"));
      objc_msgSend(v13, "sendError:forEventName:", v10, CFSTR("FMDAccountStoreFMIPFailedReadEventName"));

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist")));
  if (!v14)
  {
    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100228754();

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP notBackedUpDataArchiver](self, "notBackedUpDataArchiver"));
    v19 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v48 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "readDictionaryAndClasses:error:", v20, &v48));
    v21 = v48;

    if (!v14 || v21)
    {
      v22 = sub_1000031B8();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1002286F4();

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerGeneral sharedInstance](FMDEventLoggerGeneral, "sharedInstance"));
      objc_msgSend(v24, "sendError:forEventName:", v21, CFSTR("FMDAccountStoreFMIPFailedReadEventName"));

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP _accountFromBackedUpDictionary:andNotBackedUpDictionary:](self, "_accountFromBackedUpDictionary:andNotBackedUpDictionary:", v3, v14));
  -[FMDAccountStoreFMIP setAccount:](self, "setAccount:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", off_100304CC8));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", off_100304CC8));
    -[FMDAccountStoreFMIP _checkOSVersionHistoryUsingBackedUpVersion:nonBackedUpVersion:](self, "_checkOSVersionHistoryUsingBackedUpVersion:nonBackedUpVersion:", v27, v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if ((objc_msgSend(v29, "isInternalBuild") & 1) == 0)
  {

    goto LABEL_26;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v31 = objc_msgSend(v30, "fileExistsAtPath:", CFSTR("/var/tmp/fmipAccountInfo.plist"));

  if (!v31)
  {
LABEL_26:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
      v35 = objc_msgSend(v33, "populateiCloudAccountInfoIntoAccount:", v34);

      if ((v35 & 1) == 0)
      {
        v36 = sub_1000031B8();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_10022866C(self, v37);

        -[FMDAccountStoreFMIP setAccount:](self, "setAccount:", 0);
        -[FMDAccountStoreFMIP _saveChanges](self, "_saveChanges");
      }
    }
    goto LABEL_31;
  }
  -[FMDAccountStoreFMIP _loadTestAccount](self, "_loadTestAccount");
LABEL_31:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP _stateChangeCriteriaForAccount:](self, "_stateChangeCriteriaForAccount:", v38));
  -[FMDAccountStoreFMIP setFmipStateChangeCriteria:](self, "setFmipStateChangeCriteria:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  -[FMDAccountStoreFMIP setOldLowBatteryState:](self, "setOldLowBatteryState:", objc_msgSend(v40, "lowBatteryLocateEnabled"));

  v41 = sub_1000031B8();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "username"));
    *(_DWORD *)buf = 138412290;
    v51 = v44;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Loaded FMIP account for user %@ from the store", buf, 0xCu);

  }
  -[FMDAccountStoreFMIP setInitialized:](self, "setInitialized:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v45, "setFMiPActive:", v46 != 0);

  return (id)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
}

- (void)saveAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account")),
        v4,
        v5 = 0,
        v4))
  {
    -[FMDAccountStoreFMIP setAccount:](self, "setAccount:", v6);
    -[FMDAccountStoreFMIP _saveChanges](self, "_saveChanges");
    v5 = v6;
  }

}

- (void)_loadTestAccount
{
  id v3;
  NSObject *v4;
  void *v5;
  FMDFMIPAccount *v6;
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
  void *v22;
  int v23;
  const __CFString *v24;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = CFSTR("/var/tmp/fmipAccountInfo.plist");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using test account info from %@", (uint8_t *)&v23, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  if (!v5)
  {
    v6 = objc_alloc_init(FMDFMIPAccount);
    -[FMDAccountStoreFMIP setAccount:](self, "setAccount:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
    objc_msgSend(v8, "setAccountAddTime:", v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/var/tmp/fmipAccountInfo.plist")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_1003052F0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v11, "setUsername:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_1003052F8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v13, "setDsid:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100305308));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v15, "setFmipAuthToken:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100305320));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v17, "setServerHost:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100305328));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v19, "setServerProtocolScheme:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100305330));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v21, "setApsEnvironment:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v22, "setFmipEnableContext:", 2);

  -[FMDAccountStoreFMIP _saveChanges](self, "_saveChanges");
}

- (void)_saveChanges
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  NSObject *v42;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v44;
  unsigned int v45;
  void *v46;
  unsigned int v47;
  id v48;
  NSObject *v49;
  void *v50;
  __CFNotificationCenter *v51;
  void *v52;
  uint8_t v53[16];
  id v54;
  id v55;
  id v56;
  id v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"));

    if (v5)
    {
      v6 = sub_1000031B8();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_100228A64();

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v57 = 0;
      objc_msgSend(v8, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"), &v57);
      v9 = v57;

      if (v9 && (objc_msgSend(v9, "fm_isFileNotFoundError") & 1) == 0)
      {
        v10 = sub_1000031B8();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_100228A04();

      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = objc_msgSend(v12, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"));

    if (v13)
    {
      v14 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_1002289D8();

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v56 = 0;
      objc_msgSend(v16, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"), &v56);
      v17 = v56;

      if (v17 && (objc_msgSend(v17, "fm_isFileNotFoundError") & 1) == 0)
      {
        v18 = sub_1000031B8();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100228978();

      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP accountsFileURL](self, "accountsFileURL"));
    v55 = 0;
    objc_msgSend(v20, "removeItemAtURL:error:", v21, &v55);
    v22 = v55;

    if (v22 && (objc_msgSend(v22, "fm_isFileNotFoundError") & 1) == 0)
    {
      v23 = sub_1000031B8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100228918();

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP accountsNotBackedUpFileURL](self, "accountsNotBackedUpFileURL"));
    v54 = v22;
    objc_msgSend(v25, "removeItemAtURL:error:", v26, &v54);
    v27 = v54;

    if (v27 && (objc_msgSend(v27, "fm_isFileNotFoundError") & 1) == 0)
    {
      v28 = sub_1000031B8();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1002288B8();

    }
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
    -[FMDAccountStoreFMIP _saveDictionaryForAccount:](self, "_saveDictionaryForAccount:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v32, "setFMiPActive:", v33 != 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
  objc_msgSend(v34, "setFMIPDataclass:", 0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP _stateChangeCriteriaForAccount:](self, "_stateChangeCriteriaForAccount:", v35));

  v37 = sub_1000031B8();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    sub_10022880C(self, (uint64_t)v36, v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP fmipStateChangeCriteria](self, "fmipStateChangeCriteria"));
  v40 = objc_msgSend(v36, "isEqualToDictionary:", v39);

  if ((v40 & 1) == 0)
  {
    v41 = sub_1000031B8();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Sending FMIP state change notification", v53, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMIPStateDidChangeNotification, 0, 0, 1u);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v44, "postNotificationName:object:", CFSTR("FMIPStateChangeLocalNotification"), 0);

  }
  -[FMDAccountStoreFMIP setFmipStateChangeCriteria:](self, "setFmipStateChangeCriteria:", v36);
  v45 = -[FMDAccountStoreFMIP oldLowBatteryState](self, "oldLowBatteryState");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  v47 = objc_msgSend(v46, "lowBatteryLocateEnabled");

  if (v45 != v47)
  {
    v48 = sub_1000031B8();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Posting FMDFMIPLowBatteryLocateStateDidChangeLocalNotification", v53, 2u);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v50, "postNotificationName:object:", CFSTR("FMDFMIPLowBatteryLocateStateDidChangeLocalNotification"), 0);

    v51 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v51, kFMIPLowBatteryLocateStateDidChangeNotification, 0, 0, 1u);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
    -[FMDAccountStoreFMIP setOldLowBatteryState:](self, "setOldLowBatteryState:", objc_msgSend(v52, "lowBatteryLocateEnabled"));

  }
}

- (void)_checkOSVersionHistoryUsingBackedUpVersion:(id)a3 nonBackedUpVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "productVersion"));

  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) != 0)
      goto LABEL_16;
    v9 = a4 ? CFSTR("u") : CFSTR("b");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v6));
    if (!v10)
      goto LABEL_16;
  }
  else
  {
    v10 = CFSTR("old");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "versionHistory"));

  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v14 = -[__CFString isEqualToString:](v10, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v10));
      if ((unint64_t)objc_msgSend(v15, "count") >= 0x15)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subarrayWithRange:", 1, (char *)objc_msgSend(v15, "count") - 1));

        v15 = (void *)v16;
      }
    }
  }
  else
  {
    v18 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP account](self, "account"));
  objc_msgSend(v17, "setVersionHistory:", v15);

  -[FMDAccountStoreFMIP _saveChanges](self, "_saveChanges");
LABEL_16:

}

- (void)_saveDictionaryForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP _backedUpDictionaryFromAccount:](self, "_backedUpDictionaryFromAccount:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP _notBackedUpDictionaryFromAccount:](self, "_notBackedUpDictionaryFromAccount:", v4));

  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100228B68(v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0));
  objc_msgSend(v9, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP backedUpDataArchiver](self, "backedUpDataArchiver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "saveDictionary:", v5));

  if (v11)
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100228AF0(v6);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0));
  objc_msgSend(v16, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccountStoreFMIP notBackedUpDataArchiver](self, "notBackedUpDataArchiver"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "saveDictionary:", v6));

  if (v18)
  {
    v19 = sub_1000031B8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
}

- (id)_accountFromBackedUpDictionary:(id)a3 andNotBackedUpDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    a3 = objc_alloc_init(FMDFMIPAccount);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304C98));
    objc_msgSend(a3, "setDsid:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304CB0));
    objc_msgSend(a3, "setFmipEnableContext:", objc_msgSend(v8, "unsignedIntValue"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304CD0));
    objc_msgSend(a3, "setVersionHistory:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304CD8));
    objc_msgSend(a3, "setLastLoggedInDsid:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304CE8));
    objc_msgSend(a3, "setLowBatteryLocateEnabled:", objc_msgSend(v11, "BOOLValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_100304CE0));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (v14 > 0.0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v14));
      objc_msgSend(a3, "setAccountAddTime:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100304C98));
    if (objc_msgSend(v16, "isEqualToString:", v7))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100304CA0));
      objc_msgSend(a3, "setLastIdentityTime:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100304CA8));
      objc_msgSend(a3, "setUnregisterState:", objc_msgSend(v18, "unsignedIntValue"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100304CB8));
      objc_msgSend(a3, "setFmipDisableContext:", objc_msgSend(v19, "unsignedIntValue"));

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100304CC0));
      objc_msgSend(a3, "setLastUnregisterFailedTime:", v20);

    }
  }

  return a3;
}

- (id)_backedUpDictionaryFromAccount:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = off_100304C98;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", v5, v6);

    if (objc_msgSend(v3, "fmipEnableContext"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "fmipEnableContext")));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, off_100304CB0);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productVersion"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1002CD590;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, off_100304CC8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLoggedInDsid"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLoggedInDsid"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, off_100304CD8);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionHistory"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionHistory"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, off_100304CD0);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "lowBatteryLocateEnabled")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, off_100304CE8);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountAddTime"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountAddTime"));
      objc_msgSend(v18, "timeIntervalSince1970");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, off_100304CE0);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_notBackedUpDictionaryFromAccount:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = off_100304C98;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", v5, v6);

    v7 = off_100304CA0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastIdentityTime"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", v7, v8);

    v9 = off_100304CC0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastUnregisterFailedTime"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "unregisterState")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, off_100304CA8);

    if (objc_msgSend(v3, "fmipDisableContext"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "fmipDisableContext")));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, off_100304CB8);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productVersion"));
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1002CD590;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, off_100304CC8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_stateChangeCriteriaForAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("dsid"), v5);

  v6 = objc_msgSend(v3, "unregisterState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("unregisterState"));

  return v4;
}

- (id)accountsFileURL
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.FMIPAccounts")));

  return v5;
}

- (id)accountsNotBackedUpFileURL
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup")));

  return v5;
}

- (FMDFMIPAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)fmipStateChangeCriteria
{
  return self->_fmipStateChangeCriteria;
}

- (void)setFmipStateChangeCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_fmipStateChangeCriteria, a3);
}

- (BOOL)oldLowBatteryState
{
  return self->_oldLowBatteryState;
}

- (void)setOldLowBatteryState:(BOOL)a3
{
  self->_oldLowBatteryState = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (FMDataArchiver)backedUpDataArchiver
{
  return self->_backedUpDataArchiver;
}

- (void)setBackedUpDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_backedUpDataArchiver, a3);
}

- (FMDataArchiver)notBackedUpDataArchiver
{
  return self->_notBackedUpDataArchiver;
}

- (void)setNotBackedUpDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_notBackedUpDataArchiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notBackedUpDataArchiver, 0);
  objc_storeStrong((id *)&self->_backedUpDataArchiver, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_fmipStateChangeCriteria, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
