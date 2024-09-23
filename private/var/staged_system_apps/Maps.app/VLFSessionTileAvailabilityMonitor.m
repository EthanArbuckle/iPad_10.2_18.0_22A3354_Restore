@implementation VLFSessionTileAvailabilityMonitor

- (VLFSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4
{
  id v6;
  id v7;
  VLFSessionTileAvailabilityMonitor *v8;
  id v9;
  NSObject *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[VLFSessionTileAvailabilityMonitor initWithObserver:tileObserver:]";
      v20 = 2080;
      v21 = "VLFSessionTileAvailabilityMonitor.m";
      v22 = 1024;
      v23 = 32;
      v24 = 2080;
      v25 = "tileObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)VLFSessionTileAvailabilityMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v17, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_1008D2290();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_tileObserver, a4);
    -[VLFTileObserver addAvailabilityObserver:](v8->_tileObserver, "addAvailabilityObserver:", v8);
    -[VLFSessionTileAvailabilityMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFSessionTileAvailabilityMonitor *v7;

  v3 = sub_1008D2290();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  -[VLFTileObserver removeAvailabilityObserver:](self->_tileObserver, "removeAvailabilityObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)VLFSessionTileAvailabilityMonitor;
  -[VLFSessionTileAvailabilityMonitor dealloc](&v5, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionTileAvailabilityMonitorEnabled, off_1014B3758);
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  VLFSessionTileAvailabilityMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  v4 = objc_msgSend(v3, "areTilesAvailable");

  v5 = sub_1008D2290();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Tiles are available", (uint8_t *)&v9, 0xCu);
    }
    v8 = 2;
  }
  else
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Tiles are not available", (uint8_t *)&v9, 0xCu);
    }
    v8 = 0;
  }

  -[VLFSessionMonitor setState:](self, "setState:", v8);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionTileAvailabilityMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionTileAvailabilityMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;

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
  v10 = -[VLFSessionMonitor state](self, "state");
  v11 = CFSTR("Hide");
  if (v10 == 1)
    v11 = CFSTR("EnablePuck");
  if (v10 == 2)
    v12 = CFSTR("EnablePuckAndBanner");
  else
    v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  objc_msgSend(v13, "distanceThreshold");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  objc_msgSend(v16, "errorTimeoutThreshold");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  if (objc_msgSend(v19, "isNavigatingInUnsupportedTransportType"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, distanceThreshold: %.2f, errorTimeoutThreshold: %.2f, isNavigatingInUnsupportedTransportType: %@>"), v3, v5, v7, v9, v12, v15, v18, v20));

  return (NSString *)v21;
}

- (VLFTileObserver)tileObserver
{
  return self->_tileObserver;
}

- (void)setTileObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tileObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileObserver, 0);
}

@end
