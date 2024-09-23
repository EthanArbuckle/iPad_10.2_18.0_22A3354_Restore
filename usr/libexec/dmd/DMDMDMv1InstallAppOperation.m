@implementation DMDMDMv1InstallAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFMDMv1InstallAppRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((-[DMDMDMv1InstallAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDMDMv1InstallAppOperation;
    -[DMDMDMv1InstallAppOperation endOperationWithResultObject:](&v5, "endOperationWithResultObject:", v4);
  }

}

- (void)endOperationWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((-[DMDMDMv1InstallAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDMDMv1InstallAppOperation;
    -[DMDMDMv1InstallAppOperation endOperationWithError:](&v5, "endOperationWithError:", v4);
  }

}

- (void)installAppForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v8 = objc_msgSend(v7, "stateForBundleIdentifier:", v6);

  if (v8 == (id)3)
  {
    v11 = DMFAppLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100077BF4(self, v12);

    v20 = DMFBundleIdentifierErrorKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
    v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v16 = DMFErrorWithCodeAndUserInfo(2603, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[DMDMDMv1InstallAppOperation endOperationWithError:](self, "endOperationWithError:", v17);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "redemptionCode"));
    if (v13)
    {
      -[DMDMDMv1InstallAppOperation _redeemAppWithRedemptionCode:](self, "_redeemAppWithRedemptionCode:", v13);
      goto LABEL_10;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestURL"));

    if (v18)
    {
      -[DMDMDMv1InstallAppOperation _installEnterpriseAppForRequest:](self, "_installEnterpriseAppForRequest:", v4);
      goto LABEL_10;
    }
    v14 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v6, 0);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "compatibilityObject"));
    v15 = (void *)v19;
    if (v14 && v19)
      -[DMDMDMv1InstallAppOperation _installSystemAppWithBundleIdentifier:](self, "_installSystemAppWithBundleIdentifier:", v6);
    else
      -[DMDMDMv1InstallAppOperation _installStoreAppForRequest:](self, "_installStoreAppForRequest:", v4);
  }

LABEL_10:
}

- (id)_storeAppFormat
{
  if (qword_1000EB930 != -1)
    dispatch_once(&qword_1000EB930, &stru_1000BB6E8);
  return (id)qword_1000EB928;
}

- (id)_getRequiredAppIDFromDisk
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths mdmFilePath](DMDPaths, "mdmFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequiredAppIDForMDM")));
  v5 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_redeemAppWithRedemptionCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  DMDMDMv1InstallAppOperation *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  if (objc_msgSend(v7, "stateForBundleIdentifier:", v6) == (id)1)
  {
    -[DMDMDMv1InstallAppOperation _setRedemptionCode:](self, "_setRedemptionCode:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _storeAppFormat](self, "_storeAppFormat"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100052EE0;
    v9[3] = &unk_1000BB738;
    v10 = v6;
    v11 = self;
    v12 = v7;
    v13 = v4;
    -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:](self, "_promptIfNeededWithMessageFormat:success:", v8, v9);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2611);
  }

}

- (void)_installEnterpriseAppForRequest:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  DMDMDMv1InstallAppOperation *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];

  v4 = a3;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ is about to install and manage the app “%@”.\nYour iTunes account will not be charged for this app."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000532AC;
  v30[3] = &unk_1000BAD98;
  v30[4] = self;
  v10 = objc_retainBlock(v30);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100053344;
  v25[3] = &unk_1000BB760;
  v25[4] = self;
  v11 = v4;
  v26 = v11;
  v27 = v8;
  v12 = v9;
  v28 = v12;
  v13 = v10;
  v29 = v13;
  v14 = v8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005359C;
  v19[3] = &unk_1000BB7B0;
  v20 = v12;
  v21 = v11;
  v22 = self;
  v23 = v13;
  v24 = objc_retainBlock(v25);
  v15 = v24;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:](self, "_promptIfNeededWithMessageFormat:success:", v7, v19);

}

- (void)_installSystemAppWithBundleIdentifier:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMDMDMv1InstallAppOperation *v11;

  v4 = a3;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ is about to install the app “%@”.\nYour iTunes account will not be charged for this app."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053858;
  v9[3] = &unk_1000B9BA8;
  v10 = v4;
  v11 = self;
  v8 = v4;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:](self, "_promptIfNeededWithMessageFormat:success:", v7, v9);

}

+ (id)descriptionForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unknown change type (%ld)"), a3));
  else
    return off_1000BB978[a3];
}

- (void)_installStoreAppForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  _QWORD v14[4];
  id v15;
  DMDMDMv1InstallAppOperation *v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v8 = objc_msgSend(v7, "needsRedownload");

  v11 = DMFAppLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting re-download of app because metadata says it is necessary: %{public}@", buf, 0xCu);
    }

    -[DMDMDMv1InstallAppOperation _redownloadDeviceAppForRequest:](self, "_redownloadDeviceAppForRequest:", v4);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting SINF swap to install app: %{public}@", buf, 0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100053BC0;
    v14[3] = &unk_1000BB7D8;
    v15 = v6;
    v16 = self;
    v17 = v4;
    -[DMDMDMv1InstallAppOperation _attemptSINFSwapForRequest:completion:](self, "_attemptSINFSwapForRequest:completion:", v17, v14);

  }
}

- (void)_attemptSINFSwapForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000543B4;
  v17[3] = &unk_1000BA118;
  v7 = a4;
  v18 = v7;
  v8 = objc_retainBlock(v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v11 = DMFAppLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaIdentifier"));
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "attempt SINF swap, persona:%{public}@", buf, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storeItemIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaIdentifier"));
  objc_msgSend(v9, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", 0, v15, v16, 2, 1, v8);

}

- (void)_redownloadDeviceAppForRequest:(id)a3
{
  -[DMDMDMv1InstallAppOperation _downloadStoreAppForRequest:type:](self, "_downloadStoreAppForRequest:type:", a3, 2);
}

- (void)_redownloadUserAppForRequest:(id)a3
{
  -[DMDMDMv1InstallAppOperation _downloadStoreAppForRequest:type:](self, "_downloadStoreAppForRequest:type:", a3, 1);
}

- (void)_purchaseFreeAppForRequest:(id)a3
{
  -[DMDMDMv1InstallAppOperation _downloadStoreAppForRequest:type:](self, "_downloadStoreAppForRequest:type:", a3, 3);
}

- (void)_downloadStoreAppForRequest:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  DMDMDMv1InstallAppOperation *v21;
  id v22;
  id v23;
  int64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100054604;
  v29[3] = &unk_1000BAD98;
  v29[4] = self;
  v8 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100054658;
  v25[3] = &unk_1000BB800;
  v25[4] = self;
  v9 = v7;
  v26 = v9;
  v10 = v6;
  v27 = v10;
  v11 = v8;
  v28 = v11;
  v12 = objc_retainBlock(v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _storeAppFormat](self, "_storeAppFormat"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000548B8;
  v18[3] = &unk_1000BB850;
  v19 = v9;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v23 = v12;
  v24 = a4;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:](self, "_promptIfNeededWithMessageFormat:success:", v13, v18);

}

- (void)_applyManagementPiecesForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;

  v4 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "VPNUUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellularSliceUUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentFilterUUIDString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "DNSProxyUUIDString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relayUUIDString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "associatedDomains"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "associatedDomainsEnableDirectDownloads"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allowUserToHide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allowUserToLock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v9 = objc_msgSend(v4, "managementOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceIdentifier"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  objc_msgSend(v19, "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:", v18, v5, v6, v17, v16, v15, v14, v13, v7, v8, v9, v10, v12);

}

- (void)_promptIfNeededWithMessageFormat:(id)a3 success:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  DMDUserNotification *v31;
  NSBundle *v32;
  void *v33;
  void *v34;
  NSBundle *v35;
  void *v36;
  void *v37;
  NSBundle *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  void *v54;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDMDMv1InstallAppOperation+iphoneOS.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10005525C;
  v51[3] = &unk_1000BA7F0;
  v51[4] = self;
  v9 = v8;
  v52 = v9;
  v10 = objc_retainBlock(v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration"));
  v12 = objc_msgSend(v11, "isSupervised");

  if (v12)
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _getRequiredAppIDFromDisk](self, "_getRequiredAppIDFromDisk"));
    if (v13
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storeItemIdentifier")),
          v16 = objc_msgSend(v15, "isEqualToNumber:", v13),
          v15,
          v14,
          v16))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation request](self, "request"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originator"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "displayName"));

      v23 = DMFAppLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v54 = v20;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Prompting user to install app: %{public}@", buf, 0xCu);
      }
      v47 = v13;

      v50 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@%@"), &v50, v18, v20));
      v26 = v50;
      v28 = v26;
      if (!v25)
      {
        v29 = DMFAppLog(v26, v27);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_100077EDC();

      }
      v45 = (void *)v18;
      v46 = v28;
      v31 = objc_opt_new(DMDUserNotification);
      v32 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("App Installation"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setHeader:](v31, "setHeader:", v34);

      -[DMDUserNotification setMessage:](v31, "setMessage:", v25);
      v35 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Install"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setDefaultButtonTitle:](v31, "setDefaultButtonTitle:", v37);

      v38 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setAlternateButtonTitle:](v31, "setAlternateButtonTitle:", v40);

      -[DMDMDMv1InstallAppOperation _setState:](self, "_setState:", 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000552DC;
      v48[3] = &unk_1000BB878;
      v48[4] = self;
      v49 = v10;
      objc_msgSend(v41, "showNotification:completion:", v31, v48);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundleIdentifier"));
      -[DMDMDMv1InstallAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v43);

      v13 = v47;
    }

  }
}

- (void)_promptToSignInAndInstallAppForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  DMDUserNotification *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[16];

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Show our prompt to sign in", buf, 2u);
  }

  -[DMDMDMv1InstallAppOperation _setState:](self, "_setState:", 4);
  v8 = objc_opt_new(DMDUserNotification);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("App Installation"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setHeader:](v8, "setHeader:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Sign in to iTunes to allow %1$@ to manage and install apps."), v12));
  -[DMDUserNotification setMessage:](v8, "setMessage:", v13);

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Sign In"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setDefaultButtonTitle:](v8, "setDefaultButtonTitle:", v16);

  v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setAlternateButtonTitle:](v8, "setAlternateButtonTitle:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100055594;
  v22[3] = &unk_1000BB8A0;
  v22[4] = self;
  v23 = v4;
  v21 = v4;
  objc_msgSend(v20, "showNotification:completion:", v8, v22);

}

- (void)_showStorePromptToSignInAndInstallAppForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Show store prompt to sign in", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000556CC;
  v10[3] = &unk_1000BB8F0;
  v10[4] = self;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v12 = v4;
  v8 = v4;
  v9 = v11;
  objc_msgSend(v9, "promptUserToSignInWithCompletion:", v10);

}

- (void)_showInstallationFailurePromptIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  DMDUserNotification *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration"));
  v4 = objc_msgSend(v3, "isSupervised");

  if ((v4 & 1) == 0)
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("The app “%@” could not be installed."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

    v8 = objc_opt_new(DMDUserNotification);
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("App Installation"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotification setHeader:](v8, "setHeader:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v13));
    -[DMDUserNotification setMessage:](v8, "setMessage:", v14);

    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotification setDefaultButtonTitle:](v8, "setDefaultButtonTitle:", v17);

    v20 = DMFAppLog(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100077F3C(v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
    objc_msgSend(v22, "showNotification:completion:", v8, 0);

  }
}

- (void)_setState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  if (-[DMDMDMv1InstallAppOperation _canManageBundleIdentifier:](self, "_canManageBundleIdentifier:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v14 = 0;
    v8 = objc_msgSend(v7, "setState:forBundleIdentifier:error:", a3, v6, &v14);
    v9 = v14;

    if ((v8 & 1) == 0)
    {
      v12 = DMFAppLog(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100077F7C();

    }
  }

}

- (void)_setRedemptionCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set redemption code for bundle identifier: %{public}@", buf, 0xCu);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100055C28;
  v11[3] = &unk_1000BB918;
  v12 = v4;
  v10 = v4;
  -[DMDMDMv1InstallAppOperation _updateManagementInfoWithBlock:](self, "_updateManagementInfoWithBlock:", v11);

}

- (void)_setUnusedRedemptionCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set unused redemption code for bundle identifier: %{public}@", buf, 0xCu);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100055D60;
  v11[3] = &unk_1000BB918;
  v12 = v4;
  v10 = v4;
  -[DMDMDMv1InstallAppOperation _updateManagementInfoWithBlock:](self, "_updateManagementInfoWithBlock:", v11);

}

- (void)_updateManagementInfoWithBlock:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDMDMv1InstallAppOperation+iphoneOS.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  v8 = -[DMDMDMv1InstallAppOperation _canManageBundleIdentifier:](self, "_canManageBundleIdentifier:", v7);
  if (v8)
  {
    v10 = DMFAppLog(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Update management information for bundle identifier: %{public}@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managementInformationForBundleIdentifier:", v7));
    if (!v13)
      v13 = (void *)objc_opt_new(DMFAppManagementInformation);
    v5[2](v5, v13);
    v21 = 0;
    v14 = objc_msgSend(v12, "setManagementInformation:forBundleIdentifier:error:", v13, v7, &v21);
    v15 = v21;
    v17 = v15;
    if ((v14 & 1) == 0)
    {
      v18 = DMFAppLog(v15, v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100078004((uint64_t)v7);

    }
  }

}

- (BOOL)_canManageBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v3, 0);

  return v4 == 0;
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v6 = objc_msgSend(v5, "stateForBundleIdentifier:", v4);

  v7 = objc_msgSend(objc_alloc((Class)DMFMDMv1InstallAppResultObject), "initWithBundleIdentifier:state:", v4, v6);
  -[DMDMDMv1InstallAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);

}

- (void)_resetRemovabilityWithBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v4, "setRemovability:forBundleIdentifier:completion:", 0, v3, &stru_1000BB938);

}

- (void)_resetTapToPayScreenLock
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  objc_msgSend(v5, "setTapToPayScreenLock:forBundleIdentifier:completion:", 0, v4, &stru_1000BB958);

}

- (void)_setRemovability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100056280;
  v9[3] = &unk_1000BAD98;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "setRemovability:forBundleIdentifier:completion:", v8, v7, v9);

}

- (void)_setTapToPayScreenLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000563AC;
  v9[3] = &unk_1000BAD98;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "setTapToPayScreenLock:forBundleIdentifier:completion:", v8, v7, v9);

}

@end
