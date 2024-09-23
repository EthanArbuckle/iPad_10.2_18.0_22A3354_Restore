@implementation MSDAccountManagerHelper

- (MSDAccountManagerHelper)init
{
  MSDAccountManagerHelper *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDAccountManagerHelper;
  v2 = -[MSDAccountManagerHelper init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    -[MSDAccountManagerHelper setAccountStore:](v2, "setAccountStore:", v3);

    v4 = objc_alloc((Class)AIDAServiceOwnersManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](v2, "accountStore"));
    v6 = objc_msgSend(v4, "initWithAccountStore:", v5);
    -[MSDAccountManagerHelper setServiceOwnersManager:](v2, "setServiceOwnersManager:", v6);

  }
  return v2;
}

- (ACAccount)iCloudAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountForService:", AIDAServiceTypeCloud));

  return (ACAccount *)v3;
}

- (ACAccount)iTunesAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountForService:", AIDAServiceTypeStore));

  return (ACAccount *)v3;
}

- (id)fetchiTunesiCloudAccountsInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  if (!v4)
    goto LABEL_10;
  v5 = -[MSDCDPStateController initForPrimaryiCloudAccount]([MSDCDPStateController alloc], "initForPrimaryiCloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("iCloud"));

  if (!objc_msgSend(v5, "isCDPEnabled"))
  {
    v10 = &off_10014D730;
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("iCloudCDPState"));
    goto LABEL_7;
  }
  v16 = 0;
  v7 = objc_msgSend(v5, "isRecoveryKeyAvailable:", &v16);
  v8 = v16;
  if (!v8)
  {
    if (v7)
      v10 = &off_10014D700;
    else
      v10 = &off_10014D718;
    goto LABEL_6;
  }
  v9 = v8;
  objc_msgSend(v3, "setObject:forKey:", &off_10014D6E8, CFSTR("iCloudCDPState"));

LABEL_7:
  if ((objc_msgSend(v5, "isCDPManateeAvailable") & 1) == 0)
    objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("iCloudCDPRepairNeeded"));

LABEL_10:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iTunesAccount](self, "iTunesAccount"));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("iTunes"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v3));

  return v14;
}

- (BOOL)performiCloudAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  const __CFString *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[7];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  dispatch_semaphore_t v70;

  v5 = a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_10000C34C;
  v69 = sub_10000C35C;
  v70 = dispatch_semaphore_create(0);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_10000C34C;
  v63 = sub_10000C35C;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_10000C34C;
  v57 = sub_10000C35C;
  v58 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10000C364;
  v52[3] = &unk_10013DA08;
  v52[4] = &v59;
  v52[5] = &v53;
  v52[6] = &v65;
  -[MSDAccountManagerHelper _authenticateAccountWithContext:forService:completionHandler:](self, "_authenticateAccountWithContext:forService:completionHandler:", v5, 1, v52);
  v6 = v66[5];
  v7 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v38 = sub_1000604F0();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1000B7E40();

    sub_1000B63E4(a4, 3727741043, (uint64_t)CFSTR("Failed to authenticate account with server."), (uint64_t)CFSTR("Operation timed out"));
    v13 = 0;
    v9 = 0;
    goto LABEL_43;
  }
  v8 = (void *)v54[5];
  if (v8)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
    sub_1000B63E4(a4, 3727741043, (uint64_t)CFSTR("Failed to authenticate account with server."), (uint64_t)v35);
    v13 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", AIDAServiceTypeCloud));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "features"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("com.apple.mobilestoredemo.FaceTime")));

  if (v11 && objc_msgSend(v11, "BOOLValue"))
    objc_msgSend(v9, "addObject:", AIDAServiceTypeFaceTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "features"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("com.apple.mobilestoredemo.iMessage")));

  if (v13 && objc_msgSend(v13, "BOOLValue"))
    objc_msgSend(v9, "addObject:", AIDAServiceTypeMessages);
  v14 = v60[5];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10000C3F4;
  v51[3] = &unk_10013DA30;
  v51[4] = &v53;
  v51[5] = &v65;
  -[MSDAccountManagerHelper _signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:](self, "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:", v5, v9, v14, v51);
  v15 = v66[5];
  v16 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    v40 = sub_1000604F0();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1000B7E14();
    v42 = 3727741046;
    v43 = CFSTR("Failed to sign in account service.");
    goto LABEL_42;
  }
  v17 = (void *)v54[5];
  if (v17)
  {
    if (!objc_msgSend(v17, "aa_isAASignInErrorWithCode:", -8010))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v54[5], "localizedDescription"));
      sub_1000B63E4(a4, 3727741046, (uint64_t)CFSTR("Failed to sign in account service."), (uint64_t)v35);
      goto LABEL_21;
    }
    v18 = v60[5];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10000C448;
    v50[3] = &unk_10013DA30;
    v50[4] = &v53;
    v50[5] = &v65;
    -[MSDAccountManagerHelper _acceptiCloudTermsWithAuthResults:completionHandler:](self, "_acceptiCloudTermsWithAuthResults:completionHandler:", v18, v50);
    v19 = v66[5];
    v20 = dispatch_time(0, 200000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      v46 = sub_1000604F0();
      v41 = objc_claimAutoreleasedReturnValue(v46);
      v42 = 3727741048;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_1000B7E14();
      v43 = CFSTR("Failed to accept account terms.");
      goto LABEL_42;
    }
    v21 = (void *)v54[5];
    if (v21)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedDescription"));
      sub_1000B63E4(a4, 3727741048, (uint64_t)CFSTR("Failed to accept account terms."), (uint64_t)v35);
      goto LABEL_21;
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "features"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000C49C;
  v49[3] = &unk_10013DA30;
  v49[4] = &v53;
  v49[5] = &v65;
  -[MSDAccountManagerHelper _configureiCloudAccountFeatures:completionHandler:](self, "_configureiCloudAccountFeatures:completionHandler:", v22, v49);

  v23 = v66[5];
  v24 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    v44 = sub_1000604F0();
    v41 = objc_claimAutoreleasedReturnValue(v44);
    v42 = 3727741049;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1000B7DE8();
    v43 = CFSTR("Failed to configure account features.");
LABEL_42:

    sub_1000B63E4(a4, v42, (uint64_t)v43, (uint64_t)CFSTR("Operation timed out"));
LABEL_43:
    v36 = 0;
    goto LABEL_23;
  }
  v25 = (void *)v54[5];
  if (v25)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
    sub_1000B63E4(a4, 3727741049, (uint64_t)CFSTR("Failed to configure account features."), (uint64_t)v35);
    goto LABEL_21;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "features"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("com.apple.mobilestoredemo.FindMyiPhone")));
  v28 = objc_msgSend(v27, "BOOLValue");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "features"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("com.apple.mobilestoredemo.SendLastLocation")));
  v31 = objc_msgSend(v30, "BOOLValue");

  if (v28)
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000C4F0;
    v48[3] = &unk_10013DA30;
    v48[4] = &v53;
    v48[5] = &v65;
    -[MSDAccountManagerHelper _enableFindMyServiceAndSendLastLocation:completionHandler:](self, "_enableFindMyServiceAndSendLastLocation:completionHandler:", v31, v48);
    v32 = v66[5];
    v33 = dispatch_time(0, 200000000000);
    if (!dispatch_semaphore_wait(v32, v33))
    {
      v34 = (void *)v54[5];
      if (!v34)
        goto LABEL_19;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedDescription"));
      sub_1000B63E4(a4, 3727741042, (uint64_t)CFSTR("Cannot turn on Find My iPhone."), (uint64_t)v35);
LABEL_21:
      v36 = 0;
      goto LABEL_22;
    }
    v45 = sub_1000604F0();
    v41 = objc_claimAutoreleasedReturnValue(v45);
    v42 = 3727741042;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1000B7DBC();
    v43 = CFSTR("Cannot turn on Find My iPhone.");
    goto LABEL_42;
  }
LABEL_19:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
  -[MSDAccountManagerHelper _waitForIDSOperationToQuiesceForAccount:forSignOut:](self, "_waitForIDSOperationToQuiesceForAccount:forSignOut:", v35, 0);
  v36 = 1;
LABEL_22:

LABEL_23:
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v36;
}

- (BOOL)performiTunesAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  id v15;
  BOOL v16;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  _QWORD v24[6];
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  dispatch_semaphore_t v43;
  uint64_t v44;

  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10000C34C;
  v42 = sub_10000C35C;
  v43 = dispatch_semaphore_create(0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10000C34C;
  v36 = sub_10000C35C;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10000C34C;
  v30 = sub_10000C35C;
  v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000C8F4;
  v25[3] = &unk_10013DA08;
  v25[4] = &v32;
  v25[5] = &v26;
  v25[6] = &v38;
  -[MSDAccountManagerHelper _authenticateAccountWithContext:forService:completionHandler:](self, "_authenticateAccountWithContext:forService:completionHandler:", v6, 2, v25);
  v7 = v39[5];
  v8 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = 3727741043;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000B7E40();
    v21 = CFSTR("Failed to authenticate account with server.");
    goto LABEL_14;
  }
  v9 = (void *)v27[5];
  if (v9)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    sub_1000B63E4(a4, 3727741043, (uint64_t)CFSTR("Failed to authenticate account with server."), (uint64_t)v22);
LABEL_16:

    goto LABEL_17;
  }
  v44 = AIDAServiceTypeStore;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v11 = v33[5];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000C984;
  v24[3] = &unk_10013DA30;
  v24[4] = &v26;
  v24[5] = &v38;
  -[MSDAccountManagerHelper _signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:](self, "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:", v6, v10, v11, v24);

  v12 = v39[5];
  v13 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v23 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000B7E6C();
    v20 = 3727741046;
    v21 = CFSTR("Failed to sign in account service.");
LABEL_14:

    sub_1000B63E4(a4, v20, (uint64_t)v21, (uint64_t)CFSTR("Operation timed out"));
LABEL_17:
    v15 = 0;
    v16 = 0;
    goto LABEL_6;
  }
  v14 = (void *)v27[5];
  if (v14)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    sub_1000B63E4(a4, 3727741046, (uint64_t)CFSTR("Failed to sign in account service."), (uint64_t)v22);
    goto LABEL_16;
  }
  v15 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.MobileStore"));
  objc_msgSend(v15, "setBool:forKey:", 1, CFSTR("SKUIFamilySetupDisplayed"));
  objc_msgSend(v15, "synchronize");
  v16 = 1;
LABEL_6:
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v16;
}

- (BOOL)performiCloudAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  BOOL v15;
  id v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  id v22;
  _QWORD v23[6];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  dispatch_semaphore_t v36;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10000C34C;
  v35 = sub_10000C35C;
  v36 = dispatch_semaphore_create(0);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10000C34C;
  v29 = sub_10000C35C;
  v30 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000CCDC;
  v24[3] = &unk_10013DA30;
  v24[4] = &v25;
  v24[5] = &v31;
  -[MSDAccountManagerHelper _disableFindMyServiceUsingContext:completionHandler:](self, "_disableFindMyServiceUsingContext:completionHandler:", v6, v24);
  v9 = v32[5];
  v10 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = 3727741042;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B7EC4();
    v20 = CFSTR("Cannot turn off Find My iPhone.");
    goto LABEL_14;
  }
  v11 = (void *)v26[5];
  if (v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
    sub_1000B63E4(a4, 3727741042, (uint64_t)CFSTR("Cannot turn off Find My iPhone."), (uint64_t)v21);
LABEL_16:

    goto LABEL_17;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000CD30;
  v23[3] = &unk_10013DA30;
  v23[4] = &v25;
  v23[5] = &v31;
  -[MSDAccountManagerHelper _signOutAppleIDForServices:completionHandler:](self, "_signOutAppleIDForServices:completionHandler:", 0, v23);
  v12 = v32[5];
  v13 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v22 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B7E98();
    v19 = 3727741047;
    v20 = CFSTR("Failed to sign out account service.");
LABEL_14:

    sub_1000B63E4(a4, v19, (uint64_t)v20, (uint64_t)CFSTR("Operation timed out"));
LABEL_17:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)v26[5];
  if (v14)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    sub_1000B63E4(a4, 3727741047, (uint64_t)CFSTR("Failed to sign out account service."), (uint64_t)v21);
    goto LABEL_16;
  }
  v15 = 1;
  -[MSDAccountManagerHelper _waitForIDSOperationToQuiesceForAccount:forSignOut:](self, "_waitForIDSOperationToQuiesceForAccount:forSignOut:", v8, 1);
LABEL_6:
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (BOOL)performiTunesAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  dispatch_semaphore_t v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10000C34C;
  v26 = sub_10000C35C;
  v27 = dispatch_semaphore_create(0);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10000C34C;
  v20 = sub_10000C35C;
  v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CF68;
  v15[3] = &unk_10013DA30;
  v15[4] = &v16;
  v15[5] = &v22;
  -[MSDAccountManagerHelper _signOutAppleIDForServices:completionHandler:](self, "_signOutAppleIDForServices:completionHandler:", 0, v15);
  v7 = v23[5];
  v8 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000B7EF0();

    sub_1000B63E4(a4, 3727741047, (uint64_t)CFSTR("Failed to sign out account service."), (uint64_t)CFSTR("Operation timed out"));
    goto LABEL_9;
  }
  v9 = (void *)v17[5];
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    sub_1000B63E4(a4, 3727741047, (uint64_t)CFSTR("Failed to sign out account service."), (uint64_t)v14);

LABEL_9:
    v10 = 0;
    goto LABEL_4;
  }
  v10 = 1;
LABEL_4:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

- (id)generateiCloudAccountRecoveryKeyWithError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[16];

  v4 = -[MSDCDPStateController initForPrimaryiCloudAccount]([MSDCDPStateController alloc], "initForPrimaryiCloudAccount");
  v5 = v4;
  if (!v4)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000B7F1C();

    sub_1000B63A4(a3, 3727741051, (uint64_t)CFSTR("Failed to setup recovery key for iCloud account."));
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isRecoveryKeyAvailable:", 0))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iCloud account already has recovery key created before!", buf, 2u);
    }

  }
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "generateRecoveryKeyWithError:", &v15));
  v9 = v15;
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    sub_1000B63E4(a3, 3727741051, (uint64_t)CFSTR("Failed to setup recovery key for iCloud account."), (uint64_t)v11);

LABEL_11:
    v8 = 0;
  }

  return v8;
}

- (BOOL)forceiCloudKeychainToSyncWithServerAndError:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10000C34C;
  v24 = sub_10000C35C;
  v25 = 0;
  -[MSDAccountManagerHelper _forceIDSToSyncWithServer](self, "_forceIDSToSyncWithServer");
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10000D2B4;
  v17 = &unk_10013DA58;
  v19 = &v20;
  v6 = v5;
  v18 = v6;
  -[MSDAccountManagerHelper _forceiCloudKeychainToSyncWithServerAndCompletion:](self, "_forceiCloudKeychainToSyncWithServerAndCompletion:", &v14);
  v7 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000B7F48();

    sub_1000B63E4(a3, 3727741050, (uint64_t)CFSTR("Failed to synchronize account data with server."), (uint64_t)CFSTR("Operation timed out"));
  }
  else
  {
    v10 = (void *)v21[5];
    if (!v10)
    {
      v12 = 1;
      goto LABEL_8;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription", v14, v15, v16, v17));
    sub_1000B63E4(a3, 3727741050, (uint64_t)CFSTR("Failed to synchronize account data with server."), (uint64_t)v11);

  }
  v12 = 0;
LABEL_8:

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)_authenticateAccountWithContext:(id)a3 forService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int64_t v24;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "password"));
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2048;
    v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Authenticating account: %{public}@ for service: %ld", buf, 0x16u);
  }

  if (v9)
  {
    v14 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    objc_msgSend(v14, "setUsername:", v10);
    objc_msgSend(v14, "setIsUsernameEditable:", 0);
    objc_msgSend(v14, "_setPassword:", v11);
    objc_msgSend(v14, "setServiceType:", a4);
    objc_msgSend(v14, "setAuthenticationType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recoveryKey"));
    objc_msgSend(v14, "_setMasterKey:", v15);

    v16 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000D500;
    v17[3] = &unk_10013DA80;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v20 = v9;
    objc_msgSend(v16, "authenticateWithContext:completion:", v14, v17);

  }
}

- (void)_signInToAppleIDWithContext:(id)a3 forServices:(id)a4 usingAuthResults:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  MSDCDPFakeUIProvider *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  MSDAccountManagerHelper *v35;
  uint8_t buf[4];
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10000C34C;
  v32 = sub_10000C35C;
  v33 = 0;
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Signing in to Apple ID for services: %{public}@", buf, 0xCu);
  }

  if (v13)
  {
    v16 = objc_alloc_init(MSDCDPFakeUIProvider);
    v17 = (void *)v29[5];
    v29[5] = (uint64_t)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localSecret"));
    objc_msgSend((id)v29[5], "setLocalSecret:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recoveryKey"));
    objc_msgSend((id)v29[5], "setRecoveryKey:", v19);

    v20 = objc_alloc_init((Class)AIDAMutableServiceContext);
    objc_msgSend(v20, "setAuthenticationResults:", v12);
    objc_msgSend(v20, "setCdpUiProvider:", v29[5]);
    v21 = objc_msgSend(objc_alloc((Class)CDPContext), "initWithAuthenticationResults:", v12);
    -[MSDAccountManagerHelper setCdpContext:](self, "setCdpContext:", v21);

    if (objc_msgSend(v10, "resetCDP"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper cdpContext](self, "cdpContext"));
      objc_msgSend(v22, "set_forceReset:", 1);

    }
    v34 = AIDAServiceTypeCloud;
    v35 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    objc_msgSend(v20, "setSignInContexts:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000D988;
    v25[3] = &unk_10013DAA8;
    v26 = v13;
    v27 = &v28;
    objc_msgSend(v24, "signInToServices:usingContext:completion:", v11, v20, v25);

  }
  _Block_object_dispose(&v28, 8);

}

- (id)_createTempAppleAccountFromAuthResults:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc((Class)ACAccount);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_appleAccountType"));
  v8 = objc_msgSend(v5, "initWithAccountType:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", AKAuthenticationUsernameKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", AKAuthenticationDSIDKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));

  objc_msgSend(v8, "setUsername:", v9);
  objc_msgSend(v8, "setAccountProperty:forKey:", v11, CFSTR("personID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", AKAuthenticationPasswordKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", AKAuthenticationRawPasswordKey));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountCredential credentialWithPassword:](ACAccountCredential, "credentialWithPassword:", v12));
  objc_msgSend(v8, "setCredential:", v14);
  objc_msgSend(v8, "_aa_setRawPassword:", v13);

  return v8;
}

- (void)_acceptiCloudTermsWithAuthResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", AATermsEntryDevice, AATermsEntryWarranty, AATermsEntryPrivacy, AATermsEntryiCloud, AATermsEntryiTunes, AATermsEntryGameCenter, 0));
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accepting iCloud terms...", buf, 2u);
  }

  if (v7)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper _createTempAppleAccountFromAuthResults:](self, "_createTempAppleAccountFromAuthResults:", v6));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(objc_alloc((Class)AAiCloudTermsStringRequest), "initWithAccount:termsEntries:preferPassword:", v11, v8, 1);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000DEBC;
      v17[3] = &unk_10013DAF8;
      v18 = v12;
      v19 = v7;
      v14 = v12;
      objc_msgSend(v13, "performRequestWithHandler:", v17);

    }
    else
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000B8058();

      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744768, CFSTR("An error has occurred.")));
      (*((void (**)(id, id))v7 + 2))(v7, v13);
    }

  }
}

- (void)_signOutAppleIDForServices:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  MSDAccountManagerHelper *v23;
  uint8_t buf[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v10)
      goto LABEL_7;
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    v11 = "Signing out Apple ID for services: %{public}@";
    v12 = v9;
    v13 = 12;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v11 = "Signing out Apple ID for ALL services.";
    v12 = v9;
    v13 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_7:

  if (v7)
  {
    v14 = objc_alloc_init((Class)AIDAMutableServiceContext);
    v22 = AIDAServiceTypeCloud;
    v23 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    objc_msgSend(v14, "setSignOutContexts:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper serviceOwnersManager](self, "serviceOwnersManager"));
    if (v6)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000E340;
      v20[3] = &unk_10013DB20;
      v17 = &v21;
      v21 = v7;
      objc_msgSend(v16, "signOutOfServices:usingContext:completion:", v6, v14, v20);
    }
    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000E4F8;
      v18[3] = &unk_10013DB48;
      v17 = &v19;
      v19 = v7;
      objc_msgSend(v16, "signOutOfAllServicesUsingContext:completion:", v14, v18);
    }

  }
}

- (void)_markiCloudAccountAsManagedAccount:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  _BOOL4 v18;

  v4 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting managed account state for iCloud account to: %{BOOL}d", buf, 8u);
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v9)
    {
      v10 = v9;
      if (v4)
        v11 = CFSTR("DeKOTA");
      else
        v11 = 0;
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, ACAccountPropertyRemoteManagingAccountIdentifier);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000E780;
      v15[3] = &unk_10013DB48;
      v16 = v6;
      objc_msgSend(v14, "saveAccount:withCompletionHandler:", v10, v15);

    }
    else
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No iCloud account found on device.", buf, 2u);
      }

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

- (void)_configureiCloudAccountFeatures:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  MSDAccountManagerHelper *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint8_t v39;
  _BYTE v40[15];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring iCloud account features: %{public}@", buf, 0xCu);
  }

  if (v7)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v10)
    {
      v11 = (void *)v10;
      if (v6 && objc_msgSend(v6, "count"))
      {
        v33 = self;
        v34 = v7;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v35 = v6;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (!v13)
          goto LABEL_29;
        v14 = v13;
        v15 = *(_QWORD *)v42;
        v36 = ACAccountDataclassSiri;
        while (1)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v17));
            v19 = objc_msgSend(v18, "BOOLValue");
            v20 = sub_1000604F0();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v22)
              {
                *(_DWORD *)buf = 138543362;
                v47 = v17;
                v23 = v21;
                v24 = ">> Enabling iCloud account feature: %{public}@";
LABEL_17:
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
              }
            }
            else if (v22)
            {
              *(_DWORD *)buf = 138543362;
              v47 = v17;
              v23 = v21;
              v24 = ">> Disabling iCloud account feature: %{public}@";
              goto LABEL_17;
            }

            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.FindMyiPhone")) & 1) == 0
              && (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.SendLastLocation")) & 1) == 0)
            {
              if ((objc_msgSend(v11, "isProvisionedForDataclass:", v17) & 1) != 0)
              {
                if (objc_msgSend(v17, "isEqualToString:", v36))
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
                  objc_msgSend(v25, "setCloudSyncEnabled:", objc_msgSend(v18, "BOOLValue"));

                }
                objc_msgSend(v11, "setEnabled:forDataclass:", objc_msgSend(v18, "BOOLValue"), v17);
              }
              else
              {
                v26 = sub_1000604F0();
                v27 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  sub_1000B82DC(&v39, v40, v27);

              }
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (!v14)
          {
LABEL_29:

            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](v33, "accountStore"));
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_10000EC40;
            v37[3] = &unk_10013DB48;
            v7 = v34;
            v38 = v34;
            objc_msgSend(v28, "saveAccount:withCompletionHandler:", v11, v37);

            v6 = v35;
            goto LABEL_36;
          }
        }
      }
      v29 = sub_1000604F0();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No iCloud account features provided. Skip configuring anything!", buf, 2u);
      }

      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      v31 = sub_1000604F0();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1000B82B0();

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744768, CFSTR("An error has occurred.")));
      (*((void (**)(id, void *))v7 + 2))(v7, v11);
    }
LABEL_36:

  }
}

- (void)_enableFindMyServiceAndSendLastLocation:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance"));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabling 'Find My' service...", buf, 2u);
  }

  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000EDDC;
    v9[3] = &unk_10013DB98;
    v10 = v5;
    v11 = a3;
    objc_msgSend(v6, "enableInContext:completion:", 3, v9);

  }
}

- (void)_disableFindMyServiceUsingContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  id v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  _QWORD v33[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "username"));
    *(_DWORD *)buf = 138543362;
    v33[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking 'Find My' service state for iCloud account: %{public}@", buf, 0xCu);

  }
  if (v7)
  {
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "username"));
      objc_msgSend(v6, "setUsername:", v13);

      *(_QWORD *)&v14 = 67109376;
      v27 = v14;
      while (!objc_msgSend(v8, "isStateKnown", v27) || objc_msgSend(v8, "isChangingState"))
      {
        v15 = sub_1000604F0();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v8, "isStateKnown");
          v18 = objc_msgSend(v8, "isChangingState");
          *(_DWORD *)buf = v27;
          LODWORD(v33[0]) = v17;
          WORD2(v33[0]) = 1024;
          *(_DWORD *)((char *)v33 + 6) = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wait until 'Find My' service state is known (isStateKnown = %{BOOL}d) or finished changing (isChaningState = %{BOOL}d).", buf, 0xEu);
        }

        sleep(1u);
      }
      if (!objc_msgSend(v8, "isStateKnown") || (objc_msgSend(v8, "isEnabled") & 1) != 0)
      {
        v19 = sub_1000604F0();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "'Find My' service is still enabled. Disabling it now!", buf, 2u);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "password"));
        if (v21)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10000F394;
          v28[3] = &unk_10013DC10;
          v31 = v7;
          v29 = v9;
          v30 = v8;
          -[MSDAccountManagerHelper _authenticateAccountWithContext:forService:completionHandler:](self, "_authenticateAccountWithContext:forService:completionHandler:", v6, 0, v28);

        }
        else
        {
          v22 = sub_1000604F0();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_1000B8444();

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:reason:](NSError, "errorDomainMSDWithCode:message:reason:", 3727744512, CFSTR("Unexpected server response."), CFSTR("No password for existing account.")));
          (*((void (**)(id, void *))v7 + 2))(v7, v24);

        }
        goto LABEL_24;
      }
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "'Find My' service is already disabled.", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
LABEL_24:

}

- (void)_waitForIDSOperationToQuiesceForAccount:(id)a3 forSignOut:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __CFString *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *i;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  double v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL4 v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  __CFString *v56;
  __int16 v57;
  double v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a4;
  v46 = a3;
  v5 = CFSTR("registration");
  v44 = v4;
  if (v4)
    v5 = CFSTR("deregistration");
  v6 = v5;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wait for IDS %{public}@ to quiesce...", buf, 0xCu);
  }

  if (v46)
  {
    v9 = objc_msgSend(objc_alloc((Class)IDSAccountController), "initWithService:", CFSTR("com.apple.private.alloy.mobilestoredemo.icloud"));
    if (v9)
    {
      v10 = v9;
      v43 = (uint64_t)v6;
      v11 = 0;
      v12 = 0;
      v13 = 0.0;
      while (1)
      {
        v14 = v11;
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject accounts](v10, "accounts"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

        v16 = sub_1000604F0();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found IDS accounts: %{public}@", buf, 0xCu);
        }

        if (v44)
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v18 = v15;
          v19 = -[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (!v19)
          {
LABEL_19:

            v23 = 1;
            goto LABEL_31;
          }
          v20 = v19;
          v21 = *(_QWORD *)v52;
LABEL_13:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v18);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v22), "isActive") & 1) != 0)
              break;
            if (v20 == (id)++v22)
            {
              v20 = -[__CFString countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
              if (v20)
                goto LABEL_13;
              goto LABEL_19;
            }
          }
        }
        else
        {
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v24 = v15;
          v25 = -[__CFString countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v48;
            v45 = v12;
            while (2)
            {
              v28 = v11;
              v29 = v10;
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(_QWORD *)v48 != v27)
                  objc_enumerationMutation(v24);
                v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v31, "isActive"))
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "loginID"));
                  v33 = objc_msgSend(v32, "isEqualToString:", v46);

                  if (v33)
                  {

                    v23 = 1;
                    v10 = v29;
                    v11 = v28;
                    v12 = v45;
                    goto LABEL_31;
                  }
                }
              }
              v26 = -[__CFString countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              v10 = v29;
              v11 = v28;
              v12 = v45;
              if (v26)
                continue;
              break;
            }
          }
        }

        sleep(5u);
        v23 = 0;
LABEL_31:
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

        objc_msgSend(v34, "timeIntervalSinceDate:", v11);
        v13 = v13 + v35;

        if ((v23 & 1) == 0)
        {
          v12 = v34;
          if (v13 < 60.0)
            continue;
        }
        v36 = sub_1000604F0();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v38 = v37;
        if (v23)
        {
          v6 = (__CFString *)v43;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v56 = (__CFString *)v43;
            v57 = 2048;
            v58 = v13;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "IDS %{public}@ finished after %f seconds.", buf, 0x16u);
          }
        }
        else
        {
          v6 = (__CFString *)v43;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            sub_1000B8530(v43, v38, v13);
        }

        goto LABEL_43;
      }
    }
    v40 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000B84BC(v10, v41, v42);
  }
  else
  {
    v39 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
    }
  }
LABEL_43:

}

- (void)_forceiCloudKeychainToSyncWithServerAndCompletion:(id)a3
{
  void (**v4)(id, id);
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, id);
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[24];

  v4 = (void (**)(id, id))a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10000C34C;
  v25 = sub_10000C35C;
  v26 = 0;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forcing iCloud keychain to sync with server...", buf, 2u);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
    if (v7)
    {
      v20 = 0;
      v8 = objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](CKKSControl, "controlObject:", &v20));
      v9 = v20;
      v10 = (void *)v22[5];
      v22[5] = v8;

      if (v9)
      {
        v11 = sub_1000604F0();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
          sub_1000B85AC(v13, (uint64_t)buf, v12);
        }

        v4[2](v4, v9);
      }
      else
      {
        v16 = (void *)v22[5];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100010064;
        v17[3] = &unk_10013DC38;
        v18 = v4;
        v19 = &v21;
        objc_msgSend(v16, "rpcFetchAndProcessChanges:reply:", 0, v17);

        v9 = 0;
      }
    }
    else
    {
      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
      }

      v4[2](v4, 0);
      v9 = 0;
      v7 = 0;
    }
  }
  else
  {
    v9 = 0;
    v7 = 0;
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_forceIDSToSyncWithServer
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing IDS to sync with server...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper iCloudAccount](self, "iCloudAccount"));
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)IDSAccountController), "initWithService:", CFSTR("com.apple.private.alloy.multiplex1"));
    if (v6)
    {
      v7 = v6;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject enabledAccounts](v6, "enabledAccounts"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
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
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v14 = sub_1000604F0();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Kicking IDS account: %{public}@", buf, 0xCu);
            }

            IDSKickGetDependent(v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v10);
      }

      sleep(0xAu);
    }
    else
    {
      v17 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000B8678();
    }
  }
  else
  {
    v16 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
    }
  }

}

- (BOOL)_isAllowListedAccount:(id)a3 withAuthResults:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  uint8_t buf[16];

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKey:", AKAuthenticationDemoAccountKey));
  if (!v7
    || (v8 = objc_opt_class(NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    || !objc_msgSend(v7, "BOOLValue"))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No 'demo account' flag set in IdMS auth response!", buf, 2u);
    }

    v32 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("chnl_internal_[0-9]{1,2}@icloud.com"), 1, &v32));
    v15 = v32;
    if (!v14)
    {
      v24 = sub_1000604F0();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1000B8708();
      goto LABEL_44;
    }
    if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
      && v16 == objc_msgSend(v5, "length"))
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", objc_msgSend(CFSTR("chnl_internal_"), "length"), (_BYTE *)objc_msgSend(v5, "rangeOfString:", CFSTR("@icloud.com"))- (_BYTE *)objc_msgSend(CFSTR("chnl_internal_"), "length")));
      if ((uint64_t)-[NSObject integerValue](v17, "integerValue") >= 1
        && (uint64_t)-[NSObject integerValue](v17, "integerValue") < 21)
      {
        v11 = 1;
LABEL_31:

        goto LABEL_32;
      }

    }
    v31 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(ars|channel|dekota)[0-9]+\\.[0-9]+@(icloud|me|mac)\\.com"), 1, &v31));
    v10 = v31;

    if (v18)
    {
      if (!objc_msgSend(v18, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v19 == objc_msgSend(v5, "length"))
      {
        goto LABEL_26;
      }
      v30 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("chnl\\.[0-9]{7}\\.[0-9]{3}@icloud\\.com"), 1, &v30));
      v15 = v30;

      if (!v14)
      {
        v27 = sub_1000604F0();
        v25 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000B8708();
        goto LABEL_44;
      }
      if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v20 == objc_msgSend(v5, "length"))
      {
        v11 = 1;
LABEL_32:
        v18 = v14;
        v10 = v15;
        goto LABEL_33;
      }
      v29 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("chnl\\.[a-zA-Z0-9]{4}\\.[a-zA-Z0-9]{6}@icloud\\.com"), 1, &v29));
      v10 = v29;

      if (v18)
      {
        if (!objc_msgSend(v18, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
          && v21 == objc_msgSend(v5, "length"))
        {
LABEL_26:
          v11 = 1;
LABEL_33:

          goto LABEL_34;
        }
        v14 = v18;
        v15 = v10;
LABEL_28:
        v22 = sub_1000604F0();
        v17 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1000B86A4();
        v11 = 0;
        goto LABEL_31;
      }
      v28 = sub_1000604F0();
      v25 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1000B8708();
    }
    else
    {
      v26 = sub_1000604F0();
      v25 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1000B8708();
    }
    v15 = v10;
LABEL_44:

    v14 = 0;
    goto LABEL_28;
  }
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found 'demo account' flag in IdMS auth response!", buf, 2u);
  }
  v11 = 1;
LABEL_34:

  return v11;
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  void (**v6)(id, uint64_t);
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v6 = (void (**)(id, uint64_t))a6;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[MSDAccountManagerHelper signOutFlowController:showAlertWithTitle:message:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v9, 0xCu);
  }

  v6[2](v6, 1);
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDAccountManagerHelper signOutFlowController:performWalrusValidationForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v8, 0xCu);
  }

  v5[2](v5, 1, 0);
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDAccountManagerHelper signOutFlowController:disableFindMyDeviceForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v8, 0xCu);
  }

  v5[2](v5, 1, 0);
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;

  v7 = a5;
  v8 = a4;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[MSDAccountManagerHelper signOutFlowController:signOutAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: entered!", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManagerHelper accountStore](self, "accountStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010B4C;
  v13[3] = &unk_10013DB48;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "removeAccount:withDataclassActions:completion:", v8, 0, v13);

}

- (CDPContext)cdpContext
{
  return self->cdpContext;
}

- (void)setCdpContext:(id)a3
{
  objc_storeStrong((id *)&self->cdpContext, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (AIDAServiceOwnersManager)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->cdpContext, 0);
}

@end
