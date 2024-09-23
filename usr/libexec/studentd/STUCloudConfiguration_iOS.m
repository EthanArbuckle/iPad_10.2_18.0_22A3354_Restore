@implementation STUCloudConfiguration_iOS

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MCCloudConfigurationDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)STUCloudConfiguration_iOS;
  -[STUCloudConfiguration_iOS dealloc](&v4, "dealloc");
}

- (STUCloudConfiguration_iOS)init
{
  STUCloudConfiguration_iOS *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUCloudConfiguration_iOS;
  v2 = -[STUCloudConfiguration_iOS init](&v6, "init");
  if (v2)
  {
    v3 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "cloudConfigurationDidChange:", MCCloudConfigurationDidChangeNotification, 0);

    -[STUCloudConfiguration_iOS cloudConfigurationDidChange:](v2, "cloudConfigurationDidChange:", 0);
  }
  return v2;
}

- (BOOL)isEDUPayloadInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUCloudConfiguration_iOS profilesContainingEDUPayload](self, "profilesContainingEDUPayload"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)connection
{
  return +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
}

- (void)cloudConfigurationDidChange:(id)a3
{
  void *v5;
  id v6;

  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUCloudConfiguration_iOS connection](self, "connection"));
    v6 = objc_msgSend(v5, "isSupervised");

    if ((_DWORD)v6 != -[STUCloudConfiguration isSupervised](self, "isSupervised"))
      -[STUCloudConfiguration setSupervised:](self, "setSupervised:", v6);
  }
  else
  {
    -[STUCloudConfiguration_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (id)profilesContainingEDUPayload
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedProfilesWithFilterFlags:", 1));

  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000405D0;
    v8[3] = &unk_1000CABB0;
    v8[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_filterUsingBlock:", v8));
  }
  else
  {
    if (qword_1000FC388 != -1)
      dispatch_once(&qword_1000FC388, &stru_1000CAC10);
    v6 = qword_1000FC380;
    if (os_log_type_enabled((os_log_t)qword_1000FC380, OS_LOG_TYPE_ERROR))
      sub_10007C22C(v6);
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsEDUPayload:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "payloads"));
  v4 = objc_msgSend(v3, "crk_containsObjectMatchingPredicate:", &stru_1000CABF0);

  return v4;
}

@end
