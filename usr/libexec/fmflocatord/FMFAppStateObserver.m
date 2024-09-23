@implementation FMFAppStateObserver

+ (id)sharedInstance
{
  if (qword_100069750 != -1)
    dispatch_once(&qword_100069750, &stru_100055D30);
  return (id)qword_100069748;
}

- (FMFAppStateObserver)init
{
  FMFAppStateObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFAppStateObserver;
  v2 = -[FMFAppStateObserver init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "detectedAppInstallStateChanged:", off_100068DF0, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, off_100068DF0, 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFAppStateObserver;
  -[FMFAppStateObserver dealloc](&v4, "dealloc");
}

- (void)detectedAppInstallStateChanged:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _DWORD v13[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPlaceholder")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((objc_msgSend(v5, "fm_any:", &stru_100055D70) & 1) != 0 || !v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
    v10 = objc_msgSend(v9, "isFMFAppRemoved");

    v11 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v10 ^ 1;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected install state change event for Find My app - installed: %d.", (uint8_t *)v13, 8u);
    }

  }
}

@end
