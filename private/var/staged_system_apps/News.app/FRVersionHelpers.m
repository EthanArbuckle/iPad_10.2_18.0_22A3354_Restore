@implementation FRVersionHelpers

- (FRVersionHelpers)initWithBackgroundTaskable:(id)a3 applicationProxy:(id)a4
{
  id v6;
  id v7;
  FRVersionHelpers *v8;
  FCRemoteDefaults *v9;
  FCRemoteDefaults *remoteDefaults;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A784();
  v13.receiver = self;
  v13.super_class = (Class)FRVersionHelpers;
  v8 = -[FRVersionHelpers init](&v13, "init");
  if (v8)
  {
    v9 = (FCRemoteDefaults *)objc_msgSend(objc_alloc((Class)FCRemoteDefaults), "initWithBackgroundTaskable:", v6);
    remoteDefaults = v8->_remoteDefaults;
    v8->_remoteDefaults = v9;

    objc_storeStrong((id *)&v8->_applicationProxy, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, "sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

  }
  return v8;
}

- (BOOL)isUpdateRequired
{
  void *v3;
  unsigned int v4;
  _BOOL4 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers remoteDefaults](self, "remoteDefaults"));
  v4 = objc_msgSend(v3, "isAvailable");

  if (!v4)
    goto LABEL_4;
  v5 = -[FRVersionHelpers isAppUpdateRequired](self, "isAppUpdateRequired");
  if (v5)
  {
    if (-[FRVersionHelpers isOSUpdateRequired](self, "isOSUpdateRequired"))
    {
LABEL_4:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = !-[FRVersionHelpers isDeviceAbandoned](self, "isDeviceAbandoned");
  }
  return v5;
}

- (void)updateAppObsolescenceState
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers remoteDefaults](self, "remoteDefaults"));
  v4 = objc_msgSend(v3, "isAvailable");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
    objc_msgSend(v5, "setAccessRestrictedBecauseOfAppVersion:", -[FRVersionHelpers isAppUpdateRequired](self, "isAppUpdateRequired"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
    objc_msgSend(v6, "setAccessRestrictedBecauseOfOSVersion:", -[FRVersionHelpers isOSUpdateRequired](self, "isOSUpdateRequired"));

    v7 = (id)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
    objc_msgSend(v7, "setAccessRestrictedBecauseOfDeviceAbandoned:", -[FRVersionHelpers isDeviceAbandoned](self, "isDeviceAbandoned"));

  }
}

- (BOOL)isAppUpdateRequired
{
  uint64_t v3;

  v3 = -[FRVersionHelpers applicationVersionNumber](self, "applicationVersionNumber");
  return v3 < -[FRVersionHelpers minimumVersionNumber](self, "minimumVersionNumber");
}

- (int64_t)minimumVersionNumber
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers minimumVersionString](self, "minimumVersionString"));
  v3 = FCIntegerRepresentationOfBundleShortVersionString();

  return v3;
}

- (int64_t)applicationVersionNumber
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  int64_t v6;
  void *v7;

  v3 = NewsCoreUserDefaults(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "BOOLForKey:", FCSimulateAppObsolescenceSharedPreferenceKey);

  if ((v5 & 1) != 0)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers applicationVersionString](self, "applicationVersionString"));
  v6 = FCIntegerRepresentationOfBundleShortVersionString();
  if (v6 <= 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A83C((uint64_t)v7);

  return v6;
}

- (id)applicationVersionString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers applicationProxy](self, "applicationProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shortVersionString"));

  return v3;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (BOOL)isOSUpdateRequired
{
  uint64_t v3;

  v3 = -[FRVersionHelpers systemVersionNumber](self, "systemVersionNumber");
  return v3 < -[FRVersionHelpers minimumOSVersionNumberForUpdate](self, "minimumOSVersionNumberForUpdate");
}

- (int64_t)systemVersionNumber
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  int64_t v7;
  id v8;
  void *v9;

  v3 = NewsCoreUserDefaults(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "BOOLForKey:", FCSimulateOSObsolescenceSharedPreferenceKey);

  if ((v5 & 1) != 0)
    return -1;
  v8 = objc_msgSend((id)objc_opt_class(self, v6), "systemVersionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v7 = FCIntegerRepresentationOfBundleShortVersionString();
  if (v7 <= 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007A8F0((uint64_t)v9);

  return v7;
}

- (int64_t)minimumOSVersionNumberForUpdate
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers minimumOSVersionStringForUpdate](self, "minimumOSVersionStringForUpdate"));
  v3 = FCIntegerRepresentationOfBundleShortVersionString();

  return v3;
}

- (id)minimumOSVersionStringForUpdate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers updateInfos](self, "updateInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumOSVersion")));
  v6 = FCDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)isDeviceAbandoned
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = NewsCoreUserDefaults(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "BOOLForKey:", FCSimulateHardwareObsolescenceSharedPreferenceKey);

  if ((v5 & 1) != 0)
    return 1;
  v7 = NFDevicePlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = objc_opt_class(NSArray, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers updateInfos](self, "updateInfos"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("UnsupportedDevices")));
  v13 = FCDynamicCast(v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  LOBYTE(v11) = objc_msgSend(v14, "containsObject:", v8);
  return (char)v11;
}

- (id)minimumVersionString
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers updateInfos](self, "updateInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumApplicationVersion")));
  v6 = FCDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)updateInfos
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers remoteDefaults](self, "remoteDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("iOSUpdateInfo")));

  return v3;
}

- (FCRemoteDefaults)remoteDefaults
{
  return self->_remoteDefaults;
}

+ (id)systemVersionString
{
  if (qword_10010A4E8 != -1)
    dispatch_once(&qword_10010A4E8, &stru_1000DA468);
  return (id)qword_10010A4E0;
}

- (FRVersionHelpers)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRVersionHelpers init]";
    v7 = 2080;
    v8 = "FRVersionHelpers.m";
    v9 = 1024;
    v10 = 27;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRVersionHelpers init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FRVersionHelpers;
  -[FRVersionHelpers dealloc](&v4, "dealloc");
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRVersionHelpers remoteDefaults](self, "remoteDefaults", a3));
  objc_msgSend(v3, "checkForUpdate");

}

+ (id)applicationName
{
  if (qword_10010A4F8 != -1)
    dispatch_once(&qword_10010A4F8, &stru_1000DA488);
  return (id)qword_10010A4F0;
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_remoteDefaults, 0);
}

@end
