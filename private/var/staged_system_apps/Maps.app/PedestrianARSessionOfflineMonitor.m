@implementation PedestrianARSessionOfflineMonitor

- (PedestrianARSessionOfflineMonitor)initWithObserver:(id)a3
{
  PedestrianARSessionOfflineMonitor *v3;
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  PedestrianARSessionOfflineMonitor *v10;

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionOfflineMonitor;
  v3 = -[PedestrianARSessionMonitor initWithObserver:](&v8, "initWithObserver:", a3);
  if (v3)
  {
    v4 = sub_100C33400();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "_usingOfflineDidChange:", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

    -[PedestrianARSessionOfflineMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionOfflineMonitor *v7;

  v3 = sub_100C33400();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionOfflineMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionOfflineMonitorEnabled;
  v3 = off_1014B4CA8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  PedestrianARSessionOfflineMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  v5 = sub_100C33400();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      v8 = "[%{public}p] Using offline mode; updating state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 134349056;
    v10 = self;
    v8 = "[%{public}p] Not using offline mode; updating state";
    goto LABEL_6;
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4 ^ 1);
}

- (id)debugDescription
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  v2 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v5 = objc_msgSend(v4, "isUsingOfflineMaps");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nusing offline: %@\n"), v3, v6));

  return v7;
}

+ (id)friendlyName
{
  return CFSTR("Offline Maps Monitor");
}

@end
