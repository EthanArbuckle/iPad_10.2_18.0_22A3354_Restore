@implementation DMDUpdateAppOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = objc_opt_class(DMFMDMv1UpdateAppRequest);
  v5[1] = objc_opt_class(DMFUpdateAppRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C3270;
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((-[DMDUpdateAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDUpdateAppOperation;
    -[DMDUpdateAppOperation endOperationWithResultObject:](&v5, "endOperationWithResultObject:", v4);
  }

}

- (void)endOperationWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((-[DMDUpdateAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDUpdateAppOperation;
    -[DMDUpdateAppOperation endOperationWithError:](&v5, "endOperationWithError:", v4);
  }

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
  v7[2] = sub_10006A2B0;
  v7[3] = &unk_1000BB1F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getMetadataForAppRequest:completion:", v6, v7);

}

- (void)_runWithRequest:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = objc_opt_class(DMFMDMv1UpdateAppRequest);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController")),
        v11 = objc_msgSend(v10, "stateForBundleIdentifier:", v8),
        v10,
        v11 != (id)12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lifeCycle"));
    v15 = (unint64_t)objc_msgSend(v14, "currentState");

    if (v15 <= 8)
    {
      if (((1 << v15) & 0x10F) != 0)
      {
        v18 = DMFBundleIdentifierErrorKey;
        v19 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v16 = DMFErrorWithCodeAndUserInfo(3, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[DMDUpdateAppOperation endOperationWithError:](self, "endOperationWithError:", v17);

        goto LABEL_7;
      }
      if (((1 << v15) & 0x60) != 0)
      {
        -[DMDUpdateAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v8);
        goto LABEL_8;
      }
      if (v15 == 7)
      {
        -[DMDUpdateAppOperation _resumeUpdateForBundleIdentifier:](self, "_resumeUpdateForBundleIdentifier:", v8);
        goto LABEL_8;
      }
    }
    -[DMDUpdateAppOperation _promptIfNeededAndUpdateAppForRequest:metadata:](self, "_promptIfNeededAndUpdateAppForRequest:metadata:", v6, v7);
    goto LABEL_8;
  }
  v12 = DMFErrorWithCodeAndUserInfo(1407, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[DMDUpdateAppOperation endOperationWithError:](self, "endOperationWithError:", v13);
LABEL_7:

LABEL_8:
}

- (void)_resumeUpdateForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resume update for bundle identifier: %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006A618;
  v10[3] = &unk_1000B9B40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "resumeAppUpdateWithBundleIdentifier:completion:", v9, v10);

}

- (void)_promptIfNeededAndUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned int v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  DMDUserNotification *v22;
  NSBundle *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSBundle *v28;
  void *v29;
  void *v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(DMFMDMv1UpdateAppRequest);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isInSingleAppMode")),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        v9,
        !v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "foregroundBundleIdentifiers"));
    v15 = objc_msgSend(v14, "containsObject:", v12);

    if ((v15 & 1) != 0)
    {
      -[DMDUpdateAppOperation setDidPromptUser:](self, "setDidPromptUser:", 1);
      -[DMDUpdateAppOperation _setState:forBundleIdentifier:](self, "_setState:forBundleIdentifier:", 12, v12);
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originator"));
      v37 = (void *)v16;
      v17 = objc_msgSend(v7, "isStoreApp");
      v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v17)
        v21 = CFSTR("%@ is about to update the app “%@” from the App Store.");
      else
        v21 = CFSTR("%@ is about to update the app “%@”.");
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1000BC2E0, CFSTR("DMFNotifications")));

      v22 = objc_opt_new(DMDUserNotification);
      v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("App Update"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setHeader:](v22, "setHeader:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v16, v26));
      -[DMDUserNotification setMessage:](v22, "setMessage:", v27);

      v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Update"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setDefaultButtonTitle:](v22, "setDefaultButtonTitle:", v30);

      v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
      -[DMDUserNotification setAlternateButtonTitle:](v22, "setAlternateButtonTitle:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10006AA10;
      v38[3] = &unk_1000BBE28;
      v38[4] = self;
      v35 = v12;
      v39 = v35;
      v40 = v6;
      v41 = v7;
      objc_msgSend(v34, "showNotification:completion:", v22, v38);

      -[DMDUpdateAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v35);
    }
    else
    {
      -[DMDUpdateAppOperation _startUpdateAppForRequest:metadata:](self, "_startUpdateAppForRequest:metadata:", v6, v7);
    }

  }
  else
  {
    -[DMDUpdateAppOperation _startUpdateAppForRequest:metadata:](self, "_startUpdateAppForRequest:metadata:", v6, v7);
  }

}

- (void)_startUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  objc_msgSend(v6, "setBundleIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeItemIdentifier"));
  objc_msgSend(v6, "setStoreItemIdentifier:", v10);

  v13 = DMFAppLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Start updating app for request: %{public}@", buf, 0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006AC38;
  v19[3] = &unk_1000BBE50;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v16 = v8;
  v17 = v7;
  v18 = v6;
  objc_msgSend(v15, "startUpdatingAppForRequest:metadata:completion:", v18, v17, v19);

}

- (void)_showUpdateFailurePromptIfNeededForRequest:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  NSBundle *v10;
  void *v11;
  void *v12;
  DMDUserNotification *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSBundle *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(DMFMDMv1UpdateAppRequest);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0 && -[DMDUpdateAppOperation didPromptUser](self, "didPromptUser"))
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("The app “%@” could not be updated."), &stru_1000BC2E0, CFSTR("DMFNotifications")));

    v13 = objc_opt_new(DMDUserNotification);
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("App Update"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotification setHeader:](v13, "setHeader:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v17));
    -[DMDUserNotification setMessage:](v13, "setMessage:", v18);

    v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    -[DMDUserNotification setDefaultButtonTitle:](v13, "setDefaultButtonTitle:", v21);

    v24 = DMFAppLog(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100079CA8(v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
    objc_msgSend(v26, "showNotification:completion:", v13, 0);

  }
}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUpdateAppOperation request](self, "request"));
  v8 = objc_opt_class(DMFMDMv1UpdateAppRequest);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v13 = 0;
    v11 = objc_msgSend(v10, "setState:forBundleIdentifier:error:", a3, v6, &v13);
    v12 = v13;

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100079CE8(a3, (uint64_t)v6);

  }
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUpdateAppOperation request](self, "request"));
  v5 = objc_opt_class(DMFMDMv1UpdateAppRequest);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    v8 = objc_msgSend(v7, "stateForBundleIdentifier:", v10);

    v9 = objc_msgSend(objc_alloc((Class)DMFMDMv1InstallAppResultObject), "initWithBundleIdentifier:state:", v10, v8);
  }
  else
  {
    v9 = 0;
  }
  -[DMDUpdateAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);

}

- (BOOL)didPromptUser
{
  return self->_didPromptUser;
}

- (void)setDidPromptUser:(BOOL)a3
{
  self->_didPromptUser = a3;
}

@end
