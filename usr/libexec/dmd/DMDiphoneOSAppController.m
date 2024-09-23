@implementation DMDiphoneOSAppController

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  _QWORD v13[4];
  NSMutableArray *v14;
  id v15;
  id v16;
  DMDiphoneOSAppController *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018D54;
  v13[3] = &unk_1000BA030;
  v14 = objc_opt_new(NSMutableArray);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController updatesService](self, "updatesService"));
  v16 = v6;
  v17 = self;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemIdentifier"));
  v19 = v7;
  v8 = v7;
  v9 = v18;
  v10 = v6;
  v11 = v15;
  v12 = v14;
  objc_msgSend(v11, "getManagedUpdatesWithCompletionBlock:", v13);

}

+ (id)enumeratorForUserAppPlaceholders
{
  return +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 64);
}

+ (id)enumeratorForSystemAppPlaceholders
{
  return +[LSApplicationRecord systemPlaceholderEnumerator](LSApplicationRecord, "systemPlaceholderEnumerator");
}

+ (id)enumeratorForOrdinaryApps
{
  return +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0);
}

- (unint64_t)appTypeFromProxy:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "applicationType"));
  if ((objc_msgSend(v3, "isEqualToString:", LSUserApplicationType) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", LSSystemApplicationType);

  return v4;
}

- (id)_allPropertyKeys
{
  if (qword_1000EB730 != -1)
    dispatch_once(&qword_1000EB730, &stru_1000BA050);
  return (id)qword_1000EB728;
}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)ASDExternalManifestRequestOptions), "initWithURL:", v6);

  objc_msgSend(v7, "setShouldHideUserPrompts:", 1);
  v8 = objc_msgSend(objc_alloc((Class)ASDExternalManifestRequest), "initWithOptions:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019CB4;
  v10[3] = &unk_1000BA078;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "startWithCompletionBlock:", v10);

}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v9 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v8, 0);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compatibilityObject"));
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = objc_msgSend(v6, "licenseType");
    if ((v13 & 1) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100019F54;
      v16[3] = &unk_1000BA0A0;
      v19 = (v13 & 2) >> 1;
      v16[4] = self;
      v17 = v6;
      v18 = v7;
      -[DMDiphoneOSAppController _installDeviceLicensedAppForRequest:completion:](self, "_installDeviceLicensedAppForRequest:completion:", v17, v16);

    }
    else if ((v13 & 2) != 0)
    {
      -[DMDiphoneOSAppController _installUserAppForRequest:completion:](self, "_installUserAppForRequest:completion:", v6, v7);
    }
    else
    {
      v14 = DMFErrorWithCodeAndUserInfo(0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      (*((void (**)(id, void *))v7 + 2))(v7, v15);

    }
  }
  else
  {
    -[DMDiphoneOSAppController installSystemAppWithBundleIdentifier:completion:](self, "installSystemAppWithBundleIdentifier:completion:", v8, v7);
  }

}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resume app installation for bundle identifier: %{public}@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A104;
  v14[3] = &unk_1000BA0F0;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController jobManager](self, "jobManager"));
  v17 = v7;
  v15 = v6;
  v11 = v16;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v11, "getJobsUsingBlock:", v14);

}

- (void)_installDeviceLicensedAppForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Install device licensed app for request: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  -[DMDiphoneOSAppController _downloadAppForRequest:type:completion:](self, "_downloadAppForRequest:type:completion:", v6, 2, v7);
}

- (void)_installUserAppForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  DMDiphoneOSAppController *v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Install user licensed app for request: %{public}@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001A614;
  v13[3] = &unk_1000B9D68;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  -[DMDiphoneOSAppController _downloadAppForRequest:type:completion:](self, "_downloadAppForRequest:type:completion:", v12, 1, v13);

}

- (void)_downloadAppForRequest:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeItemIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaIdentifier"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A7F4;
  v14[3] = &unk_1000BA118;
  v15 = v8;
  v13 = v8;
  -[DMDiphoneOSAppController sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:](self, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", v10, v11, v12, a4, 0, v14);

}

- (id)initPrivate
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DMDiphoneOSAppController;
  v2 = -[DMDAppController initPrivate](&v14, "initPrivate");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)v2[7];
    v2[7] = &__NSArray0__struct;

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_10001AA14;
    v11 = &unk_1000BA140;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "setTransitionHandler:", &v8);
    v5 = objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4, v8, v9, v10, v11));
    v6 = (void *)v2[6];
    v2[6] = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)foregroundBundleIdentifiers
{
  return -[DMDiphoneOSAppController _foregroundBundleIdentifiers](self, "_foregroundBundleIdentifiers");
}

- (ASDJobManager)jobManager
{
  if (qword_1000EB740 != -1)
    dispatch_once(&qword_1000EB740, &stru_1000BA160);
  return (ASDJobManager *)(id)qword_1000EB738;
}

- (ASDUpdatesService)updatesService
{
  if (qword_1000EB750 != -1)
    dispatch_once(&qword_1000EB750, &stru_1000BA180);
  return (ASDUpdatesService *)(id)qword_1000EB748;
}

- (void)addTerminationAssertion:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v9 = DMFAppLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Add termination assertion for bundle identifier: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  if (!v11)
  {
    v12 = objc_opt_new(NSMutableDictionary);
    -[DMDiphoneOSAppController setBundleIDsToAssertions:](self, "setBundleIDsToAssertions:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)removeTerminationAssertionForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remove termination assertion for bundle identifier: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));
  objc_msgSend(v9, "invalidate");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

}

- (BOOL)userIsSignedIn
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));
  v4 = v3 != 0;

  return v4;
}

- (void)promptUserToSignInWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeAccount"));

  if (v5)
    v6 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccount:", v5);
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[SSMutableAuthenticationContext contextForSignIn](SSMutableAuthenticationContext, "contextForSignIn"));
  v7 = v6;
  objc_msgSend(v6, "setPromptStyle:", 0);
  objc_msgSend(v7, "setAccountNameEditable:", 0);
  objc_msgSend(v7, "setCanCreateNewAccount:", 1);
  v8 = objc_msgSend(objc_alloc((Class)SSAuthenticateRequest), "initWithAuthenticationContext:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AEC8;
  v10[3] = &unk_1000BA1A8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "startWithAuthenticateResponseBlock:", v10);

}

- (void)sendAppRequestWithBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 type:(int64_t)a6 skipDownloads:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v19 = v17;
  if (!v9)
  {

    v14 = 0;
  }
  if ((unint64_t)(a6 - 1) > 2)
    v20 = CFSTR("Undefined");
  else
    v20 = off_1000BA2B8[a6 - 1];
  v21 = DMFAppLog(v17, v18);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("YES");
    *(_DWORD *)buf = 138544386;
    v33 = v14;
    if (v9)
      v23 = CFSTR("NO");
    v24 = CFSTR("override");
    v34 = 2114;
    v37 = v20;
    v35 = v15;
    v36 = 2114;
    if (!v16)
      v24 = CFSTR("default");
    v38 = 2114;
    v39 = v23;
    v40 = 2114;
    v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Send app store request for bundle identifier: %{public}@, store item identifier: %{public}@, type: %{public}@, download: %{public}@, persona: %{public}@", buf, 0x34u);
  }

  v25 = objc_msgSend(objc_alloc((Class)ASDManagedApplicationRequestOptions), "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:", v15, 0, v14, 0, v9);
  objc_msgSend(v25, "setRequestType:", a6);
  v26 = objc_msgSend((id)objc_opt_class(self), "_appStoreAccountIdentifierForPersona:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v25, "setAccountIdentifier:", v27);

  v28 = objc_msgSend(objc_alloc((Class)ASDManagedApplicationRequest), "initWithOptions:", v25);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001B180;
  v30[3] = &unk_1000BA1D0;
  v30[4] = self;
  v31 = v19;
  v29 = v19;
  objc_msgSend(v28, "sendRequestWithCompletionBlock:", v30);

}

+ (id)_appStoreAccountIdentifierForPersona:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(a1), "_appleAccountForPersona:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = v6;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
      v11 = DMFAppLog(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = v4;
        v17 = 2114;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "persona:%{public}@ -> accountIdentifier:%{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      v13 = DMFAppLog(0, v7);
      v12 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "persona:%{public}@ -> accountIdentifier:<none>", (uint8_t *)&v15, 0xCu);
      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_appleAccountForPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierAppleAccount));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsWithAccountType:", v5));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v17 = v5;
    v9 = *(_QWORD *)v19;
    v10 = ACAccountPropertyPersonaIdentifier;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
        v14 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0
          && (objc_msgSend(v13, "isEqualToString:", v3) & 1) != 0)
        {
          v15 = v12;

          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
    v15 = 0;
LABEL_12:
    v5 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)changeTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("default");
  else
    return off_1000BA2D0[a3];
}

- (void)installSystemAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController+iphoneOS.m"), 328, CFSTR("We must have a bundle identifier to be installing a system app"));

  }
  v9 = objc_msgSend(objc_alloc((Class)ASDSystemAppRequest), "initWithBundleID:", v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B708;
  v12[3] = &unk_1000BA1F8;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "startWithErrorHandler:", v12);

}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMDiphoneOSAppController;
  v3 = -[DMDAppController writeManagementInformationToDiskWithError:](&v6, "writeManagementInformationToDiskWithError:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v4, "rereadManagedAppAttributes");

  }
  return v3;
}

+ (id)metadataPath
{
  return +[DMDPaths managedAppsManifest](DMDPaths, "managedAppsManifest");
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B8F0;
  v9[3] = &unk_1000B9D40;
  v10 = a5;
  v8 = v10;
  -[DMDiphoneOSAppController _getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:](self, "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:", 0, a3, a4, v9);

}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  void (**v7)(id, DMDAppMetadata *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  DMDAppMetadata *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = (void (**)(id, DMDAppMetadata *, _QWORD))a4;
  v8 = v22;
  if (v22)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController+iphoneOS.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    v8 = 0;
    if (v7)
      goto LABEL_3;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController+iphoneOS.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  v8 = v22;
LABEL_3:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v10 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v9, 0);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "compatibilityObject"));
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v15 = (DMDAppMetadata *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "storeItemIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "personaIdentifier"));
    -[DMDiphoneOSAppController _getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:](self, "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:", v9, v15, v14, v7);

  }
  else
  {
    v15 = objc_opt_new(DMDAppMetadata);
    -[DMDAppMetadata setBundleIdentifier:](v15, "setBundleIdentifier:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    -[DMDAppMetadata setStoreItemIdentifier:](v15, "setStoreItemIdentifier:", v16);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
    v18 = (void *)v17;
    if (v17)
    {
      -[DMDAppMetadata setDisplayName:](v15, "setDisplayName:", v17);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemName"));
      -[DMDAppMetadata setDisplayName:](v15, "setDisplayName:", v19);

    }
    -[DMDAppMetadata setIsStoreApp:](v15, "setIsStoreApp:", 0);
    -[DMDAppMetadata setIsFree:](v15, "setIsFree:", 1);
    -[DMDAppMetadata setIsUserLicensed:](v15, "setIsUserLicensed:", 1);
    v7[2](v7, v15, 0);
  }

}

- (id)configurationForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController _managedDefaultsForBundleIdentifier:](self, "_managedDefaultsForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.configuration.managed")));

  return v4;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v10 = DMFAppLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("non-nil");
    if (!v7)
      v12 = CFSTR("nil");
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set configuration: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController _managedDefaultsForBundleIdentifier:](self, "_managedDefaultsForBundleIdentifier:", v8));
  v14 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");

  if (!v14)
    v14 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.configuration.managed"));
  _CFPreferencesWriteManagedDomain(v14, CFSTR("mobile"), 0, v8);
  v17 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  _CFPreferencesManagementStatusChangedForDomains();
  _CFPreferencesPostValuesChangedInDomains(v15);

  return 1;
}

- (void)_withSandboxExtensionForApp:(id)a3 do:(id)a4
{
  id v5;
  void (**v6)(id, void *, uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;

  v5 = a3;
  v6 = (void (**)(id, void *, uint64_t))a4;
  if (v6)
  {
    v19 = 1;
    v7 = objc_retainAutorelease(v5);
    v8 = container_create_or_lookup_for_current_user(2, objc_msgSend(v7, "UTF8String"), 0, 0, 0, &v19);
    if (v8)
    {
      v9 = v8;
      v19 = 1;
      v10 = container_copy_path(v8, &v19);
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
        if (v12)
        {
          free(v11);
          v19 = 1;
          v13 = container_acquire_sandbox_extension(v9, 0, &v19);
          v14 = v13;
          v16 = DMFAppLog(v13, v15);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          v18 = v17;
          if (v14)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v21 = v7;
              v22 = 2114;
              v23 = (uint64_t)v12;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "container_acquire_sandbox_extension %{public}@ succeeded for path '%{public}@'", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v21 = v7;
            v22 = 2048;
            v23 = v19;
            v24 = 2114;
            v25 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "container_acquire_sandbox_extension %{public}@ failed, error %llu, path '%{public}@'", buf, 0x20u);
          }

          v6[2](v6, v12, v19);
          container_free_object(v9);
        }
        else
        {
          v6[2](v6, 0, 1);
          container_free_object(v9);
          free(v11);
        }

      }
      else
      {
        v6[2](v6, 0, v19);
        container_free_object(v9);
      }
    }
    else
    {
      v6[2](v6, 0, v19);
    }
  }

}

- (id)feedbackForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10001C0AC;
  v14 = sub_10001C0BC;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C0C4;
  v7[3] = &unk_1000BA220;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[DMDiphoneOSAppController _withSandboxExtensionForApp:do:](self, "_withSandboxExtensionForApp:do:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE *v21;
  id *v22;
  _BYTE buf[24];
  char v24;

  v8 = a3;
  v9 = a4;
  v11 = DMFAppLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("non-nil");
    if (!v8)
      v13 = CFSTR("nil");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set feedback: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001C3A0;
  v18[3] = &unk_1000BA248;
  v14 = v9;
  v19 = v14;
  v22 = a5;
  v15 = v8;
  v20 = v15;
  v21 = buf;
  -[DMDiphoneOSAppController _withSandboxExtensionForApp:do:](self, "_withSandboxExtensionForApp:do:", v14, v18);
  v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v16;
}

- (id)_managedDefaultsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)_CFPreferencesCopyPathForManagedDomain(a3, CFSTR("mobile"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v3));

  return v4;
}

- (void)_applyStoreDictionary:(id)a3 toAppMetadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ASDManagedLookupBundleID));
  if (v6)
    objc_msgSend(v5, "setBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ASDManagedLookupItemID));
  if (v7)
    objc_msgSend(v5, "setStoreItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ASDManagedLookupBundleDisplayName));
  if (v8)
    objc_msgSend(v5, "setDisplayName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ASDManagedLookupIsAppFree));
  v10 = v9;
  if (v9)
    objc_msgSend(v5, "setIsFree:", objc_msgSend(v9, "BOOLValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ASDManagedLookupIsActiveAccountAppOwner));
  v12 = v11;
  if (v11)
    objc_msgSend(v5, "setIsUserLicensed:", objc_msgSend(v11, "BOOLValue"));

}

- (void)_getMetadataForBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  DMDiphoneOSAppController *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = DMFAppLog(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Get metadata for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@", buf, 0x20u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001C7C4;
  v22[3] = &unk_1000BA298;
  v23 = v10;
  v24 = v11;
  v26 = v12;
  v27 = v13;
  v25 = self;
  v17 = v12;
  v18 = v13;
  v19 = v11;
  v20 = v10;
  v21 = objc_retainBlock(v22);
  -[DMDiphoneOSAppController sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:](self, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", v20, v19, v17, 3, 1, v21);

}

- (void)_updateForegroundBundleIdentifiers
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController+iphoneOS.m"), 689, CFSTR("_updateForegroundBundleIdentifiers should always be called on the main thread"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController layoutMonitor](self, "layoutMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elements"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12), "bundleIdentifier", (_QWORD)v20));
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v14 = objc_msgSend(v7, "copy");
  -[DMDiphoneOSAppController set_foregroundBundleIdentifiers:](self, "set_foregroundBundleIdentifiers:", v14);

  v17 = DMFAppLog(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_100072394((uint64_t)v7, v18);

}

- (NSString)singleAppModeBundleIndentifier
{
  return self->_singleAppModeBundleIndentifier;
}

- (void)setSingleAppModeBundleIndentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)bundleIDsToAssertions
{
  return self->_bundleIDsToAssertions;
}

- (void)setBundleIDsToAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDsToAssertions, a3);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (NSArray)_foregroundBundleIdentifiers
{
  return self->__foregroundBundleIdentifiers;
}

- (void)set_foregroundBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__foregroundBundleIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foregroundBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIDsToAssertions, 0);
  objc_storeStrong((id *)&self->_singleAppModeBundleIndentifier, 0);
}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CE4C;
  v8[3] = &unk_1000BA330;
  v9 = a3;
  v10 = a4;
  v6 = v9;
  v7 = v10;
  -[DMDiphoneOSAppController promptUserToSignInWithCompletion:](self, "promptUserToSignInWithCompletion:", v8);

}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D1E4;
  v11[3] = &unk_1000BA0F0;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController jobManager](self, "jobManager"));
  v14 = v7;
  v12 = v6;
  v8 = v13;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getJobsUsingBlock:", v11);

}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, char, void *);
  void *v16;
  DMDiphoneOSAppController *v17;
  id v18;
  id v19;
  SEL v20;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)BKSTerminationAssertion);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10001D5DC;
  v16 = &unk_1000BA358;
  v17 = self;
  v18 = v7;
  v19 = v8;
  v20 = a2;
  v10 = v8;
  v11 = v7;
  v12 = objc_msgSend(v9, "initWithBundleIdentifier:efficacy:name:withHandler:", v11, 3, CFSTR("com.apple.dmd.remove-foreground-app"), &v13);
  -[DMDiphoneOSAppController addTerminationAssertion:forBundleIdentifier:](self, "addTerminationAssertion:forBundleIdentifier:", v12, v11, v13, v14, v15, v16, v17);

}

- (void)_uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)IXUninstallOptions);
  objc_msgSend(v7, "setRequestUserConfirmation:", 0);
  objc_msgSend(v7, "setWaitForDeletion:", 0);
  objc_msgSend(v7, "setIgnoreRemovability:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if (objc_msgSend(v8, "isMultiUser"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D89C;
    v15[3] = &unk_1000BA3A8;
    v9 = &v16;
    v16 = v5;
    v17 = v7;
    v10 = v8;
    v18 = v10;
    v19 = v6;
    v11 = v6;
    objc_msgSend(v10, "terminateSyncWithCompletionHandler:", v15);

  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001D988;
    v13[3] = &unk_1000BA3D0;
    v9 = &v14;
    v14 = v6;
    v12 = v6;
    +[IXAppInstallCoordinator uninstallAppWithBundleID:options:completion:](IXAppInstallCoordinator, "uninstallAppWithBundleID:options:completion:", v5, v7, v13);
  }

}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController foregroundBundleIdentifiers](self, "foregroundBundleIdentifiers"));
  v13 = objc_msgSend(v12, "containsObject:", v11);

  if ((v13 & 1) != 0)
  {
    v16 = DMFAppLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138543362;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating foreground app for request: %{public}@, so will take termination assertion", (uint8_t *)&v25, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "isInSingleAppMode"));
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v23 = DMFAppLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138543362;
        v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "We will need to restart the app after updating bundle identifier: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      -[DMDiphoneOSAppController setSingleAppModeBundleIndentifier:](self, "setSingleAppModeBundleIndentifier:", v11);
    }
  }
  -[DMDiphoneOSAppController _startUpdatingAppForRequest:metadata:completion:](self, "_startUpdatingAppForRequest:metadata:completion:", v8, v9, v10);

}

- (void)didCancelUpdatingForLifeCycle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  v4 = a3;
  -[DMDAppController didCancelUpdatingForLifeCycle:](&v5, "didCancelUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);

}

- (void)didFailUpdatingForLifeCycle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  v4 = a3;
  -[DMDAppController didFailUpdatingForLifeCycle:](&v5, "didFailUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);

}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  v4 = a3;
  -[DMDAppController didFinishUpdatingForLifeCycle:](&v5, "didFinishUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);

}

- (void)_startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lifeCycle"));
  objc_msgSend(v10, "addObserver:", self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001DF1C;
  v28[3] = &unk_1000B9D68;
  v28[4] = self;
  v11 = v10;
  v29 = v11;
  v12 = v9;
  v30 = v12;
  v13 = objc_retainBlock(v28);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "manifestURL"));
  v16 = (void *)v14;
  if (v14)
  {
    v17 = DMFAppLog(v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "host"));
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Start updating enterprise app with manifest URL from: %{public}@", buf, 0xCu);

    }
    -[DMDiphoneOSAppController startInstallingEnterpriseAppWithManifestURL:completion:](self, "startInstallingEnterpriseAppWithManifestURL:completion:", v16, v13);
  }
  else
  {
    v20 = (void *)objc_opt_new(DMFInstallAppRequest);
    objc_msgSend(v20, "setLicenseType:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    objc_msgSend(v20, "setBundleIdentifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeItemIdentifier"));
    objc_msgSend(v20, "setStoreItemIdentifier:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaIdentifier"));
    objc_msgSend(v20, "setPersonaIdentifier:", v23);

    v26 = DMFAppLog(v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Start updating non-enterprise app for request: %{public}@, new install request: %{public}@", buf, 0x16u);
    }

    -[DMDiphoneOSAppController startInstallingNonEnterpriseAppForRequest:completion:](self, "startInstallingNonEnterpriseAppForRequest:completion:", v20, v13);
  }

}

- (void)_updateEndedForLifeCycle:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifier"));
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DMF registered app update complete for bundle identifier: %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController singleAppModeBundleIndentifier](self, "singleAppModeBundleIndentifier"));
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  v12 = DMFAppLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DMF restarting app with bundle identifier: %{public}@...", buf, 0xCu);
    }

    v19[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v19[1] = FBSOpenApplicationOptionKeyUnlockDevice;
    v20[0] = &__kCFBooleanTrue;
    v20[1] = &__kCFBooleanTrue;
    v19[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
    v20[2] = CFSTR("com.apple.dmd.restart-single-app-mode");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
    v13 = objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v15));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001E1D4;
    v17[3] = &unk_1000BA3F8;
    v18 = v4;
    objc_msgSend(v16, "openApplication:withOptions:completion:", v18, v13, v17);

    -[DMDiphoneOSAppController setSingleAppModeBundleIndentifier:](self, "setSingleAppModeBundleIndentifier:", 0);
  }
  else if (v14)
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DMF ignoring app restart for bundle identifier: %{public}@", buf, 0xCu);
  }

}

@end
