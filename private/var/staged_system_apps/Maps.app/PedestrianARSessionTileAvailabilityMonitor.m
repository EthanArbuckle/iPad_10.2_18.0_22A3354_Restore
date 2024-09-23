@implementation PedestrianARSessionTileAvailabilityMonitor

- (PedestrianARSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4
{
  id v6;
  id v7;
  PedestrianARSessionTileAvailabilityMonitor *v8;
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
      v19 = "-[PedestrianARSessionTileAvailabilityMonitor initWithObserver:tileObserver:]";
      v20 = 2080;
      v21 = "PedestrianARSessionTileAvailabilityMonitor.m";
      v22 = 1024;
      v23 = 31;
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
  v17.super_class = (Class)PedestrianARSessionTileAvailabilityMonitor;
  v8 = -[PedestrianARSessionMonitor initWithObserver:](&v17, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_100BE689C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_tileObserver, a4);
    -[VLFTileObserver addAvailabilityObserver:](v8->_tileObserver, "addAvailabilityObserver:", v8);
    -[PedestrianARSessionTileAvailabilityMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionTileAvailabilityMonitor *v7;

  v3 = sub_100BE689C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  -[VLFTileObserver removeAvailabilityObserver:](self->_tileObserver, "removeAvailabilityObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionTileAvailabilityMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionTileAvailabilityMonitorEnabled;
  v3 = off_1014B4038;
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
  PedestrianARSessionTileAvailabilityMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  v4 = objc_msgSend(v3, "areTilesAvailable");

  v5 = sub_100BE689C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((_DWORD)v4)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      v8 = "[%{public}p] Tiles are available";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 134349056;
    v10 = self;
    v8 = "[%{public}p] Tiles are not available";
    goto LABEL_6;
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4);
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  double Double;
  NSString *v12;
  void *v13;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTileAvailabilityMonitor tileObserver](self, "tileObserver"));
  v6 = objc_msgSend(v5, "areTilesAvailable");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = MapsConfig_VLFSessionTileAvailabilityErrorTimeoutThreshold;
  v9 = off_1014B3BA8;
  v10 = v7;
  Double = GEOConfigGetDouble(v8, v9);
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nare tiles available: %@\nerror timeout threshold (seconds): %.2f\nminimum distance threshold (meters): %.2f\n"), v4, v10, *(_QWORD *)&Double, GEOConfigGetDouble(MapsConfig_VLFSessionTileAvailabilityMonitorDistanceThreshold, off_1014B37E8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return (NSString *)v13;
}

+ (id)friendlyName
{
  return CFSTR("Tile Availability Monitor");
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
