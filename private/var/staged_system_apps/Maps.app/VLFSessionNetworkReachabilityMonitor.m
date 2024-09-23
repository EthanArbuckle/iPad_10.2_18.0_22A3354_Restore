@implementation VLFSessionNetworkReachabilityMonitor

- (VLFSessionNetworkReachabilityMonitor)initWithObserver:(id)a3
{
  VLFSessionNetworkReachabilityMonitor *v3;
  uint64_t v4;
  GEONetworkObserver *networkObserver;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VLFSessionNetworkReachabilityMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v7, "initWithObserver:", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    networkObserver = v3->_networkObserver;
    v3->_networkObserver = (GEONetworkObserver *)v4;

    -[GEONetworkObserver addNetworkReachableObserver:selector:](v3->_networkObserver, "addNetworkReachableObserver:selector:", v3, "networkReachabilityChangedNotification:");
    -[VLFSessionNetworkReachabilityMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[GEONetworkObserver removeNetworkReachableObserver:](self->_networkObserver, "removeNetworkReachableObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionNetworkReachabilityMonitor;
  -[VLFSessionNetworkReachabilityMonitor dealloc](&v3, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionNetworkReachabilityMonitorEnabled, off_1014B3798);
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionNetworkReachabilityMonitor networkObserver](self, "networkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if (qword_1014D2D08 != -1)
    dispatch_once(&qword_1014D2D08, &stru_1011BF6D8);
  v5 = (id)qword_1014D2D00;
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that network is reachable; updating state",
        buf,
        2u);
    }
    else
    {
      v7 = 2;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that network is not reachable; updating state",
        v8,
        2u);
    }
    v7 = 0;
  }

  -[VLFSessionMonitor setState:](self, "setState:", v7);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionNetworkReachabilityMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionNetworkReachabilityMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (id)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v3 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionNetworkReachabilityMonitor networkObserver](self, "networkObserver"));
  v11 = objc_msgSend(v10, "isNetworkReachable");
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v13 = CFSTR("EnablePuckAndBanner");
  v14 = CFSTR("No network");
  if (v11)
    v14 = CFSTR("Has network");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %@, currentState: %@>"), v3, v5, v7, v9, v14, v13));

  return v15;
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
