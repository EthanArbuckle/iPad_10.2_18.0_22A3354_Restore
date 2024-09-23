@implementation DMDMDMv1StartManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = objc_opt_class(DMFMDMv1StartManagingAppRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C2E80;
}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000565B4;
  v7[3] = &unk_1000BB1F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getMetadataForAppRequest:completion:", v6, v7);

}

- (void)_runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  DMDMDMv1StartManagingAppOperation *v26;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v9 = objc_msgSend(v8, "stateForBundleIdentifier:", v6);

  if (v9 == (id)17)
  {
    v10 = DMFErrorWithCodeAndUserInfo(1407, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDMDMv1StartManagingAppOperation endOperationWithError:](self, "endOperationWithError:", v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration"));
    v13 = objc_msgSend(v12, "isSupervised");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internal"));
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v13 & 1) != 0 || v15)
    {
      v20 = DMFAppLog(v16, v17);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFSTR("NO");
        if (v13)
          v23 = CFSTR("YES");
        else
          v23 = CFSTR("NO");
        if (v15)
          v22 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        v30 = 2114;
        v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request to manage app fast-tracked, supervised: %{public}@ internal: %{public}@", buf, 0x16u);
      }

      -[DMDMDMv1StartManagingAppOperation _manageApp](self, "_manageApp");
      -[DMDMDMv1StartManagingAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v6);
    }
    else
    {
      -[DMDMDMv1StartManagingAppOperation _setState:forBundleIdentifier:](self, "_setState:forBundleIdentifier:", 17, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originator"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000568A4;
      v24[3] = &unk_1000BB9B0;
      v25 = v7;
      v26 = self;
      v19 = v6;
      v27 = v19;
      -[DMDMDMv1StartManagingAppOperation _promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:](self, "_promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:", v19, v25, v18, v24);

      -[DMDMDMv1StartManagingAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v19);
    }
  }

}

- (void)_promptIfPermittedByPolicyToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DMDManageAppPromptPolicy *v14;
  _QWORD v15[4];
  DMDManageAppPromptPolicy *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_opt_new(DMDManageAppPromptPolicy);
  -[DMDManageAppPromptPolicy readTimestampsFromFile](v14, "readTimestampsFromFile");
  if (-[DMDManageAppPromptPolicy isPromptAllowedRightNow](v14, "isPromptAllowedRightNow"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100056AF4;
    v15[3] = &unk_1000BB9D8;
    v17 = v13;
    v16 = v14;
    -[DMDMDMv1StartManagingAppOperation _promptToManageApp:appDisplayName:originator:completion:](self, "_promptToManageApp:appDisplayName:originator:completion:", v10, v11, v12, v15);

  }
  else
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 2);
  }

}

- (void)_promptToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  DMDUserNotification *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v26 = a6;
  v8 = a5;
  v9 = a4;
  v10 = objc_opt_new(DMDUserNotification);
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Would you like to let %@ take management of the app “%@”? Your app data will become managed."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("App Management Change"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setHeader:](v10, "setHeader:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v9));
  -[DMDUserNotification setMessage:](v10, "setMessage:", v17);

  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Manage"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setDefaultButtonTitle:](v10, "setDefaultButtonTitle:", v20);

  v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setAlternateButtonTitle:](v10, "setAlternateButtonTitle:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100056DAC;
  v27[3] = &unk_1000BBA00;
  v28 = v26;
  v25 = v26;
  objc_msgSend(v24, "showNotification:completion:", v10, v27);

}

- (void)_manageApp
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  DMDMDMv1StartManagingAppOperation *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[16];

  -[DMDMDMv1StartManagingAppOperation _attemptSINFSwap](self, "_attemptSINFSwap");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lifeCycle"));
  v5 = objc_msgSend(v4, "currentState");
  v38 = v3;
  if (v5 && v5 != (id)8)
  {
    if (v5 != (id)2)
    {
      v9 = 7;
      goto LABEL_9;
    }
    v7 = DMFAppLog(2, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marking an app in the installing state as managed but uninstalled", buf, 2u);
    }

  }
  v9 = 8;
LABEL_9:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v4, "addObserver:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  v34 = self;
  -[DMDMDMv1StartManagingAppOperation _setState:forBundleIdentifier:](self, "_setState:forBundleIdentifier:", v9, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation request](self, "request"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "VPNUUIDString"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellularSliceUUIDString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentFilterUUIDString"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "DNSProxyUUIDString"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "relayUUIDString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "associatedDomains"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "associatedDomainsEnableDirectDownloads"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allowUserToHide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allowUserToLock"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  v18 = objc_msgSend(v13, "managementOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceIdentifier"));
  v35 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundleIdentifier"));
  objc_msgSend(v37, "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:", v36, v33, v14, v32, v31, v15, v30, v29, v16, v17, v18, v19, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "removable"));
  -[DMDMDMv1StartManagingAppOperation _setRemovability:](v34, "_setRemovability:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tapToPayScreenLock"));
  -[DMDMDMv1StartManagingAppOperation _setTapToPayScreenLock:](v34, "_setTapToPayScreenLock:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  objc_msgSend(v23, "sendManagedAppsChangedNotification");

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "personaIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundleIdentifier"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100057184;
  v39[3] = &unk_1000B9B40;
  v40 = v38;
  v41 = v13;
  v27 = v13;
  v28 = v38;
  objc_msgSend(v24, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v25, v26, v39);

}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v13 = 0;
  v7 = objc_msgSend(v6, "setState:forBundleIdentifier:error:", a3, v5, &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    v11 = DMFAppLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100078284(a3, (uint64_t)v5, v12);

  }
}

- (void)_attemptSINFSwap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeItemIdentifier"));

  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation request](self, "request"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaIdentifier"));
    objc_msgSend(v5, "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:", 0, v7, v6, 2, 1, &stru_1000BBA40);

  }
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
  -[DMDMDMv1StartManagingAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100057574;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000576A0;
  v9[3] = &unk_1000BAD98;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "setTapToPayScreenLock:forBundleIdentifier:completion:", v8, v7, v9);

}

@end
