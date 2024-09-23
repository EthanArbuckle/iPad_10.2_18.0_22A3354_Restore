@implementation STUInstalledApplicationsProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUInstalledApplicationsProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUInstalledApplicationsProvider_iOS;
  -[STUInstalledApplicationsProvider_iOS dealloc](&v3, "dealloc");
}

- (STUInstalledApplicationsProvider_iOS)init
{
  STUInstalledApplicationsProvider_iOS *v2;
  STUInstalledApplicationsProvider_iOS *v3;
  NSArray *installedApplicationInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUInstalledApplicationsProvider_iOS;
  v2 = -[STUInstalledApplicationsProvider_iOS init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    installedApplicationInfo = v2->_installedApplicationInfo;
    v2->_installedApplicationInfo = (NSArray *)&__NSArray0__struct;

  }
  return v3;
}

- (id)key
{
  return CRKDeviceInstalledApplicationInfoKey;
}

- (void)beginUpdating
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  if (!-[STUInstalledApplicationsProvider_iOS isObserving](self, "isObserving"))
  {
    -[STUInstalledApplicationsProvider_iOS setObserving:](self, "setObserving:", 1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS appsChangedNotificationName](self, "appsChangedNotificationName"));
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000552D4, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    -[STUInstalledApplicationsProvider_iOS updateInstalledApplicationInfos](self, "updateInstalledApplicationInfos");
  }
}

- (void)endUpdating
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  if (-[STUInstalledApplicationsProvider_iOS isObserving](self, "isObserving"))
  {
    -[STUInstalledApplicationsProvider_iOS setObserving:](self, "setObserving:", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS appsChangedNotificationName](self, "appsChangedNotificationName"));
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  }
}

- (id)appsChangedNotificationName
{
  return +[STUSpringBoardServices applicationDisplayIdentifiersChangedNotificationName](STUSpringBoardServices, "applicationDisplayIdentifiersChangedNotificationName");
}

- (void)updateInstalledApplicationInfos
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS makeApplicationInfoDictionaries](self, "makeApplicationInfoDictionaries"));
    v4 = objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS installedApplicationInfo](self, "installedApplicationInfo"));
    if (v4 | v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS installedApplicationInfo](self, "installedApplicationInfo"));
      v6 = objc_msgSend(v5, "isEqual:", v7);

      if ((v6 & 1) == 0)
        -[STUInstalledApplicationsProvider_iOS setInstalledApplicationInfo:](self, "setInstalledApplicationInfo:", v7);
    }

  }
  else
  {
    -[STUInstalledApplicationsProvider_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (id)makeApplicationInfoDictionaries
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUInstalledApplicationsProvider_iOS makeApplicationInfos](self, "makeApplicationInfos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_mapUsingBlock:", &stru_1000CB4D8));

  return v3;
}

- (id)makeApplicationInfos
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v20;
  NSMutableArray *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v21 = objc_opt_new(NSMutableArray);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUSpringBoardServices applicationDisplayIdentifiers](STUSpringBoardServices, "applicationDisplayIdentifiers"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v24;
    *(_QWORD *)&v4 = 138543618;
    v20 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7);
        v9 = objc_alloc((Class)LSApplicationRecord);
        v22 = 0;
        v10 = objc_msgSend(v9, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v22);
        v11 = v22;
        if (v10)
        {
          if (!objc_msgSend(v10, "stu_isUserFacing"))
            goto LABEL_13;
          v12 = objc_alloc((Class)CRKApplicationInfo);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortVersionString"));
          v14 = objc_msgSend(v12, "initWithBundleIdentifier:shortVersionString:", v8, v13);

          -[NSMutableArray addObject:](v21, "addObject:", v14);
          goto LABEL_9;
        }
        if (qword_1000FC4A8 != -1)
          dispatch_once(&qword_1000FC4A8, &stru_1000CB538);
        v15 = (void *)qword_1000FC4A0;
        if (os_log_type_enabled((os_log_t)qword_1000FC4A0, OS_LOG_TYPE_ERROR))
        {
          v14 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verboseDescription"));
          *(_DWORD *)buf = v20;
          v28 = v8;
          v29 = 2114;
          v30 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to fetch application record for %{public}@: %{public}@", buf, 0x16u);

LABEL_9:
        }
LABEL_13:

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v17 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v5 = v17;
    }
    while (v17);
  }
  -[NSMutableArray sortUsingComparator:](v21, "sortUsingComparator:", &stru_1000CB518, v20);
  v18 = -[NSMutableArray copy](v21, "copy");

  return v18;
}

+ (id)keyPathsForValuesAffectingValue
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("installedApplicationInfo"), 0);
}

- (NSArray)installedApplicationInfo
{
  return self->_installedApplicationInfo;
}

- (void)setInstalledApplicationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_installedApplicationInfo, a3);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedApplicationInfo, 0);
}

@end
