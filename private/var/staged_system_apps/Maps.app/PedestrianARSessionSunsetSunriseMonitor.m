@implementation PedestrianARSessionSunsetSunriseMonitor

- (PedestrianARSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PedestrianARSessionSunsetSunriseMonitor *v16;
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
      v44 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "PedestrianARSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 39;
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
      v44 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "PedestrianARSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 40;
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
      v44 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "PedestrianARSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 41;
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
      v44 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      v45 = 2080;
      v46 = "PedestrianARSessionSunsetSunriseMonitor.m";
      v47 = 1024;
      v48 = 42;
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
  v42.super_class = (Class)PedestrianARSessionSunsetSunriseMonitor;
  v16 = -[PedestrianARSessionMonitor initWithObserver:](&v42, "initWithObserver:", v12);
  if (v16)
  {
    v17 = sub_10085FC18();
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
    -[PedestrianARSessionSunsetSunriseMonitor updateState](v16, "updateState");
  }

  return v16;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionSunsetSunriseMonitor *v7;

  v3 = sub_10085FC18();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MapsSunsetSunriseObserver unregisterObserver:](self->_sunsetSunriseObserver, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionSunsetSunriseMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionSunsetSunriseMonitorEnabled;
  v3 = off_1014B4018;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

+ (double)offsetThreshold
{
  return GEOConfigGetDouble(MapsConfig_PedestrianARSessionSunsetSunriseMonitorThreshold, off_1014B4028);
}

+ (double)minimumTimeThreshold
{
  return GEOConfigGetDouble(MapsConfig_PedestrianARSessionSunsetSunriseMonitorTimeThreshold, off_1014B4668);
}

+ (double)minimumDistanceThreshold
{
  return GEOConfigGetDouble(MapsConfig_PedestrianARSessionSunsetSunriseMonitorDistanceThreshold, off_1014B4658);
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  uint8_t v13[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v4 = objc_msgSend(v3, "currentState");

  switch((unint64_t)v4)
  {
    case 0uLL:
      v5 = sub_10085FC18();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v13 = 134349056;
        *(_QWORD *)&v13[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}p] Could not determine sunset/sunrise state; ignoring",
          v13,
          0xCu);
      }
      v7 = 1;
      goto LABEL_16;
    case 1uLL:
      v8 = sub_10085FC18();
      v6 = objc_claimAutoreleasedReturnValue(v8);
      v7 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v13 = 134349056;
        *(_QWORD *)&v13[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Detected state is during the day", v13, 0xCu);
      }
      goto LABEL_16;
    case 2uLL:
      v9 = sub_10085FC18();
      v6 = objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)v13 = 134349056;
      *(_QWORD *)&v13[4] = self;
      v10 = "[%{public}p] Detected state is shortly before sunset";
      break;
    case 3uLL:
      v11 = sub_10085FC18();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)v13 = 134349056;
      *(_QWORD *)&v13[4] = self;
      v10 = "[%{public}p] Detected state is between sunset and sunrise";
      break;
    case 4uLL:
      v12 = sub_10085FC18();
      v6 = objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)v13 = 134349056;
      *(_QWORD *)&v13[4] = self;
      v10 = "[%{public}p] Detected state is shortly after sunrise";
      break;
    default:
      v7 = 0;
      goto LABEL_17;
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v10, v13, 0xCu);
LABEL_15:
  v7 = 0;
LABEL_16:

LABEL_17:
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v7, *(_OWORD *)v13);
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend((id)objc_opt_class(self), "offsetThreshold");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v8 = (char *)objc_msgSend(v7, "currentState") - 1;
  if ((unint64_t)v8 > 3)
    v9 = CFSTR("Unknown");
  else
    v9 = *(&off_1011D95A8 + (_QWORD)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_sunset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionSunsetSunriseMonitor sunsetSunriseObserver](self, "sunsetSunriseObserver"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_sunrise"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\noffset threshold (seconds): %.2f\nsunset/sunrise state: %@\nsunset: %@\nsunrise: %@\n"), v4, v6, v9, v11, v13));

  return (NSString *)v14;
}

+ (id)friendlyName
{
  return CFSTR("Sunset/Sunrise Monitor");
}

- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  PedestrianARSessionSunsetSunriseMonitor *v10;
  __int16 v11;
  const __CFString *v12;

  v6 = sub_10085FC18();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 3)
      v8 = CFSTR("Unknown");
    else
      v8 = *(&off_1011D95A8 + a4 - 1);
    v9 = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new state from the sunset/sunrise observer: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PedestrianARSessionSunsetSunriseMonitor updateState](self, "updateState");
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
