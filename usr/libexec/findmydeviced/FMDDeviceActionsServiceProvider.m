@implementation FMDDeviceActionsServiceProvider

- (void)didMakeProviderActive
{
  FMDLocationTracker *v3;
  id v4;

  v3 = -[FMDLocationTracker initWithType:]([FMDLocationTracker alloc], "initWithType:", 0);
  -[FMDDeviceActionsServiceProvider setLocationTracker:](self, "setLocationTracker:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
  objc_msgSend(v4, "registerDelegate:", self);

}

- (void)willMakeProviderInactive
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
  objc_msgSend(v3, "deregisterDelegate:", self);

  -[FMDDeviceActionsServiceProvider setLocationTracker:](self, "setLocationTracker:", 0);
}

- (void)accountAdded
{
  objc_super v3;

  -[FMDDeviceActionsServiceProvider _cleanupFMIPPreferences](self, "_cleanupFMIPPreferences");
  v3.receiver = self;
  v3.super_class = (Class)FMDDeviceActionsServiceProvider;
  -[FMDServiceProvider accountAdded](&v3, "accountAdded");
}

- (void)accountRemoveRequestedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[FMDDeviceActionsServiceProvider _cleanupFMIPPreferences](self, "_cleanupFMIPPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  objc_msgSend(v5, "cleanupAllContextsForKey:", CFSTR("serverContextHeaderContext"));

  v6.receiver = self;
  v6.super_class = (Class)FMDDeviceActionsServiceProvider;
  -[FMDServiceProvider accountRemoveRequestedWithCompletion:](&v6, "accountRemoveRequestedWithCompletion:", v4);

}

- (void)_cleanupFMIPPreferences
{
  +[FMDPreferencesMgr removeNeedsLostModeExitAuth](FMDPreferencesMgr, "removeNeedsLostModeExitAuth");
}

- (void)registerCommonNotifications
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "lostModeDisabled:", CFSTR("com.apple.AOSNotification.LostModeDisabled"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FMDDeviceActionsServiceProvider;
  -[FMDServiceProvider registerCommonNotifications](&v4, "registerCommonNotifications");
}

- (void)deregisterCommonNotifications
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.AOSNotification.LostModeDisabled"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FMDDeviceActionsServiceProvider;
  -[FMDServiceProvider deregisterCommonNotifications](&v4, "deregisterCommonNotifications");
}

- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
    objc_msgSend(v7, "recordLocation:ofType:", v8, v4);

  }
}

- (BOOL)setPasscodeLock:(id)a3 statusCode:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _BOOL4 v15;
  int64_t *v16;
  void *v17;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;

  v5 = a3;
  *a4 = qword_100304990;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = objc_msgSend(v7, "isPasscodeSet");

  if (!v5
    || (v10 = objc_opt_class(NSString, v9), (objc_opt_isKindOfClass(v5, v10) & 1) == 0)
    || !objc_msgSend(v5, "length"))
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Remote Lock:  Passcode is already set - Locking device only", buf, 2u);
      }

      *a4 = qword_100304998;
      goto LABEL_12;
    }
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Remote Lock:  Invalid passcode state - locking device only", buf, 2u);
    }

    LOBYTE(v14) = 0;
    v16 = &qword_100304978;
    goto LABEL_16;
  }
  if (v8)
  {
    *a4 = qword_1003049A0;
    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote Lock:  Passcode already set.  Ignoring new passcode and locking device", buf, 2u);
    }

LABEL_12:
    LOBYTE(v14) = 1;
    goto LABEL_17;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v20 = objc_msgSend(v19, "passcode:meetsCurrentConstraintsOutError:", v5, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v22 = v21;
  if (v20)
  {
    LODWORD(v14) = objc_msgSend(v21, "isPasscodeModificationAllowed");

    if ((_DWORD)v14)
    {
      v23 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Remote Lock:  Setting new lock passcode", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
      v31 = 0;
      LOBYTE(v14) = objc_msgSend(v24, "changePasscodeFrom:to:outError:", 0, v5, &v31);
      v25 = v31;

      if ((v14 & 1) == 0)
      {
        v26 = sub_1000031B8();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v25)
        {
          if (v28)
            sub_1002268BC((uint64_t)v25, v27);
        }
        else if (v28)
        {
          sub_10022687C(v27);
        }

        *a4 = qword_100304980;
      }

      goto LABEL_17;
    }
    v16 = &qword_100304988;
LABEL_16:
    *a4 = *v16;
    goto LABEL_17;
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedDescriptionOfCurrentPasscodeConstraints"));

  v29 = sub_1000031B8();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v5;
    v34 = 2112;
    v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Remote Lock: New passcode %@ does not meet current policy: %@", buf, 0x16u);
  }

  *a4 = qword_100304970;
  LOBYTE(v14) = 0;
LABEL_17:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v17, "lockDeviceImmediately:", 1);

  objc_autoreleasePoolPop(v6);
  return v14;
}

- (void)sendLostModeExitAuthWithToken:(id)a3
{
  id v4;
  FMDRequestLostModeExitAuth *v5;

  v4 = a3;
  v5 = -[FMDRequestLostModeExitAuth initWithProvider:lostModeExitAuthToken:]([FMDRequestLostModeExitAuth alloc], "initWithProvider:lostModeExitAuthToken:", self, v4);

  -[FMDRequest setCompletionHandler:](v5, "setCompletionHandler:", &stru_1002C1F38);
  -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v5);

}

- (void)lostModeDisabled:(id)a3
{
  -[FMDServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("LostModeDisabled"), 0);
}

- (void)didAddNewTrackedLocation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  FMDDeviceActionsServiceProvider *v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
  if ((objc_msgSend(v5, "trackNotifyEnabled") & 1) != 0)
  {

LABEL_4:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000219C8;
    v10[3] = &unk_1002C1F60;
    v11 = v4;
    v12 = self;
    objc_msgSend(v7, "actOnTrackedLocationsUsingBlock:", v10);

    v8 = v11;
    goto LABEL_5;
  }
  v6 = +[FMDPreferencesMgr overriddenTrackNotifyEnabled](FMDPreferencesMgr, "overriddenTrackNotifyEnabled");

  if ((v6 & 1) != 0)
    goto LABEL_4;
  v9 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not informing provider about change to trackedLocations because trackNotifyEnabled is false", buf, 2u);
  }
LABEL_5:

}

- (void)sendTrackedLocations:(id)a3 withCurrentLocation:(id)a4
{
  id v6;
  id v7;
  FMDActingRequestDecorator *v8;
  FMDRequestTrackedLocations *v9;
  void *v10;
  void *v11;
  FMDRequestTrackedLocations *v12;
  uint64_t v13;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[5];

  v6 = a4;
  v7 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100021CD8;
  v18[3] = &unk_1002C1D20;
  v18[4] = self;
  v8 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:]([FMDActingRequestDecorator alloc], "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C1F80, v18, 0, 0);
  v9 = [FMDRequestTrackedLocations alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
  v12 = -[FMDRequestTrackedLocations initWithAccount:currentLocation:trackedLocations:locationTracker:](v9, "initWithAccount:currentLocation:trackedLocations:locationTracker:", v10, v6, v7, v11);

  -[FMDRequest setDecorator:](v12, "setDecorator:", v8);
  -[FMDRequest setCompletionHandler:](v12, "setCompletionHandler:", &stru_1002C1FA0);
  v13 = ct_green_tea_logger_create_static("findmydeviced");
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v13);
  v15 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Transmitting Location.", v17, 2u);
  }

  -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v12);
}

- (FMDLocationTracker)locationTracker
{
  return self->_locationTracker;
}

- (void)setLocationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_locationTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTracker, 0);
}

@end
