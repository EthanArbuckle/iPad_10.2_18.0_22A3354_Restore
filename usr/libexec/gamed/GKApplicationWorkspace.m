@implementation GKApplicationWorkspace

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5 = objc_msgSend(v4, "applicationIsInstalled:", v3);

  return v5;
}

- (id)availableGameIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100057684;
  v6[3] = &unk_1002BE920;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateBundlesOfType:block:", 0, v6);

  return v4;
}

- (id)availableGamesAndIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005788C;
  v6[3] = &unk_1002BE920;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateBundlesOfType:block:", 4, v6);

  return v4;
}

- (void)openSettings
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=GAMECENTER")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)openURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v11 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v12 = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v10 = 0;
  objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v3, v4, &v10);
  v6 = v10;

  if (v6)
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v7);
    v9 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100057AF8((uint64_t)v3, (uint64_t)v6, v9);
  }

}

@end
