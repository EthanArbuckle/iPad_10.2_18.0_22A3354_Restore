@implementation PedestrianARSessionNetworkReachabilityMonitor

- (PedestrianARSessionNetworkReachabilityMonitor)initWithObserver:(id)a3
{
  PedestrianARSessionNetworkReachabilityMonitor *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  GEONetworkObserver *networkObserver;
  objc_super v9;
  uint8_t buf[4];
  PedestrianARSessionNetworkReachabilityMonitor *v11;

  v9.receiver = self;
  v9.super_class = (Class)PedestrianARSessionNetworkReachabilityMonitor;
  v3 = -[PedestrianARSessionMonitor initWithObserver:](&v9, "initWithObserver:", a3);
  if (v3)
  {
    v4 = sub_1006F09F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    networkObserver = v3->_networkObserver;
    v3->_networkObserver = (GEONetworkObserver *)v6;

    -[GEONetworkObserver addNetworkReachableObserver:selector:](v3->_networkObserver, "addNetworkReachableObserver:selector:", v3, "networkReachabilityChangedNotification:");
    -[PedestrianARSessionNetworkReachabilityMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionNetworkReachabilityMonitor *v7;

  v3 = sub_1006F09F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Dealloc", buf, 0xCu);
  }

  -[GEONetworkObserver removeNetworkReachableObserver:](self->_networkObserver, "removeNetworkReachableObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionNetworkReachabilityMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionNetworkReachabilityMonitorEnabled;
  v3 = off_1014B4008;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  PedestrianARSessionNetworkReachabilityMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionNetworkReachabilityMonitor networkObserver](self, "networkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  v5 = sub_1006F09F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((_DWORD)v4)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      v8 = "[%{public}p] Detected that network is reachable; updating state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 134349056;
    v10 = self;
    v8 = "[%{public}p] Detected that network is not reachable; updating state";
    goto LABEL_6;
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4);
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionNetworkReachabilityMonitor networkObserver](self, "networkObserver"));
  v6 = objc_msgSend(v5, "isNetworkReachable");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nnetwork reachable: %@\n"), v4, v7));

  return v8;
}

+ (id)friendlyName
{
  return CFSTR("Network Reachability Monitor");
}

- (GEONetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (void)setNetworkObserver:(id)a3
{
  objc_storeStrong((id *)&self->_networkObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkObserver, 0);
}

@end
