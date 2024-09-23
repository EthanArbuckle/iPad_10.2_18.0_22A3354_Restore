@implementation MSDAccountManager

+ (id)sharedInstance
{
  if (qword_100175418 != -1)
    dispatch_once(&qword_100175418, &stru_10013EF98);
  return (id)qword_100175410;
}

- (MSDAccountManager)init
{
  MSDAccountManager *v2;
  MSDAccountManagerHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDAccountManager;
  v2 = -[MSDAccountManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(MSDAccountManagerHelper);
    -[MSDAccountManager setAccountManagerHelper:](v2, "setAccountManagerHelper:", v3);

    -[MSDAccountManager setPeerChangeToken:](v2, "setPeerChangeToken:", 0xFFFFFFFFLL);
  }
  return v2;
}

- (void)disallowAccountModification
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_1000604F0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling AppleID options in Settings!", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v4, "setBoolValue:forSetting:", 0, MCFeatureAccountModificationAllowed);

}

- (void)setupTrustedPeerChangeNotificationObserver
{
  id v3;
  NSObject *v4;
  uint32_t v5;
  int v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to observe trusted peer change!", v9, 2u);
  }

  v5 = notify_register_dispatch("com.apple.security.octagon.peer-changed", &self->_peerChangeToken, (dispatch_queue_t)&_dispatch_main_q, &stru_10013EFD8);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C1F1C(v6, v8);

  }
}

- (id)existingAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchiTunesiCloudAccountsInfo"));

  if (v6)
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iCloudAccountRecoveryKey"));
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("iCloudRecoveryKey"));
  if (objc_msgSend(v3, "iCloudAccountSyncNeeded"))
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("iCloudSyncNeeded"));
  v8 = objc_msgSend(v4, "copy");

  return v8;
}

- (BOOL)setupAccounts:(id *)a3
{
  __int128 v3;
  id v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v6 = 0;
  v7 = 2;
  *(_QWORD *)&v3 = 134218498;
  v20 = v3;
  do
  {
    v8 = v6;
    v21 = v6;
    v9 = -[MSDAccountManager _trySetupAccounts:](self, "_trySetupAccounts:", &v21, v20);
    v6 = v21;

    if (v9)
      break;
    if (objc_msgSend(v6, "code") == (id)3727741185)
    {
      v17 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Account setup cancelled. Not going to retry.";
        goto LABEL_16;
      }
LABEL_17:

      break;
    }
    v10 = objc_msgSend(v6, "code");
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10 == (id)3727741043)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Account authentication failure. Not going to retry.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedFailureReason"));
      v16 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = v20;
      v23 = v7 - 1;
      v24 = 2114;
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to setup accounts (retryCount = %td): %{public}@(0x%tx)", buf, 0x20u);

    }
    sleep(5u);
    v14 = v7-- < 2 || v9;
  }
  while ((v14 & 1) == 0);
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  -[MSDAccountManager syncAppsWithiCloud](self, "syncAppsWithiCloud");

  return v9;
}

- (BOOL)removeAccounts:(id *)a3
{
  __int128 v3;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  BOOL v16;
  __int128 v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v6 = 0;
  v7 = 1;
  *(_QWORD *)&v3 = 134218498;
  v18 = v3;
  while (1)
  {
    v8 = v6;
    v20 = v6;
    v9 = -[MSDAccountManager _signOutiCloudAccountWithPassword:outError:](self, "_signOutiCloudAccountWithPassword:outError:", 0, &v20, v18);
    v6 = v20;

    if (v9)
      break;
LABEL_5:
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedFailureReason"));
      v15 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = v18;
      v22 = v7;
      v23 = 2114;
      v24 = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to remove accounts (retryCount = %td): %{public}@(0x%tx)", buf, 0x20u);

    }
    if (--v7 == -1)
    {
      v16 = 0;
      v11 = v6;
      if (!a3)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v19 = v6;
  v10 = -[MSDAccountManager _signOutiTunesAccount:](self, "_signOutiTunesAccount:", &v19);
  v11 = v19;

  if ((v10 & 1) == 0)
  {
    v6 = v11;
    goto LABEL_5;
  }
  v16 = 1;
  if (a3)
LABEL_9:
    *a3 = objc_retainAutorelease(v11);
LABEL_10:

  return v16;
}

- (BOOL)_trySetupAccounts:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSDGetAccountSettingsRequest *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  MSDGetAccountSettingsRequest *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  id v29;
  uint64_t v30;
  int has_internal_content;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  unsigned int v41;
  id v42;
  NSObject *v43;
  unsigned int v44;
  id v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  NSObject *v57;
  void *v58;
  id *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  MSDGetAccountSettingsRequest *v67;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start setting up accounts with Continuity support.", buf, 2u);
  }

  objc_msgSend(v6, "updateStage:", 20);
  v60 = v6;
  if ((objc_msgSend(v5, "allowAccountSetup") & 1) == 0)
  {
    v58 = v5;
    v59 = a3;
    v56 = sub_1000604F0();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_1000C2024(v57);

    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727740956, CFSTR("The operation is not allowed.")));
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v15 = 0;
    goto LABEL_62;
  }
  objc_msgSend(v5, "saveiCloudAccountSyncNeeded:", 0);
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v16 = 0;
    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v10 = (MSDGetAccountSettingsRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mockAccountSettingsFile"));

  if (!v10)
  {
    v16 = 0;
LABEL_16:

LABEL_17:
    v10 = objc_alloc_init(MSDGetAccountSettingsRequest);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager existingAccounts](self, "existingAccounts"));
    -[MSDGetAccountSettingsRequest setExistingAccounts:](v10, "setExistingAccounts:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "handleRequestSync:", v10));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject error](v19, "error"));
    v23 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "code") == (id)3727741185)
      {
        v24 = v23;

        v16 = v24;
        goto LABEL_20;
      }
      v30 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744512, CFSTR("Unexpected server response.")));

      v16 = (id)v30;
    }
    if (!v16)
    {
      v15 = (MSDGetAccountSettingsRequest *)objc_claimAutoreleasedReturnValue(-[NSObject accountSettings](v19, "accountSettings"));

      goto LABEL_25;
    }
LABEL_20:
    v58 = v5;
    v59 = a3;

    v25 = 0;
    v26 = 0;
    v27 = 0;
    v15 = 0;
    goto LABEL_21;
  }
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading account settings from file: %{public}@", buf, 0xCu);
  }

  v13 = objc_alloc((Class)NSDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
  v65 = 0;
  v15 = (MSDGetAccountSettingsRequest *)objc_msgSend(v13, "initWithContentsOfURL:error:", v14, &v65);
  v16 = v65;

  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (!v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000C1F90(v16, v19);

    goto LABEL_16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Account settings successfully loaded: %{public}@", buf, 0xCu);
  }
LABEL_25:

  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v32 = sub_1000604F0();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (!v34)
      goto LABEL_31;
    *(_DWORD *)buf = 138543362;
    v67 = v15;
    v35 = "Got account settings from hub: %{public}@";
    v36 = v33;
    v37 = 12;
  }
  else
  {
    if (!v34)
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v35 = "Got account settings from hub";
    v36 = v33;
    v37 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_31:

  v26 = objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest objectForKey:](v15, "objectForKey:", CFSTR("iCloud")));
  v27 = objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest objectForKey:](v15, "objectForKey:", CFSTR("iTunes")));
  v38 = sub_1000604F0();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
  if (v26 | v27)
  {
    v58 = v5;
    v59 = a3;
    if (v40)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Signing out existing iCloud account.", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v26, "objectForKey:", CFSTR("PwdForExistingAccount")));
    v64 = v16;
    v41 = -[MSDAccountManager _signOutiCloudAccountWithPassword:outError:](self, "_signOutiCloudAccountWithPassword:outError:", v25, &v64);
    v29 = v64;

    if (!v41)
      goto LABEL_62;
    v42 = sub_1000604F0();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Signing out existing iTunes account.", buf, 2u);
    }

    v63 = v29;
    v44 = -[MSDAccountManager _signOutiTunesAccount:](self, "_signOutiTunesAccount:", &v63);
    v16 = v63;

    if (v44)
    {
      v45 = sub_1000604F0();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Wait for some extra time to make sure accounts complete signout.", buf, 2u);
      }

      sleep(0xAu);
      if (v26)
      {
        v62 = v16;
        v47 = -[MSDAccountManager _setupiCloudAccountWithSettings:outError:](self, "_setupiCloudAccountWithSettings:outError:", v26, &v62);
        v29 = v62;

        if (!v47)
        {
LABEL_62:
          v28 = 0;
          goto LABEL_51;
        }
        v16 = v29;
      }
      if (v27)
      {
        v61 = v16;
        v48 = -[MSDAccountManager _setupiTunesAccountWithSettings:outError:](self, "_setupiTunesAccountWithSettings:outError:", v27, &v61);
        v29 = v61;

        if (!v48)
          goto LABEL_62;
      }
      else
      {
        v29 = v16;
      }
      v28 = 1;
LABEL_51:
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager existingAccounts](self, "existingAccounts"));
      if (v51)
      {
        v50 = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", CFSTR("Account")));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", CFSTR("Account")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v52, CFSTR("iCloudAccount"), v53, CFSTR("iTunesAccount"), 0));

      }
      else
      {
        v49 = 0;
        v50 = &__NSDictionary0__struct;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bundleInProgress"));
      objc_msgSend(v54, "updateComponentProgress:withResult:withAdditionalInfo:", CFSTR("Accounts"), v28, v49);

      if (v59)
      {
        v16 = objc_retainAutorelease(v29);
        *v59 = v16;
      }
      else
      {
        v16 = v29;
      }
      v5 = v58;
      goto LABEL_58;
    }
LABEL_21:
    v28 = 0;
    v29 = v16;
    goto LABEL_51;
  }
  if (v40)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "No iCloud or iTunes account settings provided. Skip setting up any account.", buf, 2u);
  }

  -[MSDAccountManager _forceiCloudKeychainToSyncWithServer](self, "_forceiCloudKeychainToSyncWithServer");
  v25 = 0;
  v49 = 0;
  v50 = 0;
  v26 = 0;
  v27 = 0;
  LOBYTE(v28) = 1;
LABEL_58:

  return v28;
}

- (BOOL)_setupiCloudAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  BOOL v36;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint8_t v78[16];

  v6 = a3;
  v8 = objc_opt_class(NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v56 = sub_1000604F0();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_1000C2300();

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v36 = 0;
    v17 = 0;
    v23 = 0;
    v20 = 0;
    v14 = 0;
    v11 = 0;
    goto LABEL_20;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Account")));
  if (!v9)
  {
    v34 = sub_1000604F0();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No iCloud account information in settings. iCloud account setup skipped.", v78, 2u);
    }

    v17 = 0;
    v23 = 0;
    v20 = 0;
    v14 = 0;
    v11 = 0;
LABEL_19:
    v36 = 1;
    goto LABEL_20;
  }
  v11 = (void *)v9;
  v12 = objc_opt_class(NSString, v10);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v58 = sub_1000604F0();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      sub_1000C2294();

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v36 = 0;
    v17 = 0;
    v23 = 0;
    v20 = 0;
    v14 = 0;
    goto LABEL_20;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Password")));
  if (!v14 || (v15 = objc_opt_class(NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    v38 = sub_1000604F0();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1000C2064(v39, v40, v41, v42, v43, v44, v45, v46);

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v36 = 0;
    v17 = 0;
    goto LABEL_27;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Features")));
  if (!v17 || (v18 = objc_opt_class(NSDictionary, v16), (objc_opt_isKindOfClass(v17, v18) & 1) == 0))
  {
    v47 = sub_1000604F0();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_1000C20D4(v48, v49, v50, v51, v52, v53, v54, v55);

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v36 = 0;
LABEL_27:
    v23 = 0;
    v20 = 0;
    goto LABEL_20;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("RecoveryKey")));
  if (!v20 || (v21 = objc_opt_class(NSString, v19), (objc_opt_isKindOfClass(v20, v21) & 1) != 0))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("CDPResetNeeded")));
    if (v23)
    {
      v24 = objc_opt_class(NSNumber, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {
        v69 = sub_1000604F0();
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          sub_1000C21B4(v70, v71, v72, v73, v74, v75, v76, v77);

        sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
        goto LABEL_40;
      }
    }
    if (!-[MSDAccountManager _signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:](self, "_signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:", v11, v14, v17, v20, objc_msgSend(v23, "BOOLValue"), a4))
    {
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000C2144(v26, v27, v28, v29, v30, v31, v32, v33);

LABEL_40:
      v36 = 0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v60 = sub_1000604F0();
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    sub_1000C2224(v61, v62, v63, v64, v65, v66, v67, v68);

  sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
  v36 = 0;
  v23 = 0;
LABEL_20:

  return v36;
}

- (BOOL)_setupiTunesAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  BOOL v27;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  uint8_t v42[16];

  v6 = a3;
  v8 = objc_opt_class(NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Account")));
    if (!v9)
    {
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No iTunes account information in settings. iTunes account setup skipped.", v42, 2u);
      }

      v14 = 0;
      v11 = 0;
LABEL_13:
      v27 = 1;
      goto LABEL_14;
    }
    v11 = (void *)v9;
    v12 = objc_opt_class(NSString, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Password")));
      if (!v14 || (v15 = objc_opt_class(NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
      {
        v29 = sub_1000604F0();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_1000C236C(v30, v31, v32, v33, v34, v35, v36, v37);

        sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
        goto LABEL_18;
      }
      if (!-[MSDAccountManager _signIniTunesAccount:password:outError:](self, "_signIniTunesAccount:password:outError:", v11, v14, a4))
      {
        v16 = sub_1000604F0();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1000C23DC(v17, v18, v19, v20, v21, v22, v23, v24);

LABEL_18:
        v27 = 0;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    v40 = sub_1000604F0();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1000C244C();

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v27 = 0;
    v14 = 0;
  }
  else
  {
    v38 = sub_1000604F0();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1000C24B8();

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v27 = 0;
    v14 = 0;
    v11 = 0;
  }
LABEL_14:

  return v27;
}

- (BOOL)_signIniTunesAccount:(id)a3 password:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MSDAccountContext *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MSDAccountContext);
  -[MSDAccountContext setUsername:](v10, "setUsername:", v9);

  -[MSDAccountContext setPassword:](v10, "setPassword:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a5) = objc_msgSend(v11, "performiTunesAccountSignInWithContext:outError:", v10, a5);

  return (char)a5;
}

- (BOOL)_signOutiTunesAccount:(id *)a3
{
  MSDAccountContext *v5;
  void *v6;

  v5 = objc_alloc_init(MSDAccountContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a3) = objc_msgSend(v6, "performiTunesAccountSignOutWithContext:outError:", v5, a3);

  return (char)a3;
}

- (BOOL)_signIniCloudAccount:(id)a3 password:(id)a4 features:(id)a5 recoveryKey:(id)a6 resetCDP:(BOOL)a7 outError:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  MSDAccountContext *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int has_internal_content;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  _BYTE v35[24];

  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
  v20 = objc_alloc_init(MSDAccountContext);
  -[MSDAccountContext setUsername:](v20, "setUsername:", v17);

  -[MSDAccountContext setPassword:](v20, "setPassword:", v16);
  -[MSDAccountContext setRecoveryKey:](v20, "setRecoveryKey:", v14);
  -[MSDAccountContext setResetCDP:](v20, "setResetCDP:", v9);
  -[MSDAccountContext setFeatures:](v20, "setFeatures:", v15);

  -[MSDAccountContext setLocalSecret:](v20, "setLocalSecret:", CFSTR("123456"));
  if ((objc_msgSend(v18, "createTemporaryPasscodeIfNeeded") & 1) == 0)
  {
    sub_1000B63A4(a8, 3727741045, (uint64_t)CFSTR("Failed to setup device local secret."));
    LOBYTE(v22) = 0;
LABEL_15:
    v26 = v14;
    goto LABEL_16;
  }
  objc_msgSend(v18, "unlockDeviceKeybagIfNeeded");
  objc_msgSend(v18, "acquireDeviceKeybagAssertionIfNeeded");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  v22 = objc_msgSend(v21, "performiCloudAccountSignInWithContext:outError:", v20, a8);

  if (!v22 || !v9)
    goto LABEL_15;
  v23 = sub_1000604F0();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received CDP reset request. Generate new recovery key for iCloud account!", v35, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "generateiCloudAccountRecoveryKeyWithError:", a8));

  if (!v26)
  {
    LOBYTE(v22) = 0;
    goto LABEL_16;
  }
  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v28 = sub_1000604F0();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v30)
    {
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v26;
      v31 = "New recovery key generated: %{public}@";
      v32 = v29;
      v33 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, v35, v33);
    }
  }
  else if (v30)
  {
    *(_DWORD *)v35 = 141558274;
    *(_QWORD *)&v35[4] = 1752392040;
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = v26;
    v31 = "New recovery key generated: %{mask.hash}@";
    v32 = v29;
    v33 = 22;
    goto LABEL_12;
  }

  objc_msgSend(v18, "saveiCloudAccountRecoveryKey:", v26);
  objc_msgSend(v19, "sendImmediateDeviceInfoPing");
  LOBYTE(v22) = 1;
LABEL_16:
  objc_msgSend(v18, "removeTemporaryPasscodeIfNeeded", *(_OWORD *)v35, *(_QWORD *)&v35[16]);
  -[MSDAccountManager _forceiCloudKeychainToSyncWithServer](self, "_forceiCloudKeychainToSyncWithServer");

  return v22;
}

- (BOOL)_signOutiCloudAccountWithPassword:(id)a3 outError:(id *)a4
{
  id v6;
  MSDAccountContext *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(MSDAccountContext);
  -[MSDAccountContext setPassword:](v7, "setPassword:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a4) = objc_msgSend(v8, "performiCloudAccountSignOutWithContext:outError:", v7, a4);

  return (char)a4;
}

- (void)_forceiCloudKeychainToSyncWithServer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  objc_msgSend(v2, "forceiCloudKeychainToSyncWithServerAndError:", 0);

}

- (void)syncAppsWithiCloud
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;
  void *v23;

  v22 = SBSOpenApplicationOptionKeyPreventDismissalOfTransientOverlays;
  v23 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchiTunesiCloudAccountsInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("iCloud")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppSwitcherManager sharedInstance](MSDAppSwitcherManager, "sharedInstance"));
    objc_msgSend(v7, "stashSwitcherModelToPath:overwrite:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/emptyAppSwitcherModel.plist"), 1);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(&off_10014E528, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(&off_10014E528);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          +[MSDAppLauncherTerminator launchApp:withOptions:outError:](MSDAppLauncherTerminator, "launchApp:withOptions:outError:", v12, v3, 0);
          sleep(0x3Cu);
          +[MSDAppLauncherTerminator terminateApp:outError:](MSDAppLauncherTerminator, "terminateApp:outError:", v12, 0);
        }
        v9 = objc_msgSend(&off_10014E528, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    v13 = objc_claimAutoreleasedReturnValue(+[MSDAppSwitcherManager sharedInstance](MSDAppSwitcherManager, "sharedInstance"));
    -[NSObject loadStashedSwitcherModelFromPath:](v13, "loadStashedSwitcherModelFromPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/emptyAppSwitcherModel.plist"));
  }
  else
  {
    v14 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[MSDAccountManager syncAppsWithiCloud]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s - No iCloud account logged in. Not synching any apps", buf, 0xCu);
    }
  }

}

- (MSDAccountManagerHelper)accountManagerHelper
{
  return self->_accountManagerHelper;
}

- (void)setAccountManagerHelper:(id)a3
{
  objc_storeStrong((id *)&self->_accountManagerHelper, a3);
}

- (int)peerChangeToken
{
  return self->_peerChangeToken;
}

- (void)setPeerChangeToken:(int)a3
{
  self->_peerChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManagerHelper, 0);
}

@end
