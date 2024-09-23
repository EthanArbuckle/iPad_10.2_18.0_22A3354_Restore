@implementation VLFSessionSunsetSunriseMonitor

- (VLFSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  VLFSessionSunsetSunriseMonitor *v16;
  id v17;
  NSObject *v18;
  MapsSunsetSunriseObserver *v19;
  MapsSunsetSunriseObserver *sunsetSunriseObserver;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  char *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  char *v41;
  objc_super v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "VLFSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 40;
      v49 = 2080;
      v50 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v14)
  {
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "VLFSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 41;
      v49 = 2080;
      v50 = "sunsetSunriseCalculator != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v15)
  {
    v32 = sub_1004318FC();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "VLFSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 42;
      v49 = 2080;
      v50 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v34 = sub_1004318FC();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!a7)
  {
    v37 = sub_1004318FC();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "VLFSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 43;
      v49 = 2080;
      v50 = "transportTypeSupportProvider != nil";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)VLFSessionSunsetSunriseMonitor;
  v16 = -[VLFSessionMonitor initWithObserver:](&v42, "initWithObserver:", v12);
  if (v16)
  {
    v17 = sub_100A8D184();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v44 = (const char *)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v19 = -[MapsSunsetSunriseObserver initWithLocationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:]([MapsSunsetSunriseObserver alloc], "initWithLocationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:", v13, v14, v15, a7);
    sunsetSunriseObserver = v16->_sunsetSunriseObserver;
    v16->_sunsetSunriseObserver = v19;

    objc_msgSend((id)objc_opt_class(v16), "offsetThreshold");
    -[MapsSunsetSunriseObserver setOffsetThreshold:](v16->_sunsetSunriseObserver, "setOffsetThreshold:");
    objc_msgSend((id)objc_opt_class(v16), "minimumTimeThreshold");
    -[MapsSunsetSunriseObserver setMinimumTimeThreshold:](v16->_sunsetSunriseObserver, "setMinimumTimeThreshold:");
    objc_msgSend((id)objc_opt_class(v16), "minimumDistanceThreshold");
    -[MapsSunsetSunriseObserver setMinimumDistanceThreshold:](v16->_sunsetSunriseObserver, "setMinimumDistanceThreshold:");
    -[MapsSunsetSunriseObserver registerObserver:](v16->_sunsetSunriseObserver, "registerObserver:", v16);
    -[VLFSessionSunsetSunriseMonitor calculateState](v16, "calculateState");
  }

  return v16;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFSessionSunsetSunriseMonitor *v7;

  v3 = sub_100A8D184();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MapsSunsetSunriseObserver unregisterObserver:](self->_sunsetSunriseObserver, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)VLFSessionSunsetSunriseMonitor;
  -[VLFSessionSunsetSunriseMonitor dealloc](&v5, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionSunsetSunriseMonitorEnabled, off_1014B36F8);
}

+ (double)offsetThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionSunsetSunriseMonitorThreshold, off_1014B3708);
}

+ (double)minimumTimeThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionSunsetSunriseMonitorTimeThreshold, off_1014B3728);
}

+ (double)minimumDistanceThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionSunsetSunriseMonitorDistanceThreshold, off_1014B3718);
}

- (void)calculateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  uint8_t v16[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v4 = objc_msgSend(v3, "currentState");

  switch((unint64_t)v4)
  {
    case 0uLL:
      v5 = sub_100A8D184();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)v16 = 134349056;
      *(_QWORD *)&v16[4] = self;
      v7 = "[%{public}p] Could not determine sunset/sunrise state; ignoring";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    case 1uLL:
      v11 = sub_100A8D184();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v16 = 134349056;
        *(_QWORD *)&v16[4] = self;
        v7 = "[%{public}p] Detected state is during the day";
        v8 = v6;
        v9 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v16, 0xCu);
      }
LABEL_8:
      v10 = 2;
      goto LABEL_17;
    case 2uLL:
      v12 = sub_100A8D184();
      v6 = objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)v16 = 134349056;
      *(_QWORD *)&v16[4] = self;
      v13 = "[%{public}p] Detected state is shortly before sunset";
      break;
    case 3uLL:
      v14 = sub_100A8D184();
      v6 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)v16 = 134349056;
      *(_QWORD *)&v16[4] = self;
      v13 = "[%{public}p] Detected state is between sunset and sunrise";
      break;
    case 4uLL:
      v15 = sub_100A8D184();
      v6 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)v16 = 134349056;
      *(_QWORD *)&v16[4] = self;
      v13 = "[%{public}p] Detected state is shortly after sunrise";
      break;
    default:
      v10 = 0;
      goto LABEL_18;
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v13, v16, 0xCu);
LABEL_16:
  v10 = 0;
LABEL_17:

LABEL_18:
  -[VLFSessionMonitor setState:](self, "setState:", v10, *(_OWORD *)v16);
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionSunsetSunriseMonitorAffectsBannerVisibilityKey"));

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionSunsetSunriseMonitorAffectsPuckVisibilityKey"));

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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  const __CFString *v14;
  int64_t v15;
  const __CFString *v16;
  void *v17;

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
  objc_msgSend((id)objc_opt_class(self), "offsetThreshold");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v13 = (char *)objc_msgSend(v12, "currentState") - 1;
  if ((unint64_t)v13 > 3)
    v14 = CFSTR("Unknown");
  else
    v14 = *(&off_1011E1348 + (_QWORD)v13);
  v15 = -[VLFSessionMonitor state](self, "state");
  v16 = CFSTR("Hide");
  if (v15 == 1)
    v16 = CFSTR("EnablePuck");
  if (v15 == 2)
    v16 = CFSTR("EnablePuckAndBanner");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, threshold: %f, currentValue: %@, currentState: %@>"), v3, v5, v7, v9, v11, v14, v16));

  return (NSString *)v17;
}

- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  VLFSessionSunsetSunriseMonitor *v10;
  __int16 v11;
  const __CFString *v12;

  v6 = sub_100A8D184();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 3)
      v8 = CFSTR("Unknown");
    else
      v8 = *(&off_1011E1348 + a4 - 1);
    v9 = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new state from the sunset/sunrise observer: %@", (uint8_t *)&v9, 0x16u);
  }

  -[VLFSessionSunsetSunriseMonitor calculateState](self, "calculateState");
}

- (MapsSunsetSunriseObserver)sunsetSunriseObserver
{
  return self->_sunsetSunriseObserver;
}

- (void)setSunsetSunriseObserver:(id)a3
{
  objc_storeStrong((id *)&self->_sunsetSunriseObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunsetSunriseObserver, 0);
}

@end
