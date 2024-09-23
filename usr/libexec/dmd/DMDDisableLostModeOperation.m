@implementation DMDDisableLostModeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFDisableLostModeRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2B50;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "isManagedLostModeActive");

  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling lost mode...", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDLostDeviceLocationManager sharedManager](DMDLostDeviceLocationManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocationRequestedDateMessage"));
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device was located while in lost mode. Alerting user with message “%{public}@”", buf, 0xCu);
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003879C;
    v11[3] = &unk_1000B9B40;
    v11[4] = self;
    v12 = v7;
    v10 = v7;
    objc_msgSend(v9, "disableManagedLostModeWithLocatedMessage:completion:", v8, v11);

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is not in lost mode. Reporting success regardless.", buf, 2u);
    }
    -[DMDDisableLostModeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

@end
