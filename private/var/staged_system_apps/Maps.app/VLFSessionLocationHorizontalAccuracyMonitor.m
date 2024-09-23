@implementation VLFSessionLocationHorizontalAccuracyMonitor

- (VLFSessionLocationHorizontalAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionLocationHorizontalAccuracyMonitor *v8;
  VLFSessionLocationHorizontalAccuracyMonitor *v9;
  id *p_locationManager;
  void *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionLocationHorizontalAccuracyMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
      v28 = 1024;
      v29 = 35;
      v30 = 2080;
      v31 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionLocationHorizontalAccuracyMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
      v28 = 1024;
      v29 = 36;
      v30 = 2080;
      v31 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VLFSessionLocationHorizontalAccuracyMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v23, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    objc_msgSend(*p_locationManager, "listenForLocationUpdates:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_locationManager, "lastLocation"));
    -[VLFSessionLocationHorizontalAccuracyMonitor _updateStateWithLocation:](v9, "_updateStateWithLocation:", v11);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MKLocationManager stopListeningForLocationUpdates:](self->_locationManager, "stopListeningForLocationUpdates:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationHorizontalAccuracyMonitor;
  -[VLFSessionLocationHorizontalAccuracyMonitor dealloc](&v3, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionLocationHorizontalAccuracyMonitorEnabled, off_1014B3C88);
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VLFSessionLocationHorizontalAccuracyMonitor *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;

  v4 = a3;
  v5 = sub_100AEF9FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      objc_msgSend(v4, "horizontalAccuracy");
      v26 = 134283521;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got location with horizontal accuracy: %{private}f", (uint8_t *)&v26, 0xCu);
    }

    objc_msgSend(v4, "horizontalAccuracy");
    v10 = v9;
    +[VLLocalizer maximumHorizontalAccuracyThreshold](VLLocalizer, "maximumHorizontalAccuracyThreshold");
    v12 = v11;
    v13 = -[VLFSessionMonitor state](self, "state");
    if (v10 <= v12)
    {
      if (v13 != 2)
      {
        v21 = sub_100AEF9FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "horizontalAccuracy");
          v24 = v23;
          +[VLLocalizer maximumHorizontalAccuracyThreshold](VLLocalizer, "maximumHorizontalAccuracyThreshold");
          v26 = 134283777;
          v27 = v24;
          v28 = 2049;
          v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Horizontal accuracy (%{private}f) is lower than the maximum threshold (%{private}f); updating state",
            (uint8_t *)&v26,
            0x16u);
        }

      }
      v19 = self;
      v20 = 2;
    }
    else
    {
      if (v13)
      {
        v14 = sub_100AEF9FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "horizontalAccuracy");
          v17 = v16;
          +[VLLocalizer maximumHorizontalAccuracyThreshold](VLLocalizer, "maximumHorizontalAccuracyThreshold");
          v26 = 134283777;
          v27 = v17;
          v28 = 2049;
          v29 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Horizontal accuracy (%{private}f) is higher than the maximum threshold (%{private}f); updating state",
            (uint8_t *)&v26,
            0x16u);
        }

      }
      v19 = self;
      v20 = 0;
    }
    -[VLFSessionMonitor setState:](v19, "setState:", v20);
  }
  else
  {
    if (v7)
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring",
        (uint8_t *)&v26,
        2u);
    }

  }
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationHorizontalAccuracyMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationHorizontalAccuracyMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v14 = CFSTR("EnablePuckAndBanner");
  else
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationHorizontalAccuracyMonitor locationManager](self, "locationManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastLocation"));
  objc_msgSend(v16, "horizontalAccuracy");
  v18 = v17;
  +[VLLocalizer maximumHorizontalAccuracyThreshold](VLLocalizer, "maximumHorizontalAccuracyThreshold");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentHorizontalAccuracy: %f, threshold: %f>"), v5, v7, v9, v11, v14, v18, v19));

  return (NSString *)v20;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VLFSessionLocationHorizontalAccuracyMonitor locationManagerUpdatedLocation:]";
        v16 = 2080;
        v17 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
        v18 = 1024;
        v19 = 116;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  -[VLFSessionLocationHorizontalAccuracyMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v8);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
