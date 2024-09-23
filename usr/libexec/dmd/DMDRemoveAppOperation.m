@implementation DMDRemoveAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveAppRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2F58;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  DMDRemoveAppOperation *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F360;
  v8[3] = &unk_1000B9B40;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "setRemovability:forBundleIdentifier:completion:", 0, v7, v8);

}

+ (BOOL)removeAppMetadataForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDRemoveAppOperation.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (a4)
      goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDRemoveAppOperation.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  if ((objc_msgSend(v8, "setVPNUUIDString:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079608();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setCellularSliceUUIDString:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000795A0();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setContentFilterUUIDString:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079538();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setDNSProxyUUIDString:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000794D0();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setRelayUUIDString:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079468();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setAssociatedDomains:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079400();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079398();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setAllowUserToHide:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079330();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setAllowUserToLock:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000792C8();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setConfiguration:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079260();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "setManagementInformation:forBundleIdentifier:error:", 0, v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000791F8();
    goto LABEL_42;
  }
  if ((objc_msgSend(v8, "removePersonaMappingForBundleID:error:", v7, a4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079190();
LABEL_42:
    v10 = 0;
    goto LABEL_43;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v9, "sendManagedAppsChangedNotification");

  v10 = 1;
LABEL_43:

  return v10;
}

+ (void)removeAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  _QWORD v33[4];
  id v34;
  id v35;
  void (**v36)(_QWORD, _QWORD);
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  id v40;

  v7 = a3;
  v8 = a4;
  v10 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDRemoveAppOperation.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDRemoveAppOperation.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v11 = DMFAppLog(v8, v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remove app with bundle identifier: %{public}@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v7));
  v15 = objc_msgSend(v14, "currentState");
  switch((unint64_t)v15)
  {
    case 0uLL:
    case 4uLL:
      v22 = DMFAppLog(v15, v16);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v13, "startUninstallingAppWithBundleIdentifier:completion:", v7, v10);
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v17 = DMFAppLog(v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cancel app installation with bundle identifier: %{public}@", buf, 0xCu);
      }

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10005FE18;
      v33[3] = &unk_1000B9D68;
      v34 = v7;
      v35 = v13;
      v36 = v10;
      objc_msgSend(v35, "cancelAppInstallationWithBundleIdentifier:completion:", v34, v33);

      v19 = v34;
      goto LABEL_12;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      v20 = DMFAppLog(v15, v16);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cancel app update with bundle identifier: %{public}@", buf, 0xCu);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10005FEC8;
      v29[3] = &unk_1000B9D68;
      v30 = v7;
      v31 = v13;
      v32 = v10;
      objc_msgSend(v31, "cancelAppUpdateWithBundleIdentifier:completion:", v30, v29);

      v19 = v30;
LABEL_12:

      break;
    case 8uLL:
      v10[2](v10, 0);
      break;
    default:
      v37 = DMFBundleIdentifierErrorKey;
      v38 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v25 = DMFErrorWithCodeAndUserInfo(3, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      ((void (**)(_QWORD, void *))v10)[2](v10, v26);

      break;
  }

}

@end
